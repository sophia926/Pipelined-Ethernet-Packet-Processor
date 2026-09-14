import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ReadOnly


# ============================================================
# Helpers
# ============================================================

async def start_clock(dut):
    cocotb.start_soon(
        Clock(dut.clk, 10, unit="ns").start()
    )


async def reset_dut(dut):
    dut.rst_n.value = 0

    dut.s_axis_tdata.value = 0
    dut.s_axis_tkeep.value = 0
    dut.s_axis_tvalid.value = 0
    dut.s_axis_tlast.value = 0

    dut.m_axis_tready.value = 1

    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)

    await FallingEdge(dut.clk)
    dut.rst_n.value = 1

    await RisingEdge(dut.clk)
    await ReadOnly()


async def send_beat(dut, data, keep=0xFF, last=0):
    await FallingEdge(dut.clk)

    dut.s_axis_tdata.value = data
    dut.s_axis_tkeep.value = keep
    dut.s_axis_tlast.value = last
    dut.s_axis_tvalid.value = 1

    while True:
        await RisingEdge(dut.clk)
        await ReadOnly()

        if dut.s_axis_tready.value == 1:
            break

    await FallingEdge(dut.clk)
    dut.s_axis_tvalid.value = 0


async def collect_output_beats(dut, beats, expected_count):
    while len(beats) < expected_count:
        await RisingEdge(dut.clk)
        await ReadOnly()

        if dut.m_axis_tvalid.value == 1 and dut.m_axis_tready.value == 1:
            beats.append((
                int(dut.m_axis_tdata.value),
                int(dut.m_axis_tkeep.value),
                int(dut.m_axis_tlast.value)
            ))


# ============================================================
# Test 1: Reset
# ============================================================

@cocotb.test()
async def test_reset(dut):
    await start_clock(dut)
    await reset_dut(dut)

    assert dut.m_axis_tvalid.value == 0
    assert dut.tcp_header_valid.value == 0

    assert dut.src_port.value == 0
    assert dut.dst_port.value == 0
    assert dut.seq_num.value == 0
    assert dut.ack_num.value == 0
    assert dut.tcp_data_offset.value == 0
    assert dut.tcp_flags.value == 0


# ============================================================
# Test 2: Basic TCP header parsing
# ============================================================

@cocotb.test()
async def test_tcp_header_parsing(dut):
    await start_clock(dut)
    await reset_dut(dut)

    # TCP header:
    #
    # Source port      = 0x1234
    # Destination port = 0x5678
    # Sequence number  = 0x11223344
    # Ack number       = 0x55667788
    # Data offset      = 5 -> 20-byte header
    # Flags            = SYN
    #
    # Bytes:
    #
    # 12 34 56 78 11 22 33 44
    # 55 66 77 88 50 02 00 00
    # 00 00 00 00 00 01 02 03
    #
    # Last 4 bytes of beat 2 are payload bytes 00 01 02 03

    await send_beat(
        dut,
        data=0x4433221178563412
    )

    await send_beat(
        dut,
        data=0x0000025088776655
    )

    await send_beat(
        dut,
        data=0x0302010000000000
    )

    assert int(dut.src_port.value) == 0x1234
    assert int(dut.dst_port.value) == 0x5678

    assert int(dut.seq_num.value) == 0x11223344
    assert int(dut.ack_num.value) == 0x55667788

    assert int(dut.tcp_data_offset.value) == 5

    # SYN is bit 1 of the lower 8 TCP flags
    assert int(dut.tcp_flags.value) == 0x002

    assert dut.tcp_header_valid.value == 1


# ============================================================
# Test 3: Basic payload realignment
# ============================================================

