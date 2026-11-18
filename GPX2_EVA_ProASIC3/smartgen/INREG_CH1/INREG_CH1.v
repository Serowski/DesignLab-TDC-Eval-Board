`timescale 1 ns/100 ps
// Version: v11.9 SP6 11.9.6.7


module INREG_CH1(
       Shiften,
       Shiftin,
       Aclr,
       Clock,
       Q
    );
input  Shiften;
input  Shiftin;
input  Aclr;
input  Clock;
output [31:0] Q;

    wire BUFF_5_Y, BUFF_4_Y, BUFF_3_Y, BUFF_1_Y, BUFF_0_Y, BUFF_2_Y, 
        INV_3_Y, INV_0_Y, INV_2_Y, INV_1_Y, MX2_29_Y, MX2_27_Y, 
        MX2_11_Y, MX2_28_Y, MX2_17_Y, MX2_3_Y, MX2_25_Y, MX2_6_Y, 
        MX2_26_Y, MX2_23_Y, MX2_12_Y, MX2_31_Y, MX2_22_Y, MX2_30_Y, 
        MX2_24_Y, MX2_1_Y, MX2_19_Y, MX2_5_Y, MX2_15_Y, MX2_0_Y, 
        MX2_7_Y, MX2_4_Y, MX2_8_Y, MX2_16_Y, MX2_13_Y, MX2_18_Y, 
        MX2_21_Y, MX2_2_Y, MX2_14_Y, MX2_20_Y, MX2_9_Y, MX2_10_Y;
    
    MX2 MX2_18 (.A(Q[8]), .B(Q[7]), .S(BUFF_4_Y), .Y(MX2_18_Y));
    MX2 MX2_12 (.A(Q[31]), .B(Q[30]), .S(BUFF_2_Y), .Y(MX2_12_Y));
    MX2 MX2_10 (.A(Q[26]), .B(Q[25]), .S(BUFF_0_Y), .Y(MX2_10_Y));
    MX2 MX2_7 (.A(Q[14]), .B(Q[13]), .S(BUFF_3_Y), .Y(MX2_7_Y));
    MX2 MX2_15 (.A(Q[4]), .B(Q[3]), .S(BUFF_5_Y), .Y(MX2_15_Y));
    MX2 MX2_26 (.A(Q[24]), .B(Q[23]), .S(BUFF_0_Y), .Y(MX2_26_Y));
    BUFF BUFF_0 (.A(Shiften), .Y(BUFF_0_Y));
    DFN0C1 \DFN0C1_Q[29]  (.D(MX2_25_Y), .CLK(Clock), .CLR(INV_1_Y), 
        .Q(Q[29]));
    INV INV_3 (.A(Aclr), .Y(INV_3_Y));
    MX2 MX2_16 (.A(Q[28]), .B(Q[27]), .S(BUFF_2_Y), .Y(MX2_16_Y));
    DFN0C1 \DFN0C1_Q[15]  (.D(MX2_30_Y), .CLK(Clock), .CLR(INV_0_Y), 
        .Q(Q[15]));
    DFN0C1 \DFN0C1_Q[10]  (.D(MX2_9_Y), .CLK(Clock), .CLR(INV_0_Y), .Q(
        Q[10]));
    MX2 MX2_2 (.A(Q[11]), .B(Q[10]), .S(BUFF_4_Y), .Y(MX2_2_Y));
    DFN0C1 \DFN0C1_Q[14]  (.D(MX2_7_Y), .CLK(Clock), .CLR(INV_0_Y), .Q(
        Q[14]));
    INV INV_1 (.A(Aclr), .Y(INV_1_Y));
    DFN0C1 \DFN0C1_Q[31]  (.D(MX2_12_Y), .CLK(Clock), .CLR(INV_1_Y), 
        .Q(Q[31]));
    MX2 MX2_1 (.A(Q[7]), .B(Q[6]), .S(BUFF_4_Y), .Y(MX2_1_Y));
    DFN0C1 \DFN0C1_Q[9]  (.D(MX2_28_Y), .CLK(Clock), .CLR(INV_0_Y), .Q(
        Q[9]));
    MX2 MX2_0 (.A(Q[20]), .B(Q[19]), .S(BUFF_1_Y), .Y(MX2_0_Y));
    DFN0C1 \DFN0C1_Q[25]  (.D(MX2_17_Y), .CLK(Clock), .CLR(INV_1_Y), 
        .Q(Q[25]));
    DFN0C1 \DFN0C1_Q[20]  (.D(MX2_0_Y), .CLK(Clock), .CLR(INV_2_Y), .Q(
        Q[20]));
    BUFF BUFF_1 (.A(Shiften), .Y(BUFF_1_Y));
    DFN0C1 \DFN0C1_Q[5]  (.D(MX2_14_Y), .CLK(Clock), .CLR(INV_3_Y), .Q(
        Q[5]));
    MX2 MX2_24 (.A(Q[30]), .B(Q[29]), .S(BUFF_2_Y), .Y(MX2_24_Y));
    DFN0C1 \DFN0C1_Q[12]  (.D(MX2_4_Y), .CLK(Clock), .CLR(INV_0_Y), .Q(
        Q[12]));
    DFN0C1 \DFN0C1_Q[24]  (.D(MX2_26_Y), .CLK(Clock), .CLR(INV_1_Y), 
        .Q(Q[24]));
    DFN0C1 \DFN0C1_Q[4]  (.D(MX2_15_Y), .CLK(Clock), .CLR(INV_3_Y), .Q(
        Q[4]));
    DFN0C1 \DFN0C1_Q[2]  (.D(MX2_20_Y), .CLK(Clock), .CLR(INV_3_Y), .Q(
        Q[2]));
    MX2 MX2_5 (.A(Q[19]), .B(Q[18]), .S(BUFF_1_Y), .Y(MX2_5_Y));
    DFN0C1 \DFN0C1_Q[11]  (.D(MX2_2_Y), .CLK(Clock), .CLR(INV_0_Y), .Q(
        Q[11]));
    MX2 MX2_14 (.A(Q[5]), .B(Q[4]), .S(BUFF_5_Y), .Y(MX2_14_Y));
    MX2 MX2_9 (.A(Q[10]), .B(Q[9]), .S(BUFF_4_Y), .Y(MX2_9_Y));
    DFN0C1 \DFN0C1_Q[13]  (.D(MX2_27_Y), .CLK(Clock), .CLR(INV_0_Y), 
        .Q(Q[13]));
    MX2 MX2_4 (.A(Q[12]), .B(Q[11]), .S(BUFF_3_Y), .Y(MX2_4_Y));
    DFN0C1 \DFN0C1_Q[3]  (.D(MX2_11_Y), .CLK(Clock), .CLR(INV_3_Y), .Q(
        Q[3]));
    INV INV_2 (.A(Aclr), .Y(INV_2_Y));
    DFN0C1 \DFN0C1_Q[16]  (.D(MX2_22_Y), .CLK(Clock), .CLR(INV_2_Y), 
        .Q(Q[16]));
    DFN0C1 \DFN0C1_Q[22]  (.D(MX2_23_Y), .CLK(Clock), .CLR(INV_2_Y), 
        .Q(Q[22]));
    MX2 MX2_31 (.A(Q[0]), .B(Shiftin), .S(BUFF_5_Y), .Y(MX2_31_Y));
    DFN0C1 \DFN0C1_Q[17]  (.D(MX2_3_Y), .CLK(Clock), .CLR(INV_2_Y), .Q(
        Q[17]));
    MX2 MX2_30 (.A(Q[15]), .B(Q[14]), .S(BUFF_3_Y), .Y(MX2_30_Y));
    DFN0C1 \DFN0C1_Q[21]  (.D(MX2_19_Y), .CLK(Clock), .CLR(INV_2_Y), 
        .Q(Q[21]));
    DFN0C1 \DFN0C1_Q[6]  (.D(MX2_6_Y), .CLK(Clock), .CLR(INV_3_Y), .Q(
        Q[6]));
    DFN0C1 \DFN0C1_Q[23]  (.D(MX2_13_Y), .CLK(Clock), .CLR(INV_2_Y), 
        .Q(Q[23]));
    DFN0C1 \DFN0C1_Q[18]  (.D(MX2_29_Y), .CLK(Clock), .CLR(INV_2_Y), 
        .Q(Q[18]));
    MX2 MX2_6 (.A(Q[6]), .B(Q[5]), .S(BUFF_4_Y), .Y(MX2_6_Y));
    MX2 MX2_23 (.A(Q[22]), .B(Q[21]), .S(BUFF_0_Y), .Y(MX2_23_Y));
    DFN0C1 \DFN0C1_Q[0]  (.D(MX2_31_Y), .CLK(Clock), .CLR(INV_3_Y), .Q(
        Q[0]));
    MX2 MX2_27 (.A(Q[13]), .B(Q[12]), .S(BUFF_3_Y), .Y(MX2_27_Y));
    DFN0C1 \DFN0C1_Q[26]  (.D(MX2_10_Y), .CLK(Clock), .CLR(INV_1_Y), 
        .Q(Q[26]));
    DFN0C1 \DFN0C1_Q[27]  (.D(MX2_21_Y), .CLK(Clock), .CLR(INV_1_Y), 
        .Q(Q[27]));
    MX2 MX2_13 (.A(Q[23]), .B(Q[22]), .S(BUFF_0_Y), .Y(MX2_13_Y));
    MX2 MX2_29 (.A(Q[18]), .B(Q[17]), .S(BUFF_1_Y), .Y(MX2_29_Y));
    MX2 MX2_17 (.A(Q[25]), .B(Q[24]), .S(BUFF_0_Y), .Y(MX2_17_Y));
    DFN0C1 \DFN0C1_Q[7]  (.D(MX2_1_Y), .CLK(Clock), .CLR(INV_3_Y), .Q(
        Q[7]));
    INV INV_0 (.A(Aclr), .Y(INV_0_Y));
    MX2 MX2_21 (.A(Q[27]), .B(Q[26]), .S(BUFF_2_Y), .Y(MX2_21_Y));
    MX2 MX2_28 (.A(Q[9]), .B(Q[8]), .S(BUFF_4_Y), .Y(MX2_28_Y));
    BUFF BUFF_5 (.A(Shiften), .Y(BUFF_5_Y));
    DFN0C1 \DFN0C1_Q[1]  (.D(MX2_8_Y), .CLK(Clock), .CLR(INV_3_Y), .Q(
        Q[1]));
    DFN0C1 \DFN0C1_Q[19]  (.D(MX2_5_Y), .CLK(Clock), .CLR(INV_2_Y), .Q(
        Q[19]));
    MX2 MX2_22 (.A(Q[16]), .B(Q[15]), .S(BUFF_3_Y), .Y(MX2_22_Y));
    MX2 MX2_20 (.A(Q[2]), .B(Q[1]), .S(BUFF_5_Y), .Y(MX2_20_Y));
    DFN0C1 \DFN0C1_Q[8]  (.D(MX2_18_Y), .CLK(Clock), .CLR(INV_0_Y), .Q(
        Q[8]));
    BUFF BUFF_4 (.A(Shiften), .Y(BUFF_4_Y));
    MX2 MX2_19 (.A(Q[21]), .B(Q[20]), .S(BUFF_1_Y), .Y(MX2_19_Y));
    DFN0C1 \DFN0C1_Q[28]  (.D(MX2_16_Y), .CLK(Clock), .CLR(INV_1_Y), 
        .Q(Q[28]));
    BUFF BUFF_3 (.A(Shiften), .Y(BUFF_3_Y));
    MX2 MX2_3 (.A(Q[17]), .B(Q[16]), .S(BUFF_1_Y), .Y(MX2_3_Y));
    MX2 MX2_8 (.A(Q[1]), .B(Q[0]), .S(BUFF_5_Y), .Y(MX2_8_Y));
    MX2 MX2_25 (.A(Q[29]), .B(Q[28]), .S(BUFF_2_Y), .Y(MX2_25_Y));
    MX2 MX2_11 (.A(Q[3]), .B(Q[2]), .S(BUFF_5_Y), .Y(MX2_11_Y));
    DFN0C1 \DFN0C1_Q[30]  (.D(MX2_24_Y), .CLK(Clock), .CLR(INV_1_Y), 
        .Q(Q[30]));
    BUFF BUFF_2 (.A(Shiften), .Y(BUFF_2_Y));
    
endmodule

// _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


// _GEN_File_Contents_

// Version:11.9.6.7
// ACTGENU_CALL:1
// BATCH:T
// FAM:PA3LC
// OUTFORMAT:Verilog
// LPMTYPE:LPM_DFF
// LPM_HINT:SIPO
// INSERT_PAD:NO
// INSERT_IOREG:NO
// GEN_BHV_VHDL_VAL:F
// GEN_BHV_VERILOG_VAL:F
// MGNTIMER:F
// MGNCMPL:T
// DESDIR:C:/Users/kamil/OneDrive/Pulpit/cortex_m1_test/smartgen\INREG_CH1
// GEN_BEHV_MODULE:F
// SMARTGEN_DIE:IS4X4M1
// SMARTGEN_PACKAGE:vq100
// AGENIII_IS_SUBPROJECT_LIBERO:T
// CLR_POLARITY:0
// CLR_FANIN:AUTO
// CLR_VAL:8
// EN_POLARITY:2
// EN_FANIN:AUTO
// EN_VAL:6
// SHEN_POLARITY:1
// SHEN_FANIN:AUTO
// SHEN_VAL:6
// CLK_EDGE:FALL
// CLK_FANIN:MANUAL
// CLK_VAL:1
// WIDTH:32
// FF_TYPE:REGULAR

// _End_Comments_

