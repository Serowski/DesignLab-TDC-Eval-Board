module CortexM1Integration(HCLK, SYSRESETn, IRQ, NMI, DBGRESETn, EDBGRQ, nTRST, SWCLKTCK, SWDITMS, TDI, JTAGNSW, JTAGTOP, TDO, nTDOEN, SWDO, SWDOEN, LOCKUP, HALTED, SYSRESETREQ, HREADY, HRESP, HRDATA, HTRANS, HBURST, HPROT, HSIZE, HWRITE, HMASTLOCK, HADDR, HWDATA, tcmInitWriteEnable, tcmInitAddr, tcmInitWriteData)

/* synthesis syn_black_box

pragma attribute CortexM1Integration syn_tco0 SWCLKTCK->JTAGNSW+1.5133
pragma attribute CortexM1Integration syn_tco1 SWCLKTCK->JTAGTOP+1.5133
pragma attribute CortexM1Integration syn_tco2 SWCLKTCK->TDO+1.5133
pragma attribute CortexM1Integration syn_tco3 SWCLKTCK->nTDOEN+1.5133
pragma attribute CortexM1Integration syn_tco4 SWCLKTCK->SWDO+1.5133
pragma attribute CortexM1Integration syn_tco5 SWCLKTCK->SWDOEN+1.5133
pragma attribute CortexM1Integration syn_tco6 HCLK->LOCKUP+3.2414886
pragma attribute CortexM1Integration syn_tco7 HCLK->HALTED+1.5133
pragma attribute CortexM1Integration syn_tco8 HCLK->SYSRESETREQ+1.7735876
pragma attribute CortexM1Integration syn_tco9 HCLK->HTRANS[1:0]+4.8380201
pragma attribute CortexM1Integration syn_tco10 HCLK->HBURST[2:0]+1.5133
pragma attribute CortexM1Integration syn_tco11 HCLK->HPROT[3:0]+2.5680701
pragma attribute CortexM1Integration syn_tco12 HCLK->HSIZE[2:0]+1.1380016
pragma attribute CortexM1Integration syn_tco13 HCLK->HWRITE+2.4152268
pragma attribute CortexM1Integration syn_tco14 HCLK->HMASTLOCK+1.5133
pragma attribute CortexM1Integration syn_tco15 HCLK->HADDR[31:0]+2.9433685
pragma attribute CortexM1Integration syn_tco16 HCLK->HWDATA[31:0]+2.8828365
pragma attribute CortexM1Integration syn_tsu0 SYSRESETn->HCLK+0.2784472
pragma attribute CortexM1Integration syn_tsu1 IRQ[31:0]->HCLK+2.1398062
pragma attribute CortexM1Integration syn_tsu2 NMI->HCLK+3.9966253
pragma attribute CortexM1Integration syn_tsu3 DBGRESETn->HCLK+0
pragma attribute CortexM1Integration syn_tsu4 DBGRESETn->SWCLKTCK+0
pragma attribute CortexM1Integration syn_tsu5 EDBGRQ->HCLK+0
pragma attribute CortexM1Integration syn_tsu6 nTRST->SWCLKTCK+0
pragma attribute CortexM1Integration syn_tsu7 SWDITMS->SWCLKTCK+0
pragma attribute CortexM1Integration syn_tsu8 TDI->SWCLKTCK+0
pragma attribute CortexM1Integration syn_tsu9 HREADY->HCLK+5.1482466
pragma attribute CortexM1Integration syn_tsu10 HRESP->HCLK+4.5989187
pragma attribute CortexM1Integration syn_tsu11 HRDATA[31:0]->HCLK+2.3062692
pragma attribute CortexM1Integration syn_tsu12 tcmInitWriteEnable->HCLK+0
pragma attribute CortexM1Integration syn_tsu13 tcmInitAddr[19:2]->HCLK+0
pragma attribute CortexM1Integration syn_tsu14 tcmInitWriteData[31:0]->HCLK+0

syn_scaletiming = "actel_blackbox_scaling"
syn_resources = "corecells = 4411 , blockrams = 4 , plls = 0 , fifos = 0 , global_clocks = 0 , quadrant_clocks = 0 "

*/;
input HCLK;
input SYSRESETn;
input [31:0] IRQ;
input NMI;
input DBGRESETn;
input EDBGRQ;
input nTRST;
input SWCLKTCK;
input SWDITMS;
input TDI;
output JTAGNSW;
output JTAGTOP;
output TDO;
output nTDOEN;
output SWDO;
output SWDOEN;
output LOCKUP;
output HALTED;
output SYSRESETREQ;
input HREADY;
input HRESP;
input [31:0] HRDATA;
output [1:0] HTRANS;
output [2:0] HBURST;
output [3:0] HPROT;
output [2:0] HSIZE;
output HWRITE;
output HMASTLOCK;
output [31:0] HADDR;
output [31:0] HWDATA;
input tcmInitWriteEnable;
input [19:2] tcmInitAddr;
input [31:0] tcmInitWriteData;

endmodule
