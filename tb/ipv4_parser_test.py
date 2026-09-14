import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ReadOnly


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
# Test 2: Reset
# ============================================================
@cocotb.test()
async def test_reset(dut):
    await start_clock(dut)
    await reset_dut(dut)

    assert dut.m_axis_tvalid.value == 0
    assert dut.ipv4_header_valid.value == 0

    assert dut.src_ip.value == 0
    assert dut.dst_ip.value == 0
    assert dut.ip_total_length.value == 0
    assert dut.ip_protocol.value == 0
    assert dut.ip_ihl.value == 0
    assert dut.is_tcp.value == 0



# ============================================================
# Test 2: Basic IPv4 header parsing
# ============================================================

@cocotb.test()
async def test_ipv4_header_parsing(dut):
    await start_clock(dut)
    await reset_dut(dut)


    # IPv4 header bytes:
    #
    # 45 00 00 28 00 00 00 00
    # 40 06 00 00 C0 A8 01 0A
    # 0A 00 00 05
    #
    # Meaning:
    # Version = 4
    # IHL = 5
    # Total length = 0x0028 = 40 bytes
    # Protocol = 0x06 = TCP
    # Source IP = C0.A8.01.0A = 192.168.1.10
    # Destination IP = 0A.00.00.05 = 10.0.0.5
    #
    # The third beat also needs 4 extra bytes because the
    # IPv4 header ends halfway through that 64-bit beat.
    # We'll just use:
    # 12 34 56 78

    # Beat 0:
    # 45 00 00 28 00 00 00 00
    await send_beat(
        dut,
        data=0x0000000028000045
    )

    # Beat 1:
    # 40 06 00 00 C0 A8 01 0A
    await send_beat(
        dut,
        data=0x0A01A8C000000640
    )

    # Beat 2:
    # 0A 00 00 05 12 34 56 78
    await send_beat(
        dut,
        data=0x785634120500000A
    )

    # ipv4_header_valid should pulse after the third beat
    assert dut.ipv4_header_valid.value == 1, \
        "ipv4_header_valid should be high after full IPv4 header is received"

    assert int(dut.ip_ihl.value) == 5, \
        "Incorrect IPv4 IHL"

    assert int(dut.ip_total_length.value) == 0x0028, \
        "Incorrect IPv4 total length"

    assert int(dut.ip_protocol.value) == 0x06, \
        "Incorrect IPv4 protocol"

    assert int(dut.src_ip.value) == 0xC0A8010A, \
        "Incorrect source IP"

    assert int(dut.dst_ip.value) == 0x0A000005, \
        "Incorrect destination IP"

    assert dut.is_tcp.value == 1, \
        "Packet should be identified as TCP"

    pass

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

    # IPv4 header, IHL = 5
    #
    # Beat 0:
    # 45 00 00 24 00 00 00 00
    await send_beat(
        dut,
        data=0x0000000024000045
    )

    # Beat 1:
    # 40 06 00 00 C0 A8 01 0A
    await send_beat(
        dut,
        data=0x0A01A8C000000640
    )

    # Beat 2:
    # 0A 00 00 05 00 01 02 03
    await send_beat(
        dut,
        data=0x030201000500000A
    )

    # Beat 3:
    # TCP bytes 04 05 06 07 08 09 0A 0B
    await send_beat(
        dut,
        data=0x0B0A090807060504
    )

    # Beat 4:
    # TCP bytes 0C 0D 0E 0F
    await send_beat(
        dut,
        data=0x000000000F0E0D0C,
        keep=0b0000_1111,
        last=1
    )

    await monitor

    # Output beat 0:
    # 00 01 02 03 04 05 06 07
    assert output_beats[0][0] == 0x0706050403020100
    assert output_beats[0][1] == 0xFF
    assert output_beats[0][2] == 0

    # Output beat 1:
    # 08 09 0A 0B 0C 0D 0E 0F
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

    # IPv4 header
    await send_beat(
        dut,
        data=0x000000001B000045
    )

    await send_beat(
        dut,
        data=0x0A01A8C000000640
    )

    # Header bytes 16-19 + TCP bytes 00 01 02 03
    await send_beat(
        dut,
        data=0x030201000500000A
    )

    # Final TCP bytes:
    # 04 05 06
    await send_beat(
        dut,
        data=0x0000000000060504,
        keep=0b0000_0111,
        last=1
    )

    await monitor

    # Output:
    # 00 01 02 03 04 05 06 XX
    assert (output_beats[0][0] & 0x00FFFFFFFFFFFFFF) \
        == 0x0006050403020100

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
        data=0x0000000020000045
    )

    await send_beat(
        dut,
        data=0x0A01A8C000000640
    )

    # TCP bytes 00-03
    await send_beat(
        dut,
        data=0x030201000500000A
    )

    # TCP bytes 04-0B
    # All 8 bytes valid, so upper 4 require flush
    await send_beat(
        dut,
        data=0x0B0A090807060504,
        keep=0xFF,
        last=1
    )

    await monitor

    # Output beat:
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
# Test 6: IPv4 options - aligned ending
# IHL = 6 -> 24-byte header
# ============================================================

