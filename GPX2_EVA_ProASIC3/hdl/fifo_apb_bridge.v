`timescale 1ns / 1ps

module fifo_apb_bridge (
    input  wire        PCLK,
    input  wire        PRESETN,

    // APB slave interface
    input  wire [7:0]  PADDR,
    input  wire        PSEL,
    input  wire        PENABLE,
    input  wire        PWRITE,
    input  wire [7:0]  PWDATA,
    output reg  [7:0]  PRDATA,
    output wire        PREADY,
    output wire        PSLVERR,

    // Interface to FIFO
    input  wire [35:0] FIFO_Q,
    input  wire        FIFO_EMPTY,
    output wire        FIFO_RE,

    // Control flag to CoreABC
    output wire        DATA_AVAIL
);

    assign PREADY     = 1'b1;
    assign PSLVERR    = 1'b0;
    assign DATA_AVAIL = ~FIFO_EMPTY;

    // Write any byte to address 0x00 to take FIFO sample
    assign FIFO_RE = PSEL & PENABLE & PWRITE & (PADDR[4:2] == 3'd0) & ~FIFO_EMPTY;

    // Reading from registers 0x04-0x14 outputs one byte from FIFO sample
    always @(*) begin
        case (PADDR[4:2])
            3'd0:    PRDATA = {7'b0, ~FIFO_EMPTY};              // Offset 0x00: Status
            3'd1:    PRDATA = FIFO_Q[7:0];                      // Offset 0x04: Byte 0 (LSB)
            3'd2:    PRDATA = FIFO_Q[15:8];                     // Offset 0x08: Byte 1
            3'd3:    PRDATA = FIFO_Q[23:16];                    // Offset 0x0C: Byte 2
            3'd4:    PRDATA = FIFO_Q[31:24];                    // Offset 0x10: Byte 3 (MSB)
            3'd5:    PRDATA = {4'b0000, FIFO_Q[35:32]};         // Offset 0x14: Channel ID byte (todo)
            default: PRDATA = 8'h00;
        endcase
    end
endmodule