# File saved with Nlview 7.8.0 2024-04-26 e1825d835c VDI=44 GEI=38 GUI=JA:24.0 threadsafe
# 
# non-default properties - (restore without -noprops)
property -colorscheme classic
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #575d6c
property boxcolor1 #575d6c
property boxcolor2 #000000
property boxinstcolor #1c1f28
property boxpincolor #1c1f28
property buscolor #009633
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #e5c7ff
property fillcolor2 #cde5ff
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 24
property maxzoom 10
property netcolor #8bc34a
property objecthighlight0 #fe00f6
property objecthighlight1 #ffea00
property objecthighlight2 #84e413
property objecthighlight3 #1661ff
property objecthighlight4 #d9b7ff
property objecthighlight5 #ffa358
property objecthighlight6 #ff2b2b
property objecthighlight7 #00e0ff
property objecthighlight8 #c0ca33
property objecthighlight9 #b16eff
property objecthighlight10 #46a466
property objecthighlight11 #caff78
property objecthighlight12 #ab47bc
property objecthighlight13 #b4602c
property objecthighlight14 #c20f8c
property objecthighlight15 #00ffaa
property objecthighlight16 #ff9fe4
property objecthighlight17 #ff8019
property objecthighlight18 #26b3ff
property objecthighlight19 #e5551c
property overlaycolor #8bc34a
property pbuscolor #000000
property pbusnamecolor #1c1f28
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #1c1f28
property ripindexfontsize 4
property rippercolor #000000
property rubberbandcolor #1c1f28
property rubberbandfontsize 26
property selectattr 0
property selectionappearance 2
property selectioncolor #396cef
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 1
property timelimit 1
#
module new network_pipeline work:network_pipeline:NOFILE -nosplit
load symbol OBUF hdi_primitives BUF pin O output pin I input fillcolor 1
load symbol BUFG hdi_primitives BUF pin O output pin I input fillcolor 1
load symbol IBUF hdi_primitives BUF pin O output pin I input fillcolor 1
load symbol ethernet_parser work:ethernet_parser:NOFILE HIERBOX pin byte_count_reg[3] input.left pin byte_count_reg[3]_0 input.left pin clk_IBUF_BUFG input.left pin eth_ip_tlast output.right pin eth_ip_tvalid output.right pin ethernet_header_valid_OBUF output.right pin is_ipv4_OBUF output.right pin leftover_count_reg[2] output.right pin out_keep_reg_reg[2]_0 output.right pin out_keep_reg_reg[3]_0 output.right pin out_keep_reg_reg[5]_0 input.left pin out_keep_reg_reg[5]_1 input.left pin out_keep_reg_reg[7]_0 input.left pin out_keep_reg_reg[7]_1 input.left pin out_last_reg_reg_0 output.right pin out_last_reg_reg_1 output.right pin out_valid_reg_reg_0 input.left pin rst_n_IBUF input.left pin s_axis_tlast_IBUF input.left pin s_axis_tready input.left pin s_axis_tready_0 input.left pin s_axis_tready_OBUF output.right pin s_axis_tvalid_IBUF input.left pin src_mac_reg[31]_0 input.left pin src_mac_reg[31]_1 input.left pin state_reg[0]_0 input.left pinBus D output.right [1:0] pinBus Q output.right [47:0] pinBus eth_ip_tdata output.right [63:0] pinBus eth_ip_tkeep output.right [7:0] pinBus ethertype_reg[15]_0 output.right [15:0] pinBus leftover_count output.right [0:0] pinBus s_axis_tdata_IBUF input.left [63:0] pinBus s_axis_tkeep_IBUF input.left [7:0] pinBus src_mac_reg[47]_0 output.right [47:0] pinBus state input.left [0:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ipv4_parser work:ipv4_parser:NOFILE HIERBOX pin CLK input.left pin byte_count_reg[3]_0 input.left pin byte_count_reg[3]_1 input.left pin dst_ip_reg[0]_0 input.left pin eth_ip_tlast input.left pin eth_ip_tvalid input.left pin ip_tcp_tlast output.right pin ip_tcp_tvalid output.right pin ipv4_header_valid_OBUF output.right pin is_tcp_OBUF output.right pin leftover_count_reg[0]_0 output.right pin leftover_count_reg[1]_0 output.right pin leftover_count_reg[2]_0 output.right pin leftover_count_reg[2]_1 output.right pin leftover_count_reg[2]_2 output.right pin lopt output.right pin lopt_1 output.right pin lopt_10 output.right pin lopt_11 output.right pin lopt_2 output.right pin lopt_3 output.right pin lopt_4 output.right pin lopt_5 output.right pin lopt_6 output.right pin lopt_7 output.right pin lopt_8 output.right pin lopt_9 output.right pin out_keep_reg_reg[0]_0 output.right pin out_keep_reg_reg[0]_1 output.right pin out_keep_reg_reg[6]_0 input.left pin out_keep_reg_reg[6]_1 input.left pin out_keep_reg_reg[6]_2 input.left pin out_keep_reg_reg[7]_0 output.right pin out_last_reg_reg_0 output.right pin out_last_reg_reg_1 input.left pin out_valid_reg_reg_0 output.right pin out_valid_reg_reg_1 input.left pin rst_n_IBUF input.left pin shift_reg_reg[0]_0 input.left pin state[1]_i_4 input.left pin state_reg[0]_0 output.right pin state_reg[0]_1 output.right pin state_reg[0]_2 output.right pin state_reg[0]_3 input.left pin state_reg[1]_0 output.right pin state_reg[1]_1 output.right pin state_reg[1]_2 output.right pinBus D output.right [1:0] pinBus Q output.right [6:0] pinBus dst_ip_reg[31]_0 output.right [31:0] pinBus eth_ip_tdata input.left [63:0] pinBus eth_ip_tkeep input.left [7:0] pinBus ip_ihl_OBUF output.right [3:0] pinBus ip_protocol_reg[7]_0 output.right [7:0] pinBus ip_total_length_reg[15]_0 output.right [15:0] pinBus leftover_count output.right [0:0] pinBus leftover_count_0 input.left [0:0] pinBus out_data_reg_reg[63]_0 output.right [63:0] pinBus out_keep_reg_reg[7]_1 input.left [1:0] pinBus src_ip_reg[31]_0 output.right [31:0] pinBus state input.left [0:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol tcp_parser work:tcp_parser:NOFILE HIERBOX pin CLK input.left pin byte_count_reg[3]_0 input.left pin ip_tcp_tlast input.left pin ip_tcp_tvalid input.left pin leftover_count_reg[0]_1 input.left pin leftover_count_reg[2]_0 output.right pin leftover_count_reg[2]_1 output.right pin leftover_count_reg[2]_2 output.right pin lopt output.right pin lopt_1 output.right pin lopt_2 output.right pin lopt_3 output.right pin m_axis_tlast_OBUF output.right pin m_axis_tready_IBUF input.left pin m_axis_tvalid_OBUF output.right pin out_keep_reg_reg[5]_0 input.left pin out_valid_reg_reg_0 output.right pin out_valid_reg_reg_1 output.right pin out_valid_reg_reg_2 output.right pin rst_n_IBUF input.left pin shift_reg_reg[0]_0 input.left pin state_reg[0]_0 input.left pin tcp_header_valid_OBUF output.right pinBus D input.left [1:0] pinBus Q input.left [6:0] pinBus ack_num_reg[31]_0 output.right [31:0] pinBus dst_port_reg[15]_0 output.right [15:0] pinBus leftover_count_reg[0]_0 input.left [0:0] pinBus out_data_reg_reg[63]_0 output.right [63:0] pinBus out_keep_reg_reg[7]_0 output.right [7:0] pinBus seq_num_reg[31]_0 output.right [31:0] pinBus shift_reg_reg[31]_0 input.left [63:0] pinBus src_port_reg[15]_0 output.right [15:0] pinBus state output.right [0:0] pinBus tcp_data_offset_OBUF output.right [3:0] pinBus tcp_flags_reg[8]_0 output.right [8:0] boxcolor 1 fillcolor 2 minwidth 13%
load port clk input -pg 1 -lvl 0 -x 0 -y 11740
load port ethernet_header_valid output -pg 1 -lvl 7 -x 3710 -y 11240
load port ipv4_header_valid output -pg 1 -lvl 7 -x 3710 -y 11520
load port is_ipv4 output -pg 1 -lvl 7 -x 3710 -y 11310
load port is_tcp output -pg 1 -lvl 7 -x 3710 -y 11590
load port m_axis_tlast output -pg 1 -lvl 7 -x 3710 -y 12220
load port m_axis_tready input -pg 1 -lvl 0 -x 0 -y 11420
load port m_axis_tvalid output -pg 1 -lvl 7 -x 3710 -y 12290
load port rst_n input -pg 1 -lvl 0 -x 0 -y 11940
load port s_axis_tlast input -pg 1 -lvl 0 -x 0 -y 12010
load port s_axis_tready output -pg 1 -lvl 7 -x 3710 -y 12850
load port s_axis_tvalid input -pg 1 -lvl 0 -x 0 -y 12080
load port tcp_header_valid output -pg 1 -lvl 7 -x 3710 -y 12640
load portBus ack_num output [31:0] -attr @name ack_num[31:0] -pg 1 -lvl 7 -x 3710 -y 5640
load portBus dst_ip output [31:0] -attr @name dst_ip[31:0] -pg 1 -lvl 7 -x 3710 -y 3400
load portBus dst_mac output [47:0] -attr @name dst_mac[47:0] -pg 1 -lvl 7 -x 3710 -y 40
load portBus dst_port output [15:0] -attr @name dst_port[15:0] -pg 1 -lvl 7 -x 3710 -y 7880
load portBus ethertype output [15:0] -attr @name ethertype[15:0] -pg 1 -lvl 7 -x 3710 -y 9000
load portBus ip_ihl output [3:0] -attr @name ip_ihl[3:0] -pg 1 -lvl 7 -x 3710 -y 11870
load portBus ip_protocol output [7:0] -attr @name ip_protocol[7:0] -pg 1 -lvl 7 -x 3710 -y 11620
load portBus ip_total_length output [15:0] -attr @name ip_total_length[15:0] -pg 1 -lvl 7 -x 3710 -y 10120
load portBus m_axis_tdata output [63:0] -attr @name m_axis_tdata[63:0] -pg 1 -lvl 7 -x 3710 -y 13480
load portBus m_axis_tkeep output [7:0] -attr @name m_axis_tkeep[7:0] -pg 1 -lvl 7 -x 3710 -y 12920
load portBus s_axis_tdata input [63:0] -attr @name s_axis_tdata[63:0] -pg 1 -lvl 0 -x 0 -y 12150
load portBus s_axis_tkeep input [7:0] -attr @name s_axis_tkeep[7:0] -pg 1 -lvl 0 -x 0 -y 15440
load portBus seq_num output [31:0] -attr @name seq_num[31:0] -pg 1 -lvl 7 -x 3710 -y 23070
load portBus src_ip output [31:0] -attr @name src_ip[31:0] -pg 1 -lvl 7 -x 3710 -y 25310
load portBus src_mac output [47:0] -attr @name src_mac[47:0] -pg 1 -lvl 7 -x 3710 -y 19710
load portBus src_port output [15:0] -attr @name src_port[15:0] -pg 1 -lvl 7 -x 3710 -y 17960
load portBus tcp_data_offset output [3:0] -attr @name tcp_data_offset[3:0] -pg 1 -lvl 7 -x 3710 -y 12360
load portBus tcp_flags output [8:0] -attr @name tcp_flags[8:0] -pg 1 -lvl 7 -x 3710 -y 19080
load inst ack_num_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5640
load inst ack_num_OBUF[10]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6340
load inst ack_num_OBUF[11]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6410
load inst ack_num_OBUF[12]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6480
load inst ack_num_OBUF[13]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6550
load inst ack_num_OBUF[14]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6620
load inst ack_num_OBUF[15]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6690
load inst ack_num_OBUF[16]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6760
load inst ack_num_OBUF[17]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6830
load inst ack_num_OBUF[18]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6900
load inst ack_num_OBUF[19]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6970
load inst ack_num_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5710
load inst ack_num_OBUF[20]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7040
load inst ack_num_OBUF[21]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7110
load inst ack_num_OBUF[22]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7180
load inst ack_num_OBUF[23]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7250
load inst ack_num_OBUF[24]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7320
load inst ack_num_OBUF[25]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7390
load inst ack_num_OBUF[26]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7460
load inst ack_num_OBUF[27]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7530
load inst ack_num_OBUF[28]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7600
load inst ack_num_OBUF[29]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7670
load inst ack_num_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5780
load inst ack_num_OBUF[30]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7740
load inst ack_num_OBUF[31]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7810
load inst ack_num_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5850
load inst ack_num_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5920
load inst ack_num_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5990
load inst ack_num_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6060
load inst ack_num_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6130
load inst ack_num_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6200
load inst ack_num_OBUF[9]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 6270
load inst clk_IBUF_BUFG_inst BUFG hdi_primitives -attr @cell(#1c1f28) BUFG -pg 1 -lvl 2 -x 220 -y 11740
load inst clk_IBUF_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 1 -x 40 -y 11740
load inst dst_ip_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3400
load inst dst_ip_OBUF[10]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4100
load inst dst_ip_OBUF[11]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4170
load inst dst_ip_OBUF[12]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4240
load inst dst_ip_OBUF[13]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4310
load inst dst_ip_OBUF[14]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4380
load inst dst_ip_OBUF[15]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4450
load inst dst_ip_OBUF[16]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4520
load inst dst_ip_OBUF[17]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4590
load inst dst_ip_OBUF[18]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4660
load inst dst_ip_OBUF[19]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4730
load inst dst_ip_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3470
load inst dst_ip_OBUF[20]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4800
load inst dst_ip_OBUF[21]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4870
load inst dst_ip_OBUF[22]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4940
load inst dst_ip_OBUF[23]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5010
load inst dst_ip_OBUF[24]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5080
load inst dst_ip_OBUF[25]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5150
load inst dst_ip_OBUF[26]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5220
load inst dst_ip_OBUF[27]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5290
load inst dst_ip_OBUF[28]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5360
load inst dst_ip_OBUF[29]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5430
load inst dst_ip_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3540
load inst dst_ip_OBUF[30]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5500
load inst dst_ip_OBUF[31]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 5570
load inst dst_ip_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3610
load inst dst_ip_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3680
load inst dst_ip_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3750
load inst dst_ip_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3820
load inst dst_ip_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3890
load inst dst_ip_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3960
load inst dst_ip_OBUF[9]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 4030
load inst dst_mac_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 40
load inst dst_mac_OBUF[10]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 740
load inst dst_mac_OBUF[11]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 810
load inst dst_mac_OBUF[12]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 880
load inst dst_mac_OBUF[13]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 950
load inst dst_mac_OBUF[14]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1020
load inst dst_mac_OBUF[15]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1090
load inst dst_mac_OBUF[16]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1160
load inst dst_mac_OBUF[17]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1230
load inst dst_mac_OBUF[18]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1300
load inst dst_mac_OBUF[19]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1370
load inst dst_mac_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 110
load inst dst_mac_OBUF[20]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1440
load inst dst_mac_OBUF[21]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1510
load inst dst_mac_OBUF[22]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1580
load inst dst_mac_OBUF[23]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1650
load inst dst_mac_OBUF[24]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1720
load inst dst_mac_OBUF[25]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1790
load inst dst_mac_OBUF[26]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1860
load inst dst_mac_OBUF[27]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 1930
load inst dst_mac_OBUF[28]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2000
load inst dst_mac_OBUF[29]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2070
load inst dst_mac_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 180
load inst dst_mac_OBUF[30]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2140
load inst dst_mac_OBUF[31]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2210
load inst dst_mac_OBUF[32]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2280
load inst dst_mac_OBUF[33]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2350
load inst dst_mac_OBUF[34]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2420
load inst dst_mac_OBUF[35]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2490
load inst dst_mac_OBUF[36]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2560
load inst dst_mac_OBUF[37]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2630
load inst dst_mac_OBUF[38]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2700
load inst dst_mac_OBUF[39]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2770
load inst dst_mac_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 250
load inst dst_mac_OBUF[40]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2840
load inst dst_mac_OBUF[41]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2910
load inst dst_mac_OBUF[42]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 2980
load inst dst_mac_OBUF[43]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3050
load inst dst_mac_OBUF[44]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3120
load inst dst_mac_OBUF[45]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3190
load inst dst_mac_OBUF[46]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3260
load inst dst_mac_OBUF[47]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 3330
load inst dst_mac_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 320
load inst dst_mac_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 390
load inst dst_mac_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 460
load inst dst_mac_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 530
load inst dst_mac_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 600
load inst dst_mac_OBUF[9]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 670
load inst dst_port_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7880
load inst dst_port_OBUF[10]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8580
load inst dst_port_OBUF[11]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8650
load inst dst_port_OBUF[12]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8720
load inst dst_port_OBUF[13]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8790
load inst dst_port_OBUF[14]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8860
load inst dst_port_OBUF[15]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8930
load inst dst_port_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 7950
load inst dst_port_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8020
load inst dst_port_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8090
load inst dst_port_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8160
load inst dst_port_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8230
load inst dst_port_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8300
load inst dst_port_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8370
load inst dst_port_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8440
load inst dst_port_OBUF[9]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 8510
load inst ethernet_header_valid_OBUF_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11240
load inst ethernet_parser_inst ethernet_parser work:ethernet_parser:NOFILE -autohide -attr @cell(#1c1f28) ethernet_parser -pinBusAttr D @name D[1:0] -pinBusAttr Q @name Q[47:0] -pinBusAttr eth_ip_tdata @name eth_ip_tdata[63:0] -pinBusAttr eth_ip_tkeep @name eth_ip_tkeep[7:0] -pinBusAttr ethertype_reg[15]_0 @name ethertype_reg[15]_0[15:0] -pinBusAttr leftover_count @name leftover_count -pinBusAttr s_axis_tdata_IBUF @name s_axis_tdata_IBUF[63:0] -pinBusAttr s_axis_tkeep_IBUF @name s_axis_tkeep_IBUF[7:0] -pinBusAttr src_mac_reg[47]_0 @name src_mac_reg[47]_0[47:0] -pinBusAttr state @name state -pg 1 -lvl 3 -x 800 -y 11790
load inst ethertype_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9000
load inst ethertype_OBUF[10]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9700
load inst ethertype_OBUF[11]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9770
load inst ethertype_OBUF[12]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9840
load inst ethertype_OBUF[13]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9910
load inst ethertype_OBUF[14]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9980
load inst ethertype_OBUF[15]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10050
load inst ethertype_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9070
load inst ethertype_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9140
load inst ethertype_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9210
load inst ethertype_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9280
load inst ethertype_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9350
load inst ethertype_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9420
load inst ethertype_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9490
load inst ethertype_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9560
load inst ethertype_OBUF[9]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 9630
load inst ip_ihl_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11870
load inst ip_ihl_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11940
load inst ip_ihl_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12010
load inst ip_ihl_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12080
load inst ip_protocol_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11380
load inst ip_protocol_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11450
load inst ip_protocol_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11660
load inst ip_protocol_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11730
load inst ip_protocol_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11800
load inst ip_protocol_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12150
load inst ip_protocol_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12710
load inst ip_protocol_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12780
load inst ip_total_length_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10120
load inst ip_total_length_OBUF[10]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10820
load inst ip_total_length_OBUF[11]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10890
load inst ip_total_length_OBUF[12]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10960
load inst ip_total_length_OBUF[13]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11030
load inst ip_total_length_OBUF[14]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11100
load inst ip_total_length_OBUF[15]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11170
load inst ip_total_length_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10190
load inst ip_total_length_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10260
load inst ip_total_length_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10330
load inst ip_total_length_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10400
load inst ip_total_length_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10470
load inst ip_total_length_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10540
load inst ip_total_length_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10610
load inst ip_total_length_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10680
load inst ip_total_length_OBUF[9]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 10750
load inst ipv4_header_valid_OBUF_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11520
load inst ipv4_parser_inst ipv4_parser work:ipv4_parser:NOFILE -autohide -attr @cell(#1c1f28) ipv4_parser -pinBusAttr D @name D[1:0] -pinBusAttr Q @name Q[6:0] -pinBusAttr dst_ip_reg[31]_0 @name dst_ip_reg[31]_0[31:0] -pinBusAttr eth_ip_tdata @name eth_ip_tdata[63:0] -pinBusAttr eth_ip_tkeep @name eth_ip_tkeep[7:0] -pinBusAttr ip_ihl_OBUF @name ip_ihl_OBUF[3:0] -pinBusAttr ip_ihl_OBUF @attr n/c -pinBusAttr ip_protocol_reg[7]_0 @name ip_protocol_reg[7]_0[7:0] -pinBusAttr ip_protocol_reg[7]_0 @attr n/c -pinBusAttr ip_total_length_reg[15]_0 @name ip_total_length_reg[15]_0[15:0] -pinBusAttr leftover_count @name leftover_count -pinBusAttr leftover_count_0 @name leftover_count_0 -pinBusAttr out_data_reg_reg[63]_0 @name out_data_reg_reg[63]_0[63:0] -pinBusAttr out_keep_reg_reg[7]_1 @name out_keep_reg_reg[7]_1[1:0] -pinBusAttr src_ip_reg[31]_0 @name src_ip_reg[31]_0[31:0] -pinBusAttr state @name state -pg 1 -lvl 4 -x 1610 -y 11590
load inst is_ipv4_OBUF_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11310
load inst is_tcp_OBUF_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 11590
load inst m_axis_tdata_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13480
load inst m_axis_tdata_OBUF[10]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14180
load inst m_axis_tdata_OBUF[11]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14250
load inst m_axis_tdata_OBUF[12]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14320
load inst m_axis_tdata_OBUF[13]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14390
load inst m_axis_tdata_OBUF[14]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14460
load inst m_axis_tdata_OBUF[15]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14530
load inst m_axis_tdata_OBUF[16]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14600
load inst m_axis_tdata_OBUF[17]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14670
load inst m_axis_tdata_OBUF[18]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14740
load inst m_axis_tdata_OBUF[19]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14810
load inst m_axis_tdata_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13550
load inst m_axis_tdata_OBUF[20]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14880
load inst m_axis_tdata_OBUF[21]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14950
load inst m_axis_tdata_OBUF[22]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15020
load inst m_axis_tdata_OBUF[23]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15090
load inst m_axis_tdata_OBUF[24]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15160
load inst m_axis_tdata_OBUF[25]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15230
load inst m_axis_tdata_OBUF[26]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15300
load inst m_axis_tdata_OBUF[27]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15370
load inst m_axis_tdata_OBUF[28]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15440
load inst m_axis_tdata_OBUF[29]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15510
load inst m_axis_tdata_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13620
load inst m_axis_tdata_OBUF[30]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15580
load inst m_axis_tdata_OBUF[31]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15650
load inst m_axis_tdata_OBUF[32]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15720
load inst m_axis_tdata_OBUF[33]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15790
load inst m_axis_tdata_OBUF[34]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15860
load inst m_axis_tdata_OBUF[35]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 15930
load inst m_axis_tdata_OBUF[36]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16000
load inst m_axis_tdata_OBUF[37]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16070
load inst m_axis_tdata_OBUF[38]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16140
load inst m_axis_tdata_OBUF[39]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16210
load inst m_axis_tdata_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13690
load inst m_axis_tdata_OBUF[40]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16280
load inst m_axis_tdata_OBUF[41]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16350
load inst m_axis_tdata_OBUF[42]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16420
load inst m_axis_tdata_OBUF[43]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16490
load inst m_axis_tdata_OBUF[44]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16560
load inst m_axis_tdata_OBUF[45]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16630
load inst m_axis_tdata_OBUF[46]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16700
load inst m_axis_tdata_OBUF[47]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16770
load inst m_axis_tdata_OBUF[48]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16840
load inst m_axis_tdata_OBUF[49]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16910
load inst m_axis_tdata_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13760
load inst m_axis_tdata_OBUF[50]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 16980
load inst m_axis_tdata_OBUF[51]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17050
load inst m_axis_tdata_OBUF[52]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17120
load inst m_axis_tdata_OBUF[53]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17190
load inst m_axis_tdata_OBUF[54]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17260
load inst m_axis_tdata_OBUF[55]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17330
load inst m_axis_tdata_OBUF[56]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17400
load inst m_axis_tdata_OBUF[57]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17470
load inst m_axis_tdata_OBUF[58]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17540
load inst m_axis_tdata_OBUF[59]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17610
load inst m_axis_tdata_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13830
load inst m_axis_tdata_OBUF[60]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17680
load inst m_axis_tdata_OBUF[61]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17750
load inst m_axis_tdata_OBUF[62]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17820
load inst m_axis_tdata_OBUF[63]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17890
load inst m_axis_tdata_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13900
load inst m_axis_tdata_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13970
load inst m_axis_tdata_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14040
load inst m_axis_tdata_OBUF[9]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 14110
load inst m_axis_tkeep_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12920
load inst m_axis_tkeep_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12990
load inst m_axis_tkeep_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13060
load inst m_axis_tkeep_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13130
load inst m_axis_tkeep_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13200
load inst m_axis_tkeep_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13270
load inst m_axis_tkeep_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13340
load inst m_axis_tkeep_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 13410
load inst m_axis_tlast_OBUF_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12220
load inst m_axis_tready_IBUF_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 4 -x 1610 -y 11420
load inst m_axis_tvalid_OBUF_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12290
load inst rst_n_IBUF_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 11940
load inst s_axis_tdata_IBUF[0]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12150
load inst s_axis_tdata_IBUF[10]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12850
load inst s_axis_tdata_IBUF[11]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12920
load inst s_axis_tdata_IBUF[12]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12990
load inst s_axis_tdata_IBUF[13]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13060
load inst s_axis_tdata_IBUF[14]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13130
load inst s_axis_tdata_IBUF[15]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13200
load inst s_axis_tdata_IBUF[16]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13270
load inst s_axis_tdata_IBUF[17]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13340
load inst s_axis_tdata_IBUF[18]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13410
load inst s_axis_tdata_IBUF[19]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13480
load inst s_axis_tdata_IBUF[1]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12220
load inst s_axis_tdata_IBUF[20]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13550
load inst s_axis_tdata_IBUF[21]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13620
load inst s_axis_tdata_IBUF[22]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13690
load inst s_axis_tdata_IBUF[23]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13760
load inst s_axis_tdata_IBUF[24]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13830
load inst s_axis_tdata_IBUF[25]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13900
load inst s_axis_tdata_IBUF[26]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 13970
load inst s_axis_tdata_IBUF[27]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14040
load inst s_axis_tdata_IBUF[28]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14110
load inst s_axis_tdata_IBUF[29]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14180
load inst s_axis_tdata_IBUF[2]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12290
load inst s_axis_tdata_IBUF[30]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14250
load inst s_axis_tdata_IBUF[31]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14320
load inst s_axis_tdata_IBUF[32]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14390
load inst s_axis_tdata_IBUF[33]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14460
load inst s_axis_tdata_IBUF[34]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14530
load inst s_axis_tdata_IBUF[35]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14600
load inst s_axis_tdata_IBUF[36]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14670
load inst s_axis_tdata_IBUF[37]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14740
load inst s_axis_tdata_IBUF[38]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14810
load inst s_axis_tdata_IBUF[39]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14880
load inst s_axis_tdata_IBUF[3]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12360
load inst s_axis_tdata_IBUF[40]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 14950
load inst s_axis_tdata_IBUF[41]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15020
load inst s_axis_tdata_IBUF[42]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15090
load inst s_axis_tdata_IBUF[43]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15160
load inst s_axis_tdata_IBUF[44]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15230
load inst s_axis_tdata_IBUF[45]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15300
load inst s_axis_tdata_IBUF[46]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15370
load inst s_axis_tdata_IBUF[47]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16000
load inst s_axis_tdata_IBUF[48]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16070
load inst s_axis_tdata_IBUF[49]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16140
load inst s_axis_tdata_IBUF[4]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12430
load inst s_axis_tdata_IBUF[50]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16210
load inst s_axis_tdata_IBUF[51]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16280
load inst s_axis_tdata_IBUF[52]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16350
load inst s_axis_tdata_IBUF[53]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16420
load inst s_axis_tdata_IBUF[54]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16490
load inst s_axis_tdata_IBUF[55]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16560
load inst s_axis_tdata_IBUF[56]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16630
load inst s_axis_tdata_IBUF[57]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16700
load inst s_axis_tdata_IBUF[58]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16770
load inst s_axis_tdata_IBUF[59]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16840
load inst s_axis_tdata_IBUF[5]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12500
load inst s_axis_tdata_IBUF[60]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16910
load inst s_axis_tdata_IBUF[61]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 16980
load inst s_axis_tdata_IBUF[62]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 17050
load inst s_axis_tdata_IBUF[63]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 17120
load inst s_axis_tdata_IBUF[6]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12570
load inst s_axis_tdata_IBUF[7]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12640
load inst s_axis_tdata_IBUF[8]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12710
load inst s_axis_tdata_IBUF[9]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12780
load inst s_axis_tkeep_IBUF[0]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15440
load inst s_axis_tkeep_IBUF[1]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15510
load inst s_axis_tkeep_IBUF[2]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15580
load inst s_axis_tkeep_IBUF[3]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15650
load inst s_axis_tkeep_IBUF[4]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15720
load inst s_axis_tkeep_IBUF[5]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15790
load inst s_axis_tkeep_IBUF[6]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15860
load inst s_axis_tkeep_IBUF[7]_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 15930
load inst s_axis_tlast_IBUF_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12010
load inst s_axis_tready_OBUF_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12850
load inst s_axis_tvalid_IBUF_inst IBUF hdi_primitives -attr @cell(#1c1f28) IBUF -pg 1 -lvl 2 -x 220 -y 12080
load inst seq_num_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23070
load inst seq_num_OBUF[10]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23770
load inst seq_num_OBUF[11]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23840
load inst seq_num_OBUF[12]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23910
load inst seq_num_OBUF[13]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23980
load inst seq_num_OBUF[14]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24050
load inst seq_num_OBUF[15]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24120
load inst seq_num_OBUF[16]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24190
load inst seq_num_OBUF[17]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24260
load inst seq_num_OBUF[18]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24330
load inst seq_num_OBUF[19]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24400
load inst seq_num_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23140
load inst seq_num_OBUF[20]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24470
load inst seq_num_OBUF[21]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24540
load inst seq_num_OBUF[22]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24610
load inst seq_num_OBUF[23]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24680
load inst seq_num_OBUF[24]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24750
load inst seq_num_OBUF[25]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24820
load inst seq_num_OBUF[26]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24890
load inst seq_num_OBUF[27]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 24960
load inst seq_num_OBUF[28]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25030
load inst seq_num_OBUF[29]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25100
load inst seq_num_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23210
load inst seq_num_OBUF[30]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25170
load inst seq_num_OBUF[31]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25240
load inst seq_num_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23280
load inst seq_num_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23350
load inst seq_num_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23420
load inst seq_num_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23490
load inst seq_num_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23560
load inst seq_num_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23630
load inst seq_num_OBUF[9]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23700
load inst src_ip_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25310
load inst src_ip_OBUF[10]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26010
load inst src_ip_OBUF[11]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26080
load inst src_ip_OBUF[12]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26150
load inst src_ip_OBUF[13]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26220
load inst src_ip_OBUF[14]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26290
load inst src_ip_OBUF[15]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26360
load inst src_ip_OBUF[16]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26430
load inst src_ip_OBUF[17]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26500
load inst src_ip_OBUF[18]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26570
load inst src_ip_OBUF[19]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26640
load inst src_ip_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25380
load inst src_ip_OBUF[20]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26710
load inst src_ip_OBUF[21]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26780
load inst src_ip_OBUF[22]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26850
load inst src_ip_OBUF[23]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26920
load inst src_ip_OBUF[24]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 26990
load inst src_ip_OBUF[25]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 27060
load inst src_ip_OBUF[26]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 27130
load inst src_ip_OBUF[27]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 27200
load inst src_ip_OBUF[28]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 27270
load inst src_ip_OBUF[29]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 27340
load inst src_ip_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25450
load inst src_ip_OBUF[30]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 27410
load inst src_ip_OBUF[31]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 27480
load inst src_ip_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25520
load inst src_ip_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25590
load inst src_ip_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25660
load inst src_ip_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25730
load inst src_ip_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25800
load inst src_ip_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25870
load inst src_ip_OBUF[9]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 25940
load inst src_mac_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19710
load inst src_mac_OBUF[10]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20410
load inst src_mac_OBUF[11]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20480
load inst src_mac_OBUF[12]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20550
load inst src_mac_OBUF[13]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20620
load inst src_mac_OBUF[14]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20690
load inst src_mac_OBUF[15]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20760
load inst src_mac_OBUF[16]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20830
load inst src_mac_OBUF[17]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20900
load inst src_mac_OBUF[18]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20970
load inst src_mac_OBUF[19]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21040
load inst src_mac_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19780
load inst src_mac_OBUF[20]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21110
load inst src_mac_OBUF[21]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21180
load inst src_mac_OBUF[22]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21250
load inst src_mac_OBUF[23]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21320
load inst src_mac_OBUF[24]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21390
load inst src_mac_OBUF[25]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21460
load inst src_mac_OBUF[26]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21530
load inst src_mac_OBUF[27]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21600
load inst src_mac_OBUF[28]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21670
load inst src_mac_OBUF[29]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21740
load inst src_mac_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19850
load inst src_mac_OBUF[30]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21810
load inst src_mac_OBUF[31]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21880
load inst src_mac_OBUF[32]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 21950
load inst src_mac_OBUF[33]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22020
load inst src_mac_OBUF[34]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22090
load inst src_mac_OBUF[35]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22160
load inst src_mac_OBUF[36]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22230
load inst src_mac_OBUF[37]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22300
load inst src_mac_OBUF[38]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22370
load inst src_mac_OBUF[39]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22440
load inst src_mac_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19920
load inst src_mac_OBUF[40]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22510
load inst src_mac_OBUF[41]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22580
load inst src_mac_OBUF[42]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22650
load inst src_mac_OBUF[43]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22720
load inst src_mac_OBUF[44]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22790
load inst src_mac_OBUF[45]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22860
load inst src_mac_OBUF[46]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 22930
load inst src_mac_OBUF[47]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 23000
load inst src_mac_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19990
load inst src_mac_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20060
load inst src_mac_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20130
load inst src_mac_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20200
load inst src_mac_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20270
load inst src_mac_OBUF[9]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 20340
load inst src_port_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 17960
load inst src_port_OBUF[10]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18660
load inst src_port_OBUF[11]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18730
load inst src_port_OBUF[12]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18800
load inst src_port_OBUF[13]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18870
load inst src_port_OBUF[14]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18940
load inst src_port_OBUF[15]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19010
load inst src_port_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18030
load inst src_port_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18100
load inst src_port_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18170
load inst src_port_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18240
load inst src_port_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18310
load inst src_port_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18380
load inst src_port_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18450
load inst src_port_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18520
load inst src_port_OBUF[9]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 18590
load inst tcp_data_offset_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12360
load inst tcp_data_offset_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12430
load inst tcp_data_offset_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12500
load inst tcp_data_offset_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12570
load inst tcp_flags_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19080
load inst tcp_flags_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19150
load inst tcp_flags_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19220
load inst tcp_flags_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19290
load inst tcp_flags_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19360
load inst tcp_flags_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19430
load inst tcp_flags_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19500
load inst tcp_flags_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19570
load inst tcp_flags_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 19640
load inst tcp_header_valid_OBUF_inst OBUF hdi_primitives -attr @cell(#1c1f28) OBUF -pg 1 -lvl 6 -x 3420 -y 12640
load inst tcp_parser_inst tcp_parser work:tcp_parser:NOFILE -autohide -attr @cell(#1c1f28) tcp_parser -pinBusAttr D @name D[1:0] -pinBusAttr Q @name Q[6:0] -pinBusAttr ack_num_reg[31]_0 @name ack_num_reg[31]_0[31:0] -pinBusAttr dst_port_reg[15]_0 @name dst_port_reg[15]_0[15:0] -pinBusAttr leftover_count_reg[0]_0 @name leftover_count_reg[0]_0 -pinBusAttr out_data_reg_reg[63]_0 @name out_data_reg_reg[63]_0[63:0] -pinBusAttr out_keep_reg_reg[7]_0 @name out_keep_reg_reg[7]_0[7:0] -pinBusAttr seq_num_reg[31]_0 @name seq_num_reg[31]_0[31:0] -pinBusAttr shift_reg_reg[31]_0 @name shift_reg_reg[31]_0[63:0] -pinBusAttr src_port_reg[15]_0 @name src_port_reg[15]_0[15:0] -pinBusAttr state @name state -pinBusAttr tcp_data_offset_OBUF @name tcp_data_offset_OBUF[3:0] -pinBusAttr tcp_data_offset_OBUF @attr n/c -pinBusAttr tcp_flags_reg[8]_0 @name tcp_flags_reg[8]_0[8:0] -pg 1 -lvl 5 -x 2730 -y 12030
load net ack_num[0] -attr @rip 0 -port ack_num[0] -pin ack_num_OBUF[0]_inst O
load net ack_num[10] -attr @rip 10 -port ack_num[10] -pin ack_num_OBUF[10]_inst O
load net ack_num[11] -attr @rip 11 -port ack_num[11] -pin ack_num_OBUF[11]_inst O
load net ack_num[12] -attr @rip 12 -port ack_num[12] -pin ack_num_OBUF[12]_inst O
load net ack_num[13] -attr @rip 13 -port ack_num[13] -pin ack_num_OBUF[13]_inst O
load net ack_num[14] -attr @rip 14 -port ack_num[14] -pin ack_num_OBUF[14]_inst O
load net ack_num[15] -attr @rip 15 -port ack_num[15] -pin ack_num_OBUF[15]_inst O
load net ack_num[16] -attr @rip 16 -port ack_num[16] -pin ack_num_OBUF[16]_inst O
load net ack_num[17] -attr @rip 17 -port ack_num[17] -pin ack_num_OBUF[17]_inst O
load net ack_num[18] -attr @rip 18 -port ack_num[18] -pin ack_num_OBUF[18]_inst O
load net ack_num[19] -attr @rip 19 -port ack_num[19] -pin ack_num_OBUF[19]_inst O
load net ack_num[1] -attr @rip 1 -port ack_num[1] -pin ack_num_OBUF[1]_inst O
load net ack_num[20] -attr @rip 20 -port ack_num[20] -pin ack_num_OBUF[20]_inst O
load net ack_num[21] -attr @rip 21 -port ack_num[21] -pin ack_num_OBUF[21]_inst O
load net ack_num[22] -attr @rip 22 -port ack_num[22] -pin ack_num_OBUF[22]_inst O
load net ack_num[23] -attr @rip 23 -port ack_num[23] -pin ack_num_OBUF[23]_inst O
load net ack_num[24] -attr @rip 24 -port ack_num[24] -pin ack_num_OBUF[24]_inst O
load net ack_num[25] -attr @rip 25 -port ack_num[25] -pin ack_num_OBUF[25]_inst O
load net ack_num[26] -attr @rip 26 -port ack_num[26] -pin ack_num_OBUF[26]_inst O
load net ack_num[27] -attr @rip 27 -port ack_num[27] -pin ack_num_OBUF[27]_inst O
load net ack_num[28] -attr @rip 28 -port ack_num[28] -pin ack_num_OBUF[28]_inst O
load net ack_num[29] -attr @rip 29 -port ack_num[29] -pin ack_num_OBUF[29]_inst O
load net ack_num[2] -attr @rip 2 -port ack_num[2] -pin ack_num_OBUF[2]_inst O
load net ack_num[30] -attr @rip 30 -port ack_num[30] -pin ack_num_OBUF[30]_inst O
load net ack_num[31] -attr @rip 31 -port ack_num[31] -pin ack_num_OBUF[31]_inst O
load net ack_num[3] -attr @rip 3 -port ack_num[3] -pin ack_num_OBUF[3]_inst O
load net ack_num[4] -attr @rip 4 -port ack_num[4] -pin ack_num_OBUF[4]_inst O
load net ack_num[5] -attr @rip 5 -port ack_num[5] -pin ack_num_OBUF[5]_inst O
load net ack_num[6] -attr @rip 6 -port ack_num[6] -pin ack_num_OBUF[6]_inst O
load net ack_num[7] -attr @rip 7 -port ack_num[7] -pin ack_num_OBUF[7]_inst O
load net ack_num[8] -attr @rip 8 -port ack_num[8] -pin ack_num_OBUF[8]_inst O
load net ack_num[9] -attr @rip 9 -port ack_num[9] -pin ack_num_OBUF[9]_inst O
load net ack_num_OBUF[0] -attr @rip ack_num_reg[31]_0[0] -pin ack_num_OBUF[0]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[0]
load net ack_num_OBUF[10] -attr @rip ack_num_reg[31]_0[10] -pin ack_num_OBUF[10]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[10]
load net ack_num_OBUF[11] -attr @rip ack_num_reg[31]_0[11] -pin ack_num_OBUF[11]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[11]
load net ack_num_OBUF[12] -attr @rip ack_num_reg[31]_0[12] -pin ack_num_OBUF[12]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[12]
load net ack_num_OBUF[13] -attr @rip ack_num_reg[31]_0[13] -pin ack_num_OBUF[13]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[13]
load net ack_num_OBUF[14] -attr @rip ack_num_reg[31]_0[14] -pin ack_num_OBUF[14]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[14]
load net ack_num_OBUF[15] -attr @rip ack_num_reg[31]_0[15] -pin ack_num_OBUF[15]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[15]
load net ack_num_OBUF[16] -attr @rip ack_num_reg[31]_0[16] -pin ack_num_OBUF[16]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[16]
load net ack_num_OBUF[17] -attr @rip ack_num_reg[31]_0[17] -pin ack_num_OBUF[17]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[17]
load net ack_num_OBUF[18] -attr @rip ack_num_reg[31]_0[18] -pin ack_num_OBUF[18]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[18]
load net ack_num_OBUF[19] -attr @rip ack_num_reg[31]_0[19] -pin ack_num_OBUF[19]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[19]
load net ack_num_OBUF[1] -attr @rip ack_num_reg[31]_0[1] -pin ack_num_OBUF[1]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[1]
load net ack_num_OBUF[20] -attr @rip ack_num_reg[31]_0[20] -pin ack_num_OBUF[20]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[20]
load net ack_num_OBUF[21] -attr @rip ack_num_reg[31]_0[21] -pin ack_num_OBUF[21]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[21]
load net ack_num_OBUF[22] -attr @rip ack_num_reg[31]_0[22] -pin ack_num_OBUF[22]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[22]
load net ack_num_OBUF[23] -attr @rip ack_num_reg[31]_0[23] -pin ack_num_OBUF[23]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[23]
load net ack_num_OBUF[24] -attr @rip ack_num_reg[31]_0[24] -pin ack_num_OBUF[24]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[24]
load net ack_num_OBUF[25] -attr @rip ack_num_reg[31]_0[25] -pin ack_num_OBUF[25]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[25]
load net ack_num_OBUF[26] -attr @rip ack_num_reg[31]_0[26] -pin ack_num_OBUF[26]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[26]
load net ack_num_OBUF[27] -attr @rip ack_num_reg[31]_0[27] -pin ack_num_OBUF[27]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[27]
load net ack_num_OBUF[28] -attr @rip ack_num_reg[31]_0[28] -pin ack_num_OBUF[28]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[28]
load net ack_num_OBUF[29] -attr @rip ack_num_reg[31]_0[29] -pin ack_num_OBUF[29]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[29]
load net ack_num_OBUF[2] -attr @rip ack_num_reg[31]_0[2] -pin ack_num_OBUF[2]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[2]
load net ack_num_OBUF[30] -attr @rip ack_num_reg[31]_0[30] -pin ack_num_OBUF[30]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[30]
load net ack_num_OBUF[31] -attr @rip ack_num_reg[31]_0[31] -pin ack_num_OBUF[31]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[31]
load net ack_num_OBUF[3] -attr @rip ack_num_reg[31]_0[3] -pin ack_num_OBUF[3]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[3]
load net ack_num_OBUF[4] -attr @rip ack_num_reg[31]_0[4] -pin ack_num_OBUF[4]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[4]
load net ack_num_OBUF[5] -attr @rip ack_num_reg[31]_0[5] -pin ack_num_OBUF[5]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[5]
load net ack_num_OBUF[6] -attr @rip ack_num_reg[31]_0[6] -pin ack_num_OBUF[6]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[6]
load net ack_num_OBUF[7] -attr @rip ack_num_reg[31]_0[7] -pin ack_num_OBUF[7]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[7]
load net ack_num_OBUF[8] -attr @rip ack_num_reg[31]_0[8] -pin ack_num_OBUF[8]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[8]
load net ack_num_OBUF[9] -attr @rip ack_num_reg[31]_0[9] -pin ack_num_OBUF[9]_inst I -pin tcp_parser_inst ack_num_reg[31]_0[9]
load net clk -port clk -pin clk_IBUF_inst I
netloc clk 1 0 1 NJ 11740
load net clk_IBUF -pin clk_IBUF_BUFG_inst I -pin clk_IBUF_inst O
netloc clk_IBUF 1 1 1 NJ 11740
load net clk_IBUF_BUFG -pin clk_IBUF_BUFG_inst O -pin ethernet_parser_inst clk_IBUF_BUFG -pin ipv4_parser_inst CLK -pin tcp_parser_inst CLK
netloc clk_IBUF_BUFG 1 2 3 440 11740 1390 11340 2560
load net dst_ip[0] -attr @rip 0 -port dst_ip[0] -pin dst_ip_OBUF[0]_inst O
load net dst_ip[10] -attr @rip 10 -port dst_ip[10] -pin dst_ip_OBUF[10]_inst O
load net dst_ip[11] -attr @rip 11 -port dst_ip[11] -pin dst_ip_OBUF[11]_inst O
load net dst_ip[12] -attr @rip 12 -port dst_ip[12] -pin dst_ip_OBUF[12]_inst O
load net dst_ip[13] -attr @rip 13 -port dst_ip[13] -pin dst_ip_OBUF[13]_inst O
load net dst_ip[14] -attr @rip 14 -port dst_ip[14] -pin dst_ip_OBUF[14]_inst O
load net dst_ip[15] -attr @rip 15 -port dst_ip[15] -pin dst_ip_OBUF[15]_inst O
load net dst_ip[16] -attr @rip 16 -port dst_ip[16] -pin dst_ip_OBUF[16]_inst O
load net dst_ip[17] -attr @rip 17 -port dst_ip[17] -pin dst_ip_OBUF[17]_inst O
load net dst_ip[18] -attr @rip 18 -port dst_ip[18] -pin dst_ip_OBUF[18]_inst O
load net dst_ip[19] -attr @rip 19 -port dst_ip[19] -pin dst_ip_OBUF[19]_inst O
load net dst_ip[1] -attr @rip 1 -port dst_ip[1] -pin dst_ip_OBUF[1]_inst O
load net dst_ip[20] -attr @rip 20 -port dst_ip[20] -pin dst_ip_OBUF[20]_inst O
load net dst_ip[21] -attr @rip 21 -port dst_ip[21] -pin dst_ip_OBUF[21]_inst O
load net dst_ip[22] -attr @rip 22 -port dst_ip[22] -pin dst_ip_OBUF[22]_inst O
load net dst_ip[23] -attr @rip 23 -port dst_ip[23] -pin dst_ip_OBUF[23]_inst O
load net dst_ip[24] -attr @rip 24 -port dst_ip[24] -pin dst_ip_OBUF[24]_inst O
load net dst_ip[25] -attr @rip 25 -port dst_ip[25] -pin dst_ip_OBUF[25]_inst O
load net dst_ip[26] -attr @rip 26 -port dst_ip[26] -pin dst_ip_OBUF[26]_inst O
load net dst_ip[27] -attr @rip 27 -port dst_ip[27] -pin dst_ip_OBUF[27]_inst O
load net dst_ip[28] -attr @rip 28 -port dst_ip[28] -pin dst_ip_OBUF[28]_inst O
load net dst_ip[29] -attr @rip 29 -port dst_ip[29] -pin dst_ip_OBUF[29]_inst O
load net dst_ip[2] -attr @rip 2 -port dst_ip[2] -pin dst_ip_OBUF[2]_inst O
load net dst_ip[30] -attr @rip 30 -port dst_ip[30] -pin dst_ip_OBUF[30]_inst O
load net dst_ip[31] -attr @rip 31 -port dst_ip[31] -pin dst_ip_OBUF[31]_inst O
load net dst_ip[3] -attr @rip 3 -port dst_ip[3] -pin dst_ip_OBUF[3]_inst O
load net dst_ip[4] -attr @rip 4 -port dst_ip[4] -pin dst_ip_OBUF[4]_inst O
load net dst_ip[5] -attr @rip 5 -port dst_ip[5] -pin dst_ip_OBUF[5]_inst O
load net dst_ip[6] -attr @rip 6 -port dst_ip[6] -pin dst_ip_OBUF[6]_inst O
load net dst_ip[7] -attr @rip 7 -port dst_ip[7] -pin dst_ip_OBUF[7]_inst O
load net dst_ip[8] -attr @rip 8 -port dst_ip[8] -pin dst_ip_OBUF[8]_inst O
load net dst_ip[9] -attr @rip 9 -port dst_ip[9] -pin dst_ip_OBUF[9]_inst O
load net dst_ip_OBUF[0] -attr @rip dst_ip_reg[31]_0[0] -pin dst_ip_OBUF[0]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[0]
load net dst_ip_OBUF[10] -attr @rip dst_ip_reg[31]_0[10] -pin dst_ip_OBUF[10]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[10]
load net dst_ip_OBUF[11] -attr @rip dst_ip_reg[31]_0[11] -pin dst_ip_OBUF[11]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[11]
load net dst_ip_OBUF[12] -attr @rip dst_ip_reg[31]_0[12] -pin dst_ip_OBUF[12]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[12]
load net dst_ip_OBUF[13] -attr @rip dst_ip_reg[31]_0[13] -pin dst_ip_OBUF[13]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[13]
load net dst_ip_OBUF[14] -attr @rip dst_ip_reg[31]_0[14] -pin dst_ip_OBUF[14]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[14]
load net dst_ip_OBUF[15] -attr @rip dst_ip_reg[31]_0[15] -pin dst_ip_OBUF[15]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[15]
load net dst_ip_OBUF[16] -attr @rip dst_ip_reg[31]_0[16] -pin dst_ip_OBUF[16]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[16]
load net dst_ip_OBUF[17] -attr @rip dst_ip_reg[31]_0[17] -pin dst_ip_OBUF[17]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[17]
load net dst_ip_OBUF[18] -attr @rip dst_ip_reg[31]_0[18] -pin dst_ip_OBUF[18]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[18]
load net dst_ip_OBUF[19] -attr @rip dst_ip_reg[31]_0[19] -pin dst_ip_OBUF[19]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[19]
load net dst_ip_OBUF[1] -attr @rip dst_ip_reg[31]_0[1] -pin dst_ip_OBUF[1]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[1]
load net dst_ip_OBUF[20] -attr @rip dst_ip_reg[31]_0[20] -pin dst_ip_OBUF[20]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[20]
load net dst_ip_OBUF[21] -attr @rip dst_ip_reg[31]_0[21] -pin dst_ip_OBUF[21]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[21]
load net dst_ip_OBUF[22] -attr @rip dst_ip_reg[31]_0[22] -pin dst_ip_OBUF[22]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[22]
load net dst_ip_OBUF[23] -attr @rip dst_ip_reg[31]_0[23] -pin dst_ip_OBUF[23]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[23]
load net dst_ip_OBUF[24] -attr @rip dst_ip_reg[31]_0[24] -pin dst_ip_OBUF[24]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[24]
load net dst_ip_OBUF[25] -attr @rip dst_ip_reg[31]_0[25] -pin dst_ip_OBUF[25]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[25]
load net dst_ip_OBUF[26] -attr @rip dst_ip_reg[31]_0[26] -pin dst_ip_OBUF[26]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[26]
load net dst_ip_OBUF[27] -attr @rip dst_ip_reg[31]_0[27] -pin dst_ip_OBUF[27]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[27]
load net dst_ip_OBUF[28] -attr @rip dst_ip_reg[31]_0[28] -pin dst_ip_OBUF[28]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[28]
load net dst_ip_OBUF[29] -attr @rip dst_ip_reg[31]_0[29] -pin dst_ip_OBUF[29]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[29]
load net dst_ip_OBUF[2] -attr @rip dst_ip_reg[31]_0[2] -pin dst_ip_OBUF[2]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[2]
load net dst_ip_OBUF[30] -attr @rip dst_ip_reg[31]_0[30] -pin dst_ip_OBUF[30]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[30]
load net dst_ip_OBUF[31] -attr @rip dst_ip_reg[31]_0[31] -pin dst_ip_OBUF[31]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[31]
load net dst_ip_OBUF[3] -attr @rip dst_ip_reg[31]_0[3] -pin dst_ip_OBUF[3]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[3]
load net dst_ip_OBUF[4] -attr @rip dst_ip_reg[31]_0[4] -pin dst_ip_OBUF[4]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[4]
load net dst_ip_OBUF[5] -attr @rip dst_ip_reg[31]_0[5] -pin dst_ip_OBUF[5]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[5]
load net dst_ip_OBUF[6] -attr @rip dst_ip_reg[31]_0[6] -pin dst_ip_OBUF[6]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[6]
load net dst_ip_OBUF[7] -attr @rip dst_ip_reg[31]_0[7] -pin dst_ip_OBUF[7]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[7]
load net dst_ip_OBUF[8] -attr @rip dst_ip_reg[31]_0[8] -pin dst_ip_OBUF[8]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[8]
load net dst_ip_OBUF[9] -attr @rip dst_ip_reg[31]_0[9] -pin dst_ip_OBUF[9]_inst I -pin ipv4_parser_inst dst_ip_reg[31]_0[9]
load net dst_mac[0] -attr @rip 0 -port dst_mac[0] -pin dst_mac_OBUF[0]_inst O
load net dst_mac[10] -attr @rip 10 -port dst_mac[10] -pin dst_mac_OBUF[10]_inst O
load net dst_mac[11] -attr @rip 11 -port dst_mac[11] -pin dst_mac_OBUF[11]_inst O
load net dst_mac[12] -attr @rip 12 -port dst_mac[12] -pin dst_mac_OBUF[12]_inst O
load net dst_mac[13] -attr @rip 13 -port dst_mac[13] -pin dst_mac_OBUF[13]_inst O
load net dst_mac[14] -attr @rip 14 -port dst_mac[14] -pin dst_mac_OBUF[14]_inst O
load net dst_mac[15] -attr @rip 15 -port dst_mac[15] -pin dst_mac_OBUF[15]_inst O
load net dst_mac[16] -attr @rip 16 -port dst_mac[16] -pin dst_mac_OBUF[16]_inst O
load net dst_mac[17] -attr @rip 17 -port dst_mac[17] -pin dst_mac_OBUF[17]_inst O
load net dst_mac[18] -attr @rip 18 -port dst_mac[18] -pin dst_mac_OBUF[18]_inst O
load net dst_mac[19] -attr @rip 19 -port dst_mac[19] -pin dst_mac_OBUF[19]_inst O
load net dst_mac[1] -attr @rip 1 -port dst_mac[1] -pin dst_mac_OBUF[1]_inst O
load net dst_mac[20] -attr @rip 20 -port dst_mac[20] -pin dst_mac_OBUF[20]_inst O
load net dst_mac[21] -attr @rip 21 -port dst_mac[21] -pin dst_mac_OBUF[21]_inst O
load net dst_mac[22] -attr @rip 22 -port dst_mac[22] -pin dst_mac_OBUF[22]_inst O
load net dst_mac[23] -attr @rip 23 -port dst_mac[23] -pin dst_mac_OBUF[23]_inst O
load net dst_mac[24] -attr @rip 24 -port dst_mac[24] -pin dst_mac_OBUF[24]_inst O
load net dst_mac[25] -attr @rip 25 -port dst_mac[25] -pin dst_mac_OBUF[25]_inst O
load net dst_mac[26] -attr @rip 26 -port dst_mac[26] -pin dst_mac_OBUF[26]_inst O
load net dst_mac[27] -attr @rip 27 -port dst_mac[27] -pin dst_mac_OBUF[27]_inst O
load net dst_mac[28] -attr @rip 28 -port dst_mac[28] -pin dst_mac_OBUF[28]_inst O
load net dst_mac[29] -attr @rip 29 -port dst_mac[29] -pin dst_mac_OBUF[29]_inst O
load net dst_mac[2] -attr @rip 2 -port dst_mac[2] -pin dst_mac_OBUF[2]_inst O
load net dst_mac[30] -attr @rip 30 -port dst_mac[30] -pin dst_mac_OBUF[30]_inst O
load net dst_mac[31] -attr @rip 31 -port dst_mac[31] -pin dst_mac_OBUF[31]_inst O
load net dst_mac[32] -attr @rip 32 -port dst_mac[32] -pin dst_mac_OBUF[32]_inst O
load net dst_mac[33] -attr @rip 33 -port dst_mac[33] -pin dst_mac_OBUF[33]_inst O
load net dst_mac[34] -attr @rip 34 -port dst_mac[34] -pin dst_mac_OBUF[34]_inst O
load net dst_mac[35] -attr @rip 35 -port dst_mac[35] -pin dst_mac_OBUF[35]_inst O
load net dst_mac[36] -attr @rip 36 -port dst_mac[36] -pin dst_mac_OBUF[36]_inst O
load net dst_mac[37] -attr @rip 37 -port dst_mac[37] -pin dst_mac_OBUF[37]_inst O
load net dst_mac[38] -attr @rip 38 -port dst_mac[38] -pin dst_mac_OBUF[38]_inst O
load net dst_mac[39] -attr @rip 39 -port dst_mac[39] -pin dst_mac_OBUF[39]_inst O
load net dst_mac[3] -attr @rip 3 -port dst_mac[3] -pin dst_mac_OBUF[3]_inst O
load net dst_mac[40] -attr @rip 40 -port dst_mac[40] -pin dst_mac_OBUF[40]_inst O
load net dst_mac[41] -attr @rip 41 -port dst_mac[41] -pin dst_mac_OBUF[41]_inst O
load net dst_mac[42] -attr @rip 42 -port dst_mac[42] -pin dst_mac_OBUF[42]_inst O
load net dst_mac[43] -attr @rip 43 -port dst_mac[43] -pin dst_mac_OBUF[43]_inst O
load net dst_mac[44] -attr @rip 44 -port dst_mac[44] -pin dst_mac_OBUF[44]_inst O
load net dst_mac[45] -attr @rip 45 -port dst_mac[45] -pin dst_mac_OBUF[45]_inst O
load net dst_mac[46] -attr @rip 46 -port dst_mac[46] -pin dst_mac_OBUF[46]_inst O
load net dst_mac[47] -attr @rip 47 -port dst_mac[47] -pin dst_mac_OBUF[47]_inst O
load net dst_mac[4] -attr @rip 4 -port dst_mac[4] -pin dst_mac_OBUF[4]_inst O
load net dst_mac[5] -attr @rip 5 -port dst_mac[5] -pin dst_mac_OBUF[5]_inst O
load net dst_mac[6] -attr @rip 6 -port dst_mac[6] -pin dst_mac_OBUF[6]_inst O
load net dst_mac[7] -attr @rip 7 -port dst_mac[7] -pin dst_mac_OBUF[7]_inst O
load net dst_mac[8] -attr @rip 8 -port dst_mac[8] -pin dst_mac_OBUF[8]_inst O
load net dst_mac[9] -attr @rip 9 -port dst_mac[9] -pin dst_mac_OBUF[9]_inst O
load net dst_mac_OBUF[0] -attr @rip Q[0] -pin dst_mac_OBUF[0]_inst I -pin ethernet_parser_inst Q[0]
load net dst_mac_OBUF[10] -attr @rip Q[10] -pin dst_mac_OBUF[10]_inst I -pin ethernet_parser_inst Q[10]
load net dst_mac_OBUF[11] -attr @rip Q[11] -pin dst_mac_OBUF[11]_inst I -pin ethernet_parser_inst Q[11]
load net dst_mac_OBUF[12] -attr @rip Q[12] -pin dst_mac_OBUF[12]_inst I -pin ethernet_parser_inst Q[12]
load net dst_mac_OBUF[13] -attr @rip Q[13] -pin dst_mac_OBUF[13]_inst I -pin ethernet_parser_inst Q[13]
load net dst_mac_OBUF[14] -attr @rip Q[14] -pin dst_mac_OBUF[14]_inst I -pin ethernet_parser_inst Q[14]
load net dst_mac_OBUF[15] -attr @rip Q[15] -pin dst_mac_OBUF[15]_inst I -pin ethernet_parser_inst Q[15]
load net dst_mac_OBUF[16] -attr @rip Q[16] -pin dst_mac_OBUF[16]_inst I -pin ethernet_parser_inst Q[16]
load net dst_mac_OBUF[17] -attr @rip Q[17] -pin dst_mac_OBUF[17]_inst I -pin ethernet_parser_inst Q[17]
load net dst_mac_OBUF[18] -attr @rip Q[18] -pin dst_mac_OBUF[18]_inst I -pin ethernet_parser_inst Q[18]
load net dst_mac_OBUF[19] -attr @rip Q[19] -pin dst_mac_OBUF[19]_inst I -pin ethernet_parser_inst Q[19]
load net dst_mac_OBUF[1] -attr @rip Q[1] -pin dst_mac_OBUF[1]_inst I -pin ethernet_parser_inst Q[1]
load net dst_mac_OBUF[20] -attr @rip Q[20] -pin dst_mac_OBUF[20]_inst I -pin ethernet_parser_inst Q[20]
load net dst_mac_OBUF[21] -attr @rip Q[21] -pin dst_mac_OBUF[21]_inst I -pin ethernet_parser_inst Q[21]
load net dst_mac_OBUF[22] -attr @rip Q[22] -pin dst_mac_OBUF[22]_inst I -pin ethernet_parser_inst Q[22]
load net dst_mac_OBUF[23] -attr @rip Q[23] -pin dst_mac_OBUF[23]_inst I -pin ethernet_parser_inst Q[23]
load net dst_mac_OBUF[24] -attr @rip Q[24] -pin dst_mac_OBUF[24]_inst I -pin ethernet_parser_inst Q[24]
load net dst_mac_OBUF[25] -attr @rip Q[25] -pin dst_mac_OBUF[25]_inst I -pin ethernet_parser_inst Q[25]
load net dst_mac_OBUF[26] -attr @rip Q[26] -pin dst_mac_OBUF[26]_inst I -pin ethernet_parser_inst Q[26]
load net dst_mac_OBUF[27] -attr @rip Q[27] -pin dst_mac_OBUF[27]_inst I -pin ethernet_parser_inst Q[27]
load net dst_mac_OBUF[28] -attr @rip Q[28] -pin dst_mac_OBUF[28]_inst I -pin ethernet_parser_inst Q[28]
load net dst_mac_OBUF[29] -attr @rip Q[29] -pin dst_mac_OBUF[29]_inst I -pin ethernet_parser_inst Q[29]
load net dst_mac_OBUF[2] -attr @rip Q[2] -pin dst_mac_OBUF[2]_inst I -pin ethernet_parser_inst Q[2]
load net dst_mac_OBUF[30] -attr @rip Q[30] -pin dst_mac_OBUF[30]_inst I -pin ethernet_parser_inst Q[30]
load net dst_mac_OBUF[31] -attr @rip Q[31] -pin dst_mac_OBUF[31]_inst I -pin ethernet_parser_inst Q[31]
load net dst_mac_OBUF[32] -attr @rip Q[32] -pin dst_mac_OBUF[32]_inst I -pin ethernet_parser_inst Q[32]
load net dst_mac_OBUF[33] -attr @rip Q[33] -pin dst_mac_OBUF[33]_inst I -pin ethernet_parser_inst Q[33]
load net dst_mac_OBUF[34] -attr @rip Q[34] -pin dst_mac_OBUF[34]_inst I -pin ethernet_parser_inst Q[34]
load net dst_mac_OBUF[35] -attr @rip Q[35] -pin dst_mac_OBUF[35]_inst I -pin ethernet_parser_inst Q[35]
load net dst_mac_OBUF[36] -attr @rip Q[36] -pin dst_mac_OBUF[36]_inst I -pin ethernet_parser_inst Q[36]
load net dst_mac_OBUF[37] -attr @rip Q[37] -pin dst_mac_OBUF[37]_inst I -pin ethernet_parser_inst Q[37]
load net dst_mac_OBUF[38] -attr @rip Q[38] -pin dst_mac_OBUF[38]_inst I -pin ethernet_parser_inst Q[38]
load net dst_mac_OBUF[39] -attr @rip Q[39] -pin dst_mac_OBUF[39]_inst I -pin ethernet_parser_inst Q[39]
load net dst_mac_OBUF[3] -attr @rip Q[3] -pin dst_mac_OBUF[3]_inst I -pin ethernet_parser_inst Q[3]
load net dst_mac_OBUF[40] -attr @rip Q[40] -pin dst_mac_OBUF[40]_inst I -pin ethernet_parser_inst Q[40]
load net dst_mac_OBUF[41] -attr @rip Q[41] -pin dst_mac_OBUF[41]_inst I -pin ethernet_parser_inst Q[41]
load net dst_mac_OBUF[42] -attr @rip Q[42] -pin dst_mac_OBUF[42]_inst I -pin ethernet_parser_inst Q[42]
load net dst_mac_OBUF[43] -attr @rip Q[43] -pin dst_mac_OBUF[43]_inst I -pin ethernet_parser_inst Q[43]
load net dst_mac_OBUF[44] -attr @rip Q[44] -pin dst_mac_OBUF[44]_inst I -pin ethernet_parser_inst Q[44]
load net dst_mac_OBUF[45] -attr @rip Q[45] -pin dst_mac_OBUF[45]_inst I -pin ethernet_parser_inst Q[45]
load net dst_mac_OBUF[46] -attr @rip Q[46] -pin dst_mac_OBUF[46]_inst I -pin ethernet_parser_inst Q[46]
load net dst_mac_OBUF[47] -attr @rip Q[47] -pin dst_mac_OBUF[47]_inst I -pin ethernet_parser_inst Q[47]
load net dst_mac_OBUF[4] -attr @rip Q[4] -pin dst_mac_OBUF[4]_inst I -pin ethernet_parser_inst Q[4]
load net dst_mac_OBUF[5] -attr @rip Q[5] -pin dst_mac_OBUF[5]_inst I -pin ethernet_parser_inst Q[5]
load net dst_mac_OBUF[6] -attr @rip Q[6] -pin dst_mac_OBUF[6]_inst I -pin ethernet_parser_inst Q[6]
load net dst_mac_OBUF[7] -attr @rip Q[7] -pin dst_mac_OBUF[7]_inst I -pin ethernet_parser_inst Q[7]
load net dst_mac_OBUF[8] -attr @rip Q[8] -pin dst_mac_OBUF[8]_inst I -pin ethernet_parser_inst Q[8]
load net dst_mac_OBUF[9] -attr @rip Q[9] -pin dst_mac_OBUF[9]_inst I -pin ethernet_parser_inst Q[9]
load net dst_port[0] -attr @rip 0 -port dst_port[0] -pin dst_port_OBUF[0]_inst O
load net dst_port[10] -attr @rip 10 -port dst_port[10] -pin dst_port_OBUF[10]_inst O
load net dst_port[11] -attr @rip 11 -port dst_port[11] -pin dst_port_OBUF[11]_inst O
load net dst_port[12] -attr @rip 12 -port dst_port[12] -pin dst_port_OBUF[12]_inst O
load net dst_port[13] -attr @rip 13 -port dst_port[13] -pin dst_port_OBUF[13]_inst O
load net dst_port[14] -attr @rip 14 -port dst_port[14] -pin dst_port_OBUF[14]_inst O
load net dst_port[15] -attr @rip 15 -port dst_port[15] -pin dst_port_OBUF[15]_inst O
load net dst_port[1] -attr @rip 1 -port dst_port[1] -pin dst_port_OBUF[1]_inst O
load net dst_port[2] -attr @rip 2 -port dst_port[2] -pin dst_port_OBUF[2]_inst O
load net dst_port[3] -attr @rip 3 -port dst_port[3] -pin dst_port_OBUF[3]_inst O
load net dst_port[4] -attr @rip 4 -port dst_port[4] -pin dst_port_OBUF[4]_inst O
load net dst_port[5] -attr @rip 5 -port dst_port[5] -pin dst_port_OBUF[5]_inst O
load net dst_port[6] -attr @rip 6 -port dst_port[6] -pin dst_port_OBUF[6]_inst O
load net dst_port[7] -attr @rip 7 -port dst_port[7] -pin dst_port_OBUF[7]_inst O
load net dst_port[8] -attr @rip 8 -port dst_port[8] -pin dst_port_OBUF[8]_inst O
load net dst_port[9] -attr @rip 9 -port dst_port[9] -pin dst_port_OBUF[9]_inst O
load net dst_port_OBUF[0] -attr @rip dst_port_reg[15]_0[0] -pin dst_port_OBUF[0]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[0]
load net dst_port_OBUF[10] -attr @rip dst_port_reg[15]_0[10] -pin dst_port_OBUF[10]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[10]
load net dst_port_OBUF[11] -attr @rip dst_port_reg[15]_0[11] -pin dst_port_OBUF[11]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[11]
load net dst_port_OBUF[12] -attr @rip dst_port_reg[15]_0[12] -pin dst_port_OBUF[12]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[12]
load net dst_port_OBUF[13] -attr @rip dst_port_reg[15]_0[13] -pin dst_port_OBUF[13]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[13]
load net dst_port_OBUF[14] -attr @rip dst_port_reg[15]_0[14] -pin dst_port_OBUF[14]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[14]
load net dst_port_OBUF[15] -attr @rip dst_port_reg[15]_0[15] -pin dst_port_OBUF[15]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[15]
load net dst_port_OBUF[1] -attr @rip dst_port_reg[15]_0[1] -pin dst_port_OBUF[1]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[1]
load net dst_port_OBUF[2] -attr @rip dst_port_reg[15]_0[2] -pin dst_port_OBUF[2]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[2]
load net dst_port_OBUF[3] -attr @rip dst_port_reg[15]_0[3] -pin dst_port_OBUF[3]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[3]
load net dst_port_OBUF[4] -attr @rip dst_port_reg[15]_0[4] -pin dst_port_OBUF[4]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[4]
load net dst_port_OBUF[5] -attr @rip dst_port_reg[15]_0[5] -pin dst_port_OBUF[5]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[5]
load net dst_port_OBUF[6] -attr @rip dst_port_reg[15]_0[6] -pin dst_port_OBUF[6]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[6]
load net dst_port_OBUF[7] -attr @rip dst_port_reg[15]_0[7] -pin dst_port_OBUF[7]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[7]
load net dst_port_OBUF[8] -attr @rip dst_port_reg[15]_0[8] -pin dst_port_OBUF[8]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[8]
load net dst_port_OBUF[9] -attr @rip dst_port_reg[15]_0[9] -pin dst_port_OBUF[9]_inst I -pin tcp_parser_inst dst_port_reg[15]_0[9]
load net eth_ip_tdata[0] -attr @rip eth_ip_tdata[0] -pin ethernet_parser_inst eth_ip_tdata[0] -pin ipv4_parser_inst eth_ip_tdata[0]
load net eth_ip_tdata[10] -attr @rip eth_ip_tdata[10] -pin ethernet_parser_inst eth_ip_tdata[10] -pin ipv4_parser_inst eth_ip_tdata[10]
load net eth_ip_tdata[11] -attr @rip eth_ip_tdata[11] -pin ethernet_parser_inst eth_ip_tdata[11] -pin ipv4_parser_inst eth_ip_tdata[11]
load net eth_ip_tdata[12] -attr @rip eth_ip_tdata[12] -pin ethernet_parser_inst eth_ip_tdata[12] -pin ipv4_parser_inst eth_ip_tdata[12]
load net eth_ip_tdata[13] -attr @rip eth_ip_tdata[13] -pin ethernet_parser_inst eth_ip_tdata[13] -pin ipv4_parser_inst eth_ip_tdata[13]
load net eth_ip_tdata[14] -attr @rip eth_ip_tdata[14] -pin ethernet_parser_inst eth_ip_tdata[14] -pin ipv4_parser_inst eth_ip_tdata[14]
load net eth_ip_tdata[15] -attr @rip eth_ip_tdata[15] -pin ethernet_parser_inst eth_ip_tdata[15] -pin ipv4_parser_inst eth_ip_tdata[15]
load net eth_ip_tdata[16] -attr @rip eth_ip_tdata[16] -pin ethernet_parser_inst eth_ip_tdata[16] -pin ipv4_parser_inst eth_ip_tdata[16]
load net eth_ip_tdata[17] -attr @rip eth_ip_tdata[17] -pin ethernet_parser_inst eth_ip_tdata[17] -pin ipv4_parser_inst eth_ip_tdata[17]
load net eth_ip_tdata[18] -attr @rip eth_ip_tdata[18] -pin ethernet_parser_inst eth_ip_tdata[18] -pin ipv4_parser_inst eth_ip_tdata[18]
load net eth_ip_tdata[19] -attr @rip eth_ip_tdata[19] -pin ethernet_parser_inst eth_ip_tdata[19] -pin ipv4_parser_inst eth_ip_tdata[19]
load net eth_ip_tdata[1] -attr @rip eth_ip_tdata[1] -pin ethernet_parser_inst eth_ip_tdata[1] -pin ipv4_parser_inst eth_ip_tdata[1]
load net eth_ip_tdata[20] -attr @rip eth_ip_tdata[20] -pin ethernet_parser_inst eth_ip_tdata[20] -pin ipv4_parser_inst eth_ip_tdata[20]
load net eth_ip_tdata[21] -attr @rip eth_ip_tdata[21] -pin ethernet_parser_inst eth_ip_tdata[21] -pin ipv4_parser_inst eth_ip_tdata[21]
load net eth_ip_tdata[22] -attr @rip eth_ip_tdata[22] -pin ethernet_parser_inst eth_ip_tdata[22] -pin ipv4_parser_inst eth_ip_tdata[22]
load net eth_ip_tdata[23] -attr @rip eth_ip_tdata[23] -pin ethernet_parser_inst eth_ip_tdata[23] -pin ipv4_parser_inst eth_ip_tdata[23]
load net eth_ip_tdata[24] -attr @rip eth_ip_tdata[24] -pin ethernet_parser_inst eth_ip_tdata[24] -pin ipv4_parser_inst eth_ip_tdata[24]
load net eth_ip_tdata[25] -attr @rip eth_ip_tdata[25] -pin ethernet_parser_inst eth_ip_tdata[25] -pin ipv4_parser_inst eth_ip_tdata[25]
load net eth_ip_tdata[26] -attr @rip eth_ip_tdata[26] -pin ethernet_parser_inst eth_ip_tdata[26] -pin ipv4_parser_inst eth_ip_tdata[26]
load net eth_ip_tdata[27] -attr @rip eth_ip_tdata[27] -pin ethernet_parser_inst eth_ip_tdata[27] -pin ipv4_parser_inst eth_ip_tdata[27]
load net eth_ip_tdata[28] -attr @rip eth_ip_tdata[28] -pin ethernet_parser_inst eth_ip_tdata[28] -pin ipv4_parser_inst eth_ip_tdata[28]
load net eth_ip_tdata[29] -attr @rip eth_ip_tdata[29] -pin ethernet_parser_inst eth_ip_tdata[29] -pin ipv4_parser_inst eth_ip_tdata[29]
load net eth_ip_tdata[2] -attr @rip eth_ip_tdata[2] -pin ethernet_parser_inst eth_ip_tdata[2] -pin ipv4_parser_inst eth_ip_tdata[2]
load net eth_ip_tdata[30] -attr @rip eth_ip_tdata[30] -pin ethernet_parser_inst eth_ip_tdata[30] -pin ipv4_parser_inst eth_ip_tdata[30]
load net eth_ip_tdata[31] -attr @rip eth_ip_tdata[31] -pin ethernet_parser_inst eth_ip_tdata[31] -pin ipv4_parser_inst eth_ip_tdata[31]
load net eth_ip_tdata[32] -attr @rip eth_ip_tdata[32] -pin ethernet_parser_inst eth_ip_tdata[32] -pin ipv4_parser_inst eth_ip_tdata[32]
load net eth_ip_tdata[33] -attr @rip eth_ip_tdata[33] -pin ethernet_parser_inst eth_ip_tdata[33] -pin ipv4_parser_inst eth_ip_tdata[33]
load net eth_ip_tdata[34] -attr @rip eth_ip_tdata[34] -pin ethernet_parser_inst eth_ip_tdata[34] -pin ipv4_parser_inst eth_ip_tdata[34]
load net eth_ip_tdata[35] -attr @rip eth_ip_tdata[35] -pin ethernet_parser_inst eth_ip_tdata[35] -pin ipv4_parser_inst eth_ip_tdata[35]
load net eth_ip_tdata[36] -attr @rip eth_ip_tdata[36] -pin ethernet_parser_inst eth_ip_tdata[36] -pin ipv4_parser_inst eth_ip_tdata[36]
load net eth_ip_tdata[37] -attr @rip eth_ip_tdata[37] -pin ethernet_parser_inst eth_ip_tdata[37] -pin ipv4_parser_inst eth_ip_tdata[37]
load net eth_ip_tdata[38] -attr @rip eth_ip_tdata[38] -pin ethernet_parser_inst eth_ip_tdata[38] -pin ipv4_parser_inst eth_ip_tdata[38]
load net eth_ip_tdata[39] -attr @rip eth_ip_tdata[39] -pin ethernet_parser_inst eth_ip_tdata[39] -pin ipv4_parser_inst eth_ip_tdata[39]
load net eth_ip_tdata[3] -attr @rip eth_ip_tdata[3] -pin ethernet_parser_inst eth_ip_tdata[3] -pin ipv4_parser_inst eth_ip_tdata[3]
load net eth_ip_tdata[40] -attr @rip eth_ip_tdata[40] -pin ethernet_parser_inst eth_ip_tdata[40] -pin ipv4_parser_inst eth_ip_tdata[40]
load net eth_ip_tdata[41] -attr @rip eth_ip_tdata[41] -pin ethernet_parser_inst eth_ip_tdata[41] -pin ipv4_parser_inst eth_ip_tdata[41]
load net eth_ip_tdata[42] -attr @rip eth_ip_tdata[42] -pin ethernet_parser_inst eth_ip_tdata[42] -pin ipv4_parser_inst eth_ip_tdata[42]
load net eth_ip_tdata[43] -attr @rip eth_ip_tdata[43] -pin ethernet_parser_inst eth_ip_tdata[43] -pin ipv4_parser_inst eth_ip_tdata[43]
load net eth_ip_tdata[44] -attr @rip eth_ip_tdata[44] -pin ethernet_parser_inst eth_ip_tdata[44] -pin ipv4_parser_inst eth_ip_tdata[44]
load net eth_ip_tdata[45] -attr @rip eth_ip_tdata[45] -pin ethernet_parser_inst eth_ip_tdata[45] -pin ipv4_parser_inst eth_ip_tdata[45]
load net eth_ip_tdata[46] -attr @rip eth_ip_tdata[46] -pin ethernet_parser_inst eth_ip_tdata[46] -pin ipv4_parser_inst eth_ip_tdata[46]
load net eth_ip_tdata[47] -attr @rip eth_ip_tdata[47] -pin ethernet_parser_inst eth_ip_tdata[47] -pin ipv4_parser_inst eth_ip_tdata[47]
load net eth_ip_tdata[48] -attr @rip eth_ip_tdata[48] -pin ethernet_parser_inst eth_ip_tdata[48] -pin ipv4_parser_inst eth_ip_tdata[48]
load net eth_ip_tdata[49] -attr @rip eth_ip_tdata[49] -pin ethernet_parser_inst eth_ip_tdata[49] -pin ipv4_parser_inst eth_ip_tdata[49]
load net eth_ip_tdata[4] -attr @rip eth_ip_tdata[4] -pin ethernet_parser_inst eth_ip_tdata[4] -pin ipv4_parser_inst eth_ip_tdata[4]
load net eth_ip_tdata[50] -attr @rip eth_ip_tdata[50] -pin ethernet_parser_inst eth_ip_tdata[50] -pin ipv4_parser_inst eth_ip_tdata[50]
load net eth_ip_tdata[51] -attr @rip eth_ip_tdata[51] -pin ethernet_parser_inst eth_ip_tdata[51] -pin ipv4_parser_inst eth_ip_tdata[51]
load net eth_ip_tdata[52] -attr @rip eth_ip_tdata[52] -pin ethernet_parser_inst eth_ip_tdata[52] -pin ipv4_parser_inst eth_ip_tdata[52]
load net eth_ip_tdata[53] -attr @rip eth_ip_tdata[53] -pin ethernet_parser_inst eth_ip_tdata[53] -pin ipv4_parser_inst eth_ip_tdata[53]
load net eth_ip_tdata[54] -attr @rip eth_ip_tdata[54] -pin ethernet_parser_inst eth_ip_tdata[54] -pin ipv4_parser_inst eth_ip_tdata[54]
load net eth_ip_tdata[55] -attr @rip eth_ip_tdata[55] -pin ethernet_parser_inst eth_ip_tdata[55] -pin ipv4_parser_inst eth_ip_tdata[55]
load net eth_ip_tdata[56] -attr @rip eth_ip_tdata[56] -pin ethernet_parser_inst eth_ip_tdata[56] -pin ipv4_parser_inst eth_ip_tdata[56]
load net eth_ip_tdata[57] -attr @rip eth_ip_tdata[57] -pin ethernet_parser_inst eth_ip_tdata[57] -pin ipv4_parser_inst eth_ip_tdata[57]
load net eth_ip_tdata[58] -attr @rip eth_ip_tdata[58] -pin ethernet_parser_inst eth_ip_tdata[58] -pin ipv4_parser_inst eth_ip_tdata[58]
load net eth_ip_tdata[59] -attr @rip eth_ip_tdata[59] -pin ethernet_parser_inst eth_ip_tdata[59] -pin ipv4_parser_inst eth_ip_tdata[59]
load net eth_ip_tdata[5] -attr @rip eth_ip_tdata[5] -pin ethernet_parser_inst eth_ip_tdata[5] -pin ipv4_parser_inst eth_ip_tdata[5]
load net eth_ip_tdata[60] -attr @rip eth_ip_tdata[60] -pin ethernet_parser_inst eth_ip_tdata[60] -pin ipv4_parser_inst eth_ip_tdata[60]
load net eth_ip_tdata[61] -attr @rip eth_ip_tdata[61] -pin ethernet_parser_inst eth_ip_tdata[61] -pin ipv4_parser_inst eth_ip_tdata[61]
load net eth_ip_tdata[62] -attr @rip eth_ip_tdata[62] -pin ethernet_parser_inst eth_ip_tdata[62] -pin ipv4_parser_inst eth_ip_tdata[62]
load net eth_ip_tdata[63] -attr @rip eth_ip_tdata[63] -pin ethernet_parser_inst eth_ip_tdata[63] -pin ipv4_parser_inst eth_ip_tdata[63]
load net eth_ip_tdata[6] -attr @rip eth_ip_tdata[6] -pin ethernet_parser_inst eth_ip_tdata[6] -pin ipv4_parser_inst eth_ip_tdata[6]
load net eth_ip_tdata[7] -attr @rip eth_ip_tdata[7] -pin ethernet_parser_inst eth_ip_tdata[7] -pin ipv4_parser_inst eth_ip_tdata[7]
load net eth_ip_tdata[8] -attr @rip eth_ip_tdata[8] -pin ethernet_parser_inst eth_ip_tdata[8] -pin ipv4_parser_inst eth_ip_tdata[8]
load net eth_ip_tdata[9] -attr @rip eth_ip_tdata[9] -pin ethernet_parser_inst eth_ip_tdata[9] -pin ipv4_parser_inst eth_ip_tdata[9]
load net eth_ip_tkeep[0] -attr @rip eth_ip_tkeep[0] -pin ethernet_parser_inst eth_ip_tkeep[0] -pin ipv4_parser_inst eth_ip_tkeep[0]
load net eth_ip_tkeep[1] -attr @rip eth_ip_tkeep[1] -pin ethernet_parser_inst eth_ip_tkeep[1] -pin ipv4_parser_inst eth_ip_tkeep[1]
load net eth_ip_tkeep[2] -attr @rip eth_ip_tkeep[2] -pin ethernet_parser_inst eth_ip_tkeep[2] -pin ipv4_parser_inst eth_ip_tkeep[2]
load net eth_ip_tkeep[3] -attr @rip eth_ip_tkeep[3] -pin ethernet_parser_inst eth_ip_tkeep[3] -pin ipv4_parser_inst eth_ip_tkeep[3]
load net eth_ip_tkeep[4] -attr @rip eth_ip_tkeep[4] -pin ethernet_parser_inst eth_ip_tkeep[4] -pin ipv4_parser_inst eth_ip_tkeep[4]
load net eth_ip_tkeep[5] -attr @rip eth_ip_tkeep[5] -pin ethernet_parser_inst eth_ip_tkeep[5] -pin ipv4_parser_inst eth_ip_tkeep[5]
load net eth_ip_tkeep[6] -attr @rip eth_ip_tkeep[6] -pin ethernet_parser_inst eth_ip_tkeep[6] -pin ipv4_parser_inst eth_ip_tkeep[6]
load net eth_ip_tkeep[7] -attr @rip eth_ip_tkeep[7] -pin ethernet_parser_inst eth_ip_tkeep[7] -pin ipv4_parser_inst eth_ip_tkeep[7]
load net eth_ip_tlast -pin ethernet_parser_inst eth_ip_tlast -pin ipv4_parser_inst eth_ip_tlast
netloc eth_ip_tlast 1 3 1 N 11900
load net eth_ip_tvalid -pin ethernet_parser_inst eth_ip_tvalid -pin ipv4_parser_inst eth_ip_tvalid
netloc eth_ip_tvalid 1 3 1 N 11920
load net ethernet_header_valid -port ethernet_header_valid -pin ethernet_header_valid_OBUF_inst O
netloc ethernet_header_valid 1 6 1 NJ 11240
load net ethernet_header_valid_OBUF -pin ethernet_header_valid_OBUF_inst I -pin ethernet_parser_inst ethernet_header_valid_OBUF
netloc ethernet_header_valid_OBUF 1 3 3 1110J 11300 NJ 11300 3360J
load net ethernet_parser_inst_n_16 -pin ethernet_parser_inst leftover_count_reg[2] -pin ipv4_parser_inst byte_count_reg[3]_1
netloc ethernet_parser_inst_n_16 1 3 1 1150 11820n
load net ethernet_parser_inst_n_17 -pin ethernet_parser_inst out_keep_reg_reg[2]_0 -pin ipv4_parser_inst out_keep_reg_reg[6]_2
netloc ethernet_parser_inst_n_17 1 3 1 1190 12000n
load net ethernet_parser_inst_n_18 -pin ethernet_parser_inst out_last_reg_reg_1 -pin ipv4_parser_inst shift_reg_reg[0]_0
netloc ethernet_parser_inst_n_18 1 3 1 N 12100
load net ethernet_parser_inst_n_19 -pin ethernet_parser_inst out_keep_reg_reg[3]_0 -pin ipv4_parser_inst state_reg[0]_3
netloc ethernet_parser_inst_n_19 1 3 1 1310 12060n
load net ethernet_parser_inst_n_4 -pin ethernet_parser_inst out_last_reg_reg_0 -pin ipv4_parser_inst out_last_reg_reg_1
netloc ethernet_parser_inst_n_4 1 3 1 1230 12040n
load net ethertype[0] -attr @rip 0 -port ethertype[0] -pin ethertype_OBUF[0]_inst O
load net ethertype[10] -attr @rip 10 -port ethertype[10] -pin ethertype_OBUF[10]_inst O
load net ethertype[11] -attr @rip 11 -port ethertype[11] -pin ethertype_OBUF[11]_inst O
load net ethertype[12] -attr @rip 12 -port ethertype[12] -pin ethertype_OBUF[12]_inst O
load net ethertype[13] -attr @rip 13 -port ethertype[13] -pin ethertype_OBUF[13]_inst O
load net ethertype[14] -attr @rip 14 -port ethertype[14] -pin ethertype_OBUF[14]_inst O
load net ethertype[15] -attr @rip 15 -port ethertype[15] -pin ethertype_OBUF[15]_inst O
load net ethertype[1] -attr @rip 1 -port ethertype[1] -pin ethertype_OBUF[1]_inst O
load net ethertype[2] -attr @rip 2 -port ethertype[2] -pin ethertype_OBUF[2]_inst O
load net ethertype[3] -attr @rip 3 -port ethertype[3] -pin ethertype_OBUF[3]_inst O
load net ethertype[4] -attr @rip 4 -port ethertype[4] -pin ethertype_OBUF[4]_inst O
load net ethertype[5] -attr @rip 5 -port ethertype[5] -pin ethertype_OBUF[5]_inst O
load net ethertype[6] -attr @rip 6 -port ethertype[6] -pin ethertype_OBUF[6]_inst O
load net ethertype[7] -attr @rip 7 -port ethertype[7] -pin ethertype_OBUF[7]_inst O
load net ethertype[8] -attr @rip 8 -port ethertype[8] -pin ethertype_OBUF[8]_inst O
load net ethertype[9] -attr @rip 9 -port ethertype[9] -pin ethertype_OBUF[9]_inst O
load net ethertype_OBUF[0] -attr @rip ethertype_reg[15]_0[0] -pin ethernet_parser_inst ethertype_reg[15]_0[0] -pin ethertype_OBUF[0]_inst I
load net ethertype_OBUF[10] -attr @rip ethertype_reg[15]_0[10] -pin ethernet_parser_inst ethertype_reg[15]_0[10] -pin ethertype_OBUF[10]_inst I
load net ethertype_OBUF[11] -attr @rip ethertype_reg[15]_0[11] -pin ethernet_parser_inst ethertype_reg[15]_0[11] -pin ethertype_OBUF[11]_inst I
load net ethertype_OBUF[12] -attr @rip ethertype_reg[15]_0[12] -pin ethernet_parser_inst ethertype_reg[15]_0[12] -pin ethertype_OBUF[12]_inst I
load net ethertype_OBUF[13] -attr @rip ethertype_reg[15]_0[13] -pin ethernet_parser_inst ethertype_reg[15]_0[13] -pin ethertype_OBUF[13]_inst I
load net ethertype_OBUF[14] -attr @rip ethertype_reg[15]_0[14] -pin ethernet_parser_inst ethertype_reg[15]_0[14] -pin ethertype_OBUF[14]_inst I
load net ethertype_OBUF[15] -attr @rip ethertype_reg[15]_0[15] -pin ethernet_parser_inst ethertype_reg[15]_0[15] -pin ethertype_OBUF[15]_inst I
load net ethertype_OBUF[1] -attr @rip ethertype_reg[15]_0[1] -pin ethernet_parser_inst ethertype_reg[15]_0[1] -pin ethertype_OBUF[1]_inst I
load net ethertype_OBUF[2] -attr @rip ethertype_reg[15]_0[2] -pin ethernet_parser_inst ethertype_reg[15]_0[2] -pin ethertype_OBUF[2]_inst I
load net ethertype_OBUF[3] -attr @rip ethertype_reg[15]_0[3] -pin ethernet_parser_inst ethertype_reg[15]_0[3] -pin ethertype_OBUF[3]_inst I
load net ethertype_OBUF[4] -attr @rip ethertype_reg[15]_0[4] -pin ethernet_parser_inst ethertype_reg[15]_0[4] -pin ethertype_OBUF[4]_inst I
load net ethertype_OBUF[5] -attr @rip ethertype_reg[15]_0[5] -pin ethernet_parser_inst ethertype_reg[15]_0[5] -pin ethertype_OBUF[5]_inst I
load net ethertype_OBUF[6] -attr @rip ethertype_reg[15]_0[6] -pin ethernet_parser_inst ethertype_reg[15]_0[6] -pin ethertype_OBUF[6]_inst I
load net ethertype_OBUF[7] -attr @rip ethertype_reg[15]_0[7] -pin ethernet_parser_inst ethertype_reg[15]_0[7] -pin ethertype_OBUF[7]_inst I
load net ethertype_OBUF[8] -attr @rip ethertype_reg[15]_0[8] -pin ethernet_parser_inst ethertype_reg[15]_0[8] -pin ethertype_OBUF[8]_inst I
load net ethertype_OBUF[9] -attr @rip ethertype_reg[15]_0[9] -pin ethernet_parser_inst ethertype_reg[15]_0[9] -pin ethertype_OBUF[9]_inst I
load net ip_ihl[0] -attr @rip 0 -port ip_ihl[0] -pin ip_ihl_OBUF[0]_inst O
load net ip_ihl[1] -attr @rip 1 -port ip_ihl[1] -pin ip_ihl_OBUF[1]_inst O
load net ip_ihl[2] -attr @rip 2 -port ip_ihl[2] -pin ip_ihl_OBUF[2]_inst O
load net ip_ihl[3] -attr @rip 3 -port ip_ihl[3] -pin ip_ihl_OBUF[3]_inst O
load net ip_ihl_OBUF[0]
load net ip_ihl_OBUF[1]
load net ip_ihl_OBUF[2]
load net ip_ihl_OBUF[3]
load net ip_protocol[0] -attr @rip 0 -port ip_protocol[0] -pin ip_protocol_OBUF[0]_inst O
load net ip_protocol[1] -attr @rip 1 -port ip_protocol[1] -pin ip_protocol_OBUF[1]_inst O
load net ip_protocol[2] -attr @rip 2 -port ip_protocol[2] -pin ip_protocol_OBUF[2]_inst O
load net ip_protocol[3] -attr @rip 3 -port ip_protocol[3] -pin ip_protocol_OBUF[3]_inst O
load net ip_protocol[4] -attr @rip 4 -port ip_protocol[4] -pin ip_protocol_OBUF[4]_inst O
load net ip_protocol[5] -attr @rip 5 -port ip_protocol[5] -pin ip_protocol_OBUF[5]_inst O
load net ip_protocol[6] -attr @rip 6 -port ip_protocol[6] -pin ip_protocol_OBUF[6]_inst O
load net ip_protocol[7] -attr @rip 7 -port ip_protocol[7] -pin ip_protocol_OBUF[7]_inst O
load net ip_protocol_OBUF[0]
load net ip_protocol_OBUF[1]
load net ip_protocol_OBUF[2]
load net ip_protocol_OBUF[3]
load net ip_protocol_OBUF[4]
load net ip_protocol_OBUF[5]
load net ip_protocol_OBUF[6]
load net ip_protocol_OBUF[7]
load net ip_tcp_tdata[0] -attr @rip out_data_reg_reg[63]_0[0] -pin ipv4_parser_inst out_data_reg_reg[63]_0[0] -pin tcp_parser_inst shift_reg_reg[31]_0[0]
load net ip_tcp_tdata[10] -attr @rip out_data_reg_reg[63]_0[10] -pin ipv4_parser_inst out_data_reg_reg[63]_0[10] -pin tcp_parser_inst shift_reg_reg[31]_0[10]
load net ip_tcp_tdata[11] -attr @rip out_data_reg_reg[63]_0[11] -pin ipv4_parser_inst out_data_reg_reg[63]_0[11] -pin tcp_parser_inst shift_reg_reg[31]_0[11]
load net ip_tcp_tdata[12] -attr @rip out_data_reg_reg[63]_0[12] -pin ipv4_parser_inst out_data_reg_reg[63]_0[12] -pin tcp_parser_inst shift_reg_reg[31]_0[12]
load net ip_tcp_tdata[13] -attr @rip out_data_reg_reg[63]_0[13] -pin ipv4_parser_inst out_data_reg_reg[63]_0[13] -pin tcp_parser_inst shift_reg_reg[31]_0[13]
load net ip_tcp_tdata[14] -attr @rip out_data_reg_reg[63]_0[14] -pin ipv4_parser_inst out_data_reg_reg[63]_0[14] -pin tcp_parser_inst shift_reg_reg[31]_0[14]
load net ip_tcp_tdata[15] -attr @rip out_data_reg_reg[63]_0[15] -pin ipv4_parser_inst out_data_reg_reg[63]_0[15] -pin tcp_parser_inst shift_reg_reg[31]_0[15]
load net ip_tcp_tdata[16] -attr @rip out_data_reg_reg[63]_0[16] -pin ipv4_parser_inst out_data_reg_reg[63]_0[16] -pin tcp_parser_inst shift_reg_reg[31]_0[16]
load net ip_tcp_tdata[17] -attr @rip out_data_reg_reg[63]_0[17] -pin ipv4_parser_inst out_data_reg_reg[63]_0[17] -pin tcp_parser_inst shift_reg_reg[31]_0[17]
load net ip_tcp_tdata[18] -attr @rip out_data_reg_reg[63]_0[18] -pin ipv4_parser_inst out_data_reg_reg[63]_0[18] -pin tcp_parser_inst shift_reg_reg[31]_0[18]
load net ip_tcp_tdata[19] -attr @rip out_data_reg_reg[63]_0[19] -pin ipv4_parser_inst out_data_reg_reg[63]_0[19] -pin tcp_parser_inst shift_reg_reg[31]_0[19]
load net ip_tcp_tdata[1] -attr @rip out_data_reg_reg[63]_0[1] -pin ipv4_parser_inst out_data_reg_reg[63]_0[1] -pin tcp_parser_inst shift_reg_reg[31]_0[1]
load net ip_tcp_tdata[20] -attr @rip out_data_reg_reg[63]_0[20] -pin ipv4_parser_inst out_data_reg_reg[63]_0[20] -pin tcp_parser_inst shift_reg_reg[31]_0[20]
load net ip_tcp_tdata[21] -attr @rip out_data_reg_reg[63]_0[21] -pin ipv4_parser_inst out_data_reg_reg[63]_0[21] -pin tcp_parser_inst shift_reg_reg[31]_0[21]
load net ip_tcp_tdata[22] -attr @rip out_data_reg_reg[63]_0[22] -pin ipv4_parser_inst out_data_reg_reg[63]_0[22] -pin tcp_parser_inst shift_reg_reg[31]_0[22]
load net ip_tcp_tdata[23] -attr @rip out_data_reg_reg[63]_0[23] -pin ipv4_parser_inst out_data_reg_reg[63]_0[23] -pin tcp_parser_inst shift_reg_reg[31]_0[23]
load net ip_tcp_tdata[24] -attr @rip out_data_reg_reg[63]_0[24] -pin ipv4_parser_inst out_data_reg_reg[63]_0[24] -pin tcp_parser_inst shift_reg_reg[31]_0[24]
load net ip_tcp_tdata[25] -attr @rip out_data_reg_reg[63]_0[25] -pin ipv4_parser_inst out_data_reg_reg[63]_0[25] -pin tcp_parser_inst shift_reg_reg[31]_0[25]
load net ip_tcp_tdata[26] -attr @rip out_data_reg_reg[63]_0[26] -pin ipv4_parser_inst out_data_reg_reg[63]_0[26] -pin tcp_parser_inst shift_reg_reg[31]_0[26]
load net ip_tcp_tdata[27] -attr @rip out_data_reg_reg[63]_0[27] -pin ipv4_parser_inst out_data_reg_reg[63]_0[27] -pin tcp_parser_inst shift_reg_reg[31]_0[27]
load net ip_tcp_tdata[28] -attr @rip out_data_reg_reg[63]_0[28] -pin ipv4_parser_inst out_data_reg_reg[63]_0[28] -pin tcp_parser_inst shift_reg_reg[31]_0[28]
load net ip_tcp_tdata[29] -attr @rip out_data_reg_reg[63]_0[29] -pin ipv4_parser_inst out_data_reg_reg[63]_0[29] -pin tcp_parser_inst shift_reg_reg[31]_0[29]
load net ip_tcp_tdata[2] -attr @rip out_data_reg_reg[63]_0[2] -pin ipv4_parser_inst out_data_reg_reg[63]_0[2] -pin tcp_parser_inst shift_reg_reg[31]_0[2]
load net ip_tcp_tdata[30] -attr @rip out_data_reg_reg[63]_0[30] -pin ipv4_parser_inst out_data_reg_reg[63]_0[30] -pin tcp_parser_inst shift_reg_reg[31]_0[30]
load net ip_tcp_tdata[31] -attr @rip out_data_reg_reg[63]_0[31] -pin ipv4_parser_inst out_data_reg_reg[63]_0[31] -pin tcp_parser_inst shift_reg_reg[31]_0[31]
load net ip_tcp_tdata[32] -attr @rip out_data_reg_reg[63]_0[32] -pin ipv4_parser_inst out_data_reg_reg[63]_0[32] -pin tcp_parser_inst shift_reg_reg[31]_0[32]
load net ip_tcp_tdata[33] -attr @rip out_data_reg_reg[63]_0[33] -pin ipv4_parser_inst out_data_reg_reg[63]_0[33] -pin tcp_parser_inst shift_reg_reg[31]_0[33]
load net ip_tcp_tdata[34] -attr @rip out_data_reg_reg[63]_0[34] -pin ipv4_parser_inst out_data_reg_reg[63]_0[34] -pin tcp_parser_inst shift_reg_reg[31]_0[34]
load net ip_tcp_tdata[35] -attr @rip out_data_reg_reg[63]_0[35] -pin ipv4_parser_inst out_data_reg_reg[63]_0[35] -pin tcp_parser_inst shift_reg_reg[31]_0[35]
load net ip_tcp_tdata[36] -attr @rip out_data_reg_reg[63]_0[36] -pin ipv4_parser_inst out_data_reg_reg[63]_0[36] -pin tcp_parser_inst shift_reg_reg[31]_0[36]
load net ip_tcp_tdata[37] -attr @rip out_data_reg_reg[63]_0[37] -pin ipv4_parser_inst out_data_reg_reg[63]_0[37] -pin tcp_parser_inst shift_reg_reg[31]_0[37]
load net ip_tcp_tdata[38] -attr @rip out_data_reg_reg[63]_0[38] -pin ipv4_parser_inst out_data_reg_reg[63]_0[38] -pin tcp_parser_inst shift_reg_reg[31]_0[38]
load net ip_tcp_tdata[39] -attr @rip out_data_reg_reg[63]_0[39] -pin ipv4_parser_inst out_data_reg_reg[63]_0[39] -pin tcp_parser_inst shift_reg_reg[31]_0[39]
load net ip_tcp_tdata[3] -attr @rip out_data_reg_reg[63]_0[3] -pin ipv4_parser_inst out_data_reg_reg[63]_0[3] -pin tcp_parser_inst shift_reg_reg[31]_0[3]
load net ip_tcp_tdata[40] -attr @rip out_data_reg_reg[63]_0[40] -pin ipv4_parser_inst out_data_reg_reg[63]_0[40] -pin tcp_parser_inst shift_reg_reg[31]_0[40]
load net ip_tcp_tdata[41] -attr @rip out_data_reg_reg[63]_0[41] -pin ipv4_parser_inst out_data_reg_reg[63]_0[41] -pin tcp_parser_inst shift_reg_reg[31]_0[41]
load net ip_tcp_tdata[42] -attr @rip out_data_reg_reg[63]_0[42] -pin ipv4_parser_inst out_data_reg_reg[63]_0[42] -pin tcp_parser_inst shift_reg_reg[31]_0[42]
load net ip_tcp_tdata[43] -attr @rip out_data_reg_reg[63]_0[43] -pin ipv4_parser_inst out_data_reg_reg[63]_0[43] -pin tcp_parser_inst shift_reg_reg[31]_0[43]
load net ip_tcp_tdata[44] -attr @rip out_data_reg_reg[63]_0[44] -pin ipv4_parser_inst out_data_reg_reg[63]_0[44] -pin tcp_parser_inst shift_reg_reg[31]_0[44]
load net ip_tcp_tdata[45] -attr @rip out_data_reg_reg[63]_0[45] -pin ipv4_parser_inst out_data_reg_reg[63]_0[45] -pin tcp_parser_inst shift_reg_reg[31]_0[45]
load net ip_tcp_tdata[46] -attr @rip out_data_reg_reg[63]_0[46] -pin ipv4_parser_inst out_data_reg_reg[63]_0[46] -pin tcp_parser_inst shift_reg_reg[31]_0[46]
load net ip_tcp_tdata[47] -attr @rip out_data_reg_reg[63]_0[47] -pin ipv4_parser_inst out_data_reg_reg[63]_0[47] -pin tcp_parser_inst shift_reg_reg[31]_0[47]
load net ip_tcp_tdata[48] -attr @rip out_data_reg_reg[63]_0[48] -pin ipv4_parser_inst out_data_reg_reg[63]_0[48] -pin tcp_parser_inst shift_reg_reg[31]_0[48]
load net ip_tcp_tdata[49] -attr @rip out_data_reg_reg[63]_0[49] -pin ipv4_parser_inst out_data_reg_reg[63]_0[49] -pin tcp_parser_inst shift_reg_reg[31]_0[49]
load net ip_tcp_tdata[4] -attr @rip out_data_reg_reg[63]_0[4] -pin ipv4_parser_inst out_data_reg_reg[63]_0[4] -pin tcp_parser_inst shift_reg_reg[31]_0[4]
load net ip_tcp_tdata[50] -attr @rip out_data_reg_reg[63]_0[50] -pin ipv4_parser_inst out_data_reg_reg[63]_0[50] -pin tcp_parser_inst shift_reg_reg[31]_0[50]
load net ip_tcp_tdata[51] -attr @rip out_data_reg_reg[63]_0[51] -pin ipv4_parser_inst out_data_reg_reg[63]_0[51] -pin tcp_parser_inst shift_reg_reg[31]_0[51]
load net ip_tcp_tdata[52] -attr @rip out_data_reg_reg[63]_0[52] -pin ipv4_parser_inst out_data_reg_reg[63]_0[52] -pin tcp_parser_inst shift_reg_reg[31]_0[52]
load net ip_tcp_tdata[53] -attr @rip out_data_reg_reg[63]_0[53] -pin ipv4_parser_inst out_data_reg_reg[63]_0[53] -pin tcp_parser_inst shift_reg_reg[31]_0[53]
load net ip_tcp_tdata[54] -attr @rip out_data_reg_reg[63]_0[54] -pin ipv4_parser_inst out_data_reg_reg[63]_0[54] -pin tcp_parser_inst shift_reg_reg[31]_0[54]
load net ip_tcp_tdata[55] -attr @rip out_data_reg_reg[63]_0[55] -pin ipv4_parser_inst out_data_reg_reg[63]_0[55] -pin tcp_parser_inst shift_reg_reg[31]_0[55]
load net ip_tcp_tdata[56] -attr @rip out_data_reg_reg[63]_0[56] -pin ipv4_parser_inst out_data_reg_reg[63]_0[56] -pin tcp_parser_inst shift_reg_reg[31]_0[56]
load net ip_tcp_tdata[57] -attr @rip out_data_reg_reg[63]_0[57] -pin ipv4_parser_inst out_data_reg_reg[63]_0[57] -pin tcp_parser_inst shift_reg_reg[31]_0[57]
load net ip_tcp_tdata[58] -attr @rip out_data_reg_reg[63]_0[58] -pin ipv4_parser_inst out_data_reg_reg[63]_0[58] -pin tcp_parser_inst shift_reg_reg[31]_0[58]
load net ip_tcp_tdata[59] -attr @rip out_data_reg_reg[63]_0[59] -pin ipv4_parser_inst out_data_reg_reg[63]_0[59] -pin tcp_parser_inst shift_reg_reg[31]_0[59]
load net ip_tcp_tdata[5] -attr @rip out_data_reg_reg[63]_0[5] -pin ipv4_parser_inst out_data_reg_reg[63]_0[5] -pin tcp_parser_inst shift_reg_reg[31]_0[5]
load net ip_tcp_tdata[60] -attr @rip out_data_reg_reg[63]_0[60] -pin ipv4_parser_inst out_data_reg_reg[63]_0[60] -pin tcp_parser_inst shift_reg_reg[31]_0[60]
load net ip_tcp_tdata[61] -attr @rip out_data_reg_reg[63]_0[61] -pin ipv4_parser_inst out_data_reg_reg[63]_0[61] -pin tcp_parser_inst shift_reg_reg[31]_0[61]
load net ip_tcp_tdata[62] -attr @rip out_data_reg_reg[63]_0[62] -pin ipv4_parser_inst out_data_reg_reg[63]_0[62] -pin tcp_parser_inst shift_reg_reg[31]_0[62]
load net ip_tcp_tdata[63] -attr @rip out_data_reg_reg[63]_0[63] -pin ipv4_parser_inst out_data_reg_reg[63]_0[63] -pin tcp_parser_inst shift_reg_reg[31]_0[63]
load net ip_tcp_tdata[6] -attr @rip out_data_reg_reg[63]_0[6] -pin ipv4_parser_inst out_data_reg_reg[63]_0[6] -pin tcp_parser_inst shift_reg_reg[31]_0[6]
load net ip_tcp_tdata[7] -attr @rip out_data_reg_reg[63]_0[7] -pin ipv4_parser_inst out_data_reg_reg[63]_0[7] -pin tcp_parser_inst shift_reg_reg[31]_0[7]
load net ip_tcp_tdata[8] -attr @rip out_data_reg_reg[63]_0[8] -pin ipv4_parser_inst out_data_reg_reg[63]_0[8] -pin tcp_parser_inst shift_reg_reg[31]_0[8]
load net ip_tcp_tdata[9] -attr @rip out_data_reg_reg[63]_0[9] -pin ipv4_parser_inst out_data_reg_reg[63]_0[9] -pin tcp_parser_inst shift_reg_reg[31]_0[9]
load net ip_tcp_tkeep[0] -attr @rip Q[0] -pin ipv4_parser_inst Q[0] -pin tcp_parser_inst Q[0]
load net ip_tcp_tkeep[1] -attr @rip Q[1] -pin ipv4_parser_inst Q[1] -pin tcp_parser_inst Q[1]
load net ip_tcp_tkeep[2] -attr @rip Q[2] -pin ipv4_parser_inst Q[2] -pin tcp_parser_inst Q[2]
load net ip_tcp_tkeep[3] -attr @rip Q[3] -pin ipv4_parser_inst Q[3] -pin tcp_parser_inst Q[3]
load net ip_tcp_tkeep[4] -attr @rip Q[4] -pin ipv4_parser_inst Q[4] -pin tcp_parser_inst Q[4]
load net ip_tcp_tkeep[5] -attr @rip Q[5] -pin ipv4_parser_inst Q[5] -pin tcp_parser_inst Q[5]
load net ip_tcp_tkeep[7] -attr @rip Q[6] -pin ipv4_parser_inst Q[6] -pin tcp_parser_inst Q[6]
load net ip_tcp_tlast -pin ipv4_parser_inst ip_tcp_tlast -pin tcp_parser_inst ip_tcp_tlast
netloc ip_tcp_tlast 1 4 1 2220 11660n
load net ip_tcp_tvalid -pin ipv4_parser_inst ip_tcp_tvalid -pin tcp_parser_inst ip_tcp_tvalid
netloc ip_tcp_tvalid 1 4 1 2440 11680n
load net ip_total_length[0] -attr @rip 0 -port ip_total_length[0] -pin ip_total_length_OBUF[0]_inst O
load net ip_total_length[10] -attr @rip 10 -port ip_total_length[10] -pin ip_total_length_OBUF[10]_inst O
load net ip_total_length[11] -attr @rip 11 -port ip_total_length[11] -pin ip_total_length_OBUF[11]_inst O
load net ip_total_length[12] -attr @rip 12 -port ip_total_length[12] -pin ip_total_length_OBUF[12]_inst O
load net ip_total_length[13] -attr @rip 13 -port ip_total_length[13] -pin ip_total_length_OBUF[13]_inst O
load net ip_total_length[14] -attr @rip 14 -port ip_total_length[14] -pin ip_total_length_OBUF[14]_inst O
load net ip_total_length[15] -attr @rip 15 -port ip_total_length[15] -pin ip_total_length_OBUF[15]_inst O
load net ip_total_length[1] -attr @rip 1 -port ip_total_length[1] -pin ip_total_length_OBUF[1]_inst O
load net ip_total_length[2] -attr @rip 2 -port ip_total_length[2] -pin ip_total_length_OBUF[2]_inst O
load net ip_total_length[3] -attr @rip 3 -port ip_total_length[3] -pin ip_total_length_OBUF[3]_inst O
load net ip_total_length[4] -attr @rip 4 -port ip_total_length[4] -pin ip_total_length_OBUF[4]_inst O
load net ip_total_length[5] -attr @rip 5 -port ip_total_length[5] -pin ip_total_length_OBUF[5]_inst O
load net ip_total_length[6] -attr @rip 6 -port ip_total_length[6] -pin ip_total_length_OBUF[6]_inst O
load net ip_total_length[7] -attr @rip 7 -port ip_total_length[7] -pin ip_total_length_OBUF[7]_inst O
load net ip_total_length[8] -attr @rip 8 -port ip_total_length[8] -pin ip_total_length_OBUF[8]_inst O
load net ip_total_length[9] -attr @rip 9 -port ip_total_length[9] -pin ip_total_length_OBUF[9]_inst O
load net ip_total_length_OBUF[0] -attr @rip ip_total_length_reg[15]_0[0] -pin ip_total_length_OBUF[0]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[0]
load net ip_total_length_OBUF[10] -attr @rip ip_total_length_reg[15]_0[10] -pin ip_total_length_OBUF[10]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[10]
load net ip_total_length_OBUF[11] -attr @rip ip_total_length_reg[15]_0[11] -pin ip_total_length_OBUF[11]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[11]
load net ip_total_length_OBUF[12] -attr @rip ip_total_length_reg[15]_0[12] -pin ip_total_length_OBUF[12]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[12]
load net ip_total_length_OBUF[13] -attr @rip ip_total_length_reg[15]_0[13] -pin ip_total_length_OBUF[13]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[13]
load net ip_total_length_OBUF[14] -attr @rip ip_total_length_reg[15]_0[14] -pin ip_total_length_OBUF[14]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[14]
load net ip_total_length_OBUF[15] -attr @rip ip_total_length_reg[15]_0[15] -pin ip_total_length_OBUF[15]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[15]
load net ip_total_length_OBUF[1] -attr @rip ip_total_length_reg[15]_0[1] -pin ip_total_length_OBUF[1]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[1]
load net ip_total_length_OBUF[2] -attr @rip ip_total_length_reg[15]_0[2] -pin ip_total_length_OBUF[2]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[2]
load net ip_total_length_OBUF[3] -attr @rip ip_total_length_reg[15]_0[3] -pin ip_total_length_OBUF[3]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[3]
load net ip_total_length_OBUF[4] -attr @rip ip_total_length_reg[15]_0[4] -pin ip_total_length_OBUF[4]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[4]
load net ip_total_length_OBUF[5] -attr @rip ip_total_length_reg[15]_0[5] -pin ip_total_length_OBUF[5]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[5]
load net ip_total_length_OBUF[6] -attr @rip ip_total_length_reg[15]_0[6] -pin ip_total_length_OBUF[6]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[6]
load net ip_total_length_OBUF[7] -attr @rip ip_total_length_reg[15]_0[7] -pin ip_total_length_OBUF[7]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[7]
load net ip_total_length_OBUF[8] -attr @rip ip_total_length_reg[15]_0[8] -pin ip_total_length_OBUF[8]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[8]
load net ip_total_length_OBUF[9] -attr @rip ip_total_length_reg[15]_0[9] -pin ip_total_length_OBUF[9]_inst I -pin ipv4_parser_inst ip_total_length_reg[15]_0[9]
load net ipv4_header_valid -port ipv4_header_valid -pin ipv4_header_valid_OBUF_inst O
netloc ipv4_header_valid 1 6 1 NJ 11520
load net ipv4_header_valid_OBUF -pin ipv4_header_valid_OBUF_inst I -pin ipv4_parser_inst ipv4_header_valid_OBUF
netloc ipv4_header_valid_OBUF 1 4 2 2260J 11520 NJ
load net ipv4_parser_inst_n_19 -pin ipv4_parser_inst out_last_reg_reg_0 -pin tcp_parser_inst out_keep_reg_reg[5]_0
netloc ipv4_parser_inst_n_19 1 4 1 2120 12200n
load net ipv4_parser_inst_n_20 -pin ipv4_parser_inst out_keep_reg_reg[0]_0 -pin tcp_parser_inst byte_count_reg[3]_0
netloc ipv4_parser_inst_n_20 1 4 1 2360 12140n
load net ipv4_parser_inst_n_21 -pin ethernet_parser_inst byte_count_reg[3] -pin ipv4_parser_inst leftover_count_reg[2]_0
netloc ipv4_parser_inst_n_21 1 2 3 580 12380 1310J 12400 2000
load net ipv4_parser_inst_n_22 -pin ethernet_parser_inst out_keep_reg_reg[5]_0 -pin ipv4_parser_inst leftover_count_reg[1]_0
netloc ipv4_parser_inst_n_22 1 2 3 480 11380 NJ 11380 1920
load net ipv4_parser_inst_n_23 -pin ethernet_parser_inst out_keep_reg_reg[5]_1 -pin ipv4_parser_inst leftover_count_reg[0]_0
netloc ipv4_parser_inst_n_23 1 2 3 460 11360 NJ 11360 1960
load net ipv4_parser_inst_n_24 -pin ethernet_parser_inst out_keep_reg_reg[7]_0 -pin ipv4_parser_inst leftover_count_reg[2]_1
netloc ipv4_parser_inst_n_24 1 2 3 540 12400 1270J 12420 1960
load net ipv4_parser_inst_n_25 -pin ethernet_parser_inst out_keep_reg_reg[7]_1 -pin ipv4_parser_inst state_reg[0]_1
netloc ipv4_parser_inst_n_25 1 2 3 640 11460 NJ 11460 2060
load net ipv4_parser_inst_n_26 -pin ethernet_parser_inst byte_count_reg[3]_0 -pin ipv4_parser_inst out_valid_reg_reg_0
netloc ipv4_parser_inst_n_26 1 2 3 540 11480 NJ 11480 2040
load net ipv4_parser_inst_n_27 -pin ethernet_parser_inst state_reg[0]_0 -pin ipv4_parser_inst state_reg[1]_1
netloc ipv4_parser_inst_n_27 1 2 3 560 11500 NJ 11500 2020
load net ipv4_parser_inst_n_28 -pin ethernet_parser_inst out_valid_reg_reg_0 -pin ipv4_parser_inst state_reg[0]_2
netloc ipv4_parser_inst_n_28 1 2 3 600 11520 NJ 11520 1980
load net ipv4_parser_inst_n_29 -pin ethernet_parser_inst src_mac_reg[31]_1 -pin ipv4_parser_inst state_reg[1]_2
netloc ipv4_parser_inst_n_29 1 2 3 620 11540 NJ 11540 1940
load net ipv4_parser_inst_n_30 -pin ipv4_parser_inst out_keep_reg_reg[0]_1 -pin tcp_parser_inst shift_reg_reg[0]_0
netloc ipv4_parser_inst_n_30 1 4 1 2160 12160n
load net ipv4_parser_inst_n_31 -pin ipv4_parser_inst leftover_count_reg[2]_2 -pin tcp_parser_inst state_reg[0]_0
netloc ipv4_parser_inst_n_31 1 4 1 2300 11860n
load net ipv4_parser_inst_n_32 -pin ipv4_parser_inst out_keep_reg_reg[7]_0 -pin tcp_parser_inst leftover_count_reg[0]_1
netloc ipv4_parser_inst_n_32 1 4 1 2200 12180n
load net ipv4_parser_inst_n_7 -pin ethernet_parser_inst s_axis_tready -pin ipv4_parser_inst state_reg[1]_0
netloc ipv4_parser_inst_n_7 1 2 3 520 12440 NJ 12440 1920
load net ipv4_parser_inst_n_8 -pin ethernet_parser_inst s_axis_tready_0 -pin ipv4_parser_inst state_reg[0]_0
netloc ipv4_parser_inst_n_8 1 2 3 640 12460 NJ 12460 2040
load net is_ipv4 -port is_ipv4 -pin is_ipv4_OBUF_inst O
netloc is_ipv4 1 6 1 NJ 11310
load net is_ipv4_OBUF -pin ethernet_parser_inst is_ipv4_OBUF -pin is_ipv4_OBUF_inst I
netloc is_ipv4_OBUF 1 3 3 1130J 11320 NJ 11320 3380J
load net is_tcp -port is_tcp -pin is_tcp_OBUF_inst O
netloc is_tcp 1 6 1 NJ 11590
load net is_tcp_OBUF -pin ipv4_parser_inst is_tcp_OBUF -pin is_tcp_OBUF_inst I
netloc is_tcp_OBUF 1 4 2 2300J 11590 NJ
load net leftover_count[0] -attr @rip leftover_count[0] -pin ethernet_parser_inst leftover_count[0] -pin ipv4_parser_inst leftover_count_0[0]
netloc leftover_count[0] 1 3 1 1170 11940n
load net leftover_count_0[0] -attr @rip leftover_count[0] -pin ipv4_parser_inst leftover_count[0] -pin tcp_parser_inst leftover_count_reg[0]_0[0]
netloc leftover_count_0[0] 1 4 1 2400 11760n
load net lopt -pin ip_ihl_OBUF[0]_inst I -pin ipv4_parser_inst lopt
netloc lopt 1 4 2 2360 11870 NJ
load net lopt_1 -pin ip_ihl_OBUF[1]_inst I -pin ipv4_parser_inst lopt_1
netloc lopt_1 1 4 2 2520 11940 NJ
load net lopt_10 -pin ip_protocol_OBUF[6]_inst I -pin ipv4_parser_inst lopt_10
netloc lopt_10 1 4 2 2140 12710 NJ
load net lopt_11 -pin ip_protocol_OBUF[7]_inst I -pin ipv4_parser_inst lopt_11
netloc lopt_11 1 4 2 2100 12780 NJ
load net lopt_12 -pin tcp_data_offset_OBUF[0]_inst I -pin tcp_parser_inst lopt
netloc lopt_12 1 5 1 3360 12140n
load net lopt_13 -pin tcp_data_offset_OBUF[1]_inst I -pin tcp_parser_inst lopt_1
netloc lopt_13 1 5 1 3340 12160n
load net lopt_14 -pin tcp_data_offset_OBUF[2]_inst I -pin tcp_parser_inst lopt_2
netloc lopt_14 1 5 1 3300 12180n
load net lopt_15 -pin tcp_data_offset_OBUF[3]_inst I -pin tcp_parser_inst lopt_3
netloc lopt_15 1 5 1 3280 12200n
load net lopt_2 -pin ip_ihl_OBUF[2]_inst I -pin ipv4_parser_inst lopt_2
netloc lopt_2 1 4 2 2500 11960 3380J
load net lopt_3 -pin ip_ihl_OBUF[3]_inst I -pin ipv4_parser_inst lopt_3
netloc lopt_3 1 4 2 2460 11980 3360J
load net lopt_4 -pin ip_protocol_OBUF[0]_inst I -pin ipv4_parser_inst lopt_4
netloc lopt_4 1 4 2 2280 11380 NJ
load net lopt_5 -pin ip_protocol_OBUF[1]_inst I -pin ipv4_parser_inst lopt_5
netloc lopt_5 1 4 2 2320 11450 NJ
load net lopt_6 -pin ip_protocol_OBUF[2]_inst I -pin ipv4_parser_inst lopt_6
netloc lopt_6 1 4 2 2340 11660 NJ
load net lopt_7 -pin ip_protocol_OBUF[3]_inst I -pin ipv4_parser_inst lopt_7
netloc lopt_7 1 4 2 2380 11730 NJ
load net lopt_8 -pin ip_protocol_OBUF[4]_inst I -pin ipv4_parser_inst lopt_8
netloc lopt_8 1 4 2 2420 11800 NJ
load net lopt_9 -pin ip_protocol_OBUF[5]_inst I -pin ipv4_parser_inst lopt_9
netloc lopt_9 1 4 2 2260 12520 3380J
load net m_axis_tdata[0] -attr @rip 0 -port m_axis_tdata[0] -pin m_axis_tdata_OBUF[0]_inst O
load net m_axis_tdata[10] -attr @rip 10 -port m_axis_tdata[10] -pin m_axis_tdata_OBUF[10]_inst O
load net m_axis_tdata[11] -attr @rip 11 -port m_axis_tdata[11] -pin m_axis_tdata_OBUF[11]_inst O
load net m_axis_tdata[12] -attr @rip 12 -port m_axis_tdata[12] -pin m_axis_tdata_OBUF[12]_inst O
load net m_axis_tdata[13] -attr @rip 13 -port m_axis_tdata[13] -pin m_axis_tdata_OBUF[13]_inst O
load net m_axis_tdata[14] -attr @rip 14 -port m_axis_tdata[14] -pin m_axis_tdata_OBUF[14]_inst O
load net m_axis_tdata[15] -attr @rip 15 -port m_axis_tdata[15] -pin m_axis_tdata_OBUF[15]_inst O
load net m_axis_tdata[16] -attr @rip 16 -port m_axis_tdata[16] -pin m_axis_tdata_OBUF[16]_inst O
load net m_axis_tdata[17] -attr @rip 17 -port m_axis_tdata[17] -pin m_axis_tdata_OBUF[17]_inst O
load net m_axis_tdata[18] -attr @rip 18 -port m_axis_tdata[18] -pin m_axis_tdata_OBUF[18]_inst O
load net m_axis_tdata[19] -attr @rip 19 -port m_axis_tdata[19] -pin m_axis_tdata_OBUF[19]_inst O
load net m_axis_tdata[1] -attr @rip 1 -port m_axis_tdata[1] -pin m_axis_tdata_OBUF[1]_inst O
load net m_axis_tdata[20] -attr @rip 20 -port m_axis_tdata[20] -pin m_axis_tdata_OBUF[20]_inst O
load net m_axis_tdata[21] -attr @rip 21 -port m_axis_tdata[21] -pin m_axis_tdata_OBUF[21]_inst O
load net m_axis_tdata[22] -attr @rip 22 -port m_axis_tdata[22] -pin m_axis_tdata_OBUF[22]_inst O
load net m_axis_tdata[23] -attr @rip 23 -port m_axis_tdata[23] -pin m_axis_tdata_OBUF[23]_inst O
load net m_axis_tdata[24] -attr @rip 24 -port m_axis_tdata[24] -pin m_axis_tdata_OBUF[24]_inst O
load net m_axis_tdata[25] -attr @rip 25 -port m_axis_tdata[25] -pin m_axis_tdata_OBUF[25]_inst O
load net m_axis_tdata[26] -attr @rip 26 -port m_axis_tdata[26] -pin m_axis_tdata_OBUF[26]_inst O
load net m_axis_tdata[27] -attr @rip 27 -port m_axis_tdata[27] -pin m_axis_tdata_OBUF[27]_inst O
load net m_axis_tdata[28] -attr @rip 28 -port m_axis_tdata[28] -pin m_axis_tdata_OBUF[28]_inst O
load net m_axis_tdata[29] -attr @rip 29 -port m_axis_tdata[29] -pin m_axis_tdata_OBUF[29]_inst O
load net m_axis_tdata[2] -attr @rip 2 -port m_axis_tdata[2] -pin m_axis_tdata_OBUF[2]_inst O
load net m_axis_tdata[30] -attr @rip 30 -port m_axis_tdata[30] -pin m_axis_tdata_OBUF[30]_inst O
load net m_axis_tdata[31] -attr @rip 31 -port m_axis_tdata[31] -pin m_axis_tdata_OBUF[31]_inst O
load net m_axis_tdata[32] -attr @rip 32 -port m_axis_tdata[32] -pin m_axis_tdata_OBUF[32]_inst O
load net m_axis_tdata[33] -attr @rip 33 -port m_axis_tdata[33] -pin m_axis_tdata_OBUF[33]_inst O
load net m_axis_tdata[34] -attr @rip 34 -port m_axis_tdata[34] -pin m_axis_tdata_OBUF[34]_inst O
load net m_axis_tdata[35] -attr @rip 35 -port m_axis_tdata[35] -pin m_axis_tdata_OBUF[35]_inst O
load net m_axis_tdata[36] -attr @rip 36 -port m_axis_tdata[36] -pin m_axis_tdata_OBUF[36]_inst O
load net m_axis_tdata[37] -attr @rip 37 -port m_axis_tdata[37] -pin m_axis_tdata_OBUF[37]_inst O
load net m_axis_tdata[38] -attr @rip 38 -port m_axis_tdata[38] -pin m_axis_tdata_OBUF[38]_inst O
load net m_axis_tdata[39] -attr @rip 39 -port m_axis_tdata[39] -pin m_axis_tdata_OBUF[39]_inst O
load net m_axis_tdata[3] -attr @rip 3 -port m_axis_tdata[3] -pin m_axis_tdata_OBUF[3]_inst O
load net m_axis_tdata[40] -attr @rip 40 -port m_axis_tdata[40] -pin m_axis_tdata_OBUF[40]_inst O
load net m_axis_tdata[41] -attr @rip 41 -port m_axis_tdata[41] -pin m_axis_tdata_OBUF[41]_inst O
load net m_axis_tdata[42] -attr @rip 42 -port m_axis_tdata[42] -pin m_axis_tdata_OBUF[42]_inst O
load net m_axis_tdata[43] -attr @rip 43 -port m_axis_tdata[43] -pin m_axis_tdata_OBUF[43]_inst O
load net m_axis_tdata[44] -attr @rip 44 -port m_axis_tdata[44] -pin m_axis_tdata_OBUF[44]_inst O
load net m_axis_tdata[45] -attr @rip 45 -port m_axis_tdata[45] -pin m_axis_tdata_OBUF[45]_inst O
load net m_axis_tdata[46] -attr @rip 46 -port m_axis_tdata[46] -pin m_axis_tdata_OBUF[46]_inst O
load net m_axis_tdata[47] -attr @rip 47 -port m_axis_tdata[47] -pin m_axis_tdata_OBUF[47]_inst O
load net m_axis_tdata[48] -attr @rip 48 -port m_axis_tdata[48] -pin m_axis_tdata_OBUF[48]_inst O
load net m_axis_tdata[49] -attr @rip 49 -port m_axis_tdata[49] -pin m_axis_tdata_OBUF[49]_inst O
load net m_axis_tdata[4] -attr @rip 4 -port m_axis_tdata[4] -pin m_axis_tdata_OBUF[4]_inst O
load net m_axis_tdata[50] -attr @rip 50 -port m_axis_tdata[50] -pin m_axis_tdata_OBUF[50]_inst O
load net m_axis_tdata[51] -attr @rip 51 -port m_axis_tdata[51] -pin m_axis_tdata_OBUF[51]_inst O
load net m_axis_tdata[52] -attr @rip 52 -port m_axis_tdata[52] -pin m_axis_tdata_OBUF[52]_inst O
load net m_axis_tdata[53] -attr @rip 53 -port m_axis_tdata[53] -pin m_axis_tdata_OBUF[53]_inst O
load net m_axis_tdata[54] -attr @rip 54 -port m_axis_tdata[54] -pin m_axis_tdata_OBUF[54]_inst O
load net m_axis_tdata[55] -attr @rip 55 -port m_axis_tdata[55] -pin m_axis_tdata_OBUF[55]_inst O
load net m_axis_tdata[56] -attr @rip 56 -port m_axis_tdata[56] -pin m_axis_tdata_OBUF[56]_inst O
load net m_axis_tdata[57] -attr @rip 57 -port m_axis_tdata[57] -pin m_axis_tdata_OBUF[57]_inst O
load net m_axis_tdata[58] -attr @rip 58 -port m_axis_tdata[58] -pin m_axis_tdata_OBUF[58]_inst O
load net m_axis_tdata[59] -attr @rip 59 -port m_axis_tdata[59] -pin m_axis_tdata_OBUF[59]_inst O
load net m_axis_tdata[5] -attr @rip 5 -port m_axis_tdata[5] -pin m_axis_tdata_OBUF[5]_inst O
load net m_axis_tdata[60] -attr @rip 60 -port m_axis_tdata[60] -pin m_axis_tdata_OBUF[60]_inst O
load net m_axis_tdata[61] -attr @rip 61 -port m_axis_tdata[61] -pin m_axis_tdata_OBUF[61]_inst O
load net m_axis_tdata[62] -attr @rip 62 -port m_axis_tdata[62] -pin m_axis_tdata_OBUF[62]_inst O
load net m_axis_tdata[63] -attr @rip 63 -port m_axis_tdata[63] -pin m_axis_tdata_OBUF[63]_inst O
load net m_axis_tdata[6] -attr @rip 6 -port m_axis_tdata[6] -pin m_axis_tdata_OBUF[6]_inst O
load net m_axis_tdata[7] -attr @rip 7 -port m_axis_tdata[7] -pin m_axis_tdata_OBUF[7]_inst O
load net m_axis_tdata[8] -attr @rip 8 -port m_axis_tdata[8] -pin m_axis_tdata_OBUF[8]_inst O
load net m_axis_tdata[9] -attr @rip 9 -port m_axis_tdata[9] -pin m_axis_tdata_OBUF[9]_inst O
load net m_axis_tdata_OBUF[0] -attr @rip out_data_reg_reg[63]_0[0] -pin m_axis_tdata_OBUF[0]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[0]
load net m_axis_tdata_OBUF[10] -attr @rip out_data_reg_reg[63]_0[10] -pin m_axis_tdata_OBUF[10]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[10]
load net m_axis_tdata_OBUF[11] -attr @rip out_data_reg_reg[63]_0[11] -pin m_axis_tdata_OBUF[11]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[11]
load net m_axis_tdata_OBUF[12] -attr @rip out_data_reg_reg[63]_0[12] -pin m_axis_tdata_OBUF[12]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[12]
load net m_axis_tdata_OBUF[13] -attr @rip out_data_reg_reg[63]_0[13] -pin m_axis_tdata_OBUF[13]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[13]
load net m_axis_tdata_OBUF[14] -attr @rip out_data_reg_reg[63]_0[14] -pin m_axis_tdata_OBUF[14]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[14]
load net m_axis_tdata_OBUF[15] -attr @rip out_data_reg_reg[63]_0[15] -pin m_axis_tdata_OBUF[15]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[15]
load net m_axis_tdata_OBUF[16] -attr @rip out_data_reg_reg[63]_0[16] -pin m_axis_tdata_OBUF[16]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[16]
load net m_axis_tdata_OBUF[17] -attr @rip out_data_reg_reg[63]_0[17] -pin m_axis_tdata_OBUF[17]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[17]
load net m_axis_tdata_OBUF[18] -attr @rip out_data_reg_reg[63]_0[18] -pin m_axis_tdata_OBUF[18]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[18]
load net m_axis_tdata_OBUF[19] -attr @rip out_data_reg_reg[63]_0[19] -pin m_axis_tdata_OBUF[19]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[19]
load net m_axis_tdata_OBUF[1] -attr @rip out_data_reg_reg[63]_0[1] -pin m_axis_tdata_OBUF[1]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[1]
load net m_axis_tdata_OBUF[20] -attr @rip out_data_reg_reg[63]_0[20] -pin m_axis_tdata_OBUF[20]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[20]
load net m_axis_tdata_OBUF[21] -attr @rip out_data_reg_reg[63]_0[21] -pin m_axis_tdata_OBUF[21]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[21]
load net m_axis_tdata_OBUF[22] -attr @rip out_data_reg_reg[63]_0[22] -pin m_axis_tdata_OBUF[22]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[22]
load net m_axis_tdata_OBUF[23] -attr @rip out_data_reg_reg[63]_0[23] -pin m_axis_tdata_OBUF[23]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[23]
load net m_axis_tdata_OBUF[24] -attr @rip out_data_reg_reg[63]_0[24] -pin m_axis_tdata_OBUF[24]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[24]
load net m_axis_tdata_OBUF[25] -attr @rip out_data_reg_reg[63]_0[25] -pin m_axis_tdata_OBUF[25]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[25]
load net m_axis_tdata_OBUF[26] -attr @rip out_data_reg_reg[63]_0[26] -pin m_axis_tdata_OBUF[26]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[26]
load net m_axis_tdata_OBUF[27] -attr @rip out_data_reg_reg[63]_0[27] -pin m_axis_tdata_OBUF[27]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[27]
load net m_axis_tdata_OBUF[28] -attr @rip out_data_reg_reg[63]_0[28] -pin m_axis_tdata_OBUF[28]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[28]
load net m_axis_tdata_OBUF[29] -attr @rip out_data_reg_reg[63]_0[29] -pin m_axis_tdata_OBUF[29]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[29]
load net m_axis_tdata_OBUF[2] -attr @rip out_data_reg_reg[63]_0[2] -pin m_axis_tdata_OBUF[2]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[2]
load net m_axis_tdata_OBUF[30] -attr @rip out_data_reg_reg[63]_0[30] -pin m_axis_tdata_OBUF[30]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[30]
load net m_axis_tdata_OBUF[31] -attr @rip out_data_reg_reg[63]_0[31] -pin m_axis_tdata_OBUF[31]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[31]
load net m_axis_tdata_OBUF[32] -attr @rip out_data_reg_reg[63]_0[32] -pin m_axis_tdata_OBUF[32]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[32]
load net m_axis_tdata_OBUF[33] -attr @rip out_data_reg_reg[63]_0[33] -pin m_axis_tdata_OBUF[33]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[33]
load net m_axis_tdata_OBUF[34] -attr @rip out_data_reg_reg[63]_0[34] -pin m_axis_tdata_OBUF[34]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[34]
load net m_axis_tdata_OBUF[35] -attr @rip out_data_reg_reg[63]_0[35] -pin m_axis_tdata_OBUF[35]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[35]
load net m_axis_tdata_OBUF[36] -attr @rip out_data_reg_reg[63]_0[36] -pin m_axis_tdata_OBUF[36]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[36]
load net m_axis_tdata_OBUF[37] -attr @rip out_data_reg_reg[63]_0[37] -pin m_axis_tdata_OBUF[37]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[37]
load net m_axis_tdata_OBUF[38] -attr @rip out_data_reg_reg[63]_0[38] -pin m_axis_tdata_OBUF[38]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[38]
load net m_axis_tdata_OBUF[39] -attr @rip out_data_reg_reg[63]_0[39] -pin m_axis_tdata_OBUF[39]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[39]
load net m_axis_tdata_OBUF[3] -attr @rip out_data_reg_reg[63]_0[3] -pin m_axis_tdata_OBUF[3]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[3]
load net m_axis_tdata_OBUF[40] -attr @rip out_data_reg_reg[63]_0[40] -pin m_axis_tdata_OBUF[40]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[40]
load net m_axis_tdata_OBUF[41] -attr @rip out_data_reg_reg[63]_0[41] -pin m_axis_tdata_OBUF[41]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[41]
load net m_axis_tdata_OBUF[42] -attr @rip out_data_reg_reg[63]_0[42] -pin m_axis_tdata_OBUF[42]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[42]
load net m_axis_tdata_OBUF[43] -attr @rip out_data_reg_reg[63]_0[43] -pin m_axis_tdata_OBUF[43]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[43]
load net m_axis_tdata_OBUF[44] -attr @rip out_data_reg_reg[63]_0[44] -pin m_axis_tdata_OBUF[44]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[44]
load net m_axis_tdata_OBUF[45] -attr @rip out_data_reg_reg[63]_0[45] -pin m_axis_tdata_OBUF[45]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[45]
load net m_axis_tdata_OBUF[46] -attr @rip out_data_reg_reg[63]_0[46] -pin m_axis_tdata_OBUF[46]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[46]
load net m_axis_tdata_OBUF[47] -attr @rip out_data_reg_reg[63]_0[47] -pin m_axis_tdata_OBUF[47]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[47]
load net m_axis_tdata_OBUF[48] -attr @rip out_data_reg_reg[63]_0[48] -pin m_axis_tdata_OBUF[48]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[48]
load net m_axis_tdata_OBUF[49] -attr @rip out_data_reg_reg[63]_0[49] -pin m_axis_tdata_OBUF[49]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[49]
load net m_axis_tdata_OBUF[4] -attr @rip out_data_reg_reg[63]_0[4] -pin m_axis_tdata_OBUF[4]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[4]
load net m_axis_tdata_OBUF[50] -attr @rip out_data_reg_reg[63]_0[50] -pin m_axis_tdata_OBUF[50]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[50]
load net m_axis_tdata_OBUF[51] -attr @rip out_data_reg_reg[63]_0[51] -pin m_axis_tdata_OBUF[51]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[51]
load net m_axis_tdata_OBUF[52] -attr @rip out_data_reg_reg[63]_0[52] -pin m_axis_tdata_OBUF[52]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[52]
load net m_axis_tdata_OBUF[53] -attr @rip out_data_reg_reg[63]_0[53] -pin m_axis_tdata_OBUF[53]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[53]
load net m_axis_tdata_OBUF[54] -attr @rip out_data_reg_reg[63]_0[54] -pin m_axis_tdata_OBUF[54]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[54]
load net m_axis_tdata_OBUF[55] -attr @rip out_data_reg_reg[63]_0[55] -pin m_axis_tdata_OBUF[55]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[55]
load net m_axis_tdata_OBUF[56] -attr @rip out_data_reg_reg[63]_0[56] -pin m_axis_tdata_OBUF[56]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[56]
load net m_axis_tdata_OBUF[57] -attr @rip out_data_reg_reg[63]_0[57] -pin m_axis_tdata_OBUF[57]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[57]
load net m_axis_tdata_OBUF[58] -attr @rip out_data_reg_reg[63]_0[58] -pin m_axis_tdata_OBUF[58]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[58]
load net m_axis_tdata_OBUF[59] -attr @rip out_data_reg_reg[63]_0[59] -pin m_axis_tdata_OBUF[59]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[59]
load net m_axis_tdata_OBUF[5] -attr @rip out_data_reg_reg[63]_0[5] -pin m_axis_tdata_OBUF[5]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[5]
load net m_axis_tdata_OBUF[60] -attr @rip out_data_reg_reg[63]_0[60] -pin m_axis_tdata_OBUF[60]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[60]
load net m_axis_tdata_OBUF[61] -attr @rip out_data_reg_reg[63]_0[61] -pin m_axis_tdata_OBUF[61]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[61]
load net m_axis_tdata_OBUF[62] -attr @rip out_data_reg_reg[63]_0[62] -pin m_axis_tdata_OBUF[62]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[62]
load net m_axis_tdata_OBUF[63] -attr @rip out_data_reg_reg[63]_0[63] -pin m_axis_tdata_OBUF[63]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[63]
load net m_axis_tdata_OBUF[6] -attr @rip out_data_reg_reg[63]_0[6] -pin m_axis_tdata_OBUF[6]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[6]
load net m_axis_tdata_OBUF[7] -attr @rip out_data_reg_reg[63]_0[7] -pin m_axis_tdata_OBUF[7]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[7]
load net m_axis_tdata_OBUF[8] -attr @rip out_data_reg_reg[63]_0[8] -pin m_axis_tdata_OBUF[8]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[8]
load net m_axis_tdata_OBUF[9] -attr @rip out_data_reg_reg[63]_0[9] -pin m_axis_tdata_OBUF[9]_inst I -pin tcp_parser_inst out_data_reg_reg[63]_0[9]
load net m_axis_tkeep[0] -attr @rip 0 -port m_axis_tkeep[0] -pin m_axis_tkeep_OBUF[0]_inst O
load net m_axis_tkeep[1] -attr @rip 1 -port m_axis_tkeep[1] -pin m_axis_tkeep_OBUF[1]_inst O
load net m_axis_tkeep[2] -attr @rip 2 -port m_axis_tkeep[2] -pin m_axis_tkeep_OBUF[2]_inst O
load net m_axis_tkeep[3] -attr @rip 3 -port m_axis_tkeep[3] -pin m_axis_tkeep_OBUF[3]_inst O
load net m_axis_tkeep[4] -attr @rip 4 -port m_axis_tkeep[4] -pin m_axis_tkeep_OBUF[4]_inst O
load net m_axis_tkeep[5] -attr @rip 5 -port m_axis_tkeep[5] -pin m_axis_tkeep_OBUF[5]_inst O
load net m_axis_tkeep[6] -attr @rip 6 -port m_axis_tkeep[6] -pin m_axis_tkeep_OBUF[6]_inst O
load net m_axis_tkeep[7] -attr @rip 7 -port m_axis_tkeep[7] -pin m_axis_tkeep_OBUF[7]_inst O
load net m_axis_tkeep_OBUF[0] -attr @rip out_keep_reg_reg[7]_0[0] -pin m_axis_tkeep_OBUF[0]_inst I -pin tcp_parser_inst out_keep_reg_reg[7]_0[0]
load net m_axis_tkeep_OBUF[1] -attr @rip out_keep_reg_reg[7]_0[1] -pin m_axis_tkeep_OBUF[1]_inst I -pin tcp_parser_inst out_keep_reg_reg[7]_0[1]
load net m_axis_tkeep_OBUF[2] -attr @rip out_keep_reg_reg[7]_0[2] -pin m_axis_tkeep_OBUF[2]_inst I -pin tcp_parser_inst out_keep_reg_reg[7]_0[2]
load net m_axis_tkeep_OBUF[3] -attr @rip out_keep_reg_reg[7]_0[3] -pin m_axis_tkeep_OBUF[3]_inst I -pin tcp_parser_inst out_keep_reg_reg[7]_0[3]
load net m_axis_tkeep_OBUF[4] -attr @rip out_keep_reg_reg[7]_0[4] -pin m_axis_tkeep_OBUF[4]_inst I -pin tcp_parser_inst out_keep_reg_reg[7]_0[4]
load net m_axis_tkeep_OBUF[5] -attr @rip out_keep_reg_reg[7]_0[5] -pin m_axis_tkeep_OBUF[5]_inst I -pin tcp_parser_inst out_keep_reg_reg[7]_0[5]
load net m_axis_tkeep_OBUF[6] -attr @rip out_keep_reg_reg[7]_0[6] -pin m_axis_tkeep_OBUF[6]_inst I -pin tcp_parser_inst out_keep_reg_reg[7]_0[6]
load net m_axis_tkeep_OBUF[7] -attr @rip out_keep_reg_reg[7]_0[7] -pin m_axis_tkeep_OBUF[7]_inst I -pin tcp_parser_inst out_keep_reg_reg[7]_0[7]
load net m_axis_tlast -port m_axis_tlast -pin m_axis_tlast_OBUF_inst O
netloc m_axis_tlast 1 6 1 NJ 12220
load net m_axis_tlast_OBUF -pin m_axis_tlast_OBUF_inst I -pin tcp_parser_inst m_axis_tlast_OBUF
netloc m_axis_tlast_OBUF 1 5 1 NJ 12220
load net m_axis_tready -port m_axis_tready -pin m_axis_tready_IBUF_inst I
netloc m_axis_tready 1 0 4 NJ 11420 NJ 11420 NJ 11420 NJ
load net m_axis_tready_IBUF -pin m_axis_tready_IBUF_inst O -pin tcp_parser_inst m_axis_tready_IBUF
netloc m_axis_tready_IBUF 1 4 1 2480J 11420n
load net m_axis_tvalid -port m_axis_tvalid -pin m_axis_tvalid_OBUF_inst O
netloc m_axis_tvalid 1 6 1 NJ 12290
load net m_axis_tvalid_OBUF -pin m_axis_tvalid_OBUF_inst I -pin tcp_parser_inst m_axis_tvalid_OBUF
netloc m_axis_tvalid_OBUF 1 5 1 3320J 12240n
load net out_keep_reg1_in[5] -attr @rip D[0] -pin ethernet_parser_inst D[0] -pin ipv4_parser_inst out_keep_reg_reg[7]_1[0]
load net out_keep_reg1_in[7] -attr @rip D[1] -pin ethernet_parser_inst D[1] -pin ipv4_parser_inst out_keep_reg_reg[7]_1[1]
load net out_keep_reg1_in_1[6] -attr @rip D[0] -pin ipv4_parser_inst D[0] -pin tcp_parser_inst D[0]
load net out_keep_reg1_in_1[7] -attr @rip D[1] -pin ipv4_parser_inst D[1] -pin tcp_parser_inst D[1]
load net rst_n -port rst_n -pin rst_n_IBUF_inst I
netloc rst_n 1 0 2 NJ 11940 NJ
load net rst_n_IBUF -pin ethernet_parser_inst rst_n_IBUF -pin ipv4_parser_inst rst_n_IBUF -pin rst_n_IBUF_inst O -pin tcp_parser_inst rst_n_IBUF
netloc rst_n_IBUF 1 2 3 460 12420 1250 12480 2060J
load net s_axis_tdata[0] -attr @rip s_axis_tdata[0] -port s_axis_tdata[0] -pin s_axis_tdata_IBUF[0]_inst I
load net s_axis_tdata[10] -attr @rip s_axis_tdata[10] -port s_axis_tdata[10] -pin s_axis_tdata_IBUF[10]_inst I
load net s_axis_tdata[11] -attr @rip s_axis_tdata[11] -port s_axis_tdata[11] -pin s_axis_tdata_IBUF[11]_inst I
load net s_axis_tdata[12] -attr @rip s_axis_tdata[12] -port s_axis_tdata[12] -pin s_axis_tdata_IBUF[12]_inst I
load net s_axis_tdata[13] -attr @rip s_axis_tdata[13] -port s_axis_tdata[13] -pin s_axis_tdata_IBUF[13]_inst I
load net s_axis_tdata[14] -attr @rip s_axis_tdata[14] -port s_axis_tdata[14] -pin s_axis_tdata_IBUF[14]_inst I
load net s_axis_tdata[15] -attr @rip s_axis_tdata[15] -port s_axis_tdata[15] -pin s_axis_tdata_IBUF[15]_inst I
load net s_axis_tdata[16] -attr @rip s_axis_tdata[16] -port s_axis_tdata[16] -pin s_axis_tdata_IBUF[16]_inst I
load net s_axis_tdata[17] -attr @rip s_axis_tdata[17] -port s_axis_tdata[17] -pin s_axis_tdata_IBUF[17]_inst I
load net s_axis_tdata[18] -attr @rip s_axis_tdata[18] -port s_axis_tdata[18] -pin s_axis_tdata_IBUF[18]_inst I
load net s_axis_tdata[19] -attr @rip s_axis_tdata[19] -port s_axis_tdata[19] -pin s_axis_tdata_IBUF[19]_inst I
load net s_axis_tdata[1] -attr @rip s_axis_tdata[1] -port s_axis_tdata[1] -pin s_axis_tdata_IBUF[1]_inst I
load net s_axis_tdata[20] -attr @rip s_axis_tdata[20] -port s_axis_tdata[20] -pin s_axis_tdata_IBUF[20]_inst I
load net s_axis_tdata[21] -attr @rip s_axis_tdata[21] -port s_axis_tdata[21] -pin s_axis_tdata_IBUF[21]_inst I
load net s_axis_tdata[22] -attr @rip s_axis_tdata[22] -port s_axis_tdata[22] -pin s_axis_tdata_IBUF[22]_inst I
load net s_axis_tdata[23] -attr @rip s_axis_tdata[23] -port s_axis_tdata[23] -pin s_axis_tdata_IBUF[23]_inst I
load net s_axis_tdata[24] -attr @rip s_axis_tdata[24] -port s_axis_tdata[24] -pin s_axis_tdata_IBUF[24]_inst I
load net s_axis_tdata[25] -attr @rip s_axis_tdata[25] -port s_axis_tdata[25] -pin s_axis_tdata_IBUF[25]_inst I
load net s_axis_tdata[26] -attr @rip s_axis_tdata[26] -port s_axis_tdata[26] -pin s_axis_tdata_IBUF[26]_inst I
load net s_axis_tdata[27] -attr @rip s_axis_tdata[27] -port s_axis_tdata[27] -pin s_axis_tdata_IBUF[27]_inst I
load net s_axis_tdata[28] -attr @rip s_axis_tdata[28] -port s_axis_tdata[28] -pin s_axis_tdata_IBUF[28]_inst I
load net s_axis_tdata[29] -attr @rip s_axis_tdata[29] -port s_axis_tdata[29] -pin s_axis_tdata_IBUF[29]_inst I
load net s_axis_tdata[2] -attr @rip s_axis_tdata[2] -port s_axis_tdata[2] -pin s_axis_tdata_IBUF[2]_inst I
load net s_axis_tdata[30] -attr @rip s_axis_tdata[30] -port s_axis_tdata[30] -pin s_axis_tdata_IBUF[30]_inst I
load net s_axis_tdata[31] -attr @rip s_axis_tdata[31] -port s_axis_tdata[31] -pin s_axis_tdata_IBUF[31]_inst I
load net s_axis_tdata[32] -attr @rip s_axis_tdata[32] -port s_axis_tdata[32] -pin s_axis_tdata_IBUF[32]_inst I
load net s_axis_tdata[33] -attr @rip s_axis_tdata[33] -port s_axis_tdata[33] -pin s_axis_tdata_IBUF[33]_inst I
load net s_axis_tdata[34] -attr @rip s_axis_tdata[34] -port s_axis_tdata[34] -pin s_axis_tdata_IBUF[34]_inst I
load net s_axis_tdata[35] -attr @rip s_axis_tdata[35] -port s_axis_tdata[35] -pin s_axis_tdata_IBUF[35]_inst I
load net s_axis_tdata[36] -attr @rip s_axis_tdata[36] -port s_axis_tdata[36] -pin s_axis_tdata_IBUF[36]_inst I
load net s_axis_tdata[37] -attr @rip s_axis_tdata[37] -port s_axis_tdata[37] -pin s_axis_tdata_IBUF[37]_inst I
load net s_axis_tdata[38] -attr @rip s_axis_tdata[38] -port s_axis_tdata[38] -pin s_axis_tdata_IBUF[38]_inst I
load net s_axis_tdata[39] -attr @rip s_axis_tdata[39] -port s_axis_tdata[39] -pin s_axis_tdata_IBUF[39]_inst I
load net s_axis_tdata[3] -attr @rip s_axis_tdata[3] -port s_axis_tdata[3] -pin s_axis_tdata_IBUF[3]_inst I
load net s_axis_tdata[40] -attr @rip s_axis_tdata[40] -port s_axis_tdata[40] -pin s_axis_tdata_IBUF[40]_inst I
load net s_axis_tdata[41] -attr @rip s_axis_tdata[41] -port s_axis_tdata[41] -pin s_axis_tdata_IBUF[41]_inst I
load net s_axis_tdata[42] -attr @rip s_axis_tdata[42] -port s_axis_tdata[42] -pin s_axis_tdata_IBUF[42]_inst I
load net s_axis_tdata[43] -attr @rip s_axis_tdata[43] -port s_axis_tdata[43] -pin s_axis_tdata_IBUF[43]_inst I
load net s_axis_tdata[44] -attr @rip s_axis_tdata[44] -port s_axis_tdata[44] -pin s_axis_tdata_IBUF[44]_inst I
load net s_axis_tdata[45] -attr @rip s_axis_tdata[45] -port s_axis_tdata[45] -pin s_axis_tdata_IBUF[45]_inst I
load net s_axis_tdata[46] -attr @rip s_axis_tdata[46] -port s_axis_tdata[46] -pin s_axis_tdata_IBUF[46]_inst I
load net s_axis_tdata[47] -attr @rip s_axis_tdata[47] -port s_axis_tdata[47] -pin s_axis_tdata_IBUF[47]_inst I
load net s_axis_tdata[48] -attr @rip s_axis_tdata[48] -port s_axis_tdata[48] -pin s_axis_tdata_IBUF[48]_inst I
load net s_axis_tdata[49] -attr @rip s_axis_tdata[49] -port s_axis_tdata[49] -pin s_axis_tdata_IBUF[49]_inst I
load net s_axis_tdata[4] -attr @rip s_axis_tdata[4] -port s_axis_tdata[4] -pin s_axis_tdata_IBUF[4]_inst I
load net s_axis_tdata[50] -attr @rip s_axis_tdata[50] -port s_axis_tdata[50] -pin s_axis_tdata_IBUF[50]_inst I
load net s_axis_tdata[51] -attr @rip s_axis_tdata[51] -port s_axis_tdata[51] -pin s_axis_tdata_IBUF[51]_inst I
load net s_axis_tdata[52] -attr @rip s_axis_tdata[52] -port s_axis_tdata[52] -pin s_axis_tdata_IBUF[52]_inst I
load net s_axis_tdata[53] -attr @rip s_axis_tdata[53] -port s_axis_tdata[53] -pin s_axis_tdata_IBUF[53]_inst I
load net s_axis_tdata[54] -attr @rip s_axis_tdata[54] -port s_axis_tdata[54] -pin s_axis_tdata_IBUF[54]_inst I
load net s_axis_tdata[55] -attr @rip s_axis_tdata[55] -port s_axis_tdata[55] -pin s_axis_tdata_IBUF[55]_inst I
load net s_axis_tdata[56] -attr @rip s_axis_tdata[56] -port s_axis_tdata[56] -pin s_axis_tdata_IBUF[56]_inst I
load net s_axis_tdata[57] -attr @rip s_axis_tdata[57] -port s_axis_tdata[57] -pin s_axis_tdata_IBUF[57]_inst I
load net s_axis_tdata[58] -attr @rip s_axis_tdata[58] -port s_axis_tdata[58] -pin s_axis_tdata_IBUF[58]_inst I
load net s_axis_tdata[59] -attr @rip s_axis_tdata[59] -port s_axis_tdata[59] -pin s_axis_tdata_IBUF[59]_inst I
load net s_axis_tdata[5] -attr @rip s_axis_tdata[5] -port s_axis_tdata[5] -pin s_axis_tdata_IBUF[5]_inst I
load net s_axis_tdata[60] -attr @rip s_axis_tdata[60] -port s_axis_tdata[60] -pin s_axis_tdata_IBUF[60]_inst I
load net s_axis_tdata[61] -attr @rip s_axis_tdata[61] -port s_axis_tdata[61] -pin s_axis_tdata_IBUF[61]_inst I
load net s_axis_tdata[62] -attr @rip s_axis_tdata[62] -port s_axis_tdata[62] -pin s_axis_tdata_IBUF[62]_inst I
load net s_axis_tdata[63] -attr @rip s_axis_tdata[63] -port s_axis_tdata[63] -pin s_axis_tdata_IBUF[63]_inst I
load net s_axis_tdata[6] -attr @rip s_axis_tdata[6] -port s_axis_tdata[6] -pin s_axis_tdata_IBUF[6]_inst I
load net s_axis_tdata[7] -attr @rip s_axis_tdata[7] -port s_axis_tdata[7] -pin s_axis_tdata_IBUF[7]_inst I
load net s_axis_tdata[8] -attr @rip s_axis_tdata[8] -port s_axis_tdata[8] -pin s_axis_tdata_IBUF[8]_inst I
load net s_axis_tdata[9] -attr @rip s_axis_tdata[9] -port s_axis_tdata[9] -pin s_axis_tdata_IBUF[9]_inst I
load net s_axis_tdata_IBUF[0] -attr @rip 0 -pin ethernet_parser_inst s_axis_tdata_IBUF[0] -pin s_axis_tdata_IBUF[0]_inst O
load net s_axis_tdata_IBUF[10] -attr @rip 10 -pin ethernet_parser_inst s_axis_tdata_IBUF[10] -pin s_axis_tdata_IBUF[10]_inst O
load net s_axis_tdata_IBUF[11] -attr @rip 11 -pin ethernet_parser_inst s_axis_tdata_IBUF[11] -pin s_axis_tdata_IBUF[11]_inst O
load net s_axis_tdata_IBUF[12] -attr @rip 12 -pin ethernet_parser_inst s_axis_tdata_IBUF[12] -pin s_axis_tdata_IBUF[12]_inst O
load net s_axis_tdata_IBUF[13] -attr @rip 13 -pin ethernet_parser_inst s_axis_tdata_IBUF[13] -pin s_axis_tdata_IBUF[13]_inst O
load net s_axis_tdata_IBUF[14] -attr @rip 14 -pin ethernet_parser_inst s_axis_tdata_IBUF[14] -pin s_axis_tdata_IBUF[14]_inst O
load net s_axis_tdata_IBUF[15] -attr @rip 15 -pin ethernet_parser_inst s_axis_tdata_IBUF[15] -pin s_axis_tdata_IBUF[15]_inst O
load net s_axis_tdata_IBUF[16] -attr @rip 16 -pin ethernet_parser_inst s_axis_tdata_IBUF[16] -pin s_axis_tdata_IBUF[16]_inst O
load net s_axis_tdata_IBUF[17] -attr @rip 17 -pin ethernet_parser_inst s_axis_tdata_IBUF[17] -pin s_axis_tdata_IBUF[17]_inst O
load net s_axis_tdata_IBUF[18] -attr @rip 18 -pin ethernet_parser_inst s_axis_tdata_IBUF[18] -pin s_axis_tdata_IBUF[18]_inst O
load net s_axis_tdata_IBUF[19] -attr @rip 19 -pin ethernet_parser_inst s_axis_tdata_IBUF[19] -pin s_axis_tdata_IBUF[19]_inst O
load net s_axis_tdata_IBUF[1] -attr @rip 1 -pin ethernet_parser_inst s_axis_tdata_IBUF[1] -pin s_axis_tdata_IBUF[1]_inst O
load net s_axis_tdata_IBUF[20] -attr @rip 20 -pin ethernet_parser_inst s_axis_tdata_IBUF[20] -pin s_axis_tdata_IBUF[20]_inst O
load net s_axis_tdata_IBUF[21] -attr @rip 21 -pin ethernet_parser_inst s_axis_tdata_IBUF[21] -pin s_axis_tdata_IBUF[21]_inst O
load net s_axis_tdata_IBUF[22] -attr @rip 22 -pin ethernet_parser_inst s_axis_tdata_IBUF[22] -pin s_axis_tdata_IBUF[22]_inst O
load net s_axis_tdata_IBUF[23] -attr @rip 23 -pin ethernet_parser_inst s_axis_tdata_IBUF[23] -pin s_axis_tdata_IBUF[23]_inst O
load net s_axis_tdata_IBUF[24] -attr @rip 24 -pin ethernet_parser_inst s_axis_tdata_IBUF[24] -pin s_axis_tdata_IBUF[24]_inst O
load net s_axis_tdata_IBUF[25] -attr @rip 25 -pin ethernet_parser_inst s_axis_tdata_IBUF[25] -pin s_axis_tdata_IBUF[25]_inst O
load net s_axis_tdata_IBUF[26] -attr @rip 26 -pin ethernet_parser_inst s_axis_tdata_IBUF[26] -pin s_axis_tdata_IBUF[26]_inst O
load net s_axis_tdata_IBUF[27] -attr @rip 27 -pin ethernet_parser_inst s_axis_tdata_IBUF[27] -pin s_axis_tdata_IBUF[27]_inst O
load net s_axis_tdata_IBUF[28] -attr @rip 28 -pin ethernet_parser_inst s_axis_tdata_IBUF[28] -pin s_axis_tdata_IBUF[28]_inst O
load net s_axis_tdata_IBUF[29] -attr @rip 29 -pin ethernet_parser_inst s_axis_tdata_IBUF[29] -pin s_axis_tdata_IBUF[29]_inst O
load net s_axis_tdata_IBUF[2] -attr @rip 2 -pin ethernet_parser_inst s_axis_tdata_IBUF[2] -pin s_axis_tdata_IBUF[2]_inst O
load net s_axis_tdata_IBUF[30] -attr @rip 30 -pin ethernet_parser_inst s_axis_tdata_IBUF[30] -pin s_axis_tdata_IBUF[30]_inst O
load net s_axis_tdata_IBUF[31] -attr @rip 31 -pin ethernet_parser_inst s_axis_tdata_IBUF[31] -pin s_axis_tdata_IBUF[31]_inst O
load net s_axis_tdata_IBUF[32] -attr @rip 32 -pin ethernet_parser_inst s_axis_tdata_IBUF[32] -pin s_axis_tdata_IBUF[32]_inst O
load net s_axis_tdata_IBUF[33] -attr @rip 33 -pin ethernet_parser_inst s_axis_tdata_IBUF[33] -pin s_axis_tdata_IBUF[33]_inst O
load net s_axis_tdata_IBUF[34] -attr @rip 34 -pin ethernet_parser_inst s_axis_tdata_IBUF[34] -pin s_axis_tdata_IBUF[34]_inst O
load net s_axis_tdata_IBUF[35] -attr @rip 35 -pin ethernet_parser_inst s_axis_tdata_IBUF[35] -pin s_axis_tdata_IBUF[35]_inst O
load net s_axis_tdata_IBUF[36] -attr @rip 36 -pin ethernet_parser_inst s_axis_tdata_IBUF[36] -pin s_axis_tdata_IBUF[36]_inst O
load net s_axis_tdata_IBUF[37] -attr @rip 37 -pin ethernet_parser_inst s_axis_tdata_IBUF[37] -pin s_axis_tdata_IBUF[37]_inst O
load net s_axis_tdata_IBUF[38] -attr @rip 38 -pin ethernet_parser_inst s_axis_tdata_IBUF[38] -pin s_axis_tdata_IBUF[38]_inst O
load net s_axis_tdata_IBUF[39] -attr @rip 39 -pin ethernet_parser_inst s_axis_tdata_IBUF[39] -pin s_axis_tdata_IBUF[39]_inst O
load net s_axis_tdata_IBUF[3] -attr @rip 3 -pin ethernet_parser_inst s_axis_tdata_IBUF[3] -pin s_axis_tdata_IBUF[3]_inst O
load net s_axis_tdata_IBUF[40] -attr @rip 40 -pin ethernet_parser_inst s_axis_tdata_IBUF[40] -pin s_axis_tdata_IBUF[40]_inst O
load net s_axis_tdata_IBUF[41] -attr @rip 41 -pin ethernet_parser_inst s_axis_tdata_IBUF[41] -pin s_axis_tdata_IBUF[41]_inst O
load net s_axis_tdata_IBUF[42] -attr @rip 42 -pin ethernet_parser_inst s_axis_tdata_IBUF[42] -pin s_axis_tdata_IBUF[42]_inst O
load net s_axis_tdata_IBUF[43] -attr @rip 43 -pin ethernet_parser_inst s_axis_tdata_IBUF[43] -pin s_axis_tdata_IBUF[43]_inst O
load net s_axis_tdata_IBUF[44] -attr @rip 44 -pin ethernet_parser_inst s_axis_tdata_IBUF[44] -pin s_axis_tdata_IBUF[44]_inst O
load net s_axis_tdata_IBUF[45] -attr @rip 45 -pin ethernet_parser_inst s_axis_tdata_IBUF[45] -pin s_axis_tdata_IBUF[45]_inst O
load net s_axis_tdata_IBUF[46] -attr @rip 46 -pin ethernet_parser_inst s_axis_tdata_IBUF[46] -pin s_axis_tdata_IBUF[46]_inst O
load net s_axis_tdata_IBUF[47] -attr @rip 47 -pin ethernet_parser_inst s_axis_tdata_IBUF[47] -pin s_axis_tdata_IBUF[47]_inst O
load net s_axis_tdata_IBUF[48] -attr @rip 48 -pin ethernet_parser_inst s_axis_tdata_IBUF[48] -pin s_axis_tdata_IBUF[48]_inst O
load net s_axis_tdata_IBUF[49] -attr @rip 49 -pin ethernet_parser_inst s_axis_tdata_IBUF[49] -pin s_axis_tdata_IBUF[49]_inst O
load net s_axis_tdata_IBUF[4] -attr @rip 4 -pin ethernet_parser_inst s_axis_tdata_IBUF[4] -pin s_axis_tdata_IBUF[4]_inst O
load net s_axis_tdata_IBUF[50] -attr @rip 50 -pin ethernet_parser_inst s_axis_tdata_IBUF[50] -pin s_axis_tdata_IBUF[50]_inst O
load net s_axis_tdata_IBUF[51] -attr @rip 51 -pin ethernet_parser_inst s_axis_tdata_IBUF[51] -pin s_axis_tdata_IBUF[51]_inst O
load net s_axis_tdata_IBUF[52] -attr @rip 52 -pin ethernet_parser_inst s_axis_tdata_IBUF[52] -pin s_axis_tdata_IBUF[52]_inst O
load net s_axis_tdata_IBUF[53] -attr @rip 53 -pin ethernet_parser_inst s_axis_tdata_IBUF[53] -pin s_axis_tdata_IBUF[53]_inst O
load net s_axis_tdata_IBUF[54] -attr @rip 54 -pin ethernet_parser_inst s_axis_tdata_IBUF[54] -pin s_axis_tdata_IBUF[54]_inst O
load net s_axis_tdata_IBUF[55] -attr @rip 55 -pin ethernet_parser_inst s_axis_tdata_IBUF[55] -pin s_axis_tdata_IBUF[55]_inst O
load net s_axis_tdata_IBUF[56] -attr @rip 56 -pin ethernet_parser_inst s_axis_tdata_IBUF[56] -pin s_axis_tdata_IBUF[56]_inst O
load net s_axis_tdata_IBUF[57] -attr @rip 57 -pin ethernet_parser_inst s_axis_tdata_IBUF[57] -pin s_axis_tdata_IBUF[57]_inst O
load net s_axis_tdata_IBUF[58] -attr @rip 58 -pin ethernet_parser_inst s_axis_tdata_IBUF[58] -pin s_axis_tdata_IBUF[58]_inst O
load net s_axis_tdata_IBUF[59] -attr @rip 59 -pin ethernet_parser_inst s_axis_tdata_IBUF[59] -pin s_axis_tdata_IBUF[59]_inst O
load net s_axis_tdata_IBUF[5] -attr @rip 5 -pin ethernet_parser_inst s_axis_tdata_IBUF[5] -pin s_axis_tdata_IBUF[5]_inst O
load net s_axis_tdata_IBUF[60] -attr @rip 60 -pin ethernet_parser_inst s_axis_tdata_IBUF[60] -pin s_axis_tdata_IBUF[60]_inst O
load net s_axis_tdata_IBUF[61] -attr @rip 61 -pin ethernet_parser_inst s_axis_tdata_IBUF[61] -pin s_axis_tdata_IBUF[61]_inst O
load net s_axis_tdata_IBUF[62] -attr @rip 62 -pin ethernet_parser_inst s_axis_tdata_IBUF[62] -pin s_axis_tdata_IBUF[62]_inst O
load net s_axis_tdata_IBUF[63] -attr @rip 63 -pin ethernet_parser_inst s_axis_tdata_IBUF[63] -pin s_axis_tdata_IBUF[63]_inst O
load net s_axis_tdata_IBUF[6] -attr @rip 6 -pin ethernet_parser_inst s_axis_tdata_IBUF[6] -pin s_axis_tdata_IBUF[6]_inst O
load net s_axis_tdata_IBUF[7] -attr @rip 7 -pin ethernet_parser_inst s_axis_tdata_IBUF[7] -pin s_axis_tdata_IBUF[7]_inst O
load net s_axis_tdata_IBUF[8] -attr @rip 8 -pin ethernet_parser_inst s_axis_tdata_IBUF[8] -pin s_axis_tdata_IBUF[8]_inst O
load net s_axis_tdata_IBUF[9] -attr @rip 9 -pin ethernet_parser_inst s_axis_tdata_IBUF[9] -pin s_axis_tdata_IBUF[9]_inst O
load net s_axis_tkeep[0] -attr @rip s_axis_tkeep[0] -port s_axis_tkeep[0] -pin s_axis_tkeep_IBUF[0]_inst I
load net s_axis_tkeep[1] -attr @rip s_axis_tkeep[1] -port s_axis_tkeep[1] -pin s_axis_tkeep_IBUF[1]_inst I
load net s_axis_tkeep[2] -attr @rip s_axis_tkeep[2] -port s_axis_tkeep[2] -pin s_axis_tkeep_IBUF[2]_inst I
load net s_axis_tkeep[3] -attr @rip s_axis_tkeep[3] -port s_axis_tkeep[3] -pin s_axis_tkeep_IBUF[3]_inst I
load net s_axis_tkeep[4] -attr @rip s_axis_tkeep[4] -port s_axis_tkeep[4] -pin s_axis_tkeep_IBUF[4]_inst I
load net s_axis_tkeep[5] -attr @rip s_axis_tkeep[5] -port s_axis_tkeep[5] -pin s_axis_tkeep_IBUF[5]_inst I
load net s_axis_tkeep[6] -attr @rip s_axis_tkeep[6] -port s_axis_tkeep[6] -pin s_axis_tkeep_IBUF[6]_inst I
load net s_axis_tkeep[7] -attr @rip s_axis_tkeep[7] -port s_axis_tkeep[7] -pin s_axis_tkeep_IBUF[7]_inst I
load net s_axis_tkeep_IBUF[0] -attr @rip 0 -pin ethernet_parser_inst s_axis_tkeep_IBUF[0] -pin s_axis_tkeep_IBUF[0]_inst O
load net s_axis_tkeep_IBUF[1] -attr @rip 1 -pin ethernet_parser_inst s_axis_tkeep_IBUF[1] -pin s_axis_tkeep_IBUF[1]_inst O
load net s_axis_tkeep_IBUF[2] -attr @rip 2 -pin ethernet_parser_inst s_axis_tkeep_IBUF[2] -pin s_axis_tkeep_IBUF[2]_inst O
load net s_axis_tkeep_IBUF[3] -attr @rip 3 -pin ethernet_parser_inst s_axis_tkeep_IBUF[3] -pin s_axis_tkeep_IBUF[3]_inst O
load net s_axis_tkeep_IBUF[4] -attr @rip 4 -pin ethernet_parser_inst s_axis_tkeep_IBUF[4] -pin s_axis_tkeep_IBUF[4]_inst O
load net s_axis_tkeep_IBUF[5] -attr @rip 5 -pin ethernet_parser_inst s_axis_tkeep_IBUF[5] -pin s_axis_tkeep_IBUF[5]_inst O
load net s_axis_tkeep_IBUF[6] -attr @rip 6 -pin ethernet_parser_inst s_axis_tkeep_IBUF[6] -pin s_axis_tkeep_IBUF[6]_inst O
load net s_axis_tkeep_IBUF[7] -attr @rip 7 -pin ethernet_parser_inst s_axis_tkeep_IBUF[7] -pin s_axis_tkeep_IBUF[7]_inst O
load net s_axis_tlast -port s_axis_tlast -pin s_axis_tlast_IBUF_inst I
netloc s_axis_tlast 1 0 2 NJ 12010 NJ
load net s_axis_tlast_IBUF -pin ethernet_parser_inst s_axis_tlast_IBUF -pin s_axis_tlast_IBUF_inst O
netloc s_axis_tlast_IBUF 1 2 1 420J 12010n
load net s_axis_tready -port s_axis_tready -pin s_axis_tready_OBUF_inst O
netloc s_axis_tready 1 6 1 NJ 12850
load net s_axis_tready_OBUF -pin ethernet_parser_inst s_axis_tready_OBUF -pin s_axis_tready_OBUF_inst I
netloc s_axis_tready_OBUF 1 3 3 1050J 12850 NJ 12850 NJ
load net s_axis_tvalid -port s_axis_tvalid -pin s_axis_tvalid_IBUF_inst I
netloc s_axis_tvalid 1 0 2 NJ 12080 NJ
load net s_axis_tvalid_IBUF -pin ethernet_parser_inst s_axis_tvalid_IBUF -pin s_axis_tvalid_IBUF_inst O
netloc s_axis_tvalid_IBUF 1 2 1 NJ 12080
load net seq_num[0] -attr @rip 0 -port seq_num[0] -pin seq_num_OBUF[0]_inst O
load net seq_num[10] -attr @rip 10 -port seq_num[10] -pin seq_num_OBUF[10]_inst O
load net seq_num[11] -attr @rip 11 -port seq_num[11] -pin seq_num_OBUF[11]_inst O
load net seq_num[12] -attr @rip 12 -port seq_num[12] -pin seq_num_OBUF[12]_inst O
load net seq_num[13] -attr @rip 13 -port seq_num[13] -pin seq_num_OBUF[13]_inst O
load net seq_num[14] -attr @rip 14 -port seq_num[14] -pin seq_num_OBUF[14]_inst O
load net seq_num[15] -attr @rip 15 -port seq_num[15] -pin seq_num_OBUF[15]_inst O
load net seq_num[16] -attr @rip 16 -port seq_num[16] -pin seq_num_OBUF[16]_inst O
load net seq_num[17] -attr @rip 17 -port seq_num[17] -pin seq_num_OBUF[17]_inst O
load net seq_num[18] -attr @rip 18 -port seq_num[18] -pin seq_num_OBUF[18]_inst O
load net seq_num[19] -attr @rip 19 -port seq_num[19] -pin seq_num_OBUF[19]_inst O
load net seq_num[1] -attr @rip 1 -port seq_num[1] -pin seq_num_OBUF[1]_inst O
load net seq_num[20] -attr @rip 20 -port seq_num[20] -pin seq_num_OBUF[20]_inst O
load net seq_num[21] -attr @rip 21 -port seq_num[21] -pin seq_num_OBUF[21]_inst O
load net seq_num[22] -attr @rip 22 -port seq_num[22] -pin seq_num_OBUF[22]_inst O
load net seq_num[23] -attr @rip 23 -port seq_num[23] -pin seq_num_OBUF[23]_inst O
load net seq_num[24] -attr @rip 24 -port seq_num[24] -pin seq_num_OBUF[24]_inst O
load net seq_num[25] -attr @rip 25 -port seq_num[25] -pin seq_num_OBUF[25]_inst O
load net seq_num[26] -attr @rip 26 -port seq_num[26] -pin seq_num_OBUF[26]_inst O
load net seq_num[27] -attr @rip 27 -port seq_num[27] -pin seq_num_OBUF[27]_inst O
load net seq_num[28] -attr @rip 28 -port seq_num[28] -pin seq_num_OBUF[28]_inst O
load net seq_num[29] -attr @rip 29 -port seq_num[29] -pin seq_num_OBUF[29]_inst O
load net seq_num[2] -attr @rip 2 -port seq_num[2] -pin seq_num_OBUF[2]_inst O
load net seq_num[30] -attr @rip 30 -port seq_num[30] -pin seq_num_OBUF[30]_inst O
load net seq_num[31] -attr @rip 31 -port seq_num[31] -pin seq_num_OBUF[31]_inst O
load net seq_num[3] -attr @rip 3 -port seq_num[3] -pin seq_num_OBUF[3]_inst O
load net seq_num[4] -attr @rip 4 -port seq_num[4] -pin seq_num_OBUF[4]_inst O
load net seq_num[5] -attr @rip 5 -port seq_num[5] -pin seq_num_OBUF[5]_inst O
load net seq_num[6] -attr @rip 6 -port seq_num[6] -pin seq_num_OBUF[6]_inst O
load net seq_num[7] -attr @rip 7 -port seq_num[7] -pin seq_num_OBUF[7]_inst O
load net seq_num[8] -attr @rip 8 -port seq_num[8] -pin seq_num_OBUF[8]_inst O
load net seq_num[9] -attr @rip 9 -port seq_num[9] -pin seq_num_OBUF[9]_inst O
load net seq_num_OBUF[0] -attr @rip seq_num_reg[31]_0[0] -pin seq_num_OBUF[0]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[0]
load net seq_num_OBUF[10] -attr @rip seq_num_reg[31]_0[10] -pin seq_num_OBUF[10]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[10]
load net seq_num_OBUF[11] -attr @rip seq_num_reg[31]_0[11] -pin seq_num_OBUF[11]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[11]
load net seq_num_OBUF[12] -attr @rip seq_num_reg[31]_0[12] -pin seq_num_OBUF[12]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[12]
load net seq_num_OBUF[13] -attr @rip seq_num_reg[31]_0[13] -pin seq_num_OBUF[13]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[13]
load net seq_num_OBUF[14] -attr @rip seq_num_reg[31]_0[14] -pin seq_num_OBUF[14]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[14]
load net seq_num_OBUF[15] -attr @rip seq_num_reg[31]_0[15] -pin seq_num_OBUF[15]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[15]
load net seq_num_OBUF[16] -attr @rip seq_num_reg[31]_0[16] -pin seq_num_OBUF[16]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[16]
load net seq_num_OBUF[17] -attr @rip seq_num_reg[31]_0[17] -pin seq_num_OBUF[17]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[17]
load net seq_num_OBUF[18] -attr @rip seq_num_reg[31]_0[18] -pin seq_num_OBUF[18]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[18]
load net seq_num_OBUF[19] -attr @rip seq_num_reg[31]_0[19] -pin seq_num_OBUF[19]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[19]
load net seq_num_OBUF[1] -attr @rip seq_num_reg[31]_0[1] -pin seq_num_OBUF[1]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[1]
load net seq_num_OBUF[20] -attr @rip seq_num_reg[31]_0[20] -pin seq_num_OBUF[20]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[20]
load net seq_num_OBUF[21] -attr @rip seq_num_reg[31]_0[21] -pin seq_num_OBUF[21]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[21]
load net seq_num_OBUF[22] -attr @rip seq_num_reg[31]_0[22] -pin seq_num_OBUF[22]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[22]
load net seq_num_OBUF[23] -attr @rip seq_num_reg[31]_0[23] -pin seq_num_OBUF[23]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[23]
load net seq_num_OBUF[24] -attr @rip seq_num_reg[31]_0[24] -pin seq_num_OBUF[24]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[24]
load net seq_num_OBUF[25] -attr @rip seq_num_reg[31]_0[25] -pin seq_num_OBUF[25]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[25]
load net seq_num_OBUF[26] -attr @rip seq_num_reg[31]_0[26] -pin seq_num_OBUF[26]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[26]
load net seq_num_OBUF[27] -attr @rip seq_num_reg[31]_0[27] -pin seq_num_OBUF[27]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[27]
load net seq_num_OBUF[28] -attr @rip seq_num_reg[31]_0[28] -pin seq_num_OBUF[28]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[28]
load net seq_num_OBUF[29] -attr @rip seq_num_reg[31]_0[29] -pin seq_num_OBUF[29]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[29]
load net seq_num_OBUF[2] -attr @rip seq_num_reg[31]_0[2] -pin seq_num_OBUF[2]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[2]
load net seq_num_OBUF[30] -attr @rip seq_num_reg[31]_0[30] -pin seq_num_OBUF[30]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[30]
load net seq_num_OBUF[31] -attr @rip seq_num_reg[31]_0[31] -pin seq_num_OBUF[31]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[31]
load net seq_num_OBUF[3] -attr @rip seq_num_reg[31]_0[3] -pin seq_num_OBUF[3]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[3]
load net seq_num_OBUF[4] -attr @rip seq_num_reg[31]_0[4] -pin seq_num_OBUF[4]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[4]
load net seq_num_OBUF[5] -attr @rip seq_num_reg[31]_0[5] -pin seq_num_OBUF[5]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[5]
load net seq_num_OBUF[6] -attr @rip seq_num_reg[31]_0[6] -pin seq_num_OBUF[6]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[6]
load net seq_num_OBUF[7] -attr @rip seq_num_reg[31]_0[7] -pin seq_num_OBUF[7]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[7]
load net seq_num_OBUF[8] -attr @rip seq_num_reg[31]_0[8] -pin seq_num_OBUF[8]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[8]
load net seq_num_OBUF[9] -attr @rip seq_num_reg[31]_0[9] -pin seq_num_OBUF[9]_inst I -pin tcp_parser_inst seq_num_reg[31]_0[9]
load net src_ip[0] -attr @rip 0 -port src_ip[0] -pin src_ip_OBUF[0]_inst O
load net src_ip[10] -attr @rip 10 -port src_ip[10] -pin src_ip_OBUF[10]_inst O
load net src_ip[11] -attr @rip 11 -port src_ip[11] -pin src_ip_OBUF[11]_inst O
load net src_ip[12] -attr @rip 12 -port src_ip[12] -pin src_ip_OBUF[12]_inst O
load net src_ip[13] -attr @rip 13 -port src_ip[13] -pin src_ip_OBUF[13]_inst O
load net src_ip[14] -attr @rip 14 -port src_ip[14] -pin src_ip_OBUF[14]_inst O
load net src_ip[15] -attr @rip 15 -port src_ip[15] -pin src_ip_OBUF[15]_inst O
load net src_ip[16] -attr @rip 16 -port src_ip[16] -pin src_ip_OBUF[16]_inst O
load net src_ip[17] -attr @rip 17 -port src_ip[17] -pin src_ip_OBUF[17]_inst O
load net src_ip[18] -attr @rip 18 -port src_ip[18] -pin src_ip_OBUF[18]_inst O
load net src_ip[19] -attr @rip 19 -port src_ip[19] -pin src_ip_OBUF[19]_inst O
load net src_ip[1] -attr @rip 1 -port src_ip[1] -pin src_ip_OBUF[1]_inst O
load net src_ip[20] -attr @rip 20 -port src_ip[20] -pin src_ip_OBUF[20]_inst O
load net src_ip[21] -attr @rip 21 -port src_ip[21] -pin src_ip_OBUF[21]_inst O
load net src_ip[22] -attr @rip 22 -port src_ip[22] -pin src_ip_OBUF[22]_inst O
load net src_ip[23] -attr @rip 23 -port src_ip[23] -pin src_ip_OBUF[23]_inst O
load net src_ip[24] -attr @rip 24 -port src_ip[24] -pin src_ip_OBUF[24]_inst O
load net src_ip[25] -attr @rip 25 -port src_ip[25] -pin src_ip_OBUF[25]_inst O
load net src_ip[26] -attr @rip 26 -port src_ip[26] -pin src_ip_OBUF[26]_inst O
load net src_ip[27] -attr @rip 27 -port src_ip[27] -pin src_ip_OBUF[27]_inst O
load net src_ip[28] -attr @rip 28 -port src_ip[28] -pin src_ip_OBUF[28]_inst O
load net src_ip[29] -attr @rip 29 -port src_ip[29] -pin src_ip_OBUF[29]_inst O
load net src_ip[2] -attr @rip 2 -port src_ip[2] -pin src_ip_OBUF[2]_inst O
load net src_ip[30] -attr @rip 30 -port src_ip[30] -pin src_ip_OBUF[30]_inst O
load net src_ip[31] -attr @rip 31 -port src_ip[31] -pin src_ip_OBUF[31]_inst O
load net src_ip[3] -attr @rip 3 -port src_ip[3] -pin src_ip_OBUF[3]_inst O
load net src_ip[4] -attr @rip 4 -port src_ip[4] -pin src_ip_OBUF[4]_inst O
load net src_ip[5] -attr @rip 5 -port src_ip[5] -pin src_ip_OBUF[5]_inst O
load net src_ip[6] -attr @rip 6 -port src_ip[6] -pin src_ip_OBUF[6]_inst O
load net src_ip[7] -attr @rip 7 -port src_ip[7] -pin src_ip_OBUF[7]_inst O
load net src_ip[8] -attr @rip 8 -port src_ip[8] -pin src_ip_OBUF[8]_inst O
load net src_ip[9] -attr @rip 9 -port src_ip[9] -pin src_ip_OBUF[9]_inst O
load net src_ip_OBUF[0] -attr @rip src_ip_reg[31]_0[0] -pin ipv4_parser_inst src_ip_reg[31]_0[0] -pin src_ip_OBUF[0]_inst I
load net src_ip_OBUF[10] -attr @rip src_ip_reg[31]_0[10] -pin ipv4_parser_inst src_ip_reg[31]_0[10] -pin src_ip_OBUF[10]_inst I
load net src_ip_OBUF[11] -attr @rip src_ip_reg[31]_0[11] -pin ipv4_parser_inst src_ip_reg[31]_0[11] -pin src_ip_OBUF[11]_inst I
load net src_ip_OBUF[12] -attr @rip src_ip_reg[31]_0[12] -pin ipv4_parser_inst src_ip_reg[31]_0[12] -pin src_ip_OBUF[12]_inst I
load net src_ip_OBUF[13] -attr @rip src_ip_reg[31]_0[13] -pin ipv4_parser_inst src_ip_reg[31]_0[13] -pin src_ip_OBUF[13]_inst I
load net src_ip_OBUF[14] -attr @rip src_ip_reg[31]_0[14] -pin ipv4_parser_inst src_ip_reg[31]_0[14] -pin src_ip_OBUF[14]_inst I
load net src_ip_OBUF[15] -attr @rip src_ip_reg[31]_0[15] -pin ipv4_parser_inst src_ip_reg[31]_0[15] -pin src_ip_OBUF[15]_inst I
load net src_ip_OBUF[16] -attr @rip src_ip_reg[31]_0[16] -pin ipv4_parser_inst src_ip_reg[31]_0[16] -pin src_ip_OBUF[16]_inst I
load net src_ip_OBUF[17] -attr @rip src_ip_reg[31]_0[17] -pin ipv4_parser_inst src_ip_reg[31]_0[17] -pin src_ip_OBUF[17]_inst I
load net src_ip_OBUF[18] -attr @rip src_ip_reg[31]_0[18] -pin ipv4_parser_inst src_ip_reg[31]_0[18] -pin src_ip_OBUF[18]_inst I
load net src_ip_OBUF[19] -attr @rip src_ip_reg[31]_0[19] -pin ipv4_parser_inst src_ip_reg[31]_0[19] -pin src_ip_OBUF[19]_inst I
load net src_ip_OBUF[1] -attr @rip src_ip_reg[31]_0[1] -pin ipv4_parser_inst src_ip_reg[31]_0[1] -pin src_ip_OBUF[1]_inst I
load net src_ip_OBUF[20] -attr @rip src_ip_reg[31]_0[20] -pin ipv4_parser_inst src_ip_reg[31]_0[20] -pin src_ip_OBUF[20]_inst I
load net src_ip_OBUF[21] -attr @rip src_ip_reg[31]_0[21] -pin ipv4_parser_inst src_ip_reg[31]_0[21] -pin src_ip_OBUF[21]_inst I
load net src_ip_OBUF[22] -attr @rip src_ip_reg[31]_0[22] -pin ipv4_parser_inst src_ip_reg[31]_0[22] -pin src_ip_OBUF[22]_inst I
load net src_ip_OBUF[23] -attr @rip src_ip_reg[31]_0[23] -pin ipv4_parser_inst src_ip_reg[31]_0[23] -pin src_ip_OBUF[23]_inst I
load net src_ip_OBUF[24] -attr @rip src_ip_reg[31]_0[24] -pin ipv4_parser_inst src_ip_reg[31]_0[24] -pin src_ip_OBUF[24]_inst I
load net src_ip_OBUF[25] -attr @rip src_ip_reg[31]_0[25] -pin ipv4_parser_inst src_ip_reg[31]_0[25] -pin src_ip_OBUF[25]_inst I
load net src_ip_OBUF[26] -attr @rip src_ip_reg[31]_0[26] -pin ipv4_parser_inst src_ip_reg[31]_0[26] -pin src_ip_OBUF[26]_inst I
load net src_ip_OBUF[27] -attr @rip src_ip_reg[31]_0[27] -pin ipv4_parser_inst src_ip_reg[31]_0[27] -pin src_ip_OBUF[27]_inst I
load net src_ip_OBUF[28] -attr @rip src_ip_reg[31]_0[28] -pin ipv4_parser_inst src_ip_reg[31]_0[28] -pin src_ip_OBUF[28]_inst I
load net src_ip_OBUF[29] -attr @rip src_ip_reg[31]_0[29] -pin ipv4_parser_inst src_ip_reg[31]_0[29] -pin src_ip_OBUF[29]_inst I
load net src_ip_OBUF[2] -attr @rip src_ip_reg[31]_0[2] -pin ipv4_parser_inst src_ip_reg[31]_0[2] -pin src_ip_OBUF[2]_inst I
load net src_ip_OBUF[30] -attr @rip src_ip_reg[31]_0[30] -pin ipv4_parser_inst src_ip_reg[31]_0[30] -pin src_ip_OBUF[30]_inst I
load net src_ip_OBUF[31] -attr @rip src_ip_reg[31]_0[31] -pin ipv4_parser_inst src_ip_reg[31]_0[31] -pin src_ip_OBUF[31]_inst I
load net src_ip_OBUF[3] -attr @rip src_ip_reg[31]_0[3] -pin ipv4_parser_inst src_ip_reg[31]_0[3] -pin src_ip_OBUF[3]_inst I
load net src_ip_OBUF[4] -attr @rip src_ip_reg[31]_0[4] -pin ipv4_parser_inst src_ip_reg[31]_0[4] -pin src_ip_OBUF[4]_inst I
load net src_ip_OBUF[5] -attr @rip src_ip_reg[31]_0[5] -pin ipv4_parser_inst src_ip_reg[31]_0[5] -pin src_ip_OBUF[5]_inst I
load net src_ip_OBUF[6] -attr @rip src_ip_reg[31]_0[6] -pin ipv4_parser_inst src_ip_reg[31]_0[6] -pin src_ip_OBUF[6]_inst I
load net src_ip_OBUF[7] -attr @rip src_ip_reg[31]_0[7] -pin ipv4_parser_inst src_ip_reg[31]_0[7] -pin src_ip_OBUF[7]_inst I
load net src_ip_OBUF[8] -attr @rip src_ip_reg[31]_0[8] -pin ipv4_parser_inst src_ip_reg[31]_0[8] -pin src_ip_OBUF[8]_inst I
load net src_ip_OBUF[9] -attr @rip src_ip_reg[31]_0[9] -pin ipv4_parser_inst src_ip_reg[31]_0[9] -pin src_ip_OBUF[9]_inst I
load net src_mac[0] -attr @rip 0 -port src_mac[0] -pin src_mac_OBUF[0]_inst O
load net src_mac[10] -attr @rip 10 -port src_mac[10] -pin src_mac_OBUF[10]_inst O
load net src_mac[11] -attr @rip 11 -port src_mac[11] -pin src_mac_OBUF[11]_inst O
load net src_mac[12] -attr @rip 12 -port src_mac[12] -pin src_mac_OBUF[12]_inst O
load net src_mac[13] -attr @rip 13 -port src_mac[13] -pin src_mac_OBUF[13]_inst O
load net src_mac[14] -attr @rip 14 -port src_mac[14] -pin src_mac_OBUF[14]_inst O
load net src_mac[15] -attr @rip 15 -port src_mac[15] -pin src_mac_OBUF[15]_inst O
load net src_mac[16] -attr @rip 16 -port src_mac[16] -pin src_mac_OBUF[16]_inst O
load net src_mac[17] -attr @rip 17 -port src_mac[17] -pin src_mac_OBUF[17]_inst O
load net src_mac[18] -attr @rip 18 -port src_mac[18] -pin src_mac_OBUF[18]_inst O
load net src_mac[19] -attr @rip 19 -port src_mac[19] -pin src_mac_OBUF[19]_inst O
load net src_mac[1] -attr @rip 1 -port src_mac[1] -pin src_mac_OBUF[1]_inst O
load net src_mac[20] -attr @rip 20 -port src_mac[20] -pin src_mac_OBUF[20]_inst O
load net src_mac[21] -attr @rip 21 -port src_mac[21] -pin src_mac_OBUF[21]_inst O
load net src_mac[22] -attr @rip 22 -port src_mac[22] -pin src_mac_OBUF[22]_inst O
load net src_mac[23] -attr @rip 23 -port src_mac[23] -pin src_mac_OBUF[23]_inst O
load net src_mac[24] -attr @rip 24 -port src_mac[24] -pin src_mac_OBUF[24]_inst O
load net src_mac[25] -attr @rip 25 -port src_mac[25] -pin src_mac_OBUF[25]_inst O
load net src_mac[26] -attr @rip 26 -port src_mac[26] -pin src_mac_OBUF[26]_inst O
load net src_mac[27] -attr @rip 27 -port src_mac[27] -pin src_mac_OBUF[27]_inst O
load net src_mac[28] -attr @rip 28 -port src_mac[28] -pin src_mac_OBUF[28]_inst O
load net src_mac[29] -attr @rip 29 -port src_mac[29] -pin src_mac_OBUF[29]_inst O
load net src_mac[2] -attr @rip 2 -port src_mac[2] -pin src_mac_OBUF[2]_inst O
load net src_mac[30] -attr @rip 30 -port src_mac[30] -pin src_mac_OBUF[30]_inst O
load net src_mac[31] -attr @rip 31 -port src_mac[31] -pin src_mac_OBUF[31]_inst O
load net src_mac[32] -attr @rip 32 -port src_mac[32] -pin src_mac_OBUF[32]_inst O
load net src_mac[33] -attr @rip 33 -port src_mac[33] -pin src_mac_OBUF[33]_inst O
load net src_mac[34] -attr @rip 34 -port src_mac[34] -pin src_mac_OBUF[34]_inst O
load net src_mac[35] -attr @rip 35 -port src_mac[35] -pin src_mac_OBUF[35]_inst O
load net src_mac[36] -attr @rip 36 -port src_mac[36] -pin src_mac_OBUF[36]_inst O
load net src_mac[37] -attr @rip 37 -port src_mac[37] -pin src_mac_OBUF[37]_inst O
load net src_mac[38] -attr @rip 38 -port src_mac[38] -pin src_mac_OBUF[38]_inst O
load net src_mac[39] -attr @rip 39 -port src_mac[39] -pin src_mac_OBUF[39]_inst O
load net src_mac[3] -attr @rip 3 -port src_mac[3] -pin src_mac_OBUF[3]_inst O
load net src_mac[40] -attr @rip 40 -port src_mac[40] -pin src_mac_OBUF[40]_inst O
load net src_mac[41] -attr @rip 41 -port src_mac[41] -pin src_mac_OBUF[41]_inst O
load net src_mac[42] -attr @rip 42 -port src_mac[42] -pin src_mac_OBUF[42]_inst O
load net src_mac[43] -attr @rip 43 -port src_mac[43] -pin src_mac_OBUF[43]_inst O
load net src_mac[44] -attr @rip 44 -port src_mac[44] -pin src_mac_OBUF[44]_inst O
load net src_mac[45] -attr @rip 45 -port src_mac[45] -pin src_mac_OBUF[45]_inst O
load net src_mac[46] -attr @rip 46 -port src_mac[46] -pin src_mac_OBUF[46]_inst O
load net src_mac[47] -attr @rip 47 -port src_mac[47] -pin src_mac_OBUF[47]_inst O
load net src_mac[4] -attr @rip 4 -port src_mac[4] -pin src_mac_OBUF[4]_inst O
load net src_mac[5] -attr @rip 5 -port src_mac[5] -pin src_mac_OBUF[5]_inst O
load net src_mac[6] -attr @rip 6 -port src_mac[6] -pin src_mac_OBUF[6]_inst O
load net src_mac[7] -attr @rip 7 -port src_mac[7] -pin src_mac_OBUF[7]_inst O
load net src_mac[8] -attr @rip 8 -port src_mac[8] -pin src_mac_OBUF[8]_inst O
load net src_mac[9] -attr @rip 9 -port src_mac[9] -pin src_mac_OBUF[9]_inst O
load net src_mac_OBUF[0] -attr @rip src_mac_reg[47]_0[0] -pin ethernet_parser_inst src_mac_reg[47]_0[0] -pin src_mac_OBUF[0]_inst I
load net src_mac_OBUF[10] -attr @rip src_mac_reg[47]_0[10] -pin ethernet_parser_inst src_mac_reg[47]_0[10] -pin src_mac_OBUF[10]_inst I
load net src_mac_OBUF[11] -attr @rip src_mac_reg[47]_0[11] -pin ethernet_parser_inst src_mac_reg[47]_0[11] -pin src_mac_OBUF[11]_inst I
load net src_mac_OBUF[12] -attr @rip src_mac_reg[47]_0[12] -pin ethernet_parser_inst src_mac_reg[47]_0[12] -pin src_mac_OBUF[12]_inst I
load net src_mac_OBUF[13] -attr @rip src_mac_reg[47]_0[13] -pin ethernet_parser_inst src_mac_reg[47]_0[13] -pin src_mac_OBUF[13]_inst I
load net src_mac_OBUF[14] -attr @rip src_mac_reg[47]_0[14] -pin ethernet_parser_inst src_mac_reg[47]_0[14] -pin src_mac_OBUF[14]_inst I
load net src_mac_OBUF[15] -attr @rip src_mac_reg[47]_0[15] -pin ethernet_parser_inst src_mac_reg[47]_0[15] -pin src_mac_OBUF[15]_inst I
load net src_mac_OBUF[16] -attr @rip src_mac_reg[47]_0[16] -pin ethernet_parser_inst src_mac_reg[47]_0[16] -pin src_mac_OBUF[16]_inst I
load net src_mac_OBUF[17] -attr @rip src_mac_reg[47]_0[17] -pin ethernet_parser_inst src_mac_reg[47]_0[17] -pin src_mac_OBUF[17]_inst I
load net src_mac_OBUF[18] -attr @rip src_mac_reg[47]_0[18] -pin ethernet_parser_inst src_mac_reg[47]_0[18] -pin src_mac_OBUF[18]_inst I
load net src_mac_OBUF[19] -attr @rip src_mac_reg[47]_0[19] -pin ethernet_parser_inst src_mac_reg[47]_0[19] -pin src_mac_OBUF[19]_inst I
load net src_mac_OBUF[1] -attr @rip src_mac_reg[47]_0[1] -pin ethernet_parser_inst src_mac_reg[47]_0[1] -pin src_mac_OBUF[1]_inst I
load net src_mac_OBUF[20] -attr @rip src_mac_reg[47]_0[20] -pin ethernet_parser_inst src_mac_reg[47]_0[20] -pin src_mac_OBUF[20]_inst I
load net src_mac_OBUF[21] -attr @rip src_mac_reg[47]_0[21] -pin ethernet_parser_inst src_mac_reg[47]_0[21] -pin src_mac_OBUF[21]_inst I
load net src_mac_OBUF[22] -attr @rip src_mac_reg[47]_0[22] -pin ethernet_parser_inst src_mac_reg[47]_0[22] -pin src_mac_OBUF[22]_inst I
load net src_mac_OBUF[23] -attr @rip src_mac_reg[47]_0[23] -pin ethernet_parser_inst src_mac_reg[47]_0[23] -pin src_mac_OBUF[23]_inst I
load net src_mac_OBUF[24] -attr @rip src_mac_reg[47]_0[24] -pin ethernet_parser_inst src_mac_reg[47]_0[24] -pin src_mac_OBUF[24]_inst I
load net src_mac_OBUF[25] -attr @rip src_mac_reg[47]_0[25] -pin ethernet_parser_inst src_mac_reg[47]_0[25] -pin src_mac_OBUF[25]_inst I
load net src_mac_OBUF[26] -attr @rip src_mac_reg[47]_0[26] -pin ethernet_parser_inst src_mac_reg[47]_0[26] -pin src_mac_OBUF[26]_inst I
load net src_mac_OBUF[27] -attr @rip src_mac_reg[47]_0[27] -pin ethernet_parser_inst src_mac_reg[47]_0[27] -pin src_mac_OBUF[27]_inst I
load net src_mac_OBUF[28] -attr @rip src_mac_reg[47]_0[28] -pin ethernet_parser_inst src_mac_reg[47]_0[28] -pin src_mac_OBUF[28]_inst I
load net src_mac_OBUF[29] -attr @rip src_mac_reg[47]_0[29] -pin ethernet_parser_inst src_mac_reg[47]_0[29] -pin src_mac_OBUF[29]_inst I
load net src_mac_OBUF[2] -attr @rip src_mac_reg[47]_0[2] -pin ethernet_parser_inst src_mac_reg[47]_0[2] -pin src_mac_OBUF[2]_inst I
load net src_mac_OBUF[30] -attr @rip src_mac_reg[47]_0[30] -pin ethernet_parser_inst src_mac_reg[47]_0[30] -pin src_mac_OBUF[30]_inst I
load net src_mac_OBUF[31] -attr @rip src_mac_reg[47]_0[31] -pin ethernet_parser_inst src_mac_reg[47]_0[31] -pin src_mac_OBUF[31]_inst I
load net src_mac_OBUF[32] -attr @rip src_mac_reg[47]_0[32] -pin ethernet_parser_inst src_mac_reg[47]_0[32] -pin src_mac_OBUF[32]_inst I
load net src_mac_OBUF[33] -attr @rip src_mac_reg[47]_0[33] -pin ethernet_parser_inst src_mac_reg[47]_0[33] -pin src_mac_OBUF[33]_inst I
load net src_mac_OBUF[34] -attr @rip src_mac_reg[47]_0[34] -pin ethernet_parser_inst src_mac_reg[47]_0[34] -pin src_mac_OBUF[34]_inst I
load net src_mac_OBUF[35] -attr @rip src_mac_reg[47]_0[35] -pin ethernet_parser_inst src_mac_reg[47]_0[35] -pin src_mac_OBUF[35]_inst I
load net src_mac_OBUF[36] -attr @rip src_mac_reg[47]_0[36] -pin ethernet_parser_inst src_mac_reg[47]_0[36] -pin src_mac_OBUF[36]_inst I
load net src_mac_OBUF[37] -attr @rip src_mac_reg[47]_0[37] -pin ethernet_parser_inst src_mac_reg[47]_0[37] -pin src_mac_OBUF[37]_inst I
load net src_mac_OBUF[38] -attr @rip src_mac_reg[47]_0[38] -pin ethernet_parser_inst src_mac_reg[47]_0[38] -pin src_mac_OBUF[38]_inst I
load net src_mac_OBUF[39] -attr @rip src_mac_reg[47]_0[39] -pin ethernet_parser_inst src_mac_reg[47]_0[39] -pin src_mac_OBUF[39]_inst I
load net src_mac_OBUF[3] -attr @rip src_mac_reg[47]_0[3] -pin ethernet_parser_inst src_mac_reg[47]_0[3] -pin src_mac_OBUF[3]_inst I
load net src_mac_OBUF[40] -attr @rip src_mac_reg[47]_0[40] -pin ethernet_parser_inst src_mac_reg[47]_0[40] -pin src_mac_OBUF[40]_inst I
load net src_mac_OBUF[41] -attr @rip src_mac_reg[47]_0[41] -pin ethernet_parser_inst src_mac_reg[47]_0[41] -pin src_mac_OBUF[41]_inst I
load net src_mac_OBUF[42] -attr @rip src_mac_reg[47]_0[42] -pin ethernet_parser_inst src_mac_reg[47]_0[42] -pin src_mac_OBUF[42]_inst I
load net src_mac_OBUF[43] -attr @rip src_mac_reg[47]_0[43] -pin ethernet_parser_inst src_mac_reg[47]_0[43] -pin src_mac_OBUF[43]_inst I
load net src_mac_OBUF[44] -attr @rip src_mac_reg[47]_0[44] -pin ethernet_parser_inst src_mac_reg[47]_0[44] -pin src_mac_OBUF[44]_inst I
load net src_mac_OBUF[45] -attr @rip src_mac_reg[47]_0[45] -pin ethernet_parser_inst src_mac_reg[47]_0[45] -pin src_mac_OBUF[45]_inst I
load net src_mac_OBUF[46] -attr @rip src_mac_reg[47]_0[46] -pin ethernet_parser_inst src_mac_reg[47]_0[46] -pin src_mac_OBUF[46]_inst I
load net src_mac_OBUF[47] -attr @rip src_mac_reg[47]_0[47] -pin ethernet_parser_inst src_mac_reg[47]_0[47] -pin src_mac_OBUF[47]_inst I
load net src_mac_OBUF[4] -attr @rip src_mac_reg[47]_0[4] -pin ethernet_parser_inst src_mac_reg[47]_0[4] -pin src_mac_OBUF[4]_inst I
load net src_mac_OBUF[5] -attr @rip src_mac_reg[47]_0[5] -pin ethernet_parser_inst src_mac_reg[47]_0[5] -pin src_mac_OBUF[5]_inst I
load net src_mac_OBUF[6] -attr @rip src_mac_reg[47]_0[6] -pin ethernet_parser_inst src_mac_reg[47]_0[6] -pin src_mac_OBUF[6]_inst I
load net src_mac_OBUF[7] -attr @rip src_mac_reg[47]_0[7] -pin ethernet_parser_inst src_mac_reg[47]_0[7] -pin src_mac_OBUF[7]_inst I
load net src_mac_OBUF[8] -attr @rip src_mac_reg[47]_0[8] -pin ethernet_parser_inst src_mac_reg[47]_0[8] -pin src_mac_OBUF[8]_inst I
load net src_mac_OBUF[9] -attr @rip src_mac_reg[47]_0[9] -pin ethernet_parser_inst src_mac_reg[47]_0[9] -pin src_mac_OBUF[9]_inst I
load net src_port[0] -attr @rip 0 -port src_port[0] -pin src_port_OBUF[0]_inst O
load net src_port[10] -attr @rip 10 -port src_port[10] -pin src_port_OBUF[10]_inst O
load net src_port[11] -attr @rip 11 -port src_port[11] -pin src_port_OBUF[11]_inst O
load net src_port[12] -attr @rip 12 -port src_port[12] -pin src_port_OBUF[12]_inst O
load net src_port[13] -attr @rip 13 -port src_port[13] -pin src_port_OBUF[13]_inst O
load net src_port[14] -attr @rip 14 -port src_port[14] -pin src_port_OBUF[14]_inst O
load net src_port[15] -attr @rip 15 -port src_port[15] -pin src_port_OBUF[15]_inst O
load net src_port[1] -attr @rip 1 -port src_port[1] -pin src_port_OBUF[1]_inst O
load net src_port[2] -attr @rip 2 -port src_port[2] -pin src_port_OBUF[2]_inst O
load net src_port[3] -attr @rip 3 -port src_port[3] -pin src_port_OBUF[3]_inst O
load net src_port[4] -attr @rip 4 -port src_port[4] -pin src_port_OBUF[4]_inst O
load net src_port[5] -attr @rip 5 -port src_port[5] -pin src_port_OBUF[5]_inst O
load net src_port[6] -attr @rip 6 -port src_port[6] -pin src_port_OBUF[6]_inst O
load net src_port[7] -attr @rip 7 -port src_port[7] -pin src_port_OBUF[7]_inst O
load net src_port[8] -attr @rip 8 -port src_port[8] -pin src_port_OBUF[8]_inst O
load net src_port[9] -attr @rip 9 -port src_port[9] -pin src_port_OBUF[9]_inst O
load net src_port_OBUF[0] -attr @rip src_port_reg[15]_0[0] -pin src_port_OBUF[0]_inst I -pin tcp_parser_inst src_port_reg[15]_0[0]
load net src_port_OBUF[10] -attr @rip src_port_reg[15]_0[10] -pin src_port_OBUF[10]_inst I -pin tcp_parser_inst src_port_reg[15]_0[10]
load net src_port_OBUF[11] -attr @rip src_port_reg[15]_0[11] -pin src_port_OBUF[11]_inst I -pin tcp_parser_inst src_port_reg[15]_0[11]
load net src_port_OBUF[12] -attr @rip src_port_reg[15]_0[12] -pin src_port_OBUF[12]_inst I -pin tcp_parser_inst src_port_reg[15]_0[12]
load net src_port_OBUF[13] -attr @rip src_port_reg[15]_0[13] -pin src_port_OBUF[13]_inst I -pin tcp_parser_inst src_port_reg[15]_0[13]
load net src_port_OBUF[14] -attr @rip src_port_reg[15]_0[14] -pin src_port_OBUF[14]_inst I -pin tcp_parser_inst src_port_reg[15]_0[14]
load net src_port_OBUF[15] -attr @rip src_port_reg[15]_0[15] -pin src_port_OBUF[15]_inst I -pin tcp_parser_inst src_port_reg[15]_0[15]
load net src_port_OBUF[1] -attr @rip src_port_reg[15]_0[1] -pin src_port_OBUF[1]_inst I -pin tcp_parser_inst src_port_reg[15]_0[1]
load net src_port_OBUF[2] -attr @rip src_port_reg[15]_0[2] -pin src_port_OBUF[2]_inst I -pin tcp_parser_inst src_port_reg[15]_0[2]
load net src_port_OBUF[3] -attr @rip src_port_reg[15]_0[3] -pin src_port_OBUF[3]_inst I -pin tcp_parser_inst src_port_reg[15]_0[3]
load net src_port_OBUF[4] -attr @rip src_port_reg[15]_0[4] -pin src_port_OBUF[4]_inst I -pin tcp_parser_inst src_port_reg[15]_0[4]
load net src_port_OBUF[5] -attr @rip src_port_reg[15]_0[5] -pin src_port_OBUF[5]_inst I -pin tcp_parser_inst src_port_reg[15]_0[5]
load net src_port_OBUF[6] -attr @rip src_port_reg[15]_0[6] -pin src_port_OBUF[6]_inst I -pin tcp_parser_inst src_port_reg[15]_0[6]
load net src_port_OBUF[7] -attr @rip src_port_reg[15]_0[7] -pin src_port_OBUF[7]_inst I -pin tcp_parser_inst src_port_reg[15]_0[7]
load net src_port_OBUF[8] -attr @rip src_port_reg[15]_0[8] -pin src_port_OBUF[8]_inst I -pin tcp_parser_inst src_port_reg[15]_0[8]
load net src_port_OBUF[9] -attr @rip src_port_reg[15]_0[9] -pin src_port_OBUF[9]_inst I -pin tcp_parser_inst src_port_reg[15]_0[9]
load net state[0] -attr @rip state[0] -pin ethernet_parser_inst state[0] -pin ipv4_parser_inst state[0] -pin tcp_parser_inst state[0]
netloc state[0] 1 2 4 500 12500 1330 12660 NJ 12660 2980
load net tcp_data_offset[0] -attr @rip 0 -port tcp_data_offset[0] -pin tcp_data_offset_OBUF[0]_inst O
load net tcp_data_offset[1] -attr @rip 1 -port tcp_data_offset[1] -pin tcp_data_offset_OBUF[1]_inst O
load net tcp_data_offset[2] -attr @rip 2 -port tcp_data_offset[2] -pin tcp_data_offset_OBUF[2]_inst O
load net tcp_data_offset[3] -attr @rip 3 -port tcp_data_offset[3] -pin tcp_data_offset_OBUF[3]_inst O
load net tcp_data_offset_OBUF[0]
load net tcp_data_offset_OBUF[1]
load net tcp_data_offset_OBUF[2]
load net tcp_data_offset_OBUF[3]
load net tcp_flags[0] -attr @rip 0 -port tcp_flags[0] -pin tcp_flags_OBUF[0]_inst O
load net tcp_flags[1] -attr @rip 1 -port tcp_flags[1] -pin tcp_flags_OBUF[1]_inst O
load net tcp_flags[2] -attr @rip 2 -port tcp_flags[2] -pin tcp_flags_OBUF[2]_inst O
load net tcp_flags[3] -attr @rip 3 -port tcp_flags[3] -pin tcp_flags_OBUF[3]_inst O
load net tcp_flags[4] -attr @rip 4 -port tcp_flags[4] -pin tcp_flags_OBUF[4]_inst O
load net tcp_flags[5] -attr @rip 5 -port tcp_flags[5] -pin tcp_flags_OBUF[5]_inst O
load net tcp_flags[6] -attr @rip 6 -port tcp_flags[6] -pin tcp_flags_OBUF[6]_inst O
load net tcp_flags[7] -attr @rip 7 -port tcp_flags[7] -pin tcp_flags_OBUF[7]_inst O
load net tcp_flags[8] -attr @rip 8 -port tcp_flags[8] -pin tcp_flags_OBUF[8]_inst O
load net tcp_flags_OBUF[0] -attr @rip tcp_flags_reg[8]_0[0] -pin tcp_flags_OBUF[0]_inst I -pin tcp_parser_inst tcp_flags_reg[8]_0[0]
load net tcp_flags_OBUF[1] -attr @rip tcp_flags_reg[8]_0[1] -pin tcp_flags_OBUF[1]_inst I -pin tcp_parser_inst tcp_flags_reg[8]_0[1]
load net tcp_flags_OBUF[2] -attr @rip tcp_flags_reg[8]_0[2] -pin tcp_flags_OBUF[2]_inst I -pin tcp_parser_inst tcp_flags_reg[8]_0[2]
load net tcp_flags_OBUF[3] -attr @rip tcp_flags_reg[8]_0[3] -pin tcp_flags_OBUF[3]_inst I -pin tcp_parser_inst tcp_flags_reg[8]_0[3]
load net tcp_flags_OBUF[4] -attr @rip tcp_flags_reg[8]_0[4] -pin tcp_flags_OBUF[4]_inst I -pin tcp_parser_inst tcp_flags_reg[8]_0[4]
load net tcp_flags_OBUF[5] -attr @rip tcp_flags_reg[8]_0[5] -pin tcp_flags_OBUF[5]_inst I -pin tcp_parser_inst tcp_flags_reg[8]_0[5]
load net tcp_flags_OBUF[6] -attr @rip tcp_flags_reg[8]_0[6] -pin tcp_flags_OBUF[6]_inst I -pin tcp_parser_inst tcp_flags_reg[8]_0[6]
load net tcp_flags_OBUF[7] -attr @rip tcp_flags_reg[8]_0[7] -pin tcp_flags_OBUF[7]_inst I -pin tcp_parser_inst tcp_flags_reg[8]_0[7]
load net tcp_flags_OBUF[8] -attr @rip tcp_flags_reg[8]_0[8] -pin tcp_flags_OBUF[8]_inst I -pin tcp_parser_inst tcp_flags_reg[8]_0[8]
load net tcp_header_valid -port tcp_header_valid -pin tcp_header_valid_OBUF_inst O
netloc tcp_header_valid 1 6 1 NJ 12640
load net tcp_header_valid_OBUF -pin tcp_header_valid_OBUF_inst I -pin tcp_parser_inst tcp_header_valid_OBUF
netloc tcp_header_valid_OBUF 1 5 1 3220J 12440n
load net tcp_parser_inst_n_10 -pin ipv4_parser_inst byte_count_reg[3]_0 -pin tcp_parser_inst leftover_count_reg[2]_1
netloc tcp_parser_inst_n_10 1 3 3 1390 12520 2180J 12500 3060
load net tcp_parser_inst_n_11 -pin ipv4_parser_inst out_keep_reg_reg[6]_0 -pin tcp_parser_inst leftover_count_reg[2]_2
netloc tcp_parser_inst_n_11 1 3 3 1410 12500 2120J 12480 3040
load net tcp_parser_inst_n_12 -pin ipv4_parser_inst out_valid_reg_reg_1 -pin tcp_parser_inst out_valid_reg_reg_1
netloc tcp_parser_inst_n_12 1 3 3 1350 12620 NJ 12620 3020
load net tcp_parser_inst_n_13 -pin ethernet_parser_inst src_mac_reg[31]_0 -pin ipv4_parser_inst dst_ip_reg[0]_0 -pin tcp_parser_inst out_valid_reg_reg_2
netloc tcp_parser_inst_n_13 1 2 4 600 12480 1210 12640 NJ 12640 3000
load net tcp_parser_inst_n_8 -pin ipv4_parser_inst state[1]_i_4 -pin tcp_parser_inst leftover_count_reg[2]_0
netloc tcp_parser_inst_n_8 1 3 3 1370 12540 NJ 12540 3080
load net tcp_parser_inst_n_9 -pin ipv4_parser_inst out_keep_reg_reg[6]_1 -pin tcp_parser_inst out_valid_reg_reg_0
netloc tcp_parser_inst_n_9 1 3 3 1430 12600 NJ 12600 3100
load netBundle @s_axis_tdata 64 s_axis_tdata[63] s_axis_tdata[62] s_axis_tdata[61] s_axis_tdata[60] s_axis_tdata[59] s_axis_tdata[58] s_axis_tdata[57] s_axis_tdata[56] s_axis_tdata[55] s_axis_tdata[54] s_axis_tdata[53] s_axis_tdata[52] s_axis_tdata[51] s_axis_tdata[50] s_axis_tdata[49] s_axis_tdata[48] s_axis_tdata[47] s_axis_tdata[46] s_axis_tdata[45] s_axis_tdata[44] s_axis_tdata[43] s_axis_tdata[42] s_axis_tdata[41] s_axis_tdata[40] s_axis_tdata[39] s_axis_tdata[38] s_axis_tdata[37] s_axis_tdata[36] s_axis_tdata[35] s_axis_tdata[34] s_axis_tdata[33] s_axis_tdata[32] s_axis_tdata[31] s_axis_tdata[30] s_axis_tdata[29] s_axis_tdata[28] s_axis_tdata[27] s_axis_tdata[26] s_axis_tdata[25] s_axis_tdata[24] s_axis_tdata[23] s_axis_tdata[22] s_axis_tdata[21] s_axis_tdata[20] s_axis_tdata[19] s_axis_tdata[18] s_axis_tdata[17] s_axis_tdata[16] s_axis_tdata[15] s_axis_tdata[14] s_axis_tdata[13] s_axis_tdata[12] s_axis_tdata[11] s_axis_tdata[10] s_axis_tdata[9] s_axis_tdata[8] s_axis_tdata[7] s_axis_tdata[6] s_axis_tdata[5] s_axis_tdata[4] s_axis_tdata[3] s_axis_tdata[2] s_axis_tdata[1] s_axis_tdata[0] -autobundled
netbloc @s_axis_tdata 1 0 2 NJ 12150 180
load netBundle @s_axis_tkeep 8 s_axis_tkeep[7] s_axis_tkeep[6] s_axis_tkeep[5] s_axis_tkeep[4] s_axis_tkeep[3] s_axis_tkeep[2] s_axis_tkeep[1] s_axis_tkeep[0] -autobundled
netbloc @s_axis_tkeep 1 0 2 NJ 15440 160
load netBundle @ack_num 32 ack_num[31] ack_num[30] ack_num[29] ack_num[28] ack_num[27] ack_num[26] ack_num[25] ack_num[24] ack_num[23] ack_num[22] ack_num[21] ack_num[20] ack_num[19] ack_num[18] ack_num[17] ack_num[16] ack_num[15] ack_num[14] ack_num[13] ack_num[12] ack_num[11] ack_num[10] ack_num[9] ack_num[8] ack_num[7] ack_num[6] ack_num[5] ack_num[4] ack_num[3] ack_num[2] ack_num[1] ack_num[0] -autobundled
netbloc @ack_num 1 6 1 3670 5640n
load netBundle @dst_ip 32 dst_ip[31] dst_ip[30] dst_ip[29] dst_ip[28] dst_ip[27] dst_ip[26] dst_ip[25] dst_ip[24] dst_ip[23] dst_ip[22] dst_ip[21] dst_ip[20] dst_ip[19] dst_ip[18] dst_ip[17] dst_ip[16] dst_ip[15] dst_ip[14] dst_ip[13] dst_ip[12] dst_ip[11] dst_ip[10] dst_ip[9] dst_ip[8] dst_ip[7] dst_ip[6] dst_ip[5] dst_ip[4] dst_ip[3] dst_ip[2] dst_ip[1] dst_ip[0] -autobundled
netbloc @dst_ip 1 6 1 3670 3400n
load netBundle @dst_mac 48 dst_mac[47] dst_mac[46] dst_mac[45] dst_mac[44] dst_mac[43] dst_mac[42] dst_mac[41] dst_mac[40] dst_mac[39] dst_mac[38] dst_mac[37] dst_mac[36] dst_mac[35] dst_mac[34] dst_mac[33] dst_mac[32] dst_mac[31] dst_mac[30] dst_mac[29] dst_mac[28] dst_mac[27] dst_mac[26] dst_mac[25] dst_mac[24] dst_mac[23] dst_mac[22] dst_mac[21] dst_mac[20] dst_mac[19] dst_mac[18] dst_mac[17] dst_mac[16] dst_mac[15] dst_mac[14] dst_mac[13] dst_mac[12] dst_mac[11] dst_mac[10] dst_mac[9] dst_mac[8] dst_mac[7] dst_mac[6] dst_mac[5] dst_mac[4] dst_mac[3] dst_mac[2] dst_mac[1] dst_mac[0] -autobundled
netbloc @dst_mac 1 6 1 3670 40n
load netBundle @dst_port 16 dst_port[15] dst_port[14] dst_port[13] dst_port[12] dst_port[11] dst_port[10] dst_port[9] dst_port[8] dst_port[7] dst_port[6] dst_port[5] dst_port[4] dst_port[3] dst_port[2] dst_port[1] dst_port[0] -autobundled
netbloc @dst_port 1 6 1 3670 7880n
load netBundle @ethertype 16 ethertype[15] ethertype[14] ethertype[13] ethertype[12] ethertype[11] ethertype[10] ethertype[9] ethertype[8] ethertype[7] ethertype[6] ethertype[5] ethertype[4] ethertype[3] ethertype[2] ethertype[1] ethertype[0] -autobundled
netbloc @ethertype 1 6 1 3670 9000n
load netBundle @ip_ihl 4 ip_ihl[3] ip_ihl[2] ip_ihl[1] ip_ihl[0] -autobundled
netbloc @ip_ihl 1 6 1 3690 11870n
load netBundle @ip_protocol 8 ip_protocol[7] ip_protocol[6] ip_protocol[5] ip_protocol[4] ip_protocol[3] ip_protocol[2] ip_protocol[1] ip_protocol[0] -autobundled
netbloc @ip_protocol 1 6 1 3670 11380n
load netBundle @ip_total_length 16 ip_total_length[15] ip_total_length[14] ip_total_length[13] ip_total_length[12] ip_total_length[11] ip_total_length[10] ip_total_length[9] ip_total_length[8] ip_total_length[7] ip_total_length[6] ip_total_length[5] ip_total_length[4] ip_total_length[3] ip_total_length[2] ip_total_length[1] ip_total_length[0] -autobundled
netbloc @ip_total_length 1 6 1 3670 10120n
load netBundle @m_axis_tdata 64 m_axis_tdata[63] m_axis_tdata[62] m_axis_tdata[61] m_axis_tdata[60] m_axis_tdata[59] m_axis_tdata[58] m_axis_tdata[57] m_axis_tdata[56] m_axis_tdata[55] m_axis_tdata[54] m_axis_tdata[53] m_axis_tdata[52] m_axis_tdata[51] m_axis_tdata[50] m_axis_tdata[49] m_axis_tdata[48] m_axis_tdata[47] m_axis_tdata[46] m_axis_tdata[45] m_axis_tdata[44] m_axis_tdata[43] m_axis_tdata[42] m_axis_tdata[41] m_axis_tdata[40] m_axis_tdata[39] m_axis_tdata[38] m_axis_tdata[37] m_axis_tdata[36] m_axis_tdata[35] m_axis_tdata[34] m_axis_tdata[33] m_axis_tdata[32] m_axis_tdata[31] m_axis_tdata[30] m_axis_tdata[29] m_axis_tdata[28] m_axis_tdata[27] m_axis_tdata[26] m_axis_tdata[25] m_axis_tdata[24] m_axis_tdata[23] m_axis_tdata[22] m_axis_tdata[21] m_axis_tdata[20] m_axis_tdata[19] m_axis_tdata[18] m_axis_tdata[17] m_axis_tdata[16] m_axis_tdata[15] m_axis_tdata[14] m_axis_tdata[13] m_axis_tdata[12] m_axis_tdata[11] m_axis_tdata[10] m_axis_tdata[9] m_axis_tdata[8] m_axis_tdata[7] m_axis_tdata[6] m_axis_tdata[5] m_axis_tdata[4] m_axis_tdata[3] m_axis_tdata[2] m_axis_tdata[1] m_axis_tdata[0] -autobundled
netbloc @m_axis_tdata 1 6 1 3690 13480n
load netBundle @m_axis_tkeep 8 m_axis_tkeep[7] m_axis_tkeep[6] m_axis_tkeep[5] m_axis_tkeep[4] m_axis_tkeep[3] m_axis_tkeep[2] m_axis_tkeep[1] m_axis_tkeep[0] -autobundled
netbloc @m_axis_tkeep 1 6 1 3670 12920n
load netBundle @seq_num 32 seq_num[31] seq_num[30] seq_num[29] seq_num[28] seq_num[27] seq_num[26] seq_num[25] seq_num[24] seq_num[23] seq_num[22] seq_num[21] seq_num[20] seq_num[19] seq_num[18] seq_num[17] seq_num[16] seq_num[15] seq_num[14] seq_num[13] seq_num[12] seq_num[11] seq_num[10] seq_num[9] seq_num[8] seq_num[7] seq_num[6] seq_num[5] seq_num[4] seq_num[3] seq_num[2] seq_num[1] seq_num[0] -autobundled
netbloc @seq_num 1 6 1 3690 23070n
load netBundle @src_ip 32 src_ip[31] src_ip[30] src_ip[29] src_ip[28] src_ip[27] src_ip[26] src_ip[25] src_ip[24] src_ip[23] src_ip[22] src_ip[21] src_ip[20] src_ip[19] src_ip[18] src_ip[17] src_ip[16] src_ip[15] src_ip[14] src_ip[13] src_ip[12] src_ip[11] src_ip[10] src_ip[9] src_ip[8] src_ip[7] src_ip[6] src_ip[5] src_ip[4] src_ip[3] src_ip[2] src_ip[1] src_ip[0] -autobundled
netbloc @src_ip 1 6 1 3670 25310n
load netBundle @src_mac 48 src_mac[47] src_mac[46] src_mac[45] src_mac[44] src_mac[43] src_mac[42] src_mac[41] src_mac[40] src_mac[39] src_mac[38] src_mac[37] src_mac[36] src_mac[35] src_mac[34] src_mac[33] src_mac[32] src_mac[31] src_mac[30] src_mac[29] src_mac[28] src_mac[27] src_mac[26] src_mac[25] src_mac[24] src_mac[23] src_mac[22] src_mac[21] src_mac[20] src_mac[19] src_mac[18] src_mac[17] src_mac[16] src_mac[15] src_mac[14] src_mac[13] src_mac[12] src_mac[11] src_mac[10] src_mac[9] src_mac[8] src_mac[7] src_mac[6] src_mac[5] src_mac[4] src_mac[3] src_mac[2] src_mac[1] src_mac[0] -autobundled
netbloc @src_mac 1 6 1 3670 19710n
load netBundle @src_port 16 src_port[15] src_port[14] src_port[13] src_port[12] src_port[11] src_port[10] src_port[9] src_port[8] src_port[7] src_port[6] src_port[5] src_port[4] src_port[3] src_port[2] src_port[1] src_port[0] -autobundled
netbloc @src_port 1 6 1 3670 17960n
load netBundle @tcp_data_offset 4 tcp_data_offset[3] tcp_data_offset[2] tcp_data_offset[1] tcp_data_offset[0] -autobundled
netbloc @tcp_data_offset 1 6 1 3690 12360n
load netBundle @tcp_flags 9 tcp_flags[8] tcp_flags[7] tcp_flags[6] tcp_flags[5] tcp_flags[4] tcp_flags[3] tcp_flags[2] tcp_flags[1] tcp_flags[0] -autobundled
netbloc @tcp_flags 1 6 1 3690 19080n
load netBundle @out_keep_reg1_in 2 out_keep_reg1_in[7] out_keep_reg1_in[5] -autobundled
netbloc @out_keep_reg1_in 1 3 1 1070 11820n
load netBundle @dst_mac_OBUF 48 dst_mac_OBUF[47] dst_mac_OBUF[46] dst_mac_OBUF[45] dst_mac_OBUF[44] dst_mac_OBUF[43] dst_mac_OBUF[42] dst_mac_OBUF[41] dst_mac_OBUF[40] dst_mac_OBUF[39] dst_mac_OBUF[38] dst_mac_OBUF[37] dst_mac_OBUF[36] dst_mac_OBUF[35] dst_mac_OBUF[34] dst_mac_OBUF[33] dst_mac_OBUF[32] dst_mac_OBUF[31] dst_mac_OBUF[30] dst_mac_OBUF[29] dst_mac_OBUF[28] dst_mac_OBUF[27] dst_mac_OBUF[26] dst_mac_OBUF[25] dst_mac_OBUF[24] dst_mac_OBUF[23] dst_mac_OBUF[22] dst_mac_OBUF[21] dst_mac_OBUF[20] dst_mac_OBUF[19] dst_mac_OBUF[18] dst_mac_OBUF[17] dst_mac_OBUF[16] dst_mac_OBUF[15] dst_mac_OBUF[14] dst_mac_OBUF[13] dst_mac_OBUF[12] dst_mac_OBUF[11] dst_mac_OBUF[10] dst_mac_OBUF[9] dst_mac_OBUF[8] dst_mac_OBUF[7] dst_mac_OBUF[6] dst_mac_OBUF[5] dst_mac_OBUF[4] dst_mac_OBUF[3] dst_mac_OBUF[2] dst_mac_OBUF[1] dst_mac_OBUF[0] -autobundled
netbloc @dst_mac_OBUF 1 3 3 1050 11220 NJ 11220 3040
load netBundle @eth_ip_tdata 64 eth_ip_tdata[63] eth_ip_tdata[62] eth_ip_tdata[61] eth_ip_tdata[60] eth_ip_tdata[59] eth_ip_tdata[58] eth_ip_tdata[57] eth_ip_tdata[56] eth_ip_tdata[55] eth_ip_tdata[54] eth_ip_tdata[53] eth_ip_tdata[52] eth_ip_tdata[51] eth_ip_tdata[50] eth_ip_tdata[49] eth_ip_tdata[48] eth_ip_tdata[47] eth_ip_tdata[46] eth_ip_tdata[45] eth_ip_tdata[44] eth_ip_tdata[43] eth_ip_tdata[42] eth_ip_tdata[41] eth_ip_tdata[40] eth_ip_tdata[39] eth_ip_tdata[38] eth_ip_tdata[37] eth_ip_tdata[36] eth_ip_tdata[35] eth_ip_tdata[34] eth_ip_tdata[33] eth_ip_tdata[32] eth_ip_tdata[31] eth_ip_tdata[30] eth_ip_tdata[29] eth_ip_tdata[28] eth_ip_tdata[27] eth_ip_tdata[26] eth_ip_tdata[25] eth_ip_tdata[24] eth_ip_tdata[23] eth_ip_tdata[22] eth_ip_tdata[21] eth_ip_tdata[20] eth_ip_tdata[19] eth_ip_tdata[18] eth_ip_tdata[17] eth_ip_tdata[16] eth_ip_tdata[15] eth_ip_tdata[14] eth_ip_tdata[13] eth_ip_tdata[12] eth_ip_tdata[11] eth_ip_tdata[10] eth_ip_tdata[9] eth_ip_tdata[8] eth_ip_tdata[7] eth_ip_tdata[6] eth_ip_tdata[5] eth_ip_tdata[4] eth_ip_tdata[3] eth_ip_tdata[2] eth_ip_tdata[1] eth_ip_tdata[0] -autobundled
netbloc @eth_ip_tdata 1 3 1 N 11860
load netBundle @eth_ip_tkeep 8 eth_ip_tkeep[7] eth_ip_tkeep[6] eth_ip_tkeep[5] eth_ip_tkeep[4] eth_ip_tkeep[3] eth_ip_tkeep[2] eth_ip_tkeep[1] eth_ip_tkeep[0] -autobundled
netbloc @eth_ip_tkeep 1 3 1 N 11880
load netBundle @ethertype_OBUF 16 ethertype_OBUF[15] ethertype_OBUF[14] ethertype_OBUF[13] ethertype_OBUF[12] ethertype_OBUF[11] ethertype_OBUF[10] ethertype_OBUF[9] ethertype_OBUF[8] ethertype_OBUF[7] ethertype_OBUF[6] ethertype_OBUF[5] ethertype_OBUF[4] ethertype_OBUF[3] ethertype_OBUF[2] ethertype_OBUF[1] ethertype_OBUF[0] -autobundled
netbloc @ethertype_OBUF 1 3 3 1090 11260 NJ 11260 3100
load netBundle @src_mac_OBUF 48 src_mac_OBUF[47] src_mac_OBUF[46] src_mac_OBUF[45] src_mac_OBUF[44] src_mac_OBUF[43] src_mac_OBUF[42] src_mac_OBUF[41] src_mac_OBUF[40] src_mac_OBUF[39] src_mac_OBUF[38] src_mac_OBUF[37] src_mac_OBUF[36] src_mac_OBUF[35] src_mac_OBUF[34] src_mac_OBUF[33] src_mac_OBUF[32] src_mac_OBUF[31] src_mac_OBUF[30] src_mac_OBUF[29] src_mac_OBUF[28] src_mac_OBUF[27] src_mac_OBUF[26] src_mac_OBUF[25] src_mac_OBUF[24] src_mac_OBUF[23] src_mac_OBUF[22] src_mac_OBUF[21] src_mac_OBUF[20] src_mac_OBUF[19] src_mac_OBUF[18] src_mac_OBUF[17] src_mac_OBUF[16] src_mac_OBUF[15] src_mac_OBUF[14] src_mac_OBUF[13] src_mac_OBUF[12] src_mac_OBUF[11] src_mac_OBUF[10] src_mac_OBUF[9] src_mac_OBUF[8] src_mac_OBUF[7] src_mac_OBUF[6] src_mac_OBUF[5] src_mac_OBUF[4] src_mac_OBUF[3] src_mac_OBUF[2] src_mac_OBUF[1] src_mac_OBUF[0] -autobundled
netbloc @src_mac_OBUF 1 3 3 1290J 12560 NJ 12560 3140
load netBundle @out_keep_reg1_in_1 2 out_keep_reg1_in_1[7] out_keep_reg1_in_1[6] -autobundled
netbloc @out_keep_reg1_in_1 1 4 1 2200 11600n
load netBundle @ip_tcp_tkeep 7 ip_tcp_tkeep[7] ip_tcp_tkeep[5] ip_tcp_tkeep[4] ip_tcp_tkeep[3] ip_tcp_tkeep[2] ip_tcp_tkeep[1] ip_tcp_tkeep[0] -autobundled
netbloc @ip_tcp_tkeep 1 4 1 2540 11620n
load netBundle @dst_ip_OBUF 32 dst_ip_OBUF[31] dst_ip_OBUF[30] dst_ip_OBUF[29] dst_ip_OBUF[28] dst_ip_OBUF[27] dst_ip_OBUF[26] dst_ip_OBUF[25] dst_ip_OBUF[24] dst_ip_OBUF[23] dst_ip_OBUF[22] dst_ip_OBUF[21] dst_ip_OBUF[20] dst_ip_OBUF[19] dst_ip_OBUF[18] dst_ip_OBUF[17] dst_ip_OBUF[16] dst_ip_OBUF[15] dst_ip_OBUF[14] dst_ip_OBUF[13] dst_ip_OBUF[12] dst_ip_OBUF[11] dst_ip_OBUF[10] dst_ip_OBUF[9] dst_ip_OBUF[8] dst_ip_OBUF[7] dst_ip_OBUF[6] dst_ip_OBUF[5] dst_ip_OBUF[4] dst_ip_OBUF[3] dst_ip_OBUF[2] dst_ip_OBUF[1] dst_ip_OBUF[0] -autobundled
netbloc @dst_ip_OBUF 1 4 2 2220 11240 3080
load netBundle @ip_total_length_OBUF 16 ip_total_length_OBUF[15] ip_total_length_OBUF[14] ip_total_length_OBUF[13] ip_total_length_OBUF[12] ip_total_length_OBUF[11] ip_total_length_OBUF[10] ip_total_length_OBUF[9] ip_total_length_OBUF[8] ip_total_length_OBUF[7] ip_total_length_OBUF[6] ip_total_length_OBUF[5] ip_total_length_OBUF[4] ip_total_length_OBUF[3] ip_total_length_OBUF[2] ip_total_length_OBUF[1] ip_total_length_OBUF[0] -autobundled
netbloc @ip_total_length_OBUF 1 4 2 2240 11280 3320
load netBundle @ip_tcp_tdata 64 ip_tcp_tdata[63] ip_tcp_tdata[62] ip_tcp_tdata[61] ip_tcp_tdata[60] ip_tcp_tdata[59] ip_tcp_tdata[58] ip_tcp_tdata[57] ip_tcp_tdata[56] ip_tcp_tdata[55] ip_tcp_tdata[54] ip_tcp_tdata[53] ip_tcp_tdata[52] ip_tcp_tdata[51] ip_tcp_tdata[50] ip_tcp_tdata[49] ip_tcp_tdata[48] ip_tcp_tdata[47] ip_tcp_tdata[46] ip_tcp_tdata[45] ip_tcp_tdata[44] ip_tcp_tdata[43] ip_tcp_tdata[42] ip_tcp_tdata[41] ip_tcp_tdata[40] ip_tcp_tdata[39] ip_tcp_tdata[38] ip_tcp_tdata[37] ip_tcp_tdata[36] ip_tcp_tdata[35] ip_tcp_tdata[34] ip_tcp_tdata[33] ip_tcp_tdata[32] ip_tcp_tdata[31] ip_tcp_tdata[30] ip_tcp_tdata[29] ip_tcp_tdata[28] ip_tcp_tdata[27] ip_tcp_tdata[26] ip_tcp_tdata[25] ip_tcp_tdata[24] ip_tcp_tdata[23] ip_tcp_tdata[22] ip_tcp_tdata[21] ip_tcp_tdata[20] ip_tcp_tdata[19] ip_tcp_tdata[18] ip_tcp_tdata[17] ip_tcp_tdata[16] ip_tcp_tdata[15] ip_tcp_tdata[14] ip_tcp_tdata[13] ip_tcp_tdata[12] ip_tcp_tdata[11] ip_tcp_tdata[10] ip_tcp_tdata[9] ip_tcp_tdata[8] ip_tcp_tdata[7] ip_tcp_tdata[6] ip_tcp_tdata[5] ip_tcp_tdata[4] ip_tcp_tdata[3] ip_tcp_tdata[2] ip_tcp_tdata[1] ip_tcp_tdata[0] -autobundled
netbloc @ip_tcp_tdata 1 4 1 2180 12120n
load netBundle @src_ip_OBUF 32 src_ip_OBUF[31] src_ip_OBUF[30] src_ip_OBUF[29] src_ip_OBUF[28] src_ip_OBUF[27] src_ip_OBUF[26] src_ip_OBUF[25] src_ip_OBUF[24] src_ip_OBUF[23] src_ip_OBUF[22] src_ip_OBUF[21] src_ip_OBUF[20] src_ip_OBUF[19] src_ip_OBUF[18] src_ip_OBUF[17] src_ip_OBUF[16] src_ip_OBUF[15] src_ip_OBUF[14] src_ip_OBUF[13] src_ip_OBUF[12] src_ip_OBUF[11] src_ip_OBUF[10] src_ip_OBUF[9] src_ip_OBUF[8] src_ip_OBUF[7] src_ip_OBUF[6] src_ip_OBUF[5] src_ip_OBUF[4] src_ip_OBUF[3] src_ip_OBUF[2] src_ip_OBUF[1] src_ip_OBUF[0] -autobundled
netbloc @src_ip_OBUF 1 4 2 2080J 12580 3120
load netBundle @ack_num_OBUF 32 ack_num_OBUF[31] ack_num_OBUF[30] ack_num_OBUF[29] ack_num_OBUF[28] ack_num_OBUF[27] ack_num_OBUF[26] ack_num_OBUF[25] ack_num_OBUF[24] ack_num_OBUF[23] ack_num_OBUF[22] ack_num_OBUF[21] ack_num_OBUF[20] ack_num_OBUF[19] ack_num_OBUF[18] ack_num_OBUF[17] ack_num_OBUF[16] ack_num_OBUF[15] ack_num_OBUF[14] ack_num_OBUF[13] ack_num_OBUF[12] ack_num_OBUF[11] ack_num_OBUF[10] ack_num_OBUF[9] ack_num_OBUF[8] ack_num_OBUF[7] ack_num_OBUF[6] ack_num_OBUF[5] ack_num_OBUF[4] ack_num_OBUF[3] ack_num_OBUF[2] ack_num_OBUF[1] ack_num_OBUF[0] -autobundled
netbloc @ack_num_OBUF 1 5 1 3300 5640n
load netBundle @dst_port_OBUF 16 dst_port_OBUF[15] dst_port_OBUF[14] dst_port_OBUF[13] dst_port_OBUF[12] dst_port_OBUF[11] dst_port_OBUF[10] dst_port_OBUF[9] dst_port_OBUF[8] dst_port_OBUF[7] dst_port_OBUF[6] dst_port_OBUF[5] dst_port_OBUF[4] dst_port_OBUF[3] dst_port_OBUF[2] dst_port_OBUF[1] dst_port_OBUF[0] -autobundled
netbloc @dst_port_OBUF 1 5 1 3340 7880n
load netBundle @m_axis_tdata_OBUF 64 m_axis_tdata_OBUF[63] m_axis_tdata_OBUF[62] m_axis_tdata_OBUF[61] m_axis_tdata_OBUF[60] m_axis_tdata_OBUF[59] m_axis_tdata_OBUF[58] m_axis_tdata_OBUF[57] m_axis_tdata_OBUF[56] m_axis_tdata_OBUF[55] m_axis_tdata_OBUF[54] m_axis_tdata_OBUF[53] m_axis_tdata_OBUF[52] m_axis_tdata_OBUF[51] m_axis_tdata_OBUF[50] m_axis_tdata_OBUF[49] m_axis_tdata_OBUF[48] m_axis_tdata_OBUF[47] m_axis_tdata_OBUF[46] m_axis_tdata_OBUF[45] m_axis_tdata_OBUF[44] m_axis_tdata_OBUF[43] m_axis_tdata_OBUF[42] m_axis_tdata_OBUF[41] m_axis_tdata_OBUF[40] m_axis_tdata_OBUF[39] m_axis_tdata_OBUF[38] m_axis_tdata_OBUF[37] m_axis_tdata_OBUF[36] m_axis_tdata_OBUF[35] m_axis_tdata_OBUF[34] m_axis_tdata_OBUF[33] m_axis_tdata_OBUF[32] m_axis_tdata_OBUF[31] m_axis_tdata_OBUF[30] m_axis_tdata_OBUF[29] m_axis_tdata_OBUF[28] m_axis_tdata_OBUF[27] m_axis_tdata_OBUF[26] m_axis_tdata_OBUF[25] m_axis_tdata_OBUF[24] m_axis_tdata_OBUF[23] m_axis_tdata_OBUF[22] m_axis_tdata_OBUF[21] m_axis_tdata_OBUF[20] m_axis_tdata_OBUF[19] m_axis_tdata_OBUF[18] m_axis_tdata_OBUF[17] m_axis_tdata_OBUF[16] m_axis_tdata_OBUF[15] m_axis_tdata_OBUF[14] m_axis_tdata_OBUF[13] m_axis_tdata_OBUF[12] m_axis_tdata_OBUF[11] m_axis_tdata_OBUF[10] m_axis_tdata_OBUF[9] m_axis_tdata_OBUF[8] m_axis_tdata_OBUF[7] m_axis_tdata_OBUF[6] m_axis_tdata_OBUF[5] m_axis_tdata_OBUF[4] m_axis_tdata_OBUF[3] m_axis_tdata_OBUF[2] m_axis_tdata_OBUF[1] m_axis_tdata_OBUF[0] -autobundled
netbloc @m_axis_tdata_OBUF 1 5 1 3260 12260n
load netBundle @m_axis_tkeep_OBUF 8 m_axis_tkeep_OBUF[7] m_axis_tkeep_OBUF[6] m_axis_tkeep_OBUF[5] m_axis_tkeep_OBUF[4] m_axis_tkeep_OBUF[3] m_axis_tkeep_OBUF[2] m_axis_tkeep_OBUF[1] m_axis_tkeep_OBUF[0] -autobundled
netbloc @m_axis_tkeep_OBUF 1 5 1 3240 12280n
load netBundle @seq_num_OBUF 32 seq_num_OBUF[31] seq_num_OBUF[30] seq_num_OBUF[29] seq_num_OBUF[28] seq_num_OBUF[27] seq_num_OBUF[26] seq_num_OBUF[25] seq_num_OBUF[24] seq_num_OBUF[23] seq_num_OBUF[22] seq_num_OBUF[21] seq_num_OBUF[20] seq_num_OBUF[19] seq_num_OBUF[18] seq_num_OBUF[17] seq_num_OBUF[16] seq_num_OBUF[15] seq_num_OBUF[14] seq_num_OBUF[13] seq_num_OBUF[12] seq_num_OBUF[11] seq_num_OBUF[10] seq_num_OBUF[9] seq_num_OBUF[8] seq_num_OBUF[7] seq_num_OBUF[6] seq_num_OBUF[5] seq_num_OBUF[4] seq_num_OBUF[3] seq_num_OBUF[2] seq_num_OBUF[1] seq_num_OBUF[0] -autobundled
netbloc @seq_num_OBUF 1 5 1 3180 12360n
load netBundle @src_port_OBUF 16 src_port_OBUF[15] src_port_OBUF[14] src_port_OBUF[13] src_port_OBUF[12] src_port_OBUF[11] src_port_OBUF[10] src_port_OBUF[9] src_port_OBUF[8] src_port_OBUF[7] src_port_OBUF[6] src_port_OBUF[5] src_port_OBUF[4] src_port_OBUF[3] src_port_OBUF[2] src_port_OBUF[1] src_port_OBUF[0] -autobundled
netbloc @src_port_OBUF 1 5 1 3200 12380n
load netBundle @tcp_flags_OBUF 9 tcp_flags_OBUF[8] tcp_flags_OBUF[7] tcp_flags_OBUF[6] tcp_flags_OBUF[5] tcp_flags_OBUF[4] tcp_flags_OBUF[3] tcp_flags_OBUF[2] tcp_flags_OBUF[1] tcp_flags_OBUF[0] -autobundled
netbloc @tcp_flags_OBUF 1 5 1 3160 12420n
load netBundle @s_axis_tdata_IBUF 64 s_axis_tdata_IBUF[63] s_axis_tdata_IBUF[62] s_axis_tdata_IBUF[61] s_axis_tdata_IBUF[60] s_axis_tdata_IBUF[59] s_axis_tdata_IBUF[58] s_axis_tdata_IBUF[57] s_axis_tdata_IBUF[56] s_axis_tdata_IBUF[55] s_axis_tdata_IBUF[54] s_axis_tdata_IBUF[53] s_axis_tdata_IBUF[52] s_axis_tdata_IBUF[51] s_axis_tdata_IBUF[50] s_axis_tdata_IBUF[49] s_axis_tdata_IBUF[48] s_axis_tdata_IBUF[47] s_axis_tdata_IBUF[46] s_axis_tdata_IBUF[45] s_axis_tdata_IBUF[44] s_axis_tdata_IBUF[43] s_axis_tdata_IBUF[42] s_axis_tdata_IBUF[41] s_axis_tdata_IBUF[40] s_axis_tdata_IBUF[39] s_axis_tdata_IBUF[38] s_axis_tdata_IBUF[37] s_axis_tdata_IBUF[36] s_axis_tdata_IBUF[35] s_axis_tdata_IBUF[34] s_axis_tdata_IBUF[33] s_axis_tdata_IBUF[32] s_axis_tdata_IBUF[31] s_axis_tdata_IBUF[30] s_axis_tdata_IBUF[29] s_axis_tdata_IBUF[28] s_axis_tdata_IBUF[27] s_axis_tdata_IBUF[26] s_axis_tdata_IBUF[25] s_axis_tdata_IBUF[24] s_axis_tdata_IBUF[23] s_axis_tdata_IBUF[22] s_axis_tdata_IBUF[21] s_axis_tdata_IBUF[20] s_axis_tdata_IBUF[19] s_axis_tdata_IBUF[18] s_axis_tdata_IBUF[17] s_axis_tdata_IBUF[16] s_axis_tdata_IBUF[15] s_axis_tdata_IBUF[14] s_axis_tdata_IBUF[13] s_axis_tdata_IBUF[12] s_axis_tdata_IBUF[11] s_axis_tdata_IBUF[10] s_axis_tdata_IBUF[9] s_axis_tdata_IBUF[8] s_axis_tdata_IBUF[7] s_axis_tdata_IBUF[6] s_axis_tdata_IBUF[5] s_axis_tdata_IBUF[4] s_axis_tdata_IBUF[3] s_axis_tdata_IBUF[2] s_axis_tdata_IBUF[1] s_axis_tdata_IBUF[0] -autobundled
netbloc @s_axis_tdata_IBUF 1 2 1 440 11980n
load netBundle @s_axis_tkeep_IBUF 8 s_axis_tkeep_IBUF[7] s_axis_tkeep_IBUF[6] s_axis_tkeep_IBUF[5] s_axis_tkeep_IBUF[4] s_axis_tkeep_IBUF[3] s_axis_tkeep_IBUF[2] s_axis_tkeep_IBUF[1] s_axis_tkeep_IBUF[0] -autobundled
netbloc @s_axis_tkeep_IBUF 1 2 1 480 12000n
levelinfo -pg 1 0 40 220 800 1610 2730 3420 3710
pagesize -pg 1 -db -bbox -sgen -160 0 3900 27520
show
fullfit
#
# initialize ictrl to current module network_pipeline work:network_pipeline:NOFILE
ictrl init topinfo |
