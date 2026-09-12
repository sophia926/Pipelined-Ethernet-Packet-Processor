package network_pkg;

    // ============================================================
    // Ethernet Constants
    // ============================================================

    localparam logic [15:0] ETHERTYPE_IPV4 = 16'h0800;
    localparam logic [15:0] ETHERTYPE_ARP  = 16'h0806;

    localparam int ETH_HEADER_BYTES = 14;


    // ============================================================
    // IPv4 Constants
    // ============================================================

    localparam logic [3:0] IPV4_VERSION = 4'd4;

    localparam logic [7:0] IP_PROTOCOL_TCP = 8'd6;
    localparam logic [7:0] IP_PROTOCOL_UDP = 8'd17;

    localparam int IPV4_MIN_HEADER_BYTES = 20;


    // ============================================================
    // TCP Constants
    // ============================================================

    localparam int TCP_MIN_HEADER_BYTES = 20;


    // ============================================================
    // Packet Metadata
    // ============================================================

    typedef struct packed {

        // --------------------------------------------------------
        // Ethernet metadata
        // --------------------------------------------------------

        logic [47:0] dst_mac;
        logic [47:0] src_mac;
        logic [15:0] ethertype;


        // --------------------------------------------------------
        // IPv4 metadata
        // --------------------------------------------------------

        logic [31:0] src_ip;
        logic [31:0] dst_ip;

        logic [15:0] ip_total_length;

        logic [7:0]  ip_protocol;
        logic [3:0]  ip_ihl;


        // --------------------------------------------------------
        // TCP metadata
        // --------------------------------------------------------

        logic [15:0] src_port;
        logic [15:0] dst_port;

        logic [31:0] sequence_number;
        logic [31:0] acknowledgment_number;

        logic [3:0] tcp_data_offset;

        logic tcp_fin;
        logic tcp_syn;
        logic tcp_rst;
        logic tcp_psh;
        logic tcp_ack;


        // --------------------------------------------------------
        // Packet status
        // --------------------------------------------------------

        logic valid_ethernet;
        logic valid_ipv4;
        logic valid_tcp;

        logic drop_packet;

    } packet_metadata_t;


endpackage