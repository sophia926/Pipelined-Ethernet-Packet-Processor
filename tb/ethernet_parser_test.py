import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ReadOnly


# ============================================================
# Helpers
# ============================================================

async def start_clock(dut):
    # clock with 10ns period
    cocotb.start_soon(Clock(dut.clk, 10, unit="ns").start())


async def reset_dut(dut):

    dut.rst_n.value = 0
    dut.s_axis_tdata.value = 0
    dut.s_axis_tvalid.value = 0
    dut.s_axis_tlast.value = 0
    dut.s_axis_tkeep.value = 0
    dut.m_axis_tready.value = 1

    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)

    await FallingEdge(dut.clk)

    dut.rst_n.value = 1

    await RisingEdge(dut.clk)
    await ReadOnly()


async def send_beat(
    dut,
    data,
    keep=0xFF,
    last=0,
):

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

    assert dut.m_axis_tvalid.value == 0, "m_axis_tvalid should be 0 after reset"

    assert dut.s_axis_tready.value == 1, "s_axis_tready should be 1 after reset"

    assert dut.ethernet_header_valid.value == 0, "ethernet_header_valid should be 0 after reset"

    assert dut.is_ipv4.value == 0, "is_ipv4 should be 0 after reset"

    assert int(dut.dst_mac.value) == 0, "dst_mac should be 0 after reset"

    assert int(dut.src_mac.value) == 0, "src_mac should be 0 after reset"

    assert int(dut.ethertype.value) == 0, "ethertype should be 0 after reset"


# ============================================================
# Test 2: Ethernet metadata parsing
# ============================================================

@cocotb.test()
async def test_ethernet_header_parsing(dut):
    await start_clock(dut)
    await reset_dut(dut)

    # dst MAC:
    # AA:BB:CC:DD:EE:FF
    # src MAC:
    # 11:22:33:44:55:66
    # EtherType:
    # 0x0800

    await send_beat(dut=dut, data=0x2211FFEEDDCCBBAA)
    await send_beat(dut=dut, data=0x9999000866554433)

    assert int(dut.dst_mac.value) == 0xAABBCCDDEEFF, \
        "Destination MAC was parsed incorrectly"

    assert int(dut.src_mac.value) == 0x112233445566, \
        "Source MAC was parsed incorrectly"

    assert int(dut.ethertype.value) == 0x0800, \
        "EtherType was parsed incorrectly"

    assert dut.is_ipv4.value == 1, \
        "is_ipv4 should be asserted for EtherType 0x0800"

    assert dut.ethernet_header_valid.value == 1, \
        "ethernet_header_valid should pulse when header parsing completes"
    
# ============================================================
# Test 3: Header stripping / payload realignment
# ============================================================

@cocotb.test()
async def test_payload_realignment(dut):
    await start_clock(dut)
    await reset_dut(dut)
    output_beats = []

    # Start monitor BEFORE sending input
    monitor = cocotb.start_soon(
        collect_output_beats(dut, output_beats, expected_count=2)
    )

    # dst MAC:
    # AA:BB:CC:DD:EE:FF
    # src MAC:
    # 11:22:33:44:55:66
    # EtherType:
    # 0x0800

    # 14-byte Ethernet header
    # +
    # known payload bytes:
    # 00 01 02 03 04 05 06 07
    # 08 09 0A 0B 0C 0D 0E 0F

    await send_beat(dut=dut, data=0x2211FFEEDDCCBBAA)
    await send_beat(dut=dut, data=0x0100000866554433)
    await send_beat(dut=dut, data=0x0908070605040302)
    await send_beat(dut=dut, data=0x00000F0E0D0C0B0A, keep=0b0011_1111, last=1)

    # Expected:
    # first output byte = payload byte 0
    # Ethernet header bytes should NOT appear on output

    await monitor
    
    
    # Check first realigned output beat

    assert output_beats[0][0] == 0x0706050403020100, \
        "First realigned output beat is incorrect"

    assert output_beats[0][1] == 0xFF, \
        "First realigned output beat should contain 8 valid bytes"

    assert output_beats[0][2] == 0, \
        "First realigned output beat should not be the final beat"

    # Check second realigned output beat

    assert output_beats[1][0] == 0x0F0E0D0C0B0A0908, \
        "Second realigned output beat is incorrect"

    assert output_beats[1][1] == 0xFF, \
        "Second realigned output beat should contain 8 valid bytes"

    assert output_beats[1][2] == 1, \
        "Second realigned output beat should be marked as final"


# ============================================================
# Test 4: Partial final beat
# ============================================================

@cocotb.test()
async def test_partial_final_beat(dut):
    await start_clock(dut)
    await reset_dut(dut)

    
    output_beats = []

    # Start monitor BEFORE sending input
    monitor = cocotb.start_soon(
        collect_output_beats(dut, output_beats, expected_count=1)
    )

    # dst MAC:
    # AA:BB:CC:DD:EE:FF
    # src MAC:
    # 11:22:33:44:55:66
    # EtherType:
    # 0x0800

    # 14-byte Ethernet header
    # +
    # known payload bytes:
    # 00 01 02 03 04 05 06 XX

    await send_beat(dut=dut, data=0x2211FFEEDDCCBBAA)
    await send_beat(dut=dut, data=0x0100000866554433)
    await send_beat(dut=dut, data=0x0000000605040302, keep=0b0001_1111, last=1) # has only 5 valid bytes (no flush)


    await monitor
    
    
    # Check first realigned output beat

    assert output_beats[0][0] == 0x0006050403020100, \
        "First realigned output beat is incorrect"

    assert output_beats[0][1] == 0b0111_1111, \
        "First realigned output beat should contain 7 valid bytes"

    assert output_beats[0][2] == 1, \
        "First realigned output beat should be the final beat"


