//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Nov 23 21:38:30 2026
// Version: v11.9 SP6 11.9.6.7
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// top_m1
module top_m1(
    // Inputs
    CLK_X2_5MHz,
    FRAME1N,
    FRAME1P,
    LCLKOUTN_TDC,
    LCLKOUTP_TDC,
    RX,
    SDO1N,
    SDO1P,
    SPISDI,
    // Outputs
    LCLKINN_TDC,
    LCLKINP_TDC,
    OSC_EN,
    SPISCLKO,
    SPISDO,
    SPISS,
    TX
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  CLK_X2_5MHz;
input  FRAME1N;
input  FRAME1P;
input  LCLKOUTN_TDC;
input  LCLKOUTP_TDC;
input  RX;
input  SDO1N;
input  SDO1P;
input  SPISDI;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output LCLKINN_TDC;
output LCLKINP_TDC;
output OSC_EN;
output SPISCLKO;
output SPISDO;
output SPISS;
output TX;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [35:0] CH1_ID_0_ID_DATA_O;
wire          CLK_X2_5MHz;
wire          CLKINT_0_Y;
wire          COREABC_0_APB3Initiator_PENABLE;
wire          COREABC_0_APB3Initiator_PREADY;
wire          COREABC_0_APB3Initiator_PSELx;
wire          COREABC_0_APB3Initiator_PSLVERR;
wire          COREABC_0_APB3Initiator_PWRITE;
wire          COREABC_0_PRESETN;
wire          CoreAPB3_0_APBmslave0_PENABLE;
wire          CoreAPB3_0_APBmslave0_PREADY;
wire          CoreAPB3_0_APBmslave0_PSELx;
wire          CoreAPB3_0_APBmslave0_PSLVERR;
wire          CoreAPB3_0_APBmslave0_PWRITE;
wire          CoreAPB3_0_APBmslave1_PREADY;
wire          CoreAPB3_0_APBmslave1_PSELx;
wire          CoreAPB3_0_APBmslave1_PSLVERR;
wire          CoreAPB3_0_APBmslave2_PREADY;
wire          CoreAPB3_0_APBmslave2_PSELx;
wire          CoreAPB3_0_APBmslave2_PSLVERR;
wire          CoreUARTapb_0_RXRDY;
wire          CoreUARTapb_0_TXRDY;
wire          falling_edge_detector_0_fifo_we;
wire          falling_edge_detector_0_shift_reg_en;
wire          fifo_apb_bridge_0_DATA_AVAIL;
wire          fifo_apb_bridge_0_FIFO_RE;
wire          FRAME1N;
wire          FRAME1P;
wire          INBUF_LVDS_0_Y;
wire          INBUF_LVDS_1_Y;
wire          INBUF_LVDS_2_Y;
wire          INFRAME_FIFO1_0_EMPTY;
wire   [35:0] INFRAME_FIFO1_0_Q;
wire   [31:0] INREG_CH1_0_Q;
wire          LCLKINN_TDC_net_0;
wire          LCLKINP_TDC_net_0;
wire          LCLKOUTN_TDC;
wire          LCLKOUTP_TDC;
wire          PLL_clock_0_GLA;
wire          PLL_clock_0_GLB;
wire          PLL_clock_0_LOCK;
wire          RX;
wire          SDO1N;
wire          SDO1P;
wire          SPISCLKO_net_0;
wire          SPISDI;
wire          SPISDO_net_0;
wire   [7:0]  SPISS_net_0;
wire   [0:0]  SPISS_1;
wire          TX_net_0;
wire          TX_net_1;
wire          SPISCLKO_net_1;
wire          SPISDO_net_1;
wire          SPISS_1_net_0;
wire          LCLKINP_TDC_net_1;
wire          LCLKINN_TDC_net_1;
wire   [1:1]  SPISS_slice_0;
wire   [2:2]  SPISS_slice_1;
wire   [3:3]  SPISS_slice_2;
wire   [4:4]  SPISS_slice_3;
wire   [5:5]  SPISS_slice_4;
wire   [6:6]  SPISS_slice_5;
wire   [7:7]  SPISS_slice_6;
wire   [4:0]  IO_IN_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          VCC_net;
wire          GND_net;
wire   [10:0] INITADDR_const_net_0;
wire   [8:0]  INITDATA_const_net_0;
wire   [7:0]  PADDR_S_const_net_0;
wire   [7:0]  PWDATA_S_const_net_0;
wire   [31:0] IADDR_const_net_0;
wire   [31:0] PRDATAS3_const_net_0;
wire   [31:0] PRDATAS4_const_net_0;
wire   [31:0] PRDATAS5_const_net_0;
wire   [31:0] PRDATAS6_const_net_0;
wire   [31:0] PRDATAS7_const_net_0;
wire   [31:0] PRDATAS8_const_net_0;
wire   [31:0] PRDATAS9_const_net_0;
wire   [31:0] PRDATAS10_const_net_0;
wire   [31:0] PRDATAS11_const_net_0;
wire   [31:0] PRDATAS12_const_net_0;
wire   [31:0] PRDATAS13_const_net_0;
wire   [31:0] PRDATAS14_const_net_0;
wire   [31:0] PRDATAS15_const_net_0;
wire   [31:0] PRDATAS16_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [19:0] COREABC_0_APB3Initiator_PADDR;
wire   [31:20]COREABC_0_APB3Initiator_PADDR_0_31to20;
wire   [19:0] COREABC_0_APB3Initiator_PADDR_0_19to0;
wire   [31:0] COREABC_0_APB3Initiator_PADDR_0;
wire   [31:0] COREABC_0_APB3Initiator_PRDATA;
wire   [7:0]  COREABC_0_APB3Initiator_PRDATA_0_7to0;
wire   [7:0]  COREABC_0_APB3Initiator_PRDATA_0;
wire   [31:8] COREABC_0_APB3Initiator_PWDATA_0_31to8;
wire   [7:0]  COREABC_0_APB3Initiator_PWDATA_0_7to0;
wire   [31:0] COREABC_0_APB3Initiator_PWDATA_0;
wire   [7:0]  COREABC_0_APB3Initiator_PWDATA;
wire   [6:0]  CoreAPB3_0_APBmslave0_PADDR_0_6to0;
wire   [6:0]  CoreAPB3_0_APBmslave0_PADDR_0;
wire   [4:0]  CoreAPB3_0_APBmslave0_PADDR_1_4to0;
wire   [4:0]  CoreAPB3_0_APBmslave0_PADDR_1;
wire   [7:0]  CoreAPB3_0_APBmslave0_PADDR_2_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PADDR_2;
wire   [31:0] CoreAPB3_0_APBmslave0_PADDR;
wire   [31:8] CoreAPB3_0_APBmslave0_PRDATA_0_31to8;
wire   [7:0]  CoreAPB3_0_APBmslave0_PRDATA_0_7to0;
wire   [31:0] CoreAPB3_0_APBmslave0_PRDATA_0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PRDATA;
wire   [31:0] CoreAPB3_0_APBmslave0_PWDATA;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_0_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_1_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_1;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_2_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_2;
wire   [31:8] CoreAPB3_0_APBmslave1_PRDATA_0_31to8;
wire   [7:0]  CoreAPB3_0_APBmslave1_PRDATA_0_7to0;
wire   [31:0] CoreAPB3_0_APBmslave1_PRDATA_0;
wire   [7:0]  CoreAPB3_0_APBmslave1_PRDATA;
wire   [31:8] CoreAPB3_0_APBmslave2_PRDATA_0_31to8;
wire   [7:0]  CoreAPB3_0_APBmslave2_PRDATA_0_7to0;
wire   [31:0] CoreAPB3_0_APBmslave2_PRDATA_0;
wire   [7:0]  CoreAPB3_0_APBmslave2_PRDATA;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net               = 1'b1;
assign GND_net               = 1'b0;
assign INITADDR_const_net_0  = 11'h000;
assign INITDATA_const_net_0  = 9'h000;
assign PADDR_S_const_net_0   = 8'h00;
assign PWDATA_S_const_net_0  = 8'h00;
assign IADDR_const_net_0     = 32'h00000000;
assign PRDATAS3_const_net_0  = 32'h00000000;
assign PRDATAS4_const_net_0  = 32'h00000000;
assign PRDATAS5_const_net_0  = 32'h00000000;
assign PRDATAS6_const_net_0  = 32'h00000000;
assign PRDATAS7_const_net_0  = 32'h00000000;
assign PRDATAS8_const_net_0  = 32'h00000000;
assign PRDATAS9_const_net_0  = 32'h00000000;
assign PRDATAS10_const_net_0 = 32'h00000000;
assign PRDATAS11_const_net_0 = 32'h00000000;
assign PRDATAS12_const_net_0 = 32'h00000000;
assign PRDATAS13_const_net_0 = 32'h00000000;
assign PRDATAS14_const_net_0 = 32'h00000000;
assign PRDATAS15_const_net_0 = 32'h00000000;
assign PRDATAS16_const_net_0 = 32'h00000000;
//--------------------------------------------------------------------
// TieOff assignments
//--------------------------------------------------------------------
assign OSC_EN            = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign TX_net_1          = TX_net_0;
assign TX                = TX_net_1;
assign SPISCLKO_net_1    = SPISCLKO_net_0;
assign SPISCLKO          = SPISCLKO_net_1;
assign SPISDO_net_1      = SPISDO_net_0;
assign SPISDO            = SPISDO_net_1;
assign SPISS_1_net_0     = SPISS_1[0];
assign SPISS             = SPISS_1_net_0;
assign LCLKINP_TDC_net_1 = LCLKINP_TDC_net_0;
assign LCLKINP_TDC       = LCLKINP_TDC_net_1;
assign LCLKINN_TDC_net_1 = LCLKINN_TDC_net_0;
assign LCLKINN_TDC       = LCLKINN_TDC_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign SPISS_1[0]       = SPISS_net_0[0:0];
assign SPISS_slice_0[1] = SPISS_net_0[1:1];
assign SPISS_slice_1[2] = SPISS_net_0[2:2];
assign SPISS_slice_2[3] = SPISS_net_0[3:3];
assign SPISS_slice_3[4] = SPISS_net_0[4:4];
assign SPISS_slice_4[5] = SPISS_net_0[5:5];
assign SPISS_slice_5[6] = SPISS_net_0[6:6];
assign SPISS_slice_6[7] = SPISS_net_0[7:7];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign IO_IN_net_0 = { 1'b0 , 1'b0 , fifo_apb_bridge_0_DATA_AVAIL , CoreUARTapb_0_TXRDY , CoreUARTapb_0_RXRDY };
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign COREABC_0_APB3Initiator_PADDR_0_31to20 = 12'h0;
assign COREABC_0_APB3Initiator_PADDR_0_19to0 = COREABC_0_APB3Initiator_PADDR[19:0];
assign COREABC_0_APB3Initiator_PADDR_0 = { COREABC_0_APB3Initiator_PADDR_0_31to20, COREABC_0_APB3Initiator_PADDR_0_19to0 };

assign COREABC_0_APB3Initiator_PRDATA_0_7to0 = COREABC_0_APB3Initiator_PRDATA[7:0];
assign COREABC_0_APB3Initiator_PRDATA_0 = { COREABC_0_APB3Initiator_PRDATA_0_7to0 };

assign COREABC_0_APB3Initiator_PWDATA_0_31to8 = 24'h0;
assign COREABC_0_APB3Initiator_PWDATA_0_7to0 = COREABC_0_APB3Initiator_PWDATA[7:0];
assign COREABC_0_APB3Initiator_PWDATA_0 = { COREABC_0_APB3Initiator_PWDATA_0_31to8, COREABC_0_APB3Initiator_PWDATA_0_7to0 };

assign CoreAPB3_0_APBmslave0_PADDR_0_6to0 = CoreAPB3_0_APBmslave0_PADDR[6:0];
assign CoreAPB3_0_APBmslave0_PADDR_0 = { CoreAPB3_0_APBmslave0_PADDR_0_6to0 };
assign CoreAPB3_0_APBmslave0_PADDR_1_4to0 = CoreAPB3_0_APBmslave0_PADDR[4:0];
assign CoreAPB3_0_APBmslave0_PADDR_1 = { CoreAPB3_0_APBmslave0_PADDR_1_4to0 };
assign CoreAPB3_0_APBmslave0_PADDR_2_7to0 = CoreAPB3_0_APBmslave0_PADDR[7:0];
assign CoreAPB3_0_APBmslave0_PADDR_2 = { CoreAPB3_0_APBmslave0_PADDR_2_7to0 };

assign CoreAPB3_0_APBmslave0_PRDATA_0_31to8 = 24'h0;
assign CoreAPB3_0_APBmslave0_PRDATA_0_7to0 = CoreAPB3_0_APBmslave0_PRDATA[7:0];
assign CoreAPB3_0_APBmslave0_PRDATA_0 = { CoreAPB3_0_APBmslave0_PRDATA_0_31to8, CoreAPB3_0_APBmslave0_PRDATA_0_7to0 };

assign CoreAPB3_0_APBmslave0_PWDATA_0_7to0 = CoreAPB3_0_APBmslave0_PWDATA[7:0];
assign CoreAPB3_0_APBmslave0_PWDATA_0 = { CoreAPB3_0_APBmslave0_PWDATA_0_7to0 };
assign CoreAPB3_0_APBmslave0_PWDATA_1_7to0 = CoreAPB3_0_APBmslave0_PWDATA[7:0];
assign CoreAPB3_0_APBmslave0_PWDATA_1 = { CoreAPB3_0_APBmslave0_PWDATA_1_7to0 };
assign CoreAPB3_0_APBmslave0_PWDATA_2_7to0 = CoreAPB3_0_APBmslave0_PWDATA[7:0];
assign CoreAPB3_0_APBmslave0_PWDATA_2 = { CoreAPB3_0_APBmslave0_PWDATA_2_7to0 };

assign CoreAPB3_0_APBmslave1_PRDATA_0_31to8 = 24'h0;
assign CoreAPB3_0_APBmslave1_PRDATA_0_7to0 = CoreAPB3_0_APBmslave1_PRDATA[7:0];
assign CoreAPB3_0_APBmslave1_PRDATA_0 = { CoreAPB3_0_APBmslave1_PRDATA_0_31to8, CoreAPB3_0_APBmslave1_PRDATA_0_7to0 };

assign CoreAPB3_0_APBmslave2_PRDATA_0_31to8 = 24'h0;
assign CoreAPB3_0_APBmslave2_PRDATA_0_7to0 = CoreAPB3_0_APBmslave2_PRDATA[7:0];
assign CoreAPB3_0_APBmslave2_PRDATA_0 = { CoreAPB3_0_APBmslave2_PRDATA_0_31to8, CoreAPB3_0_APBmslave2_PRDATA_0_7to0 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CH1_ID
CH1_ID CH1_ID_0(
        // Inputs
        .DATA_I    ( INREG_CH1_0_Q ),
        // Outputs
        .ID_DATA_O ( CH1_ID_0_ID_DATA_O ) 
        );

//--------CLKINT
CLKINT CLKINT_0(
        // Inputs
        .A ( INBUF_LVDS_2_Y ),
        // Outputs
        .Y ( CLKINT_0_Y ) 
        );

//--------top_m1_COREABC_0_COREABC   -   Actel:DirectCore:COREABC:4.1.111
top_m1_COREABC_0_COREABC #( 
        .ACT_CALIBRATIONDATA ( 1 ),
        .APB_AWIDTH          ( 8 ),
        .APB_DWIDTH          ( 8 ),
        .APB_SDEPTH          ( 3 ),
        .APB_TIMEOUT_COUNT   ( 80 ),
        .DEBUG               ( 1 ),
        .EN_ACM              ( 0 ),
        .EN_ADD              ( 1 ),
        .EN_ALURAM           ( 0 ),
        .EN_AND              ( 1 ),
        .EN_CALL             ( 0 ),
        .EN_DATAM            ( 2 ),
        .EN_INC              ( 1 ),
        .EN_INDIRECT         ( 0 ),
        .EN_INT              ( 0 ),
        .EN_IOREAD           ( 1 ),
        .EN_IOWRT            ( 1 ),
        .EN_MULT             ( 0 ),
        .EN_OR               ( 1 ),
        .EN_PUSH             ( 0 ),
        .EN_RAM              ( 0 ),
        .EN_RAM_ECC          ( 0 ),
        .EN_SHL              ( 0 ),
        .EN_SHR              ( 0 ),
        .EN_XOR              ( 1 ),
        .FAMILY              ( 15 ),
        .HI_REL              ( 0 ),
        .ICWIDTH             ( 7 ),
        .IFWIDTH             ( 3 ),
        .IIWIDTH             ( 5 ),
        .IMEM_APB_ACCESS     ( 0 ),
        .INITDATAWIDTH       ( 9 ),
        .INITWIDTH           ( 11 ),
        .INSMODE             ( 0 ),
        .INVALID_STACK_ACC   ( 1 ),
        .IOWIDTH             ( 1 ),
        .ISRADDR             ( 1 ),
        .MAX_NVMDWIDTH       ( 32 ),
        .STWIDTH             ( 4 ),
        .TESTMODE            ( 0 ),
        .UNIQ_STRING_LENGTH  ( 16 ),
        .ZRWIDTH             ( 5 ) )
COREABC_0(
        // Inputs
        .INITDATVAL      ( GND_net ), // tied to 1'b0 from definition
        .INITDONE        ( VCC_net ), // tied to 1'b1 from definition
        .INTREQ          ( GND_net ), // tied to 1'b0 from definition
        .NSYSRESET       ( PLL_clock_0_LOCK ),
        .PCLK            ( PLL_clock_0_GLA ),
        .PREADY_M        ( COREABC_0_APB3Initiator_PREADY ),
        .PSLVERR_M       ( COREABC_0_APB3Initiator_PSLVERR ),
        .PSEL_S          ( GND_net ), // tied to 1'b0 from definition
        .PENABLE_S       ( GND_net ), // tied to 1'b0 from definition
        .PWRITE_S        ( GND_net ), // tied to 1'b0 from definition
        .INITADDR        ( INITADDR_const_net_0 ), // tied to 11'h000 from definition
        .INITDATA        ( INITDATA_const_net_0 ), // tied to 9'h000 from definition
        .IO_IN           ( IO_IN_net_0 ),
        .PRDATA_M        ( COREABC_0_APB3Initiator_PRDATA_0 ),
        .PADDR_S         ( PADDR_S_const_net_0 ), // tied to 8'h00 from definition
        .PWDATA_S        ( PWDATA_S_const_net_0 ), // tied to 8'h00 from definition
        // Outputs
        .INTACT          (  ),
        .PRESETN         ( COREABC_0_PRESETN ),
        .PENABLE_M       ( COREABC_0_APB3Initiator_PENABLE ),
        .PSEL_M          ( COREABC_0_APB3Initiator_PSELx ),
        .PWRITE_M        ( COREABC_0_APB3Initiator_PWRITE ),
        .PREADY_S        (  ),
        .PSLVERR_S       (  ),
        .FAULT_DET       (  ),
        .DB_DETECT       (  ),
        .SB_CORRECT      (  ),
        .DB_DETECT_IRAM  (  ),
        .SB_CORRECT_IRAM (  ),
        .IO_OUT          (  ),
        .PADDR_M         ( COREABC_0_APB3Initiator_PADDR ),
        .PWDATA_M        ( COREABC_0_APB3Initiator_PWDATA ),
        .PRDATA_S        (  ) 
        );

//--------CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.2.100
CoreAPB3 #( 
        .APB_DWIDTH      ( 8 ),
        .APBSLOT0ENABLE  ( 1 ),
        .APBSLOT1ENABLE  ( 1 ),
        .APBSLOT2ENABLE  ( 1 ),
        .APBSLOT3ENABLE  ( 0 ),
        .APBSLOT4ENABLE  ( 0 ),
        .APBSLOT5ENABLE  ( 0 ),
        .APBSLOT6ENABLE  ( 0 ),
        .APBSLOT7ENABLE  ( 0 ),
        .APBSLOT8ENABLE  ( 0 ),
        .APBSLOT9ENABLE  ( 0 ),
        .APBSLOT10ENABLE ( 0 ),
        .APBSLOT11ENABLE ( 0 ),
        .APBSLOT12ENABLE ( 0 ),
        .APBSLOT13ENABLE ( 0 ),
        .APBSLOT14ENABLE ( 0 ),
        .APBSLOT15ENABLE ( 0 ),
        .FAMILY          ( 15 ),
        .IADDR_OPTION    ( 0 ),
        .MADDR_BITS      ( 12 ),
        .SC_0            ( 0 ),
        .SC_1            ( 0 ),
        .SC_2            ( 0 ),
        .SC_3            ( 0 ),
        .SC_4            ( 0 ),
        .SC_5            ( 0 ),
        .SC_6            ( 0 ),
        .SC_7            ( 0 ),
        .SC_8            ( 0 ),
        .SC_9            ( 0 ),
        .SC_10           ( 0 ),
        .SC_11           ( 0 ),
        .SC_12           ( 0 ),
        .SC_13           ( 0 ),
        .SC_14           ( 0 ),
        .SC_15           ( 0 ),
        .UPR_NIBBLE_POSN ( 2 ) )
