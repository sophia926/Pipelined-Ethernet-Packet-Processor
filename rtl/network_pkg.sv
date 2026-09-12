/*
This file creates a SystemVerilog package containing definitions that can be shared across modules.
*/

package network_pkg;

    // ============================================================
    // Ethernet Constants
    // ============================================================

    localparam logic [15:0] ETHERTYPE_IPV4 = 16'h0800; // Defines Ethernet EtherType value that identifies an IPv4 packet
    localparam logic [15:0] ETHERTYPE_ARP  = 16'h0806; // Defines Ethernet EtherType value that identifies an ARP packet

    localparam int ETH_HEADER_BYTES = 14; // Standard Ethernet header length is 14 bytes


    // ============================================================
    // IPv4 Constants
    // ============================================================

    localparam logic [3:0] IPV4_VERSION = 4'd4; // Expected IP version field for IPv4 is 4

    localparam logic [7:0] IP_PROTOCOL_TCP = 8'd6; // IPv4 protocol number 6 means the payload is TCP
    localparam logic [7:0] IP_PROTOCOL_UDP = 8'd17; // IPv4 protocol number 17 means the payload is UDP

    localparam int IPV4_MIN_HEADER_BYTES = 20; // Minimum IPv4 header size is 20 bytes


    // ============================================================
    // TCP Constants
    // ============================================================

    localparam int TCP_MIN_HEADER_BYTES = 20; // Minimum TCP header size is 20 bytes


    // ============================================================
    // Packet Metadata
    // ============================================================

    typedef struct packed { // Packed group of signals that will hold all parsed packet metadata

        // --------------------------------------------------------
        // Ethernet metadata
        // --------------------------------------------------------

        logic [47:0] dst_mac; // Packet's 48-bit destination MAC address
        logic [47:0] src_mac; // Packet's 58-bit source MAC address
        logic [15:0] ethertype; // Ethernet EtherType identifying the next protocol


        // --------------------------------------------------------
        // IPv4 metadata
        // --------------------------------------------------------

        logic [31:0] src_ip; // 32-bit IPv4 source address
        logic [31:0] dst_ip; // 32-bit IPv4 destination address

        logic [15:0] ip_total_length; // Total size in bytes of the IPv4 packet, including the header

        logic [7:0]  ip_protocol; // IPv4 protocol field, such as 6 for TCP
        logic [3:0]  ip_ihl; // IPv4 Internet Header Length field, specifying the header length in 32-bit words


        // --------------------------------------------------------
        // TCP metadata
        // --------------------------------------------------------

        logic [15:0] src_port; // 16-bit TCP source port
        logic [15:0] dst_port; // 16-bit TCP destination port

        logic [31:0] sequence_number; // TCP sequence number used to identify the position of TCP data
        logic [31:0] acknowledgment_number; // TCP acknowledgement number

        logic [3:0] tcp_data_offset; // TCP header length in units of 32-bit words

        logic tcp_fin; // TCP FIN flag (connection termination)
        logic tcp_syn; // TCP SYN flag (establish a connection)
        logic tcp_rst; // TCP RST flag (resets a connection)
        logic tcp_psh; // TCP PSH flag (requesting that received data be promptly delivered)
        logic tcp_ack; // TCP ACK flag (acknowledgement field is valid)


        // --------------------------------------------------------
        // Packet status
        // --------------------------------------------------------

        logic valid_ethernet; // Ethernet header was successfully recognized/parsed
        logic valid_ipv4; // Packet contains a valid/supported IPv4 header
        logic valid_tcp; // Packet contains a valid/supported TCP header

        logic drop_packet; // Packet shouldn't continue to the final output

    } packet_metadata_t;


endpackage