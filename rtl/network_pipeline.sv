`timescale 1ns/1ps

module network_pipeline (
    input  logic        clk,
    input  logic        rst_n,

    // ============================================================
    // Input Ethernet stream
    // ============================================================
    input  logic [63:0] s_axis_tdata,
    input  logic [7:0]  s_axis_tkeep,
    input  logic        s_axis_tvalid,
    output logic        s_axis_tready,
    input  logic        s_axis_tlast,

    // ============================================================
    // Output TCP payload stream
    // ============================================================
    output logic [63:0] m_axis_tdata,
    output logic [7:0]  m_axis_tkeep,
    output logic        m_axis_tvalid,
    input  logic        m_axis_tready,
    output logic        m_axis_tlast,

    // ============================================================
    // Ethernet metadata
    // ============================================================
    output logic [47:0] dst_mac,
    output logic [47:0] src_mac,
    output logic [15:0] ethertype,
    output logic        ethernet_header_valid,
    output logic        is_ipv4,

    // ============================================================
    // IPv4 metadata
    // ============================================================
    output logic [31:0] src_ip,
    output logic [31:0] dst_ip,
    output logic [15:0] ip_total_length,
    output logic [7:0]  ip_protocol,
    output logic [3:0]  ip_ihl,
    output logic        ipv4_header_valid,
    output logic        is_tcp,

    // ============================================================
    // TCP metadata
    // ============================================================
    output logic [15:0] src_port,
    output logic [15:0] dst_port,
    output logic [31:0] seq_num,
    output logic [31:0] ack_num,
    output logic [3:0]  tcp_data_offset,
    output logic [8:0]  tcp_flags,
    output logic        tcp_header_valid
);


    // ============================================================
    // Ethernet -> IPv4 internal stream
    // ============================================================

    logic [63:0] eth_ip_tdata;
    logic [7:0]  eth_ip_tkeep;
    logic        eth_ip_tvalid;
    logic        eth_ip_tready;
    logic        eth_ip_tlast;


    // ============================================================
    // IPv4 -> TCP internal stream
    // ============================================================

    logic [63:0] ip_tcp_tdata;
    logic [7:0]  ip_tcp_tkeep;
    logic        ip_tcp_tvalid;
    logic        ip_tcp_tready;
    logic        ip_tcp_tlast;


    // ============================================================
    // Ethernet parser
    // ============================================================

    ethernet_parser ethernet_parser_inst (
        .clk                  (clk),
        .rst_n                (rst_n),

        .s_axis_tdata         (s_axis_tdata),
        .s_axis_tkeep         (s_axis_tkeep),
        .s_axis_tvalid        (s_axis_tvalid),
        .s_axis_tready        (s_axis_tready),
        .s_axis_tlast         (s_axis_tlast),

        .m_axis_tdata         (eth_ip_tdata),
        .m_axis_tkeep         (eth_ip_tkeep),
        .m_axis_tvalid        (eth_ip_tvalid),
        .m_axis_tready        (eth_ip_tready),
        .m_axis_tlast         (eth_ip_tlast),

        .dst_mac              (dst_mac),
        .src_mac              (src_mac),
        .ethertype            (ethertype),
        .ethernet_header_valid(ethernet_header_valid),
        .is_ipv4              (is_ipv4)
    );


    // ============================================================
    // IPv4 parser
    // ============================================================

    ipv4_parser ipv4_parser_inst (
        .clk                  (clk),
        .rst_n                (rst_n),

        .s_axis_tdata         (eth_ip_tdata),
        .s_axis_tkeep         (eth_ip_tkeep),
        .s_axis_tvalid        (eth_ip_tvalid),
        .s_axis_tready        (eth_ip_tready),
        .s_axis_tlast         (eth_ip_tlast),

        .m_axis_tdata         (ip_tcp_tdata),
        .m_axis_tkeep         (ip_tcp_tkeep),
        .m_axis_tvalid        (ip_tcp_tvalid),
        .m_axis_tready        (ip_tcp_tready),
        .m_axis_tlast         (ip_tcp_tlast),

        .src_ip               (src_ip),
        .dst_ip               (dst_ip),
        .ip_total_length      (ip_total_length),
        .ip_protocol          (ip_protocol),
        .ip_ihl               (ip_ihl),
        .ipv4_header_valid    (ipv4_header_valid),
        .is_tcp               (is_tcp)
    );


    // ============================================================
    // TCP parser
    // ============================================================

    tcp_parser tcp_parser_inst (
        .clk                  (clk),
        .rst_n                (rst_n),

        .s_axis_tdata         (ip_tcp_tdata),
        .s_axis_tkeep         (ip_tcp_tkeep),
        .s_axis_tvalid        (ip_tcp_tvalid),
        .s_axis_tready        (ip_tcp_tready),
        .s_axis_tlast         (ip_tcp_tlast),

        .m_axis_tdata         (m_axis_tdata),
        .m_axis_tkeep         (m_axis_tkeep),
        .m_axis_tvalid        (m_axis_tvalid),
        .m_axis_tready        (m_axis_tready),
        .m_axis_tlast         (m_axis_tlast),

        .src_port             (src_port),
        .dst_port             (dst_port),
        .seq_num              (seq_num),
        .ack_num              (ack_num),
        .tcp_data_offset      (tcp_data_offset),
        .tcp_flags            (tcp_flags),
        .tcp_header_valid     (tcp_header_valid)
    );


endmodule