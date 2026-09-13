`timescale 1ns/1ps

module ipv4_parser (
    input  logic        clk,
    input  logic        rst_n,

    // ============================================================
    // Input stream
    // ============================================================
    input  logic [63:0] s_axis_tdata,
    input  logic [7:0]  s_axis_tkeep,
    input  logic        s_axis_tvalid,
    output logic        s_axis_tready,
    input  logic        s_axis_tlast,

    // ============================================================
    // Output stream
    // ============================================================
    output logic [63:0] m_axis_tdata,
    output logic [7:0]  m_axis_tkeep,
    output logic        m_axis_tvalid,
    input  logic        m_axis_tready,
    output logic        m_axis_tlast,

    // ============================================================
    // Parsed IPv4 metadata
    // ============================================================
    output logic [31:0] src_ip,
    output logic [31:0] dst_ip,
    output logic [15:0] ip_total_length,
    output logic [7:0]  ip_protocol,
    output logic [3:0]  ip_ihl,

    output logic        ipv4_header_valid,
    output logic        is_tcp
);

    import network_pkg::*;


    // ============================================================
    // Internal state
    // ============================================================

    typedef enum logic [2:0] {
        IP_HEADER,
        IP_OPTIONS,
        IP_PAYLOAD,
        IP_FLUSH
    } state_t;

    state_t state;


    // ============================================================
    // Header tracking
    // ============================================================

    logic [7:0] byte_count;
    logic [7:0] header_bytes;


    // ============================================================
    // Realignment storage
    // ============================================================

    logic [31:0] shift_reg;
    logic [3:0]  leftover_count;


    // ============================================================
    // Output registers
    // ============================================================

    logic [63:0] out_data_reg;
    logic [7:0]  out_keep_reg;
    logic        out_valid_reg;
    logic        out_last_reg;


    // ============================================================
    // Handshake logic
    // ============================================================

    logic input_fire;

    assign input_fire = s_axis_tvalid && s_axis_tready;
    assign s_axis_tready = (state != IP_FLUSH) && (m_axis_tready || !out_valid_reg);
    // Accept input when output register is empty or when downstream is consuming the existing output


    // ============================================================
    // Output assignments
    // ============================================================

    assign m_axis_tdata  = out_data_reg;
    assign m_axis_tkeep  = out_keep_reg;
    assign m_axis_tvalid = out_valid_reg;
    assign m_axis_tlast  = out_last_reg;


    // ============================================================
    // IPv4 parsing logic
    // ============================================================

    always_ff @(posedge clk) begin

        if (!rst_n) begin

            state <= IP_HEADER;
            shift_reg <= '0;
            byte_count <= '0;
            header_bytes <= '0;
            leftover_count <= '0;
            out_data_reg <= '0;
            out_keep_reg <= '0;
            out_valid_reg <= 1'b0;
            out_last_reg <= 1'b0;
            src_ip            <= '0;
            dst_ip            <= '0;
            ip_total_length   <= '0;
            ip_protocol       <= '0;
            ip_ihl            <= '0;
            ipv4_header_valid <= 1'b0;
            is_tcp            <= 1'b0;
        end

        else begin

            // Make ipv4_header_valid a one-cycle pulse
            ipv4_header_valid <= 1'b0;

            // Clear out_valid_reg when output gets consumed
            if (m_axis_tvalid && m_axis_tready) out_valid_reg <= 1'b0;

            // Parse IPv4 header bytes

            if (state == IP_HEADER && input_fire) begin

                // First IPv4 beat is accepted
                if (byte_count == '0) begin

                    is_tcp <= 1'b0;

                    // Byte 0 of the packet contains Version & IHL
                    ip_ihl <= s_axis_tdata[3:0]; // data[7:4] is version
                    header_bytes <= {2'b00, s_axis_tdata[3:0], 2'b00};

                    // Total length field is in bytes 2 and 3 of the packet
                    ip_total_length <= {
                        s_axis_tdata[23:16],
                        s_axis_tdata[31:24]
                    };

                    byte_count <= byte_count + 8'd8;
                end

                // Second IPv4 beat
                else if (byte_count == 8'd8) begin
                    // Protocol is in byte lane 1 of this beat
                    ip_protocol <= s_axis_tdata[15:8];
                    
                    // Source IP address is in lanes 4-7 of this beat
                    src_ip <= {
                        s_axis_tdata[39:32],
                        s_axis_tdata[47:40],
                        s_axis_tdata[55:48],
                        s_axis_tdata[63:56]
                    };

                    byte_count <= byte_count + 8'd8;
                end

                // Third IPv4 beat
                else if (byte_count == 8'd16) begin
                    // Destination IP is in lanes 0-3 of this beat
                    dst_ip <= {
                        s_axis_tdata[7:0],
                        s_axis_tdata[15:8],
                        s_axis_tdata[23:16],
                        s_axis_tdata[31:24]
                    };

                    // Minimum IPv4 header is complete when IHL = 5
                    if (header_bytes == 8'd20) begin

                        // No IPv4 options. Bytes 20-23 are already TCP bytes 0-3.

                        ipv4_header_valid <= 1'b1;
                        is_tcp <= (ip_protocol == IP_PROTOCOL_TCP);
                        leftover_count <= 4'd4;

                        shift_reg <= {
                            s_axis_tdata[63:56],  // TCP byte 3
                            s_axis_tdata[55:48],  // TCP byte 2
                            s_axis_tdata[47:40],  // TCP byte 1
                            s_axis_tdata[39:32]   // TCP byte 0
                        };

                        state <= IP_PAYLOAD;

                    end

                    else if (header_bytes == 8'd24) begin
                        // Header ended exactly at the end of this beat

                        leftover_count <= 4'd0;

                        ipv4_header_valid <= 1'b1;
                        is_tcp <= (ip_protocol == IP_PROTOCOL_TCP);
                        state <= IP_PAYLOAD;
                    end

                    else begin
                        // IPv4 options continue after byte 19. Bytes 20-23 are still part of the IPv4 header.
                        state <= IP_OPTIONS;
                    end

                    byte_count <= byte_count + 8'd8;
                end

            end

            else if (state==IP_OPTIONS && input_fire) begin
                // Case 1: header ends halfway through this beat
                // Example: byte_count = 24, header_bytes = 28
                // Lanes 0-3 = IPv4 options, lanes 4-7 = TCP bytes 0-3
                if (header_bytes == byte_count + 8'd4) begin
                    shift_reg <= {
                        s_axis_tdata[63:56],
                        s_axis_tdata[55:48],
                        s_axis_tdata[47:40],
                        s_axis_tdata[39:32]
                    };

                    leftover_count <= 4'd4;

                    ipv4_header_valid <= 1'b1;
                    is_tcp <= (ip_protocol == IP_PROTOCOL_TCP);

                    state <= IP_PAYLOAD;
                end

                // Case 2: Header ends exactly at the end of this beat
                // Example byte_count = 24, header_bytes = 32
                // All 8 bytes are IPv4 options
                else if (header_bytes == byte_count + 8'd8) begin
                    leftover_count <= 4'd0;
                    ipv4_header_valid <= 1'b1;
                    is_tcp <= (ip_protocol == IP_PROTOCOL_TCP);
                    state <= IP_PAYLOAD;
                end

                // Ccase 3: Header continues beyond this beat
                else begin
                    byte_count <= byte_count + 8'd8;
                end
            end

            else if (state == IP_PAYLOAD && input_fire) begin

                // ============================================================
                // Case 1: No leftover bytes
                // IPv4 header ended exactly on an 8-byte boundary.
                // Input TCP beat is already aligned.
                // ============================================================
                if (leftover_count == 4'd0) begin

                    out_data_reg  <= s_axis_tdata;
                    out_keep_reg  <= s_axis_tkeep;
                    out_last_reg  <= s_axis_tlast;
                    out_valid_reg <= 1'b1;

                    // Packet is finished
                    if (s_axis_tlast) begin
                        state      <= IP_HEADER;
                        byte_count <= 8'd0;
                    end
                end


                // ============================================================
                // Case 2: Four leftover TCP bytes
                // IPv4 header ended halfway through a beat.
                // ============================================================
                else if (leftover_count == 4'd4) begin

                    // Form output from:
                    // 4 saved bytes + first 4 bytes of current input
                    out_data_reg <= {
                        s_axis_tdata[31:24],
                        s_axis_tdata[23:16],
                        s_axis_tdata[15:8],
                        s_axis_tdata[7:0],
                        shift_reg[31:24],
                        shift_reg[23:16],
                        shift_reg[15:8],
                        shift_reg[7:0]
                    };

                    out_valid_reg <= 1'b1;


                    // --------------------------------------------------------
                    // Not the final input beat
                    // --------------------------------------------------------
                    if (!s_axis_tlast) begin

                        out_keep_reg <= 8'hFF;
                        out_last_reg <= 1'b0;

                        // Save input bytes 4-7 for next output beat
                        shift_reg <= {
                            s_axis_tdata[63:56],
                            s_axis_tdata[55:48],
                            s_axis_tdata[47:40],
                            s_axis_tdata[39:32]
                        };
                    end


                    // --------------------------------------------------------
                    // Final input beat
                    // --------------------------------------------------------
                    else begin

                        case (s_axis_tkeep)

                            // 1 valid new byte:
                            // 4 saved + 1 new = 5 output bytes
                            8'b0000_0001: begin
                                out_keep_reg <= 8'b0001_1111;
                                out_last_reg <= 1'b1;

                                state      <= IP_HEADER;
                                byte_count <= 8'd0;
                                leftover_count <= 4'd0;
                            end


                            // 2 valid new bytes:
                            // 4 saved + 2 new = 6 output bytes
                            8'b0000_0011: begin
                                out_keep_reg <= 8'b0011_1111;
                                out_last_reg <= 1'b1;

                                state      <= IP_HEADER;
                                byte_count <= 8'd0;
                                leftover_count <= 4'd0;
                            end


                            // 3 valid new bytes:
                            // 4 saved + 3 new = 7 output bytes
                            8'b0000_0111: begin
                                out_keep_reg <= 8'b0111_1111;
                                out_last_reg <= 1'b1;

                                state      <= IP_HEADER;
                                byte_count <= 8'd0;
                                leftover_count <= 4'd0;
                            end


                            // 4 valid new bytes:
                            // 4 saved + 4 new = exactly 8 output bytes
                            8'b0000_1111: begin
                                out_keep_reg <= 8'hFF;
                                out_last_reg <= 1'b1;

                                state      <= IP_HEADER;
                                byte_count <= 8'd0;
                                leftover_count <= 4'd0;
                            end


                            // 5 valid new bytes:
                            // First 4 fill current output.
                            // 1 byte remains for flush.
                            8'b0001_1111: begin
                                out_keep_reg <= 8'hFF;
                                out_last_reg <= 1'b0;

                                shift_reg <= {
                                    s_axis_tdata[63:56],
                                    s_axis_tdata[55:48],
                                    s_axis_tdata[47:40],
                                    s_axis_tdata[39:32]
                                };

                                leftover_count <= 4'd1;
                                state <= IP_FLUSH;
                            end


                            // 6 valid new bytes:
                            // 2 bytes remain for flush.
                            8'b0011_1111: begin
                                out_keep_reg <= 8'hFF;
                                out_last_reg <= 1'b0;

                                shift_reg <= {
                                    s_axis_tdata[63:56],
                                    s_axis_tdata[55:48],
                                    s_axis_tdata[47:40],
                                    s_axis_tdata[39:32]
                                };

                                leftover_count <= 4'd2;
                                state <= IP_FLUSH;
                            end


                            // 7 valid new bytes:
                            // 3 bytes remain for flush.
                            8'b0111_1111: begin
                                out_keep_reg <= 8'hFF;
                                out_last_reg <= 1'b0;

                                shift_reg <= {
                                    s_axis_tdata[63:56],
                                    s_axis_tdata[55:48],
                                    s_axis_tdata[47:40],
                                    s_axis_tdata[39:32]
                                };

                                leftover_count <= 4'd3;
                                state <= IP_FLUSH;
                            end


                            // 8 valid new bytes:
                            // 4 bytes remain for flush.
                            8'b1111_1111: begin
                                out_keep_reg <= 8'hFF;
                                out_last_reg <= 1'b0;

                                shift_reg <= {
                                    s_axis_tdata[63:56],
                                    s_axis_tdata[55:48],
                                    s_axis_tdata[47:40],
                                    s_axis_tdata[39:32]
                                };

                                leftover_count <= 4'd4;
                                state <= IP_FLUSH;
                            end

                        endcase
                    end
                end
            end

            else if (state == IP_FLUSH) begin
                // Only load a new flush beat if the output register
                // is empty or the current output is being consumed.
                if (!out_valid_reg || m_axis_tready) begin

                    out_data_reg <= {
                        32'b0,
                        shift_reg
                    };

                    out_valid_reg <= 1'b1;
                    out_last_reg  <= 1'b1;

                    case (leftover_count)
                        4'd1: out_keep_reg <= 8'b0000_0001;
                        4'd2: out_keep_reg <= 8'b0000_0011;
                        4'd3: out_keep_reg <= 8'b0000_0111;
                        4'd4: out_keep_reg <= 8'b0000_1111;
                    endcase

                    // Packet is now completely finished
                    state          <= IP_HEADER;
                    byte_count     <= 8'd0;
                    leftover_count <= 4'd0;
                end
            end


        end

    end


endmodule