@cocotb.test()
async def test_ipv4_options_aligned(dut):
    await start_clock(dut)
    await reset_dut(dut)

    output_beats = []

    monitor = cocotb.start_soon(
        collect_output_beats(dut, output_beats, expected_count=1)
    )

    # IHL = 6
    #
    # Beat 0:
    # 46 00 00 20 00 00 00 00
    await send_beat(
        dut,
        data=0x0000000020000046
    )

    # Beat 1
    await send_beat(
        dut,
        data=0x0A01A8C000000640
    )

    # Beat 2:
    # dst IP + 4 bytes of IPv4 options
    # 0A 00 00 05 AA BB CC DD
    await send_beat(
        dut,
        data=0xDDCCBBAA0500000A
    )

    # Header ended exactly at byte 24.
    # TCP begins aligned here:
    # 00 01 02 03 04 05 06 07
    await send_beat(
        dut,
        data=0x0706050403020100,
        keep=0xFF,
        last=1
    )

    await monitor

    assert int(dut.ip_ihl.value) == 6
    assert dut.is_tcp.value == 1

    assert output_beats[0][0] == 0x0706050403020100
    assert output_beats[0][1] == 0xFF
    assert output_beats[0][2] == 1


# ============================================================
# Test 7: IPv4 options - unaligned ending
# IHL = 7 -> 28-byte header
# ============================================================

@cocotb.test()
async def test_ipv4_options_unaligned(dut):
    await start_clock(dut)
    await reset_dut(dut)

    output_beats = []

    monitor = cocotb.start_soon(
        collect_output_beats(dut, output_beats, expected_count=1)
    )

    # IHL = 7
    await send_beat(
        dut,
        data=0x0000000024000047
    )

    await send_beat(
        dut,
        data=0x0A01A8C000000640
    )

    # Bytes 16-23:
    # dst IP + first 4 option bytes
    await send_beat(
        dut,
        data=0xDDCCBBAA0500000A
    )

    # Bytes 24-31:
    # remaining 4 options + TCP bytes 00 01 02 03
    #
    # AA BB CC DD 00 01 02 03
    await send_beat(
        dut,
        data=0x03020100DDCCBBAA
    )

    # TCP bytes 04 05 06 07
    await send_beat(
        dut,
        data=0x0000000007060504,
        keep=0b0000_1111,
        last=1
    )

    await monitor

    assert int(dut.ip_ihl.value) == 7
    assert dut.is_tcp.value == 1

    # Realigned TCP output:
    # 00 01 02 03 04 05 06 07
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

    # Header beats
    await send_beat(
        dut,
        data=0x000000001C000045
    )

    await send_beat(
        dut,
        data=0x0A01A8C000000640
    )

    # Header bytes 16-19 + TCP bytes 00-03
    await send_beat(
        dut,
        data=0x030201000500000A
    )

    # Stall downstream BEFORE generating output
    await FallingEdge(dut.clk)
    dut.m_axis_tready.value = 0

    # Output register is currently empty,
    # so parser should still accept one input beat
    assert dut.s_axis_tready.value == 1

    dut.s_axis_tdata.value = 0x07060504
    dut.s_axis_tkeep.value = 0b0000_1111
    dut.s_axis_tlast.value = 1
    dut.s_axis_tvalid.value = 1

    # Parser accepts beat and creates output
    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 1
    assert int(dut.m_axis_tdata.value) == 0x0706050403020100
    assert dut.m_axis_tkeep.value == 0xFF
    assert dut.m_axis_tlast.value == 1

    # Output register is full and downstream is stalled
    assert dut.s_axis_tready.value == 0

    # Stop presenting input
    await FallingEdge(dut.clk)
    dut.s_axis_tvalid.value = 0

    expected_data = int(dut.m_axis_tdata.value)
    expected_keep = int(dut.m_axis_tkeep.value)
    expected_last = int(dut.m_axis_tlast.value)

    # Verify output remains stable while stalled
    for _ in range(2):
        await RisingEdge(dut.clk)
        await ReadOnly()

        assert dut.m_axis_tvalid.value == 1
        assert int(dut.m_axis_tdata.value) == expected_data
        assert int(dut.m_axis_tkeep.value) == expected_keep
        assert int(dut.m_axis_tlast.value) == expected_last

        assert dut.s_axis_tready.value == 0

    # Release backpressure
    await FallingEdge(dut.clk)
    dut.m_axis_tready.value = 1

    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 0
    assert dut.s_axis_tready.value == 1