@cocotb.test()
async def test_payload_realignment(dut):
    await start_clock(dut)
    await reset_dut(dut)

    output_beats = []

    monitor = cocotb.start_soon(
        collect_output_beats(dut, output_beats, expected_count=2)
    )

    # TCP bytes 0-7
    await send_beat(
        dut,
        data=0x4433221178563412
    )

    # TCP bytes 8-15
    await send_beat(
        dut,
        data=0x0000025088776655
    )

    # TCP bytes 16-19 + payload 00 01 02 03
    await send_beat(
        dut,
        data=0x0302010000000000
    )

    # Payload 04-0B
    await send_beat(
        dut,
        data=0x0B0A090807060504
    )

    # Payload 0C-0F
    await send_beat(
        dut,
        data=0x000000000F0E0D0C,
        keep=0b0000_1111,
        last=1
    )

    await monitor

    # Output payload 00-07
    assert output_beats[0][0] == 0x0706050403020100
    assert output_beats[0][1] == 0xFF
    assert output_beats[0][2] == 0

    # Output payload 08-0F
    assert output_beats[1][0] == 0x0F0E0D0C0B0A0908
    assert output_beats[1][1] == 0xFF
    assert output_beats[1][2] == 1


# ============================================================
# Test 4: Partial final beat
# ============================================================

@cocotb.test()
async def test_partial_final_beat(dut):
    await start_clock(dut)
    await reset_dut(dut)

    output_beats = []

    monitor = cocotb.start_soon(
        collect_output_beats(dut, output_beats, expected_count=1)
    )

    await send_beat(
        dut,
        data=0x4433221178563412
    )

    await send_beat(
        dut,
        data=0x0000025088776655
    )

    # TCP header bytes 16-19 + payload 00-03
    await send_beat(
        dut,
        data=0x0302010000000000
    )

    # Final payload bytes 04 05 06
    await send_beat(
        dut,
        data=0x0000000000060504,
        keep=0b0000_0111,
        last=1
    )

    await monitor

    # Payload:
    # 00 01 02 03 04 05 06 XX
    assert (
        output_beats[0][0] & 0x00FFFFFFFFFFFFFF
    ) == 0x0006050403020100

    assert output_beats[0][1] == 0b0111_1111
    assert output_beats[0][2] == 1


# ============================================================
# Test 5: Flush case
# ============================================================

@cocotb.test()
async def test_flush_final_beat(dut):
    await start_clock(dut)
    await reset_dut(dut)

    output_beats = []

    monitor = cocotb.start_soon(
        collect_output_beats(dut, output_beats, expected_count=2)
    )

    await send_beat(
        dut,
        data=0x4433221178563412
    )

    await send_beat(
        dut,
        data=0x0000025088776655
    )

    # Payload 00-03 stored as leftover
    await send_beat(
        dut,
        data=0x0302010000000000
    )

    # Payload 04-0B
    await send_beat(
        dut,
        data=0x0B0A090807060504,
        keep=0xFF,
        last=1
    )

    await monitor

    # First output:
    # 00 01 02 03 04 05 06 07
    assert output_beats[0][0] == 0x0706050403020100
    assert output_beats[0][1] == 0xFF
    assert output_beats[0][2] == 0

    # Flush:
    # 08 09 0A 0B
    assert output_beats[1][0] == 0x000000000B0A0908
    assert output_beats[1][1] == 0b0000_1111
    assert output_beats[1][2] == 1


# ============================================================
# Test 6: TCP options - aligned ending
# Data Offset = 6 -> 24-byte TCP header
# ============================================================

@cocotb.test()
async def test_tcp_options_aligned(dut):
    await start_clock(dut)
    await reset_dut(dut)

    output_beats = []

    monitor = cocotb.start_soon(
        collect_output_beats(dut, output_beats, expected_count=1)
    )

    # TCP bytes 0-7
    await send_beat(
        dut,
        data=0x4433221178563412
    )

    # Data offset = 6
    # Byte 12 = 0x60
    await send_beat(
        dut,
        data=0x0000026088776655
    )

    # Bytes 16-23:
    # 4 normal TCP header bytes + 4 option bytes
    await send_beat(
        dut,
        data=0xDDCCBBAA00000000
    )

    assert int(dut.tcp_data_offset.value) == 6
    assert dut.tcp_header_valid.value == 1

    # Payload begins aligned:
    # 00 01 02 03 04 05 06 07
    await send_beat(
        dut,
        data=0x0706050403020100,
        keep=0xFF,
        last=1
    )

    await monitor

    assert output_beats[0][0] == 0x0706050403020100
    assert output_beats[0][1] == 0xFF
    assert output_beats[0][2] == 1


