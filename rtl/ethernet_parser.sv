`timescale 1ns/1ps

module ethernet_parser (
    input  logic                       clk,
    input  logic                       rst_n,

    // ============================================================
    // Input stream
    // ============================================================
    input  logic [63:0]      s_axis_tdata,
    input  logic [7:0]    s_axis_tkeep,
    input  logic                       s_axis_tvalid,
    output logic                       s_axis_tready,
    input  logic                       s_axis_tlast,

    // ============================================================
    // Output stream
    // ============================================================
    output logic [63:0]      m_axis_tdata,
    output logic [7:0]    m_axis_tkeep,
    output logic                       m_axis_tvalid,
    input  logic                       m_axis_tready,
    output logic                       m_axis_tlast,

    // ============================================================
    // Parsed Ethernet metadata
    // ============================================================
    output logic [47:0]                dst_mac,
    output logic [47:0]                src_mac,
    output logic [15:0]                ethertype,

    output logic                       ethernet_header_valid,
    output logic                       is_ipv4
);

    import network_pkg::*;


    // ============================================================
    // Internal state
    // ============================================================

    // Track our current position within the Ethernet frame.
    typedef enum logic [1:0] {
        ETH_BEAT_0,
        ETH_BEAT_1,
        ETH_PAYLOAD,
        ETH_FLUSH
    } state_t;

    state_t state;


    // Need a register than can hold 2 leftover bytes
    logic [15:0] leftover_data;

    // Other registers
    logic out_valid_reg;
    logic [63:0] out_data_reg;
    logic [7:0] out_keep_reg;
    logic out_last_reg;
    logic [3:0] valid_byte_count; // small internal count to decide whether current realigned beat can assert out_last_reg or we need one extra flush beat
    logic [1:0] flush_byte_count;

    // how many bytes in the current input beat are actually valid
    always_comb begin
        case (s_axis_tkeep)
            8'b0000_0001: valid_byte_count = 4'd1;
            8'b0000_0011: valid_byte_count = 4'd2;
            8'b0000_0111: valid_byte_count = 4'd3;
            8'b0000_1111: valid_byte_count = 4'd4;
            8'b0001_1111: valid_byte_count = 4'd5;
            8'b0011_1111: valid_byte_count = 4'd6;
            8'b0111_1111: valid_byte_count = 4'd7;
            8'b1111_1111: valid_byte_count = 4'd8;
            default:      valid_byte_count = 4'd0;
        endcase
    end

    // ============================================================
    // Handshake logic
    // ============================================================

    // Determine when input data can be accepted.
    logic input_fire;
    assign input_fire = s_axis_tvalid && s_axis_tready;
    assign s_axis_tready = (state != ETH_FLUSH) && (m_axis_tready || !out_valid_reg); // Parser can accept a new input beat when either the output register is currently empty or the downstream is ready to consume the current output beat
                                                                                      // But cannot accept when state is ETH_FLUSH


    // ============================================================
    // Output stream logic
    // ============================================================

    assign m_axis_tvalid = out_valid_reg;
    assign m_axis_tdata = out_data_reg; 
    assign m_axis_tkeep = out_keep_reg;
    assign m_axis_tlast = out_last_reg;


    // ============================================================
    // Ethernet parsing logic
    // ============================================================

    always_ff @(posedge clk) begin

        if (!rst_n) begin

            // Reset parser state and metadata.
            state <= ETH_BEAT_0;
            dst_mac <= '0;
            src_mac <= '0;
            ethertype <= '0;
            ethernet_header_valid <= 1'b0;
            is_ipv4 <= 1'b0;
            out_valid_reg <= 1'b0;
            leftover_data <= '0;
            out_keep_reg <= '0;
            out_last_reg <= 1'b0;
            flush_byte_count <= '0;
            out_data_reg <= '0;

        end

        else begin

            ethernet_header_valid <= 1'b0; // Make this a one cycle high pulse

            // No replacement was generated, existing output was consumed
            if (m_axis_tvalid && m_axis_tready) begin
                out_valid_reg <= 1'b0;
            end

            // Parse Ethernet header beat 0
            if (input_fire && state==ETH_BEAT_0) begin
                // First 6 bytes are the destination mac
                dst_mac <= {
                    s_axis_tdata[7:0],
                    s_axis_tdata[15:8],
                    s_axis_tdata[23:16],
                    s_axis_tdata[31:24],
                    s_axis_tdata[39:32],
                    s_axis_tdata[47:40]
                };
                // Last 2 bytes are the first 2 bytes of src_mac
                src_mac[47:32] <= {
                    s_axis_tdata[55:48],
                    s_axis_tdata[63:56]
                };

                is_ipv4 <= 1'b0;

                state <= ETH_BEAT_1;
            end

            // Parse Ethernet header beat 1
            else if (input_fire && state==ETH_BEAT_1) begin
                // First 4 bytes are the last 4 bytes of src_mac
                src_mac[31:0] <= {
                    s_axis_tdata[7:0],
                    s_axis_tdata[15:8],
                    s_axis_tdata[23:16],
                    s_axis_tdata[31:24]
                };
                // Last 2 bytes are the EtherType
                ethertype <= {
                    s_axis_tdata[39:32],
                    s_axis_tdata[47:40]
                };

                ethernet_header_valid <= 1'b1;
                is_ipv4 <= {s_axis_tdata[39:32], s_axis_tdata[47:40]} == ETHERTYPE_IPV4;

                leftover_data <= {s_axis_tdata[55:48], s_axis_tdata[63:56]};

                state <= ETH_PAYLOAD;
            end

            else if (input_fire && state==ETH_PAYLOAD) begin
                
                out_data_reg <= {
                    s_axis_tdata[47:40], // IP7
                    s_axis_tdata[39:32], // IP6
                    s_axis_tdata[31:24],
                    s_axis_tdata[23:16],
                    s_axis_tdata[15:8],
                    s_axis_tdata[7:0],
                    leftover_data[7:0],
                    leftover_data[15:8] // IP0
                };

                leftover_data <= {s_axis_tdata[55:48], s_axis_tdata[63:56]};

                out_valid_reg <= 1'b1;
                out_keep_reg <= 8'hFF; // all bytes are valid
                out_last_reg <= 1'b0; // not the last

                // all remaining packet bytes fit into the final output beat
                if (s_axis_tlast && valid_byte_count <= 6) begin
                    out_last_reg <= 1'b1; // last
                    state <= ETH_BEAT_0;

                    case (valid_byte_count)
                        4'd0: out_keep_reg <= 8'b0000_0011;
                        4'd1: out_keep_reg <= 8'b0000_0111;
                        4'd2: out_keep_reg <= 8'b0000_1111;
                        4'd3: out_keep_reg <= 8'b0001_1111;
                        4'd4: out_keep_reg <= 8'b0011_1111;
                        4'd5: out_keep_reg <= 8'b0111_1111;
                        4'd6: out_keep_reg <= 8'b1111_1111;
                    endcase

                end

                else if (s_axis_tlast && valid_byte_count > 6) begin
                    state <= ETH_FLUSH;
                    if (valid_byte_count == 4'd7) flush_byte_count <= 2'b01;
                    else flush_byte_count <= 2'b10;
                end

            end

            else if (state==ETH_FLUSH) begin
                if (!out_valid_reg || m_axis_tready) begin

                    // Load the final 1-2 leftover bytes
                    out_data_reg <= {
                        48'b0,
                        leftover_data[7:0],
                        leftover_data[15:8]
                    };

                    out_valid_reg <= 1'b1;
                    out_last_reg  <= 1'b1;

                    if (flush_byte_count == 2'd1)
                        out_keep_reg <= 8'b0000_0001;
                    else
                        out_keep_reg <= 8'b0000_0011;

                    // Flush beat is now stored in the output register.
                    // Parser can prepare for the next Ethernet frame.
                    state <= ETH_BEAT_0;

                    flush_byte_count <= '0;
                end
            end



        end

    end


endmodule