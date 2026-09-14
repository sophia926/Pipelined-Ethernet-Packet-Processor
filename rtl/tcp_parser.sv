`timescale 1ns/1ps

module tcp_parser (
    input  logic        clk,
    input  logic        rst_n,

    // ============================================================
    // Input TCP stream
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
    // Parsed TCP metadata
    // ============================================================
    output logic [15:0] src_port,
    output logic [15:0] dst_port,

    output logic [31:0] seq_num,
    output logic [31:0] ack_num,

    output logic [3:0]  tcp_data_offset,
    output logic [8:0]  tcp_flags,

    output logic        tcp_header_valid
);

    import network_pkg::*;


    // ============================================================
    // State
    // ============================================================

    typedef enum logic [2:0] {
        TCP_HEADER,
        TCP_OPTIONS,
        TCP_PAYLOAD,
        TCP_FLUSH
    } state_t;

    state_t state;


    // ============================================================
    // Header tracking
    // ============================================================

    logic [7:0] byte_count;
    logic [7:0] header_bytes;


    // ============================================================
    // Payload realignment
    // ============================================================

    // TCP header length is always a multiple of 4 bytes.
    // On a 64-bit interface, the payload therefore begins
    // either at lane 0 or lane 4.
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

    assign s_axis_tready =
        (state != TCP_FLUSH) &&
        (m_axis_tready || !out_valid_reg);


    // ============================================================
    // Output assignments
    // ============================================================

    assign m_axis_tdata  = out_data_reg;
    assign m_axis_tkeep  = out_keep_reg;
    assign m_axis_tvalid = out_valid_reg;
    assign m_axis_tlast  = out_last_reg;


    // ============================================================
    // TCP parser
    // ============================================================

    always_ff @(posedge clk) begin

        if (!rst_n) begin

            state <= TCP_HEADER;

            byte_count      <= '0;
            header_bytes    <= '0;

            shift_reg       <= '0;
            leftover_count  <= '0;

            out_data_reg    <= '0;
            out_keep_reg    <= '0;
            out_valid_reg   <= 1'b0;
            out_last_reg    <= 1'b0;

            src_port        <= '0;
            dst_port        <= '0;
            seq_num         <= '0;
            ack_num         <= '0;
            tcp_data_offset <= '0;
            tcp_flags       <= '0;

            tcp_header_valid <= 1'b0;

        end

        else begin

            // One-cycle pulse
            tcp_header_valid <= 1'b0;

            // Existing output beat consumed
            if (m_axis_tvalid && m_axis_tready)
                out_valid_reg <= 1'b0;


            // ====================================================
            // TCP HEADER
            // ====================================================

            if (state == TCP_HEADER && input_fire) begin

                // ------------------------------------------------
                // Beat 0: TCP bytes 0-7
                // ------------------------------------------------
                if (byte_count == 8'd0) begin

                    // TCP bytes 0-1: source port
                    src_port <= {
                        s_axis_tdata[7:0],
                        s_axis_tdata[15:8]
                    };

                    // TCP bytes 2-3: destination port
                    dst_port <= {
                        s_axis_tdata[23:16],
                        s_axis_tdata[31:24]
                    };

                    // TCP bytes 4-7: sequence number
                    seq_num <= {
                        s_axis_tdata[39:32],
                        s_axis_tdata[47:40],
                        s_axis_tdata[55:48],
                        s_axis_tdata[63:56]
                    };

                    byte_count <= 8'd8;
                end


                // ------------------------------------------------
                // Beat 1: TCP bytes 8-15
                // ------------------------------------------------
                else if (byte_count == 8'd8) begin

                    // TCP bytes 8-11: acknowledgement number
                    ack_num <= {
                        s_axis_tdata[7:0],
                        s_axis_tdata[15:8],
                        s_axis_tdata[23:16],
                        s_axis_tdata[31:24]
                    };

                    // TCP byte 12:
                    // bits 7:4 = Data Offset
                    tcp_data_offset <= s_axis_tdata[39:36];

                    // Header length = Data Offset * 4
                    header_bytes <= {
                        2'b00,
                        s_axis_tdata[39:36],
                        2'b00
                    };

                    // TCP flags:
                    //
                    // byte 12 bit 0 = NS
                    // byte 13 bits 7:0 =
                    // CWR ECE URG ACK PSH RST SYN FIN
                    tcp_flags <= {
                        s_axis_tdata[32],
                        s_axis_tdata[47:40]
                    };

                    byte_count <= 8'd16;
                end


                // ------------------------------------------------
                // Beat 2: TCP bytes 16-23
                // ------------------------------------------------
                else if (byte_count == 8'd16) begin

                    // Minimum TCP header = 20 bytes
                    if (header_bytes == 8'd20) begin

                        // Bytes 20-23 are already payload bytes 0-3
                        shift_reg <= {
                            s_axis_tdata[63:56],
                            s_axis_tdata[55:48],
                            s_axis_tdata[47:40],
                            s_axis_tdata[39:32]
                        };

                        leftover_count <= 4'd4;

                        tcp_header_valid <= 1'b1;

                        state <= TCP_PAYLOAD;
                    end


                    // 24-byte TCP header ends exactly
                    // at the end of this beat
                    else if (header_bytes == 8'd24) begin

                        leftover_count <= 4'd0;

                        tcp_header_valid <= 1'b1;

                        state <= TCP_PAYLOAD;
                    end


                    // Longer TCP header contains options
                    else begin

                        state <= TCP_OPTIONS;
                    end

                    byte_count <= 8'd24;
                end
            end


            // ====================================================
            // TCP OPTIONS
            // ====================================================

            else if (state == TCP_OPTIONS && input_fire) begin

                // Header ends halfway through current beat
                //
                // Example:
                // byte_count   = 24
                // header_bytes = 28
                //
                // lanes 0-3 = TCP options
                // lanes 4-7 = payload bytes 0-3
                if (header_bytes == byte_count + 8'd4) begin

                    shift_reg <= {
                        s_axis_tdata[63:56],
                        s_axis_tdata[55:48],
                        s_axis_tdata[47:40],
                        s_axis_tdata[39:32]
                    };

                    leftover_count <= 4'd4;

                    tcp_header_valid <= 1'b1;

                    state <= TCP_PAYLOAD;
                end


                // Header ends exactly at end of current beat
                else if (header_bytes == byte_count + 8'd8) begin

                    leftover_count <= 4'd0;

                    tcp_header_valid <= 1'b1;

                    state <= TCP_PAYLOAD;
                end


                // TCP options continue
                else begin
                    byte_count <= byte_count + 8'd8;
                end
            end


            // ====================================================
            // TCP PAYLOAD
            // ====================================================

            else if (state == TCP_PAYLOAD && input_fire) begin

                // ------------------------------------------------
                // Payload already aligned
                // ------------------------------------------------
                if (leftover_count == 4'd0) begin

                    out_data_reg  <= s_axis_tdata;
                    out_keep_reg  <= s_axis_tkeep;
                    out_last_reg  <= s_axis_tlast;
                    out_valid_reg <= 1'b1;

                    if (s_axis_tlast) begin
                        state      <= TCP_HEADER;
                        byte_count <= 8'd0;
                    end
                end


                // ------------------------------------------------
                // Four saved payload bytes
                // ------------------------------------------------
                else if (leftover_count == 4'd4) begin

                    // saved payload bytes 0-3
                    // +
                    // new payload bytes 4-7
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


                    // --------------------------------------------
                    // Not final input beat
                    // --------------------------------------------
                    if (!s_axis_tlast) begin

                        out_keep_reg <= 8'hFF;
                        out_last_reg <= 1'b0;

                        shift_reg <= {
                            s_axis_tdata[63:56],
                            s_axis_tdata[55:48],
                            s_axis_tdata[47:40],
                            s_axis_tdata[39:32]
                        };
                    end


                    // --------------------------------------------
                    // Final input beat
                    // --------------------------------------------
                    else begin

                        case (s_axis_tkeep)

                            // 4 saved + 1 new = 5 bytes
                            8'b0000_0001: begin
                                out_keep_reg <= 8'b0001_1111;
                                out_last_reg <= 1'b1;

                                state           <= TCP_HEADER;
                                byte_count      <= 8'd0;
                                leftover_count  <= 4'd0;
                            end


                            // 4 saved + 2 new = 6 bytes
                            8'b0000_0011: begin
                                out_keep_reg <= 8'b0011_1111;
                                out_last_reg <= 1'b1;

                                state           <= TCP_HEADER;
                                byte_count      <= 8'd0;
                                leftover_count  <= 4'd0;
                            end


                            // 4 saved + 3 new = 7 bytes
                            8'b0000_0111: begin
                                out_keep_reg <= 8'b0111_1111;
                                out_last_reg <= 1'b1;

                                state           <= TCP_HEADER;
                                byte_count      <= 8'd0;
                                leftover_count  <= 4'd0;
                            end


                            // 4 saved + 4 new = 8 bytes
                            8'b0000_1111: begin
                                out_keep_reg <= 8'hFF;
                                out_last_reg <= 1'b1;

                                state           <= TCP_HEADER;
                                byte_count      <= 8'd0;
                                leftover_count  <= 4'd0;
                            end


                            // 4 saved + 5 new
                            // First output is full,
                            // 1 byte must be flushed
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
                                state <= TCP_FLUSH;
                            end


                            // 2-byte flush
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
                                state <= TCP_FLUSH;
                            end


                            // 3-byte flush
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
                                state <= TCP_FLUSH;
                            end


                            // 4-byte flush
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
                                state <= TCP_FLUSH;
                            end

                        endcase
                    end
                end
            end


            // ====================================================
            // TCP FLUSH
            // ====================================================

            else if (state == TCP_FLUSH) begin

                // Wait until output register can accept the flush beat
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

                    // Packet complete
                    state           <= TCP_HEADER;
                    byte_count      <= 8'd0;
                    leftover_count  <= 4'd0;
                end
            end

        end
    end

endmodule