# ============================================================
# Test 7: TCP options - unaligned ending
# Data Offset = 7 -> 28-byte TCP header
# ============================================================

@cocotb.test()
async def test_tcp_options_unaligned(dut):
    await start_clock(dut)
    await reset_dut(dut)

    output_beats = []

    monitor = cocotb.start_soon(
        collect_output_beats(dut, output_beats, expected_count=1)
    )

    await send_beat(
        dut,
        data=0x4433221178563412
    )

    # Data offset = 7
    await send_beat(
        dut,
        data=0x0000027088776655
    )

    # Bytes 16-23
    await send_beat(
        dut,
        data=0xDDCCBBAA00000000
    )

    # Bytes 24-27 = options
    # Bytes 28-31 = payload 00-03
    await send_beat(
        dut,
        data=0x0302010011223344
    )

    # Payload 04-07
    await send_beat(
        dut,
        data=0x0000000007060504,
        keep=0b0000_1111,
        last=1
    )

    await monitor

    assert int(dut.tcp_data_offset.value) == 7

    # Realigned payload 00-07
    assert output_beats[0][0] == 0x0706050403020100
    assert output_beats[0][1] == 0xFF
    assert output_beats[0][2] == 1


# ============================================================
# Test 8: Backpressure
# ============================================================

@cocotb.test()
async def test_backpressure(dut):
    await start_clock(dut)
    await reset_dut(dut)

    # TCP header beat 0
    await send_beat(
        dut,
        data=0x4433221178563412
    )

    # TCP header beat 1
    await send_beat(
        dut,
        data=0x0000025088776655
    )

    # Header bytes 16-19 + payload 00-03
    await send_beat(
        dut,
        data=0x0302010000000000
    )

    # Stall downstream BEFORE generating output
    await FallingEdge(dut.clk)
    dut.m_axis_tready.value = 0

    # Output register is still empty, so DUT can accept one beat
    assert dut.s_axis_tready.value == 1

    # Payload 04-07
    dut.s_axis_tdata.value = 0x0000000007060504
    dut.s_axis_tkeep.value = 0b0000_1111
    dut.s_axis_tlast.value = 1
    dut.s_axis_tvalid.value = 1

    await RisingEdge(dut.clk)
    await ReadOnly()

    # DUT should now contain one complete payload output beat
    assert dut.m_axis_tvalid.value == 1
    assert int(dut.m_axis_tdata.value) == 0x0706050403020100
    assert int(dut.m_axis_tkeep.value) == 0xFF
    assert dut.m_axis_tlast.value == 1

    # Output is full and downstream is stalled
    assert dut.s_axis_tready.value == 0

    await FallingEdge(dut.clk)
    dut.s_axis_tvalid.value = 0

    expected_data = int(dut.m_axis_tdata.value)
    expected_keep = int(dut.m_axis_tkeep.value)
    expected_last = int(dut.m_axis_tlast.value)

    # Hold stall for multiple cycles
    for _ in range(2):
        await RisingEdge(dut.clk)
        await ReadOnly()

        assert dut.m_axis_tvalid.value == 1
        assert int(dut.m_axis_tdata.value) == expected_data
        assert int(dut.m_axis_tkeep.value) == expected_keep
        assert int(dut.m_axis_tlast.value) == expected_last

        assert dut.s_axis_tready.value == 0

    # Release downstream
    await FallingEdge(dut.clk)
    dut.m_axis_tready.value = 1

    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 0
    assert dut.s_axis_tready.value == 1