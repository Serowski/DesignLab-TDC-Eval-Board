`timescale 1ns / 1ps

module falling_edge_detector #(
    parameter FRAME_WIDTH = 32
)(
    input wire clk,
    input wire reset_n,
    input wire frame_sig,       // FRAME signal from TDC
    output wire fifo_we,        // Strobe to latch the data in FIFO
    output wire shift_reg_en    // Enable signal for shift-register INREG_CH1
);

    reg active;
    reg we_q;
    // Counter for FRAME_WIDTH pulses
    reg [5:0] cnt_q;

    assign shift_reg_en = active | frame_sig;
    assign fifo_we      = we_q;

    always @(negedge clk or negedge reset_n) begin
        if(!reset_n) begin
            active  <= 1'b0;
            we_q    <= 1'b1;
            cnt_q   <= 6'd0;
        end else begin
            we_q <= 1'b1;
            
            if(!active) begin
                if(frame_sig) begin
                    active  <= 1'b1;
                    cnt_q   <= 6'b1;
                end 
            end else begin
                if(cnt_q == (FRAME_WIDTH-1)) begin
                    active  <= 1'b0;
                    cnt_q   <= 6'd0;
                    we_q    <= 1'b0;
                end else begin
                    cnt_q <= cnt_q + 6'd1;
                end
            end
        end
    end

endmodule
