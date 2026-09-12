/*
Accepts one 64-bit beat from upstream, stores it, and forwards it downstream using valid/ready handshaking.
*/
`timescale 1ns/1ps

module axis_register #(
    parameter int DATA_WIDTH = 64
) (
    input  logic                      clk,
    input  logic                      rst_n,

    // ============================================================
    // Input stream
    // ============================================================
    input  logic [DATA_WIDTH-1:0]     s_axis_tdata,
    input  logic [DATA_WIDTH/8-1:0]   s_axis_tkeep,
    input  logic                      s_axis_tvalid,
    output logic                      s_axis_tready,
    input  logic                      s_axis_tlast,

    // ============================================================
    // Output stream
    // ============================================================
    output logic [DATA_WIDTH-1:0]     m_axis_tdata,
    output logic [DATA_WIDTH/8-1:0]   m_axis_tkeep,
    output logic                      m_axis_tvalid,
    input  logic                      m_axis_tready,
    output logic                      m_axis_tlast
);

    // ============================================================
    // Internal storage
    // ============================================================

    logic [DATA_WIDTH-1:0]     data_reg;
    logic [DATA_WIDTH/8-1:0]   keep_reg;
    logic                      last_reg;
    logic                      valid_reg;


    // ============================================================
    // Combinational outputs
    // ============================================================

    assign m_axis_tdata  = data_reg;
    assign m_axis_tkeep  = keep_reg;
    assign m_axis_tlast  = last_reg;
    assign m_axis_tvalid = valid_reg;

    // This register can accept a new input beat.
    assign s_axis_tready = !valid_reg || m_axis_tready; // register is currently empty, or register is full but downstream side is ready to consume the current beat this cycle


    // ============================================================
    // Sequential logic
    // ============================================================

    always_ff @(posedge clk) begin

        if (!rst_n) begin
            data_reg  <= '0;
            keep_reg  <= '0;
            last_reg  <= 1'b0;
            valid_reg <= 1'b0;
        end

        else begin

            // Accepting a new beat
            if (s_axis_tvalid && s_axis_tready) begin
                // Store incoming data into their registers
                data_reg <= s_axis_tdata;
                keep_reg <= s_axis_tkeep;
                last_reg <= s_axis_tlast;
                valid_reg <= 1'b1;
            end

            // Old beat consumed, no new beat arrives
            else if (m_axis_tready && m_axis_tvalid) begin // !(s_axis_tvalid && s_axis_tready) is implied by else if
                valid_reg <= 1'b0;
                // No need to clear the registers, because valid_reg = 1'b0 tells us the data in the registers is invalid
            end

            // Stall case: register has valid data, downstream is not ready -> no need for code
        end

    end

endmodule