CoreAPB3_0(
        // Inputs
        .PRESETN    ( GND_net ), // tied to 1'b0 from definition
        .PCLK       ( GND_net ), // tied to 1'b0 from definition
        .PWRITE     ( COREABC_0_APB3Initiator_PWRITE ),
        .PENABLE    ( COREABC_0_APB3Initiator_PENABLE ),
        .PSEL       ( COREABC_0_APB3Initiator_PSELx ),
        .PREADYS0   ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERRS0  ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .PREADYS1   ( CoreAPB3_0_APBmslave1_PREADY ),
        .PSLVERRS1  ( CoreAPB3_0_APBmslave1_PSLVERR ),
        .PREADYS2   ( CoreAPB3_0_APBmslave2_PREADY ),
        .PSLVERRS2  ( CoreAPB3_0_APBmslave2_PSLVERR ),
        .PREADYS3   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS3  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS4   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS4  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS5   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS5  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS6   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS6  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS7   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS7  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS8   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS8  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS9   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS9  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS10  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS10 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS11  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS11 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS12  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS12 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS13  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS13 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS14  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS14 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS15  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS15 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS16  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS16 ( GND_net ), // tied to 1'b0 from definition
        .PADDR      ( COREABC_0_APB3Initiator_PADDR_0 ),
        .PWDATA     ( COREABC_0_APB3Initiator_PWDATA_0 ),
        .PRDATAS0   ( CoreAPB3_0_APBmslave0_PRDATA_0 ),
        .PRDATAS1   ( CoreAPB3_0_APBmslave1_PRDATA_0 ),
        .PRDATAS2   ( CoreAPB3_0_APBmslave2_PRDATA_0 ),
        .PRDATAS3   ( PRDATAS3_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS4   ( PRDATAS4_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS5   ( PRDATAS5_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS6   ( PRDATAS6_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS7   ( PRDATAS7_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS8   ( PRDATAS8_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS9   ( PRDATAS9_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS10  ( PRDATAS10_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS11  ( PRDATAS11_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS12  ( PRDATAS12_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS13  ( PRDATAS13_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS14  ( PRDATAS14_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS15  ( PRDATAS15_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS16  ( PRDATAS16_const_net_0 ), // tied to 32'h00000000 from definition
        .IADDR      ( IADDR_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .PREADY     ( COREABC_0_APB3Initiator_PREADY ),
        .PSLVERR    ( COREABC_0_APB3Initiator_PSLVERR ),
        .PWRITES    ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PENABLES   ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PSELS0     ( CoreAPB3_0_APBmslave0_PSELx ),
        .PSELS1     ( CoreAPB3_0_APBmslave1_PSELx ),
        .PSELS2     ( CoreAPB3_0_APBmslave2_PSELx ),
        .PSELS3     (  ),
        .PSELS4     (  ),
        .PSELS5     (  ),
        .PSELS6     (  ),
        .PSELS7     (  ),
        .PSELS8     (  ),
        .PSELS9     (  ),
        .PSELS10    (  ),
        .PSELS11    (  ),
        .PSELS12    (  ),
        .PSELS13    (  ),
        .PSELS14    (  ),
        .PSELS15    (  ),
        .PSELS16    (  ),
        .PRDATA     ( COREABC_0_APB3Initiator_PRDATA ),
        .PADDRS     ( CoreAPB3_0_APBmslave0_PADDR ),
        .PWDATAS    ( CoreAPB3_0_APBmslave0_PWDATA ) 
        );

//--------CORESPI   -   Actel:DirectCore:CORESPI:5.2.104
CORESPI #( 
        .APB_DWIDTH        ( 8 ),
        .CFG_CLK           ( 4 ),
        .CFG_FIFO_DEPTH    ( 20 ),
        .CFG_FRAME_SIZE    ( 8 ),
        .CFG_MODE          ( 0 ),
        .CFG_MOT_MODE      ( 1 ),
        .CFG_MOT_SSEL      ( 1 ),
        .CFG_NSC_OPERATION ( 0 ),
        .CFG_TI_JMB_FRAMES ( 0 ),
        .CFG_TI_NSC_CUSTOM ( 0 ),
        .CFG_TI_NSC_FRC    ( 0 ) )
CORESPI_0(
        // Inputs
        .PCLK       ( PLL_clock_0_GLA ),
        .PRESETN    ( COREABC_0_PRESETN ),
        .PSEL       ( CoreAPB3_0_APBmslave0_PSELx ),
        .PENABLE    ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PWRITE     ( CoreAPB3_0_APBmslave0_PWRITE ),
        .SPISSI     ( VCC_net ),
        .SPISDI     ( SPISDI ),
        .SPICLKI    ( GND_net ),
        .PADDR      ( CoreAPB3_0_APBmslave0_PADDR_0 ),
        .PWDATA     ( CoreAPB3_0_APBmslave0_PWDATA_0 ),
        // Outputs
        .PREADY     ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERR    ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .SPIINT     (  ),
        .SPIRXAVAIL (  ),
        .SPITXRFM   (  ),
        .SPISCLKO   ( SPISCLKO_net_0 ),
        .SPIOEN     (  ),
        .SPISDO     ( SPISDO_net_0 ),
        .SPIMODE    (  ),
        .PRDATA     ( CoreAPB3_0_APBmslave0_PRDATA ),
        .SPISS      ( SPISS_net_0 ) 
        );

//--------top_m1_CoreUARTapb_0_CoreUARTapb   -   Actel:DirectCore:CoreUARTapb:5.7.100
top_m1_CoreUARTapb_0_CoreUARTapb #( 
        .BAUD_VAL_FRCTN    ( 3 ),
        .BAUD_VAL_FRCTN_EN ( 1 ),
        .BAUD_VALUE        ( 2 ),
        .FAMILY            ( 15 ),
        .FIXEDMODE         ( 1 ),
        .PRG_BIT8          ( 1 ),
        .PRG_PARITY        ( 0 ),
        .RX_FIFO           ( 0 ),
        .RX_LEGACY_MODE    ( 0 ),
        .TX_FIFO           ( 0 ) )
CoreUARTapb_0(
        // Inputs
        .PCLK        ( PLL_clock_0_GLA ),
        .PRESETN     ( COREABC_0_PRESETN ),
        .PSEL        ( CoreAPB3_0_APBmslave1_PSELx ),
        .PENABLE     ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PWRITE      ( CoreAPB3_0_APBmslave0_PWRITE ),
        .RX          ( RX ),
        .PADDR       ( CoreAPB3_0_APBmslave0_PADDR_1 ),
        .PWDATA      ( CoreAPB3_0_APBmslave0_PWDATA_1 ),
        // Outputs
        .TXRDY       ( CoreUARTapb_0_TXRDY ),
        .RXRDY       ( CoreUARTapb_0_RXRDY ),
        .PARITY_ERR  (  ),
        .OVERFLOW    (  ),
        .TX          ( TX_net_0 ),
        .PREADY      ( CoreAPB3_0_APBmslave1_PREADY ),
        .PSLVERR     ( CoreAPB3_0_APBmslave1_PSLVERR ),
        .FRAMING_ERR (  ),
        .PRDATA      ( CoreAPB3_0_APBmslave1_PRDATA ) 
        );

//--------falling_edge_detector
falling_edge_detector #( 
        .FRAME_WIDTH ( 32 ) )
falling_edge_detector_0(
        // Inputs
        .clk          ( CLKINT_0_Y ),
        .reset_n      ( COREABC_0_PRESETN ),
        .frame_sig    ( INBUF_LVDS_1_Y ),
        // Outputs
        .fifo_we      ( falling_edge_detector_0_fifo_we ),
        .shift_reg_en ( falling_edge_detector_0_shift_reg_en ) 
        );

//--------fifo_apb_bridge
fifo_apb_bridge fifo_apb_bridge_0(
        // Inputs
        .PCLK       ( PLL_clock_0_GLA ),
        .PRESETN    ( COREABC_0_PRESETN ),
        .PSEL       ( CoreAPB3_0_APBmslave2_PSELx ),
        .PENABLE    ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PWRITE     ( CoreAPB3_0_APBmslave0_PWRITE ),
        .FIFO_EMPTY ( INFRAME_FIFO1_0_EMPTY ),
        .PADDR      ( CoreAPB3_0_APBmslave0_PADDR_2 ),
        .PWDATA     ( CoreAPB3_0_APBmslave0_PWDATA_2 ),
        .FIFO_Q     ( INFRAME_FIFO1_0_Q ),
        // Outputs
        .PREADY     ( CoreAPB3_0_APBmslave2_PREADY ),
        .PSLVERR    ( CoreAPB3_0_APBmslave2_PSLVERR ),
        .FIFO_RE    ( fifo_apb_bridge_0_FIFO_RE ),
        .DATA_AVAIL ( fifo_apb_bridge_0_DATA_AVAIL ),
        .PRDATA     ( CoreAPB3_0_APBmslave2_PRDATA ) 
        );

//--------INBUF_LVDS
INBUF_LVDS INBUF_LVDS_0(
        // Inputs
        .PADP ( SDO1P ),
        .PADN ( SDO1N ),
        // Outputs
        .Y    ( INBUF_LVDS_0_Y ) 
        );

//--------INBUF_LVDS
INBUF_LVDS INBUF_LVDS_1(
        // Inputs
        .PADP ( FRAME1P ),
        .PADN ( FRAME1N ),
        // Outputs
        .Y    ( INBUF_LVDS_1_Y ) 
        );

//--------INBUF_LVDS
INBUF_LVDS INBUF_LVDS_2(
        // Inputs
        .PADP ( LCLKOUTN_TDC ),
        .PADN ( LCLKOUTP_TDC ),
        // Outputs
        .Y    ( INBUF_LVDS_2_Y ) 
        );

//--------INFRAME_FIFO1
INFRAME_FIFO1 INFRAME_FIFO1_0(
        // Inputs
        .WE     ( falling_edge_detector_0_fifo_we ),
        .RE     ( fifo_apb_bridge_0_FIFO_RE ),
        .WCLOCK ( CLKINT_0_Y ),
        .RCLOCK ( PLL_clock_0_GLA ),
        .RESET  ( COREABC_0_PRESETN ),
        .DATA   ( CH1_ID_0_ID_DATA_O ),
        // Outputs
        .FULL   (  ),
        .EMPTY  ( INFRAME_FIFO1_0_EMPTY ),
        .Q      ( INFRAME_FIFO1_0_Q ) 
        );

//--------INREG_CH1
INREG_CH1 INREG_CH1_0(
        // Inputs
        .Shiften ( falling_edge_detector_0_shift_reg_en ),
        .Shiftin ( INBUF_LVDS_0_Y ),
        .Aclr    ( COREABC_0_PRESETN ),
        .Clock   ( CLKINT_0_Y ),
        // Outputs
        .Q       ( INREG_CH1_0_Q ) 
        );

//--------OUTBUF_LVDS
OUTBUF_LVDS OUTBUF_LVDS_0(
        // Inputs
        .D    ( PLL_clock_0_GLB ),
        // Outputs
        .PADP ( LCLKINP_TDC_net_0 ),
        .PADN ( LCLKINN_TDC_net_0 ) 
        );

//--------PLL_clock
PLL_clock PLL_clock_0(
        // Inputs
        .POWERDOWN ( VCC_net ),
        .CLKA      ( CLK_X2_5MHz ),
        // Outputs
        .LOCK      ( PLL_clock_0_LOCK ),
        .GLA       ( PLL_clock_0_GLA ),
        .GLB       ( PLL_clock_0_GLB ) 
        );


endmodule
