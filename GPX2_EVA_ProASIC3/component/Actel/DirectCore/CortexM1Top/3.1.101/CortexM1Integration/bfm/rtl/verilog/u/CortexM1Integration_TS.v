`timescale 1 ns / 100 ps

module CortexM1Integration (
    // Outputs
    SYSRESETREQ, LOCKUP, HTRANS, HBURST, HPROT, HSIZE, HWRITE,
    HMASTLOCK, HADDR, HWDATA,
    // Inputs
    HCLK, SYSRESETn, IRQ, NMI, HREADY, HRESP, HRDATA,
    // Debug inputs
    DBGRESETn, EDBGRQ, nTRST, SWCLKTCK, SWDITMS, TDI,
    // Debug outputs
    JTAGNSW,JTAGTOP,TDO, nTDOEN, SWDO, SWDOEN, HALTED,
    // TCM init
    tcmInitWriteEnable, tcmInitAddr, tcmInitWriteData
    );

//------------------------------------------------------------------------------
// Port declaration
//------------------------------------------------------------------------------
    // Inputs
    input           HCLK;
    input           SYSRESETn;

    input [31:0]    IRQ;        // External interrupts
    input           NMI;        // Non-maskable interrupt

    input           HREADY;     // Slave ready signal
    input           HRESP;      // Slave response signal
    input [31:0]    HRDATA;     // Data from slave to master

    // Debug inputs
    input           DBGRESETn;
    input           EDBGRQ;
    input           nTRST;
    input           SWCLKTCK;
    input           SWDITMS;
    input           TDI;

    // TCM init
    input [19:2]    tcmInitAddr;
    input           tcmInitWriteEnable;
    input [31:0]    tcmInitWriteData;

    // Outputs
    output          SYSRESETREQ;// Request system reset
    output          LOCKUP;     // Core is in lockup state
    output [1:0]    HTRANS;     // Transfer type
    output [2:0]    HBURST;     // Burst type
    output [3:0]    HPROT;      // Transfer protection bits
    output [2:0]    HSIZE;      // Transfer size
    output          HWRITE;     // Transfer direction
    output          HMASTLOCK;  // Transfer is a locked transfer
    output [31:0]   HADDR;      // Transfer address
    output [31:0]   HWDATA;     // Data from master to slave

    // Debug outputs
    output          JTAGNSW;
    output          JTAGTOP;
    output          TDO;
    output          nTDOEN;
    output          SWDO;
    output          SWDOEN;
    output          HALTED;

    CortexM1BFM BFM_core(
    // Outputs
    .SYSRESETREQ(SYSRESETREQ), .LOCKUP(LOCKUP), .HTRANS(HTRANS), .HBURST(HBURST), .HPROT(HPROT), .HSIZE(HSIZE),
    .HWRITE(HWRITE), .HMASTLOCK(HMASTLOCK), .HADDR(HADDR), .HWDATA(HWDATA),
    // Inputs
    .HCLK(HCLK), .SYSRESETn(SYSRESETn), .IRQ(IRQ), .NMI(NMI), .HREADY(HREADY), .HRESP(HRESP), .HRDATA(HRDATA),
    // Debug inputs
    .DBGRESETn(DBGRESETn), .EDBGRQ(EDBGRQ), .nTRST(nTRST), .SWCLKTCK(SWCLKTCK), .SWDITMS(SWDITMS), .TDI(TDI),
    // Debug outputs
    .JTAGNSW(JTAGNSW),.JTAGTOP(JTAGTOP),.TDO(TDO), .nTDOEN(nTDOEN), .SWDO(SWDO), .SWDOEN(SWDOEN), .HALTED(HALTED)
    );

specify
    $setup ( posedge DBGRESETn, posedge SWCLKTCK, 0.0 );
    $setup ( negedge DBGRESETn, posedge SWCLKTCK, 0.0 );
    $setup ( posedge nTRST, posedge SWCLKTCK, 0.0 );
    $setup ( negedge nTRST, posedge SWCLKTCK, 0.0 );
    $setup ( posedge SWDITMS, posedge SWCLKTCK, 0.0 );
    $setup ( negedge SWDITMS, posedge SWCLKTCK, 0.0 );
    $setup ( posedge TDI, posedge SWCLKTCK, 0.0 );
    $setup ( negedge TDI, posedge SWCLKTCK, 0.0 );
    $hold ( posedge SWCLKTCK, posedge DBGRESETn, 0.0 );
    $hold ( posedge SWCLKTCK, negedge DBGRESETn, 0.0 );
    $hold ( posedge SWCLKTCK, posedge nTRST, 0.0 );
    $hold ( posedge SWCLKTCK, negedge nTRST, 0.0 );
    $hold ( posedge SWCLKTCK, posedge SWDITMS, 0.0 );
    $hold ( posedge SWCLKTCK, negedge SWDITMS, 0.0 );
    $hold ( posedge SWCLKTCK, posedge TDI, 0.0 );
    $hold ( posedge SWCLKTCK, negedge TDI, 0.0 );
    $width ( posedge SWCLKTCK, 0.0, 0 );
    $width ( negedge SWCLKTCK, 0.0, 0 );
endspecify

specify
    $setup ( posedge DBGRESETn, posedge HCLK, 0.0 );
    $setup ( negedge DBGRESETn, posedge HCLK, 0.0 );
    $setup ( posedge EDBGRQ, posedge HCLK, 0.0 );
    $setup ( negedge EDBGRQ, posedge HCLK, 0.0 );
    $setup ( posedge nTRST, posedge HCLK, 0.0 );
    $setup ( negedge nTRST, posedge HCLK, 0.0 );
    $setup ( posedge SWCLKTCK, posedge HCLK, 0.0 );
    $setup ( negedge SWCLKTCK, posedge HCLK, 0.0 );
    $setup ( posedge SWDITMS, posedge HCLK, 0.0 );
    $setup ( negedge SWDITMS, posedge HCLK, 0.0 );
    $setup ( posedge TDI, posedge HCLK, 0.0 );
    $setup ( negedge TDI, posedge HCLK, 0.0 );
    $setup ( posedge SYSRESETn, posedge HCLK, 0.0 );
    $setup ( negedge SYSRESETn, posedge HCLK, 0.0 );
    $setup ( posedge HRESP, posedge HCLK, 0.0 );
    $setup ( negedge HRESP, posedge HCLK, 0.0 );
    $setup ( posedge HREADY, posedge HCLK, 0.0 );
    $setup ( negedge HREADY, posedge HCLK, 0.0 );
    $setup ( posedge NMI, posedge HCLK, 0.0 );
    $setup ( negedge NMI, posedge HCLK, 0.0 );
    $setup ( negedge IRQ[0], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[0], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[1], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[1], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[2], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[2], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[3], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[3], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[4], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[4], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[5], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[5], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[6], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[6], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[7], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[7], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[8], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[8], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[9], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[9], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[10], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[10], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[11], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[11], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[12], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[12], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[13], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[13], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[14], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[14], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[15], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[15], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[16], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[16], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[17], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[17], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[18], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[18], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[19], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[19], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[20], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[20], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[21], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[21], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[22], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[22], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[23], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[23], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[24], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[24], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[25], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[25], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[26], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[26], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[27], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[27], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[28], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[28], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[29], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[29], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[30], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[30], posedge HCLK, 0.0 );
    $setup ( negedge IRQ[31], posedge HCLK, 0.0 );
    $setup ( posedge IRQ[31], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[0], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[0], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[1], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[1], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[2], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[2], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[3], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[3], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[4], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[4], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[5], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[5], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[6], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[6], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[7], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[7], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[8], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[8], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[9], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[9], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[10], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[10], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[11], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[11], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[12], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[12], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[13], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[13], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[14], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[14], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[15], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[15], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[16], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[16], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[17], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[17], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[18], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[18], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[19], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[19], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[20], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[20], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[21], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[21], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[22], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[22], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[23], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[23], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[24], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[24], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[25], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[25], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[26], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[26], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[27], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[27], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[28], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[28], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[29], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[29], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[30], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[30], posedge HCLK, 0.0 );
    $setup ( negedge HRDATA[31], posedge HCLK, 0.0 );
    $setup ( posedge HRDATA[31], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[0], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[0], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[1], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[1], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[2], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[2], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[3], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[3], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[4], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[4], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[5], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[5], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[6], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[6], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[7], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[7], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[8], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[8], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[9], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[9], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[10], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[10], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[11], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[11], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[12], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[12], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[13], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[13], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[14], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[14], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[15], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[15], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[16], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[16], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[17], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[17], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[18], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[18], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[19], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[19], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[20], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[20], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[21], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[21], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[22], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[22], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[23], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[23], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[24], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[24], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[25], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[25], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[26], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[26], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[27], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[27], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[28], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[28], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[29], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[29], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[30], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[30], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteData[31], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteData[31], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[2], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[2], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[3], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[3], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[4], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[4], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[5], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[5], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[6], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[6], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[7], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[7], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[8], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[8], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[9], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[9], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[10], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[10], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[11], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[11], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[12], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[12], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[13], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[13], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[14], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[14], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[15], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[15], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[16], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[16], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[17], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[17], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[18], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[18], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitAddr[19], posedge HCLK, 0.0 );
    $setup ( posedge tcmInitAddr[19], posedge HCLK, 0.0 );
    $setup ( negedge tcmInitWriteEnable, posedge HCLK, 0.0 );
    $setup ( posedge tcmInitWriteEnable, posedge HCLK, 0.0 );
    $hold ( posedge HCLK, posedge DBGRESETn, 0.0 );
    $hold ( posedge HCLK, negedge DBGRESETn, 0.0 );
    $hold ( posedge HCLK, posedge EDBGRQ, 0.0 );
    $hold ( posedge HCLK, negedge EDBGRQ, 0.0 );
    $hold ( posedge HCLK, posedge nTRST, 0.0 );
    $hold ( posedge HCLK, negedge nTRST, 0.0 );
    $hold ( posedge HCLK, posedge SWCLKTCK, 0.0 );
    $hold ( posedge HCLK, negedge SWCLKTCK, 0.0 );
    $hold ( posedge HCLK, posedge SWDITMS, 0.0 );
    $hold ( posedge HCLK, negedge SWDITMS, 0.0 );
    $hold ( posedge HCLK, posedge TDI, 0.0 );
    $hold ( posedge HCLK, negedge TDI, 0.0 );
    $hold ( posedge HCLK, posedge SYSRESETn, 0.0 );
    $hold ( posedge HCLK, negedge SYSRESETn, 0.0 );
    $hold ( posedge HCLK, posedge HRESP, 0.0 );
    $hold ( posedge HCLK, negedge HRESP, 0.0 );
    $hold ( posedge HCLK, posedge HREADY, 0.0 );
    $hold ( posedge HCLK, negedge HREADY, 0.0 );
    $hold ( posedge HCLK, posedge NMI, 0.0 );
    $hold ( posedge HCLK, negedge NMI, 0.0 );
    $hold ( posedge HCLK, negedge IRQ[0], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[0], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[1], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[1], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[2], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[2], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[3], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[3], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[4], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[4], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[5], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[5], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[6], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[6], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[7], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[7], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[8], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[8], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[9], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[9], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[10], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[10], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[11], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[11], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[12], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[12], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[13], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[13], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[14], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[14], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[15], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[15], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[16], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[16], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[17], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[17], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[18], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[18], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[19], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[19], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[20], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[20], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[21], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[21], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[22], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[22], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[23], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[23], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[24], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[24], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[25], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[25], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[26], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[26], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[27], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[27], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[28], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[28], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[29], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[29], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[30], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[30], 0.0 );
    $hold ( posedge HCLK, negedge IRQ[31], 0.0 );
    $hold ( posedge HCLK, posedge IRQ[31], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[0], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[0], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[1], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[1], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[2], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[2], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[3], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[3], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[4], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[4], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[5], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[5], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[6], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[6], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[7], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[7], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[8], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[8], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[9], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[9], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[10], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[10], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[11], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[11], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[12], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[12], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[13], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[13], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[14], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[14], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[15], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[15], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[16], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[16], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[17], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[17], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[18], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[18], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[19], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[19], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[20], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[20], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[21], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[21], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[22], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[22], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[23], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[23], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[24], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[24], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[25], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[25], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[26], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[26], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[27], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[27], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[28], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[28], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[29], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[29], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[30], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[30], 0.0 );
    $hold ( posedge HCLK, negedge HRDATA[31], 0.0 );
    $hold ( posedge HCLK, posedge HRDATA[31], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[0], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[0], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[1], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[1], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[2], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[2], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[3], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[3], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[4], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[4], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[5], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[5], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[6], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[6], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[7], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[7], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[8], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[8], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[9], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[9], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[10], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[10], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[11], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[11], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[12], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[12], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[13], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[13], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[14], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[14], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[15], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[15], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[16], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[16], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[17], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[17], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[18], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[18], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[19], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[19], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[20], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[20], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[21], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[21], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[22], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[22], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[23], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[23], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[24], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[24], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[25], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[25], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[26], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[26], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[27], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[27], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[28], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[28], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[29], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[29], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[30], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[30], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteData[31], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteData[31], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[2], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[2], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[3], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[3], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[4], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[4], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[5], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[5], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[6], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[6], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[7], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[7], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[8], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[8], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[9], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[9], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[10], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[10], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[11], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[11], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[12], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[12], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[13], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[13], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[14], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[14], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[15], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[15], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[16], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[16], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[17], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[17], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[18], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[18], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitAddr[19], 0.0 );
    $hold ( posedge HCLK, posedge tcmInitAddr[19], 0.0 );
    $hold ( posedge HCLK, negedge tcmInitWriteEnable, 0.0 );
    $hold ( posedge HCLK, posedge tcmInitWriteEnable, 0.0 );
    $width ( posedge HCLK, 0.0, 0 );
    $width ( negedge HCLK, 0.0, 0 );
endspecify

specify
    (SWCLKTCK *> JTAGNSW) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (SWCLKTCK *> JTAGTOP) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (SWCLKTCK *> TDO) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (SWCLKTCK *> nTDOEN) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (SWCLKTCK *> SWDO) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (SWCLKTCK *> SWDOEN) = (0.1:0.1:0.1, 0.1:0.1:0.1);
endspecify

specify
    (HCLK *> SYSRESETREQ) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> LOCKUP) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HALTED) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HTRANS[0]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HTRANS[1]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HBURST[0]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HBURST[1]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HBURST[2]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HPROT[0]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HPROT[1]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HPROT[2]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HPROT[3]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HSIZE[0]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HSIZE[1]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HSIZE[2]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWRITE) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HMASTLOCK) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[0]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[1]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[2]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[3]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[4]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[5]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[6]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[7]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[8]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[9]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[10]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[11]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[12]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[13]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[14]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[15]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[16]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[17]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[18]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[19]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[20]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[21]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[22]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[23]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[24]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[25]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[26]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[27]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[28]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[29]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[30]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HADDR[31]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[0]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[1]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[2]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[3]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[4]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[5]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[6]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[7]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[8]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[9]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[10]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[11]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[12]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[13]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[14]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[15]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[16]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[17]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[18]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[19]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[20]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[21]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[22]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[23]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[24]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[25]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[26]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[27]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[28]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[29]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[30]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
    (HCLK *> HWDATA[31]) = (0.1:0.1:0.1, 0.1:0.1:0.1);
endspecify


endmodule
