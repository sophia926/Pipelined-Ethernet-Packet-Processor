import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ReadOnly


async def reset_dut(dut):
    # Drive reset and idle inputs
    dut.rst_n.value = 0

    dut.s_axis_tdata.value = 0
    dut.s_axis_tkeep.value = 0
    dut.s_axis_tvalid.value = 0
    dut.s_axis_tlast.value = 0

    dut.m_axis_tready.value = 0

    # Let DUT sample reset for two rising edges
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)

    # Deassert reset away from the active edge
    await FallingEdge(dut.clk)
    dut.rst_n.value = 1

    # Let DUT sample rst_n = 1
    await RisingEdge(dut.clk)
    await ReadOnly()


@cocotb.test()
async def test_axis_register(dut):

    # ============================================================
    # Start clock
    # ============================================================

    cocotb.start_soon(
        Clock(dut.clk, 10, unit="ns").start()
    )

    await reset_dut(dut)


    # ============================================================
    # Test 1: Reset state
    # ============================================================

    assert dut.m_axis_tvalid.value == 0, \
        "m_axis_tvalid should be 0 after reset"

    assert dut.s_axis_tready.value == 1, \
        "Register should be ready after reset"


    # ============================================================
    # Test 2: Accept one beat
    # ============================================================

    # Drive input before the next active edge
    await FallingEdge(dut.clk)

    dut.s_axis_tdata.value = 0x1122334455667788
    dut.s_axis_tkeep.value = 0xFF
    dut.s_axis_tlast.value = 1
    dut.s_axis_tvalid.value = 1

    # DUT samples input here
    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 1, \
        "Output should contain valid data"

    assert int(dut.m_axis_tdata.value) == 0x1122334455667788, \
        "Output data does not match input"

    assert int(dut.m_axis_tkeep.value) == 0xFF, \
        "Output tkeep does not match input"

    assert dut.m_axis_tlast.value == 1, \
        "Output tlast does not match input"


    # ============================================================
    # Test 3: Backpressure
    # ============================================================

    # Drive new values during falling edge
    await FallingEdge(dut.clk)

    # Keep downstream stalled
    dut.m_axis_tready.value = 0

    # Present a second beat
    dut.s_axis_tdata.value = 0xAABBCCDDEEFF0011
    dut.s_axis_tkeep.value = 0xFF
    dut.s_axis_tlast.value = 0
    dut.s_axis_tvalid.value = 1

    # Because the register is full and downstream is not ready,
    # upstream should see ready = 0
    await ReadOnly()

    assert dut.s_axis_tready.value == 0, \
        "Input should not be ready while full and downstream stalled"

    old_data = int(dut.m_axis_tdata.value)

    # Let the stalled cycle complete
    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 1, \
        "Valid should remain high during backpressure"

    assert int(dut.m_axis_tdata.value) == old_data, \
        "Stored data changed during backpressure"


    # ============================================================
    # Test 4: Consume existing beat with no replacement
    # ============================================================

    await FallingEdge(dut.clk)

    # Stop presenting a new input beat
    dut.s_axis_tvalid.value = 0

    # Allow downstream to consume current stored beat
    dut.m_axis_tready.value = 1

    # Output handshake occurs here
    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 0, \
        "Register should become empty after output is consumed"

    assert dut.s_axis_tready.value == 1, \
        "Register should be ready after becoming empty"


    # ============================================================
    # Test 5: Simultaneous consume and replace
    # ============================================================

    # First load a beat into the empty register
    await FallingEdge(dut.clk)

    dut.m_axis_tready.value = 0

    dut.s_axis_tdata.value = 0x1111111111111111
    dut.s_axis_tkeep.value = 0xFF
    dut.s_axis_tlast.value = 0
    dut.s_axis_tvalid.value = 1

    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 1, \
        "First beat should be stored"

    assert int(dut.m_axis_tdata.value) == 0x1111111111111111, \
        "First stored beat is incorrect"


    # Now prepare simultaneous output consume + input accept
    await FallingEdge(dut.clk)

    dut.m_axis_tready.value = 1

    dut.s_axis_tdata.value = 0x2222222222222222
    dut.s_axis_tkeep.value = 0xFF
    dut.s_axis_tlast.value = 1
    dut.s_axis_tvalid.value = 1

    # At this edge:
    # - downstream consumes 0x1111...
    # - register accepts 0x2222...
    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 1, \
        "Register should remain valid after simultaneous replacement"

    assert int(dut.m_axis_tdata.value) == 0x2222222222222222, \
        "New beat should replace consumed beat"

    assert int(dut.m_axis_tkeep.value) == 0xFF, \
        "Replacement tkeep is incorrect"

    assert dut.m_axis_tlast.value == 1, \
        "Replacement tlast is incorrect"


    # ============================================================
    # Test 6: Drain final beat
    # ============================================================

    await FallingEdge(dut.clk)

    dut.s_axis_tvalid.value = 0
    dut.m_axis_tready.value = 1

    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 0, \
        "Register should be empty after final beat is consumed"

    assert dut.s_axis_tready.value == 1, \
        "Register should be ready when empty"
