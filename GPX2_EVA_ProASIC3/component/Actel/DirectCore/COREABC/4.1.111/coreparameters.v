//--------------------------------------------------------------------
// Created by Microsemi SmartDesign Wed Nov 18 18:31:48 2026
// Parameters for COREABC
//--------------------------------------------------------------------


parameter ABCCODE = "$INIT_SYSTEM
    APBWRT DAT 0 0x00 0x43
    JUMP $LOOP
$STREAM_FIFO
    JUMP IF INPUT0 $LOOP
    WAIT UNTIL INPUT2
    // Take a byte off FIFO
    APBWRT DAT 2 0x00 0x01
    // Byte 0    
    WAIT UNTIL INPUT1
    APBREAD 2 0x04
    APBWRT ACC 1 0x00
    // Byte 1
    WAIT UNTIL INPUT1
    APBREAD 2 0x08
    APBWRT ACC 1 0x00
    // Byte 2
    WAIT UNTIL INPUT1
    APBREAD 2 0x0C
    APBWRT ACC 1 0x00
    // Byte 3
    WAIT UNTIL INPUT1
    APBREAD 2 0x10
    APBWRT ACC 1 0x00
    JUMP $STREAM_FIFO
$LOOP
    WAIT UNTIL INPUT0

    APBREAD 1 0x04
    BITTST 5
    JUMP IFNOTZERO $OPC_POWER
    BITTST 7
    JUMP IFNOTZERO $OPC_WR_CONFIG
    BITTST 4
    JUMP IFNOTZERO $OPC_INIT
    BITTST 6 
    JUMP IFNOTZERO $OPC_RD_CONFIG
  
    JUMP $LOOP

$OPC_POWER
    // Set SPISS
    APBWRT DAT 0 0x24 0x01
    // Send spiopc_power opcode 
    APBWRT DAT 0 0x28 0x30
    JUMP $LOOP


$OPC_WR_CONFIG
    // Halt CoreSPI
    APBWRT DAT 0 0x00 0x02
    // Set SPISS
    APBWRT DAT 0 0x24 0x01
    // Send spiopc_write_config opcode
    APBWRT DAT 0 0x0C 0x80
    // Setup counter
    LOADZ DAT 0x10    
$CONFIG_BYTES
        WAIT UNTIL INPUT0
        APBREAD 1 0x04
        APBWRT ACC 0 0x0C
        
        DECZ
        JUMP IFNOT ZZERO $CONFIG_BYTES
        
        WAIT UNTIL INPUT0
        APBREAD 1 0x04
        APBWRT ACC 0 0x28
            
        // Enable CoreSPI back
        APBWRT DAT 0 0x00 0x43
        JUMP $LOOP


$OPC_INIT
    // Set SPISS
    APBWRT DAT 0 0x24 0x01
    // Send spiopc_init opcode
    APBWRT DAT 0 0x28 0x18

    JUMP $STREAM_FIFO


$OPC_RD_CONFIG
    // Clear RX FIFO
    APBWRT DAT 0 0x1C 0x01
    // Halt CoreSPI
    APBWRT DAT 0 0x00 0x02
    // Set SPISS
    APBWRT DAT 0 0x24 0x01
    // Send spiopc_read_config opcode
    APBWRT DAT 0 0x0C 0x40
    // Setup counter to fill the TX FIFO
    LOADZ DAT 0x10
$FILL_TX_FIFO
    APBWRT DAT 0 0x0C 0x00  
    DECZ
    JUMP IFNOT ZZERO $FILL_TX_FIFO
    APBWRT DAT 0 0x28 0x00
    // Enable CoreSPI back to send/receive 18 bytes
    APBWRT DAT 0 0x00 0x43
$WAIT_SPI_DONE
    // Wait for spi to finish by checking ACTIVE flag in STAT register
    APBREAD 0 0x20
    BITTST 7
    JUMP IFNOTZERO $WAIT_SPI_DONE
    // Omit the first byte read during OPCODE transmission
    APBREAD 0 0x08
    // Read 17 bytes of config from RX FIFO
    LOADZ DAT 0x11
$READ_BYTES    
    WAIT UNTIL INPUT1
    APBREAD 0 0x08
    APBWRT ACC 1 0x00
    DECZ
    JUMP IFNOT ZZERO $READ_BYTES

    JUMP $LOOP
    ";
parameter ACT_CALIBRATIONDATA = 1;
parameter APB_AWIDTH = 8;
parameter APB_DWIDTH = 8;
parameter APB_SDEPTH = 3;
parameter APB_TIMEOUT_COUNT = 80;
parameter CODEHEXDUMP = "";
parameter CODEHEXDUMP2 = "";
parameter DEBUG = 1;
parameter EN_ACM = 0;
parameter EN_ADD = 1;
parameter EN_ALURAM = 0;
parameter EN_AND = 1;
parameter EN_CALL = 0;
parameter EN_DATAM = 2;
parameter EN_INC = 1;
parameter EN_INDIRECT = 0;
parameter EN_INT = 0;
parameter EN_IOREAD = 1;
parameter EN_IOWRT = 1;
parameter EN_MULT = 0;
parameter EN_OR = 1;
parameter EN_PUSH = 0;
parameter EN_RAM = 0;
parameter EN_RAM_ECC = 0;
parameter EN_SHL = 0;
parameter EN_SHR = 0;
parameter EN_XOR = 1;
parameter FAMILY = 15;
parameter HI_REL = 0;
parameter ICWIDTH = 7;
parameter IFWIDTH = 3;
parameter IIWIDTH = 5;
parameter IMEM_APB_ACCESS = 0;
parameter INITDATAWIDTH = 9;
parameter INITWIDTH = 11;
parameter INSMODE = 0;
parameter INVALID_STACK_ACC = 1;
parameter IOWIDTH = 1;
parameter ISRADDR = 1;
parameter MAX_NVMDWIDTH = 32;
parameter STWIDTH = 4;
parameter TESTBENCH = "User";
parameter TESTMODE = 0;
parameter UNIQ_STRING = "top_m1_COREABC_0";
parameter UNIQ_STRING_LENGTH = 16;
parameter VERILOGCODE = "";
parameter VERILOGVARS = "";
parameter ZRWIDTH = 5;