# ============================================================
# Test 5: Flush case
# ============================================================

@cocotb.test()
async def test_flush_final_beat(dut):
    await start_clock(dut)
    await reset_dut(dut)

    
    output_beats = []

    # Start monitor BEFORE sending input
    monitor = cocotb.start_soon(
        collect_output_beats(dut, output_beats, expected_count=2)
    )

    # dst MAC:
    # AA:BB:CC:DD:EE:FF
    # src MAC:
    # 11:22:33:44:55:66
    # EtherType:
    # 0x0800

    # 14-byte Ethernet header
    # +
    # known payload bytes:
    # 00 01 02 03 04 05 06 07
    # 08 09

    await send_beat(dut=dut, data=0x2211FFEEDDCCBBAA)
    await send_beat(dut=dut, data=0x0100000866554433)
    await send_beat(dut=dut, data=0x0908070605040302, keep=0b1111_1111, last=1) # has all 8 valid bytes (flush)

    await monitor
    
    # Check first realigned output beat

    assert output_beats[0][0] == 0x0706050403020100, \
        "First realigned output beat is incorrect"

    assert output_beats[0][1] == 0b1111_1111, \
        "First realigned output beat should contain 8 valid bytes"

    assert output_beats[0][2] == 0, \
        "First realigned output beat should not be the final beat"


    # Check flush output beat

    assert output_beats[1][0] == 0x0000000000000908, \
        "Flush output beat is incorrect"

    assert output_beats[1][1] == 0b0000_0011, \
        "Flush output beat should contain 2 valid bytes"

    assert output_beats[1][2] == 1, \
        "Flush output beat should be the final beat"


# ============================================================
# Test 6: Backpressure
# ============================================================

@cocotb.test()
async def test_backpressure(dut):
    await start_clock(dut)
    await reset_dut(dut)

    # Ethernet header:
    # dst MAC: AA:BB:CC:DD:EE:FF
    # src MAC: 11:22:33:44:55:66
    # EtherType: 0x0800
    #
    # Payload:
    # 00 01 02 03 04 05 06 07

    # Send Ethernet header beats normally
    await send_beat(
        dut,
        data=0x2211FFEEDDCCBBAA
    )

    await send_beat(
        dut,
        data=0x0100000866554433
    )

    # ------------------------------------------------------------
    # Stall downstream BEFORE sending the payload beat
    # ------------------------------------------------------------

    await FallingEdge(dut.clk)

    dut.m_axis_tready.value = 0

    # At this point the output register is empty, so even though
    # downstream is stalled, the parser should still be able to
    # accept one input beat.
    assert dut.s_axis_tready.value == 1, \
        "Parser should accept one beat while output register is empty"

    # ------------------------------------------------------------
    # Present the payload beat
    # ------------------------------------------------------------

    dut.s_axis_tdata.value = 0x0000070605040302
    dut.s_axis_tkeep.value = 0b0011_1111
    dut.s_axis_tlast.value = 1
    dut.s_axis_tvalid.value = 1

    # Parser accepts payload beat here and generates output
    await RisingEdge(dut.clk)
    await ReadOnly()

    # Output beat should now exist
    assert dut.m_axis_tvalid.value == 1, \
        "Output should become valid after payload beat is accepted"

    assert int(dut.m_axis_tdata.value) == 0x0706050403020100, \
        "Output data is incorrect"

    assert int(dut.m_axis_tkeep.value) == 0xFF, \
        "Output tkeep is incorrect"

    assert dut.m_axis_tlast.value == 1, \
        "Output beat should be the final beat"

    # Since downstream is stalled and the output register is now full,
    # the parser must stop accepting new input.
    assert dut.s_axis_tready.value == 0, \
        "s_axis_tready should go low when output register is full"

    # ------------------------------------------------------------
    # Stop driving the input beat
    # ------------------------------------------------------------

    await FallingEdge(dut.clk)
    dut.s_axis_tvalid.value = 0

    # Save output values so we can verify they remain stable
    expected_data = int(dut.m_axis_tdata.value)
    expected_keep = int(dut.m_axis_tkeep.value)
    expected_last = int(dut.m_axis_tlast.value)

    # ------------------------------------------------------------
    # Hold backpressure for several cycles
    # ------------------------------------------------------------

    for _ in range(2):
        await RisingEdge(dut.clk)
        await ReadOnly()

        assert dut.m_axis_tvalid.value == 1, \
            "m_axis_tvalid should remain high during backpressure"

        assert int(dut.m_axis_tdata.value) == expected_data, \
            "m_axis_tdata changed while downstream was stalled"

        assert int(dut.m_axis_tkeep.value) == expected_keep, \
            "m_axis_tkeep changed while downstream was stalled"

        assert int(dut.m_axis_tlast.value) == expected_last, \
            "m_axis_tlast changed while downstream was stalled"

        assert dut.s_axis_tready.value == 0, \
            "s_axis_tready should remain low while output is stalled"

    # ------------------------------------------------------------
    # Release downstream backpressure
    # ------------------------------------------------------------

    await FallingEdge(dut.clk)
    dut.m_axis_tready.value = 1

    # Pending output beat is consumed here
    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 0, \
        "Output register should become empty after beat is consumed"

    assert dut.s_axis_tready.value == 1, \
        "Parser should be ready for new input after output is consumed"