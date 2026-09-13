module ethernet_parser #(
    parameter int DATA_WIDTH = 64
) (
    input  logic                       clk,
    input  logic                       rst_n,

    // ============================================================
    // Input stream
    // ============================================================
    input  logic [DATA_WIDTH-1:0]      s_axis_tdata,
    input  logic [DATA_WIDTH/8-1:0]    s_axis_tkeep,
    input  logic                       s_axis_tvalid,
    output logic                       s_axis_tready,
    input  logic                       s_axis_tlast,

    // ============================================================
    // Output stream
    // ============================================================
    output logic [DATA_WIDTH-1:0]      m_axis_tdata,
    output logic [DATA_WIDTH/8-1:0]    m_axis_tkeep,
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

    // TODO:
    // Track our current position within the Ethernet frame.
    typedef enum logic [1:0] {
        ETH_BEAT_0,
        ETH_BEAT_1,
        ETH_PAYLOAD
    } state_t;

    state_t state;


    // ============================================================
    // Handshake logic
    // ============================================================

    // Determine when input data can be accepted.
    logic input_fire;
    assign input_fire = s_axis_tvalid && s_axis_tready;
    assign s_axis_tready = m_axis_tready || !out_valid_reg; // Parser can accept a new input beat when either the output register is currently empty or the downstream is ready to consume the current output beat


    // ============================================================
    // Output stream logic
    // ============================================================

    // Need a register than can hold 2 leftover bytes
    logic [15:0] leftover_data;
    logic leftover_valid;

    logic out_valid_reg;

    // Ethernet parser is a pass-through stage: inspects the incoming beats to extract Ethernet metadata, but it doesn't modify or remove any bytes
    // Forward the packet stream toward the IPv4 parser.
    assign m_axis_tvalid = out_valid_reg;


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
            leftover_valid <= 1'b0;

        end

        else begin

            ethernet_header_valid <= 1'b0; // Make this a one cycle high pulse

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
                leftover_valid <= 1'b1;

                state <= ETH_PAYLOAD;
            end

            else if (input_fire && state==ETH_PAYLOAD) begin
                if (s_axis_tlast) state <= ETH_BEAT_0; // current Ethernet frame has ended
                
                m_axis_tdata <= {
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
            end

            // No replacement was generated, existing output was consumed
            else if (m_axis_tvalid && m_axis_tready) begin
                out_valid_reg <= 1'b0;
            end

        end

    end


endmodule