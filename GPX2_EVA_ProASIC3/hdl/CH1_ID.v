`timescale 1ns / 1ps

module CH1_ID( DATA_I, ID_DATA_O );
    input [31:0] DATA_I;
    output [35:0] ID_DATA_O;
    // Add ID=1 for samples from STOP1
    assign ID_DATA_O = {4'b0001, DATA_I};

endmodule

