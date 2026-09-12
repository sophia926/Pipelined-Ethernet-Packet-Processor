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

    dut.m_axis_tready.value = 0

    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)

    await FallingEdge(dut.clk)
    dut.rst_n.value = 1

    await RisingEdge(dut.clk)
    await ReadOnly()


@cocotb.test()
async def test_reset_state(dut):
    await start_clock(dut)
    await reset_dut(dut)

    assert dut.m_axis_tvalid.value == 0, \
        "m_axis_tvalid should be 0 after reset"

    assert dut.s_axis_tready.value == 1, \
        "Register should be ready after reset"


@cocotb.test()
async def test_accept_one_beat(dut):
    await start_clock(dut)
    await reset_dut(dut)

    await FallingEdge(dut.clk)

    dut.s_axis_tdata.value = 0x1122334455667788
    dut.s_axis_tkeep.value = 0xFF
    dut.s_axis_tlast.value = 1
    dut.s_axis_tvalid.value = 1

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


@cocotb.test()
async def test_backpressure(dut):
    await start_clock(dut)
    await reset_dut(dut)

    # First fill the register
    await FallingEdge(dut.clk)

    dut.s_axis_tdata.value = 0x1111111111111111
    dut.s_axis_tkeep.value = 0xFF
    dut.s_axis_tlast.value = 0
    dut.s_axis_tvalid.value = 1
    dut.m_axis_tready.value = 0

    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 1

    # Now present another beat while downstream is stalled
    await FallingEdge(dut.clk)

    dut.s_axis_tdata.value = 0x2222222222222222
    dut.s_axis_tvalid.value = 1
    dut.m_axis_tready.value = 0

    await ReadOnly()

    assert dut.s_axis_tready.value == 0, \
        "Input should not be ready while register is full"

    old_data = int(dut.m_axis_tdata.value)

    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 1, \
        "Valid should remain high during backpressure"

    assert int(dut.m_axis_tdata.value) == old_data, \
        "Stored data changed during backpressure"


@cocotb.test()
async def test_consume_without_replacement(dut):
    await start_clock(dut)
    await reset_dut(dut)

    # Fill register
    await FallingEdge(dut.clk)

    dut.s_axis_tdata.value = 0xAAAAAAAAAAAAAAAA
    dut.s_axis_tkeep.value = 0xFF
    dut.s_axis_tlast.value = 0
    dut.s_axis_tvalid.value = 1
    dut.m_axis_tready.value = 0

    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 1

    # Consume it without sending a new beat
    await FallingEdge(dut.clk)

    dut.s_axis_tvalid.value = 0
    dut.m_axis_tready.value = 1

    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 0, \
        "Register should become empty after beat is consumed"

    assert dut.s_axis_tready.value == 1, \
        "Register should be ready after becoming empty"


@cocotb.test()
async def test_simultaneous_consume_and_replace(dut):
    await start_clock(dut)
    await reset_dut(dut)

    # Load first beat
    await FallingEdge(dut.clk)

    dut.s_axis_tdata.value = 0x1111111111111111
    dut.s_axis_tkeep.value = 0xFF
    dut.s_axis_tlast.value = 0
    dut.s_axis_tvalid.value = 1
    dut.m_axis_tready.value = 0

    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 1
    assert int(dut.m_axis_tdata.value) == 0x1111111111111111

    # Consume old beat and present replacement simultaneously
    await FallingEdge(dut.clk)

    dut.m_axis_tready.value = 1

    dut.s_axis_tdata.value = 0x2222222222222222
    dut.s_axis_tkeep.value = 0xFF
    dut.s_axis_tlast.value = 1
    dut.s_axis_tvalid.value = 1

    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 1, \
        "Register should remain valid after replacement"

    assert int(dut.m_axis_tdata.value) == 0x2222222222222222, \
        "Replacement beat was not stored"

    assert int(dut.m_axis_tkeep.value) == 0xFF, \
        "Replacement tkeep is incorrect"

    assert dut.m_axis_tlast.value == 1, \
        "Replacement tlast is incorrect"


@cocotb.test()
async def test_drain_final_beat(dut):
    await start_clock(dut)
    await reset_dut(dut)

    # Load one beat
    await FallingEdge(dut.clk)

    dut.s_axis_tdata.value = 0xDEADBEEFCAFEBABE
    dut.s_axis_tkeep.value = 0xFF
    dut.s_axis_tlast.value = 1
    dut.s_axis_tvalid.value = 1
    dut.m_axis_tready.value = 0

    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 1

    # Drain it
    await FallingEdge(dut.clk)

    dut.s_axis_tvalid.value = 0
    dut.m_axis_tready.value = 1

    await RisingEdge(dut.clk)
    await ReadOnly()

    assert dut.m_axis_tvalid.value == 0, \
        "Register should be empty after final beat"

    assert dut.s_axis_tready.value == 1, \
        "Register should be ready when empty"