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

    assert dut.ethernet_header_valid.value == 0
    assert dut.ipv4_header_valid.value == 0
    assert dut.tcp_header_valid.value == 0

    assert dut.dst_mac.value == 0
    assert dut.src_mac.value == 0

    assert dut.src_ip.value == 0
    assert dut.dst_ip.value == 0

    assert dut.src_port.value == 0
    assert dut.dst_port.value == 0


# ============================================================
# Test 2: Complete Ethernet + IPv4 + TCP frame
# ============================================================

@cocotb.test()
async def test_complete_packet(dut):
    await start_clock(dut)
    await reset_dut(dut)

    output_beats = []

    monitor = cocotb.start_soon(
        collect_output_beats(
            dut,
            output_beats,
            expected_count=2
        )
    )

    # ========================================================
    # Complete packet
    #
    # Ethernet header: 14 bytes
    # IPv4 header:     20 bytes
    # TCP header:      20 bytes
    # TCP payload:     16 bytes
    #
    # Total Ethernet frame:
    # 14 + 20 + 20 + 16 = 70 bytes
    # ========================================================


    # --------------------------------------------------------
    # Ethernet header
    # --------------------------------------------------------
    #
    # Destination MAC:
    # AA:BB:CC:DD:EE:FF
    #
    # Source MAC:
    # 11:22:33:44:55:66
    #
    # EtherType:
    # 08 00 = IPv4
    #
    # Ethernet bytes:
    #
    # AA BB CC DD EE FF 11 22
    # 33 44 55 66 08 00


    # --------------------------------------------------------
    # IPv4 header
    # --------------------------------------------------------
    #
    # Version = 4
    # IHL = 5
    # Total Length = 56 bytes
    #
    # 20-byte IPv4 header
    # + 20-byte TCP header
    # + 16-byte TCP payload
    #
    # Protocol = 6 = TCP
    #
    # Source IP:
    # C0 A8 01 0A = 192.168.1.10
    #
    # Destination IP:
    # 0A 00 00 05 = 10.0.0.5
    #
    # IPv4 bytes:
    #
    # 45 00 00 38 00 00 00 00
    # 40 06 00 00 C0 A8 01 0A
    # 0A 00 00 05


    # --------------------------------------------------------
    # TCP header
    # --------------------------------------------------------
    #
    # Source port:
    # 12 34
    #
    # Destination port:
    # 56 78
    #
    # Sequence:
    # 11 22 33 44
    #
    # ACK:
    # 55 66 77 88
    #
    # Data Offset = 5
    # Flags = SYN
    #
    # TCP bytes:
    #
    # 12 34 56 78 11 22 33 44
    # 55 66 77 88 50 02 00 00
    # 00 00 00 00


    # --------------------------------------------------------
    # TCP payload
    # --------------------------------------------------------
    #
    # 00 01 02 03 04 05 06 07
    # 08 09 0A 0B 0C 0D 0E 0F


    # ========================================================
    # Pack entire Ethernet frame into 64-bit beats
    # ========================================================

    # Beat 0:
    # AA BB CC DD EE FF 11 22
    await send_beat(
        dut,
        data=0x2211FFEEDDCCBBAA
    )

    # Beat 1:
    # 33 44 55 66 08 00 45 00
    await send_beat(
        dut,
        data=0x0045000866554433
    )

    # Beat 2:
    # 00 38 00 00 00 00 40 06
    await send_beat(
        dut,
        data=0x0640000000003800
    )

    # Beat 3:
    # 00 00 C0 A8 01 0A 0A 00
    await send_beat(
        dut,
        data=0x000A0A01A8C00000
    )

    # Beat 4:
    # 00 05 12 34 56 78 11 22
    await send_beat(
        dut,
        data=0x2211785634120500
    )

    # Beat 5:
    # 33 44 55 66 77 88 50 02
    await send_beat(
        dut,
        data=0x0250887766554433
    )

    # Beat 6:
    # 00 00 00 00 00 00 00 00
    #
    # First 4 bytes:
    # TCP window/checksum/urgent fields
    #
    # Last 4 bytes:
    # payload 00 01 02 03
    await send_beat(
        dut,
        data=0x0100000000000000
    )

    await send_beat(
        dut,
        data=0x0908070605040302
    )

    await send_beat(
        dut,
        data=0x00000F0E0D0C0B0A,
        keep=0b0011_1111,
        last=1
    )
    await monitor


    # ========================================================
    # Check Ethernet metadata
    # ========================================================

    assert int(dut.dst_mac.value) == 0xAABBCCDDEEFF
    assert int(dut.src_mac.value) == 0x112233445566
    assert int(dut.ethertype.value) == 0x0800
    assert dut.is_ipv4.value == 1


    # ========================================================
    # Check IPv4 metadata
    # ========================================================

    assert int(dut.ip_ihl.value) == 5
    assert int(dut.ip_total_length.value) == 56
    assert int(dut.ip_protocol.value) == 6

    assert int(dut.src_ip.value) == 0xC0A8010A
    assert int(dut.dst_ip.value) == 0x0A000005

    assert dut.is_tcp.value == 1


    # ========================================================
    # Check TCP metadata
    # ========================================================

    assert int(dut.src_port.value) == 0x1234
    assert int(dut.dst_port.value) == 0x5678

    assert int(dut.seq_num.value) == 0x11223344
    assert int(dut.ack_num.value) == 0x55667788

    assert int(dut.tcp_data_offset.value) == 5

    # SYN only
    assert int(dut.tcp_flags.value) == 0x002


    # ========================================================
    # Check final TCP payload
    # ========================================================

    assert len(output_beats) == 2

    # Payload bytes:
    # 00 01 02 03 04 05 06 07
    assert output_beats[0][0] == 0x0706050403020100
    assert output_beats[0][1] == 0xFF
    assert output_beats[0][2] == 0

    # Payload bytes:
    # 08 09 0A 0B 0C 0D 0E 0F
    assert output_beats[1][0] == 0x0F0E0D0C0B0A0908
    assert output_beats[1][1] == 0xFF
    assert output_beats[1][2] == 1