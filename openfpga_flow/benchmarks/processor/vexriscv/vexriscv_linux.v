// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : VexRiscv
// Git hash  : d67fe72de9f5ce288f2667b150314c926f4bbf4d


`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_WFI 2'b10
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND 2'b10

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define MmuPlugin_shared_State_defaultEncoding_type [2:0]
`define MmuPlugin_shared_State_defaultEncoding_IDLE 3'b000
`define MmuPlugin_shared_State_defaultEncoding_L1_CMD 3'b001
`define MmuPlugin_shared_State_defaultEncoding_L1_RSP 3'b010
`define MmuPlugin_shared_State_defaultEncoding_L0_CMD 3'b011
`define MmuPlugin_shared_State_defaultEncoding_L0_RSP 3'b100


module VexRiscv (
  output              dBus_cmd_valid,
  input               dBus_cmd_ready,
  output              dBus_cmd_payload_wr,
  output              dBus_cmd_payload_uncached,
  output     [31:0]   dBus_cmd_payload_address,
  output     [31:0]   dBus_cmd_payload_data,
  output     [3:0]    dBus_cmd_payload_mask,
  output     [2:0]    dBus_cmd_payload_size,
  output              dBus_cmd_payload_last,
  input               dBus_rsp_valid,
  input               dBus_rsp_payload_last,
  input      [31:0]   dBus_rsp_payload_data,
  input               dBus_rsp_payload_error,
  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt,
  input               externalInterruptS,
  input               debug_bus_cmd_valid,
  output reg          debug_bus_cmd_ready,
  input               debug_bus_cmd_payload_wr,
  input      [7:0]    debug_bus_cmd_payload_address,
  input      [31:0]   debug_bus_cmd_payload_data,
  output reg [31:0]   debug_bus_rsp_data,
  output              debug_resetOut,
  output              iBus_cmd_valid,
  input               iBus_cmd_ready,
  output reg [31:0]   iBus_cmd_payload_address,
  output     [2:0]    iBus_cmd_payload_size,
  input               iBus_rsp_valid,
  input      [31:0]   iBus_rsp_payload_data,
  input               iBus_rsp_payload_error,
  input               clk,
  input               reset,
  input               debugReset
);
  wire                IBusCachedPlugin_cache_io_flush;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isStuck;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_isRemoved;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isValid;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isStuck;
  wire                IBusCachedPlugin_cache_io_cpu_decode_isUser;
  reg                 IBusCachedPlugin_cache_io_cpu_fill_valid;
  reg                 dataCache_1_io_cpu_execute_isValid;
  reg        [31:0]   dataCache_1_io_cpu_execute_address;
  reg                 dataCache_1_io_cpu_execute_args_wr;
  reg        [1:0]    dataCache_1_io_cpu_execute_args_size;
  reg                 dataCache_1_io_cpu_execute_args_isLrsc;
  wire                dataCache_1_io_cpu_execute_args_amoCtrl_swap;
  wire       [2:0]    dataCache_1_io_cpu_execute_args_amoCtrl_alu;
  reg                 dataCache_1_io_cpu_memory_isValid;
  wire       [31:0]   dataCache_1_io_cpu_memory_address;
  reg                 dataCache_1_io_cpu_memory_mmuRsp_isIoAccess;
  reg                 dataCache_1_io_cpu_writeBack_isValid;
  wire                dataCache_1_io_cpu_writeBack_isUser;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_storeData;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_address;
  wire                dataCache_1_io_cpu_writeBack_fence_SW;
  wire                dataCache_1_io_cpu_writeBack_fence_SR;
  wire                dataCache_1_io_cpu_writeBack_fence_SO;
  wire                dataCache_1_io_cpu_writeBack_fence_SI;
  wire                dataCache_1_io_cpu_writeBack_fence_PW;
  wire                dataCache_1_io_cpu_writeBack_fence_PR;
  wire                dataCache_1_io_cpu_writeBack_fence_PO;
  wire                dataCache_1_io_cpu_writeBack_fence_PI;
  wire       [3:0]    dataCache_1_io_cpu_writeBack_fence_FM;
  wire                dataCache_1_io_cpu_flush_valid;
  wire                dataCache_1_io_mem_cmd_ready;
  reg        [31:0]   _zz_RegFilePlugin_regFile_port0;
  reg        [31:0]   _zz_RegFilePlugin_regFile_port1;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire                IBusCachedPlugin_cache_io_cpu_decode_error;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuException;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_data;
  wire                IBusCachedPlugin_cache_io_cpu_decode_cacheMiss;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire                IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire       [31:0]   IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire       [2:0]    IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire                dataCache_1_io_cpu_execute_haltIt;
  wire                dataCache_1_io_cpu_execute_refilling;
  wire                dataCache_1_io_cpu_memory_isWrite;
  wire                dataCache_1_io_cpu_writeBack_haltIt;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_data;
  wire                dataCache_1_io_cpu_writeBack_mmuException;
  wire                dataCache_1_io_cpu_writeBack_unalignedAccess;
  wire                dataCache_1_io_cpu_writeBack_accessError;
  wire                dataCache_1_io_cpu_writeBack_isWrite;
  wire                dataCache_1_io_cpu_writeBack_keepMemRspData;
  wire                dataCache_1_io_cpu_writeBack_exclusiveOk;
  wire                dataCache_1_io_cpu_flush_ready;
  wire                dataCache_1_io_cpu_redo;
  wire                dataCache_1_io_mem_cmd_valid;
  wire                dataCache_1_io_mem_cmd_payload_wr;
  wire                dataCache_1_io_mem_cmd_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_payload_size;
  wire                dataCache_1_io_mem_cmd_payload_last;
  wire       [51:0]   _zz_memory_MUL_LOW;
  wire       [51:0]   _zz_memory_MUL_LOW_1;
  wire       [51:0]   _zz_memory_MUL_LOW_2;
  wire       [51:0]   _zz_memory_MUL_LOW_3;
  wire       [32:0]   _zz_memory_MUL_LOW_4;
  wire       [51:0]   _zz_memory_MUL_LOW_5;
  wire       [49:0]   _zz_memory_MUL_LOW_6;
  wire       [51:0]   _zz_memory_MUL_LOW_7;
  wire       [49:0]   _zz_memory_MUL_LOW_8;
  wire       [31:0]   _zz_execute_SHIFT_RIGHT;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_1;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_2;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_1;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_2;
  wire                _zz_decode_LEGAL_INSTRUCTION_3;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_4;
  wire       [17:0]   _zz_decode_LEGAL_INSTRUCTION_5;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_6;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_7;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_8;
  wire                _zz_decode_LEGAL_INSTRUCTION_9;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_10;
  wire       [11:0]   _zz_decode_LEGAL_INSTRUCTION_11;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_12;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_13;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_14;
  wire                _zz_decode_LEGAL_INSTRUCTION_15;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_16;
  wire       [5:0]    _zz_decode_LEGAL_INSTRUCTION_17;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_18;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_19;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_20;
  wire                _zz_decode_LEGAL_INSTRUCTION_21;
  wire                _zz_decode_LEGAL_INSTRUCTION_22;
  wire       [4:0]    _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1;
  reg        [31:0]   _zz_IBusCachedPlugin_jump_pcLoad_payload_6;
  wire       [2:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload_7;
  wire       [31:0]   _zz_IBusCachedPlugin_fetchPc_pc;
  wire       [2:0]    _zz_IBusCachedPlugin_fetchPc_pc_1;
  wire       [11:0]   _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire       [31:0]   _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2;
  wire       [19:0]   _zz__zz_2;
  wire       [11:0]   _zz__zz_4;
  wire       [31:0]   _zz__zz_6;
  wire       [31:0]   _zz__zz_6_1;
  wire       [19:0]   _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload;
  wire       [11:0]   _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_4;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_5;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_6;
  wire       [2:0]    _zz_DBusCachedPlugin_exceptionBus_payload_code;
  wire       [2:0]    _zz_DBusCachedPlugin_exceptionBus_payload_code_1;
  reg        [7:0]    _zz_writeBack_DBusCachedPlugin_rspShifted;
  wire       [1:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_1;
  reg        [7:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_2;
  wire       [0:0]    _zz_writeBack_DBusCachedPlugin_rspShifted_3;
  wire       [0:0]    _zz_writeBack_DBusCachedPlugin_rspRf;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_1;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_2;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_3;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_4;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_5;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_6;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_7;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_8;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_9;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_10;
  wire       [30:0]   _zz__zz_decode_IS_SFENCE_VMA2_11;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_12;
  wire       [1:0]    _zz__zz_decode_IS_SFENCE_VMA2_13;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_14;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_15;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_16;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_17;
  wire       [1:0]    _zz__zz_decode_IS_SFENCE_VMA2_18;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_19;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_20;
  wire       [26:0]   _zz__zz_decode_IS_SFENCE_VMA2_21;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_22;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_23;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_24;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_25;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_26;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_27;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_28;
  wire       [23:0]   _zz__zz_decode_IS_SFENCE_VMA2_29;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_30;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_31;
  wire       [1:0]    _zz__zz_decode_IS_SFENCE_VMA2_32;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_33;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_34;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_35;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_36;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_37;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_38;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_39;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_40;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_41;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_42;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_43;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_44;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_45;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_46;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_47;
  wire       [19:0]   _zz__zz_decode_IS_SFENCE_VMA2_48;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_49;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_50;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_51;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_52;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_53;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_54;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_55;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_56;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_57;
  wire       [2:0]    _zz__zz_decode_IS_SFENCE_VMA2_58;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_59;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_60;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_61;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_62;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_63;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_64;
  wire       [16:0]   _zz__zz_decode_IS_SFENCE_VMA2_65;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_66;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_67;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_68;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_69;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_70;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_71;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_72;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_73;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_74;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_75;
  wire       [4:0]    _zz__zz_decode_IS_SFENCE_VMA2_76;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_77;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_78;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_79;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_80;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_81;
  wire       [2:0]    _zz__zz_decode_IS_SFENCE_VMA2_82;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_83;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_84;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_85;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_86;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_87;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_88;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_89;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_90;
  wire       [13:0]   _zz__zz_decode_IS_SFENCE_VMA2_91;
  wire       [2:0]    _zz__zz_decode_IS_SFENCE_VMA2_92;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_93;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_94;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_95;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_96;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_97;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_98;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_99;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_100;
  wire       [2:0]    _zz__zz_decode_IS_SFENCE_VMA2_101;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_102;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_103;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_104;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_105;
  wire       [3:0]    _zz__zz_decode_IS_SFENCE_VMA2_106;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_107;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_108;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_109;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_110;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_111;
  wire       [1:0]    _zz__zz_decode_IS_SFENCE_VMA2_112;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_113;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_114;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_115;
  wire       [4:0]    _zz__zz_decode_IS_SFENCE_VMA2_116;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_117;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_118;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_119;
  wire       [2:0]    _zz__zz_decode_IS_SFENCE_VMA2_120;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_121;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_122;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_123;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_124;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_125;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_126;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_127;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_128;
  wire       [4:0]    _zz__zz_decode_IS_SFENCE_VMA2_129;
  wire       [10:0]   _zz__zz_decode_IS_SFENCE_VMA2_130;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_131;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_132;
  wire       [5:0]    _zz__zz_decode_IS_SFENCE_VMA2_133;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_134;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_135;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_136;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_137;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_138;
  wire       [3:0]    _zz__zz_decode_IS_SFENCE_VMA2_139;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_140;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_141;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_142;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_143;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_144;
  wire       [1:0]    _zz__zz_decode_IS_SFENCE_VMA2_145;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_146;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_147;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_148;
  wire       [1:0]    _zz__zz_decode_IS_SFENCE_VMA2_149;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_150;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_151;
  wire       [1:0]    _zz__zz_decode_IS_SFENCE_VMA2_152;
  wire       [8:0]    _zz__zz_decode_IS_SFENCE_VMA2_153;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_154;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_155;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_156;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_157;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_158;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_159;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_160;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_161;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_162;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_163;
  wire       [6:0]    _zz__zz_decode_IS_SFENCE_VMA2_164;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_165;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_166;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_167;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_168;
  wire       [4:0]    _zz__zz_decode_IS_SFENCE_VMA2_169;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_170;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_171;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_172;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_173;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_174;
  wire       [2:0]    _zz__zz_decode_IS_SFENCE_VMA2_175;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_176;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_177;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_178;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_179;
  wire       [4:0]    _zz__zz_decode_IS_SFENCE_VMA2_180;
  wire       [4:0]    _zz__zz_decode_IS_SFENCE_VMA2_181;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_182;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_183;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_184;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_185;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_186;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_187;
  wire       [2:0]    _zz__zz_decode_IS_SFENCE_VMA2_188;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_189;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_190;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_191;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_192;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_193;
  wire       [2:0]    _zz__zz_decode_IS_SFENCE_VMA2_194;
  wire       [2:0]    _zz__zz_decode_IS_SFENCE_VMA2_195;
  wire                _zz__zz_decode_IS_SFENCE_VMA2_196;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_197;
  wire       [1:0]    _zz__zz_decode_IS_SFENCE_VMA2_198;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_199;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_200;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_201;
  wire       [1:0]    _zz__zz_decode_IS_SFENCE_VMA2_202;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_203;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_204;
  wire       [1:0]    _zz__zz_decode_IS_SFENCE_VMA2_205;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_206;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_207;
  wire       [31:0]   _zz__zz_decode_IS_SFENCE_VMA2_208;
  wire       [0:0]    _zz__zz_decode_IS_SFENCE_VMA2_209;
  wire                _zz_RegFilePlugin_regFile_port;
  wire                _zz_decode_RegFilePlugin_rs1Data;
  wire                _zz_RegFilePlugin_regFile_port_1;
  wire                _zz_decode_RegFilePlugin_rs2Data;
  wire       [0:0]    _zz__zz_execute_REGFILE_WRITE_DATA;
  wire       [2:0]    _zz__zz_decode_SRC1_1;
  wire       [4:0]    _zz__zz_decode_SRC1_1_1;
  wire       [11:0]   _zz__zz_decode_SRC2_4;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_1;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_3;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_4;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_5;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_6;
  wire       [65:0]   _zz_writeBack_MulPlugin_result;
  wire       [65:0]   _zz_writeBack_MulPlugin_result_1;
  wire       [31:0]   _zz__zz_decode_RS2_2;
  wire       [31:0]   _zz__zz_decode_RS2_2_1;
  wire       [5:0]    _zz_memory_MulDivIterativePlugin_div_counter_valueNext;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_div_counter_valueNext_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_outNumerator;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_1;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_2;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_3;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_div_result_4;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_div_result_5;
  wire       [32:0]   _zz_memory_MulDivIterativePlugin_rs1_2;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_rs1_3;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_rs2_1;
  wire       [0:0]    _zz_memory_MulDivIterativePlugin_rs2_2;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1;
  wire                _zz_when;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_4;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1;
  wire       [31:0]   _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_branch_src2_2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_branch_src2_4;
  wire                _zz_execute_BranchPlugin_branch_src2_6;
  wire                _zz_execute_BranchPlugin_branch_src2_7;
  wire                _zz_execute_BranchPlugin_branch_src2_8;
  wire       [2:0]    _zz_execute_BranchPlugin_branch_src2_9;
  wire       [9:0]    _zz_MmuPlugin_ports_0_cacheHitsCalc;
  wire       [9:0]    _zz_MmuPlugin_ports_0_cacheHitsCalc_1;
  wire                _zz_MmuPlugin_ports_0_cacheHitsCalc_2;
  wire                _zz_MmuPlugin_ports_0_cacheHitsCalc_3;
  wire                _zz_MmuPlugin_ports_0_cacheHitsCalc_4;
  wire                _zz_MmuPlugin_ports_0_cacheHitsCalc_5;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_valid_4;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_exception;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_superPage;
  reg        [9:0]    _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_0;
  reg        [9:0]    _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_1;
  reg        [9:0]    _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_0;
  reg        [9:0]    _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_1;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_allowRead;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_allowWrite;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_allowExecute;
  reg                 _zz_MmuPlugin_ports_0_cacheLine_allowUser;
  wire       [1:0]    _zz_MmuPlugin_ports_0_entryToReplace_valueNext;
  wire       [0:0]    _zz_MmuPlugin_ports_0_entryToReplace_valueNext_1;
  wire       [9:0]    _zz_MmuPlugin_ports_1_cacheHitsCalc;
  wire       [9:0]    _zz_MmuPlugin_ports_1_cacheHitsCalc_1;
  wire                _zz_MmuPlugin_ports_1_cacheHitsCalc_2;
  wire                _zz_MmuPlugin_ports_1_cacheHitsCalc_3;
  wire                _zz_MmuPlugin_ports_1_cacheHitsCalc_4;
  wire                _zz_MmuPlugin_ports_1_cacheHitsCalc_5;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_valid_4;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_exception;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_superPage;
  reg        [9:0]    _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_0;
  reg        [9:0]    _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_1;
  reg        [9:0]    _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_0;
  reg        [9:0]    _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_1;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_allowRead;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_allowWrite;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_allowExecute;
  reg                 _zz_MmuPlugin_ports_1_cacheLine_allowUser;
  wire       [1:0]    _zz_MmuPlugin_ports_1_entryToReplace_valueNext;
  wire       [0:0]    _zz_MmuPlugin_ports_1_entryToReplace_valueNext_1;
  wire       [1:0]    _zz__zz_MmuPlugin_shared_refills_2;
  wire       [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_19;
  wire       [51:0]   memory_MUL_LOW;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       [33:0]   execute_MUL_HL;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   execute_MUL_LL;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire                execute_IS_DBUS_SHARING;
  wire       [31:0]   memory_MEMORY_STORE_DATA_RF;
  wire       [31:0]   execute_MEMORY_STORE_DATA_RF;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire                decode_DO_EBREAK;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire       [31:0]   decode_SRC2;
  wire       [31:0]   decode_SRC1;
  wire                decode_SRC2_FORCE_ZERO;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_decode_to_execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_decode_to_execute_BRANCH_CTRL_1;
  wire                decode_IS_SFENCE_VMA2;
  wire                decode_IS_SFENCE_VMA;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_memory_to_writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_memory_to_writeBack_ENV_CTRL_1;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_execute_to_memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_execute_to_memory_ENV_CTRL_1;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_decode_to_execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_decode_to_execute_ENV_CTRL_1;
  wire                decode_IS_CSR;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_execute_to_memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_execute_to_memory_SHIFT_CTRL_1;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_decode_to_execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_decode_to_execute_SHIFT_CTRL_1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_decode_to_execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                decode_MEMORY_MANAGMENT;
  wire                memory_MEMORY_LRSC;
  wire                memory_MEMORY_WR;
  wire                decode_MEMORY_WR;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_decode_to_execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_decode_to_execute_ALU_CTRL_1;
  wire                decode_MEMORY_FORCE_CONSTISTENCY;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_IS_SFENCE_VMA2;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  wire                execute_BRANCH_COND_RESULT;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_execute_BRANCH_CTRL;
  wire       [31:0]   execute_PC;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_writeBack_ENV_CTRL;
  wire                execute_IS_SFENCE_VMA;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  wire                memory_IS_DIV;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  (* keep , syn_keep *) wire       [31:0]   execute_RS1 /* synthesis syn_keep = 1 */ ;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  reg        [31:0]   _zz_decode_RS2;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_decode_RS2_1;
  wire       `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_execute_SHIFT_CTRL;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_decode_SRC2;
  wire       [31:0]   _zz_decode_SRC2_1;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_decode_SRC2_CTRL;
  wire       [31:0]   _zz_decode_SRC1;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_decode_SRC1_CTRL;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_execute_ALU_CTRL;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_execute_ALU_BITWISE_CTRL;
  wire       [31:0]   _zz_lastStageRegFileWrite_payload_address;
  wire                _zz_lastStageRegFileWrite_valid;
  reg                 _zz_1;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_decode_BRANCH_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_decode_ENV_CTRL_1;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_decode_SHIFT_CTRL_1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_decode_ALU_BITWISE_CTRL_1;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_decode_SRC2_CTRL_1;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_decode_ALU_CTRL_1;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_decode_SRC1_CTRL_1;
  wire                writeBack_IS_DBUS_SHARING;
  wire                memory_IS_DBUS_SHARING;
  reg        [31:0]   _zz_decode_RS2_2;
  wire                writeBack_MEMORY_LRSC;
  wire                writeBack_MEMORY_WR;
  wire       [31:0]   writeBack_MEMORY_STORE_DATA_RF;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire                writeBack_MEMORY_ENABLE;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_ENABLE;
  reg                 execute_MEMORY_AMO;
  reg                 execute_MEMORY_LRSC;
  wire                execute_MEMORY_FORCE_CONSTISTENCY;
  wire                execute_MEMORY_MANAGMENT;
  (* keep , syn_keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire                execute_MEMORY_WR;
  wire       [31:0]   execute_SRC_ADD;
  wire                execute_MEMORY_ENABLE;
  wire       [31:0]   execute_INSTRUCTION;
  wire                decode_MEMORY_AMO;
  wire                decode_MEMORY_LRSC;
  reg                 _zz_decode_MEMORY_FORCE_CONSTISTENCY;
  wire                decode_MEMORY_ENABLE;
  wire                decode_FLUSH_ALL;
  reg                 IBusCachedPlugin_rsp_issueDetected_4;
  reg                 IBusCachedPlugin_rsp_issueDetected_3;
  reg                 IBusCachedPlugin_rsp_issueDetected_2;
  reg                 IBusCachedPlugin_rsp_issueDetected_1;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_decode_BRANCH_CTRL_1;
  wire       [31:0]   decode_INSTRUCTION;
  reg        [31:0]   _zz_memory_to_writeBack_FORMAL_PC_NEXT;
  reg        [31:0]   _zz_execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   _zz_decode_to_execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_PC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  reg                 writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  reg                 writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusCachedPlugin_fetcherHalt;
  reg                 IBusCachedPlugin_incomingInstruction;
  wire                IBusCachedPlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire       [31:0]   IBusCachedPlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  reg                 IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire                IBusCachedPlugin_decodePrediction_rsp_wasWrong;
  wire                IBusCachedPlugin_pcValids_0;
  wire                IBusCachedPlugin_pcValids_1;
  wire                IBusCachedPlugin_pcValids_2;
  wire                IBusCachedPlugin_pcValids_3;
  reg                 IBusCachedPlugin_decodeExceptionPort_valid;
  reg        [3:0]    IBusCachedPlugin_decodeExceptionPort_payload_code;
  wire       [31:0]   IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                IBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  wire                IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  reg        [31:0]   IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  reg                 IBusCachedPlugin_mmuBus_rsp_isPaging;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowRead;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowWrite;
  reg                 IBusCachedPlugin_mmuBus_rsp_allowExecute;
  reg                 IBusCachedPlugin_mmuBus_rsp_exception;
  reg                 IBusCachedPlugin_mmuBus_rsp_refilling;
  wire                IBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                IBusCachedPlugin_mmuBus_rsp_ways_0_sel;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_ways_0_physical;
  wire                IBusCachedPlugin_mmuBus_rsp_ways_1_sel;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_ways_1_physical;
  wire                IBusCachedPlugin_mmuBus_rsp_ways_2_sel;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_ways_2_physical;
  wire                IBusCachedPlugin_mmuBus_rsp_ways_3_sel;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_ways_3_physical;
  wire                IBusCachedPlugin_mmuBus_end;
  wire                IBusCachedPlugin_mmuBus_busy;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isValid;
  wire                DBusCachedPlugin_mmuBus_cmd_0_isStuck;
  wire       [31:0]   DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
  reg                 DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation;
  reg        [31:0]   DBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                DBusCachedPlugin_mmuBus_rsp_isIoAccess;
  reg                 DBusCachedPlugin_mmuBus_rsp_isPaging;
  reg                 DBusCachedPlugin_mmuBus_rsp_allowRead;
  reg                 DBusCachedPlugin_mmuBus_rsp_allowWrite;
  reg                 DBusCachedPlugin_mmuBus_rsp_allowExecute;
  reg                 DBusCachedPlugin_mmuBus_rsp_exception;
  reg                 DBusCachedPlugin_mmuBus_rsp_refilling;
  wire                DBusCachedPlugin_mmuBus_rsp_bypassTranslation;
  wire                DBusCachedPlugin_mmuBus_rsp_ways_0_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_0_physical;
  wire                DBusCachedPlugin_mmuBus_rsp_ways_1_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_1_physical;
  wire                DBusCachedPlugin_mmuBus_rsp_ways_2_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_2_physical;
  wire                DBusCachedPlugin_mmuBus_rsp_ways_3_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_3_physical;
  wire                DBusCachedPlugin_mmuBus_end;
  wire                DBusCachedPlugin_mmuBus_busy;
  reg                 DBusCachedPlugin_redoBranch_valid;
  wire       [31:0]   DBusCachedPlugin_redoBranch_payload;
  reg                 DBusCachedPlugin_exceptionBus_valid;
  reg        [3:0]    DBusCachedPlugin_exceptionBus_payload_code;
  wire       [31:0]   DBusCachedPlugin_exceptionBus_payload_badAddr;
  reg                 _zz_when_DBusCachedPlugin_l386;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire       [31:0]   CsrPlugin_csrMapping_readDataSignal;
  wire       [31:0]   CsrPlugin_csrMapping_readDataInit;
  wire       [31:0]   CsrPlugin_csrMapping_writeDataSignal;
  wire                CsrPlugin_csrMapping_allowCsrSignal;
  wire                CsrPlugin_csrMapping_hazardFree;
  reg                 CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  reg                 CsrPlugin_redoInterface_valid;
  wire       [31:0]   CsrPlugin_redoInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_selfException_valid;
  reg        [3:0]    CsrPlugin_selfException_payload_code;
  wire       [31:0]   CsrPlugin_selfException_payload_badAddr;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 CsrPlugin_allowEbreakException;
  reg                 IBusCachedPlugin_injectionPort_valid;
  reg                 IBusCachedPlugin_injectionPort_ready;
  wire       [31:0]   IBusCachedPlugin_injectionPort_payload;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                BranchPlugin_branchExceptionPort_valid;
  wire       [3:0]    BranchPlugin_branchExceptionPort_payload_code;
  wire       [31:0]   BranchPlugin_branchExceptionPort_payload_badAddr;
  reg                 MmuPlugin_dBusAccess_cmd_valid;
  reg                 MmuPlugin_dBusAccess_cmd_ready;
  reg        [31:0]   MmuPlugin_dBusAccess_cmd_payload_address;
  wire       [1:0]    MmuPlugin_dBusAccess_cmd_payload_size;
  wire                MmuPlugin_dBusAccess_cmd_payload_write;
  wire       [31:0]   MmuPlugin_dBusAccess_cmd_payload_data;
  wire       [3:0]    MmuPlugin_dBusAccess_cmd_payload_writeMask;
  wire                MmuPlugin_dBusAccess_rsp_valid;
  wire       [31:0]   MmuPlugin_dBusAccess_rsp_payload_data;
  wire                MmuPlugin_dBusAccess_rsp_payload_error;
  wire                MmuPlugin_dBusAccess_rsp_payload_redo;
  wire                IBusCachedPlugin_externalFlush;
  wire                IBusCachedPlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusCachedPlugin_jump_pcLoad_payload;
  wire       [4:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload;
  wire       [4:0]    _zz_IBusCachedPlugin_jump_pcLoad_payload_1;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_2;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_3;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_4;
  wire                _zz_IBusCachedPlugin_jump_pcLoad_payload_5;
  wire                IBusCachedPlugin_fetchPc_output_valid;
  wire                IBusCachedPlugin_fetchPc_output_ready;
  wire       [31:0]   IBusCachedPlugin_fetchPc_output_payload;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusCachedPlugin_fetchPc_correction;
  reg                 IBusCachedPlugin_fetchPc_correctionReg;
  wire                when_Fetcher_l127;
  wire                IBusCachedPlugin_fetchPc_corrected;
  reg                 IBusCachedPlugin_fetchPc_pcRegPropagate;
  reg                 IBusCachedPlugin_fetchPc_booted;
  reg                 IBusCachedPlugin_fetchPc_inc;
  wire                when_Fetcher_l131;
  wire                when_Fetcher_l131_1;
  wire                when_Fetcher_l131_2;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pc;
  wire                IBusCachedPlugin_fetchPc_redo_valid;
  wire       [31:0]   IBusCachedPlugin_fetchPc_redo_payload;
  reg                 IBusCachedPlugin_fetchPc_flushed;
  wire                when_Fetcher_l158;
  reg                 IBusCachedPlugin_iBusRsp_redoFetch;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_2_halt;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire                _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_1;
  reg                 _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_2;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  reg        [31:0]   _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 IBusCachedPlugin_iBusRsp_readyForError;
  wire                IBusCachedPlugin_iBusRsp_output_valid;
  wire                IBusCachedPlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_pc;
  wire                IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  wire                when_Fetcher_l240;
  wire                when_Fetcher_l320;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_0;
  wire                when_Fetcher_l329;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_1;
  wire                when_Fetcher_l329_1;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_2;
  wire                when_Fetcher_l329_2;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_3;
  wire                when_Fetcher_l329_3;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_4;
  wire                when_Fetcher_l329_4;
  wire                _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  reg        [18:0]   _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1;
  wire                _zz_2;
  reg        [10:0]   _zz_3;
  wire                _zz_4;
  reg        [18:0]   _zz_5;
  reg                 _zz_6;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload;
  reg        [10:0]   _zz_IBusCachedPlugin_predictionJumpInterface_payload_1;
  wire                _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  reg        [18:0]   _zz_IBusCachedPlugin_predictionJumpInterface_payload_3;
  wire       [31:0]   _zz_IBusCachedPlugin_rspCounter;
  reg        [31:0]   IBusCachedPlugin_rspCounter;
  wire                IBusCachedPlugin_s0_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s1_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s2_tightlyCoupledHit;
  wire                IBusCachedPlugin_rsp_iBusRspOutputHalt;
  wire                IBusCachedPlugin_rsp_issueDetected;
  reg                 IBusCachedPlugin_rsp_redoFetch;
  wire                when_IBusCachedPlugin_l239;
  wire                when_IBusCachedPlugin_l244;
  wire                when_IBusCachedPlugin_l250;
  wire                when_IBusCachedPlugin_l256;
  wire                when_IBusCachedPlugin_l267;
  wire                dataCache_1_io_mem_cmd_s2mPipe_valid;
  wire                dataCache_1_io_mem_cmd_s2mPipe_ready;
  wire                dataCache_1_io_mem_cmd_s2mPipe_payload_wr;
  wire                dataCache_1_io_mem_cmd_s2mPipe_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_s2mPipe_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_s2mPipe_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_s2mPipe_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_s2mPipe_payload_size;
  wire                dataCache_1_io_mem_cmd_s2mPipe_payload_last;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rValid;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rData_wr;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rData_uncached;
  reg        [31:0]   dataCache_1_io_mem_cmd_s2mPipe_rData_address;
  reg        [31:0]   dataCache_1_io_mem_cmd_s2mPipe_rData_data;
  reg        [3:0]    dataCache_1_io_mem_cmd_s2mPipe_rData_mask;
  reg        [2:0]    dataCache_1_io_mem_cmd_s2mPipe_rData_size;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rData_last;
  wire                when_Stream_l365;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_ready;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_size;
  wire                dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rValid_1;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rData_wr_1;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rData_uncached_1;
  reg        [31:0]   dataCache_1_io_mem_cmd_s2mPipe_rData_address_1;
  reg        [31:0]   dataCache_1_io_mem_cmd_s2mPipe_rData_data_1;
  reg        [3:0]    dataCache_1_io_mem_cmd_s2mPipe_rData_mask_1;
  reg        [2:0]    dataCache_1_io_mem_cmd_s2mPipe_rData_size_1;
  reg                 dataCache_1_io_mem_cmd_s2mPipe_rData_last_1;
  reg                 dBus_rsp_regNext_valid;
  reg                 dBus_rsp_regNext_payload_last;
  reg        [31:0]   dBus_rsp_regNext_payload_data;
  reg                 dBus_rsp_regNext_payload_error;
  wire       [31:0]   _zz_DBusCachedPlugin_rspCounter;
  reg        [31:0]   DBusCachedPlugin_rspCounter;
  wire                when_DBusCachedPlugin_l303;
  wire                when_DBusCachedPlugin_l311;
  wire       [1:0]    execute_DBusCachedPlugin_size;
  reg        [31:0]   _zz_execute_MEMORY_STORE_DATA_RF;
  wire                when_DBusCachedPlugin_l343;
  wire                when_DBusCachedPlugin_l359;
  wire                when_DBusCachedPlugin_l386;
  wire                when_DBusCachedPlugin_l438;
  wire                when_DBusCachedPlugin_l458;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_0;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_1;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_2;
  wire       [7:0]    writeBack_DBusCachedPlugin_rspSplits_3;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspShifted;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspRf;
  wire                when_DBusCachedPlugin_l474;
  wire       [1:0]    switch_Misc_l199;
  wire                _zz_writeBack_DBusCachedPlugin_rspFormated;
  reg        [31:0]   _zz_writeBack_DBusCachedPlugin_rspFormated_1;
  wire                _zz_writeBack_DBusCachedPlugin_rspFormated_2;
  reg        [31:0]   _zz_writeBack_DBusCachedPlugin_rspFormated_3;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspFormated;
  wire                when_DBusCachedPlugin_l484;
  reg                 DBusCachedPlugin_forceDatapath;
  wire                when_DBusCachedPlugin_l498;
  wire                when_DBusCachedPlugin_l499;
  wire       [36:0]   _zz_decode_IS_SFENCE_VMA2;
  wire                _zz_decode_IS_SFENCE_VMA2_1;
  wire                _zz_decode_IS_SFENCE_VMA2_2;
  wire                _zz_decode_IS_SFENCE_VMA2_3;
  wire                _zz_decode_IS_SFENCE_VMA2_4;
  wire                _zz_decode_IS_SFENCE_VMA2_5;
  wire                _zz_decode_IS_SFENCE_VMA2_6;
  wire                _zz_decode_IS_SFENCE_VMA2_7;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_decode_SRC1_CTRL_2;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_decode_ALU_CTRL_2;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_decode_SRC2_CTRL_2;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_decode_ALU_BITWISE_CTRL_2;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_decode_SHIFT_CTRL_2;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_decode_ENV_CTRL_2;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_decode_BRANCH_CTRL_2;
  wire                when_RegFilePlugin_l63;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_7;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_execute_REGFILE_WRITE_DATA;
  reg        [31:0]   _zz_decode_SRC1_1;
  wire                _zz_decode_SRC2_2;
  reg        [19:0]   _zz_decode_SRC2_3;
  wire                _zz_decode_SRC2_4;
  reg        [19:0]   _zz_decode_SRC2_5;
  reg        [31:0]   _zz_decode_SRC2_6;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_execute_FullBarrelShifterPlugin_reversed;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_decode_RS2_3;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                when_HazardSimplePlugin_l47;
  wire                when_HazardSimplePlugin_l48;
  wire                when_HazardSimplePlugin_l51;
  wire                when_HazardSimplePlugin_l45;
  wire                when_HazardSimplePlugin_l57;
  wire                when_HazardSimplePlugin_l58;
  wire                when_HazardSimplePlugin_l48_1;
  wire                when_HazardSimplePlugin_l51_1;
  wire                when_HazardSimplePlugin_l45_1;
  wire                when_HazardSimplePlugin_l57_1;
  wire                when_HazardSimplePlugin_l58_1;
  wire                when_HazardSimplePlugin_l48_2;
  wire                when_HazardSimplePlugin_l51_2;
  wire                when_HazardSimplePlugin_l45_2;
  wire                when_HazardSimplePlugin_l57_2;
  wire                when_HazardSimplePlugin_l58_2;
  wire                when_HazardSimplePlugin_l105;
  wire                when_HazardSimplePlugin_l108;
  wire                when_HazardSimplePlugin_l113;
  reg                 execute_MulPlugin_aSigned;
  reg                 execute_MulPlugin_bSigned;
  wire       [31:0]   execute_MulPlugin_a;
  wire       [31:0]   execute_MulPlugin_b;
  wire       [1:0]    switch_MulPlugin_l87;
  wire       [15:0]   execute_MulPlugin_aULow;
  wire       [15:0]   execute_MulPlugin_bULow;
  wire       [16:0]   execute_MulPlugin_aSLow;
  wire       [16:0]   execute_MulPlugin_bSLow;
  wire       [16:0]   execute_MulPlugin_aHigh;
  wire       [16:0]   execute_MulPlugin_bHigh;
  wire       [65:0]   writeBack_MulPlugin_result;
  wire                when_MulPlugin_l147;
  wire       [1:0]    switch_MulPlugin_l148;
  reg        [32:0]   memory_MulDivIterativePlugin_rs1;
  reg        [31:0]   memory_MulDivIterativePlugin_rs2;
  reg        [64:0]   memory_MulDivIterativePlugin_accumulator;
  wire                memory_MulDivIterativePlugin_frontendOk;
  reg                 memory_MulDivIterativePlugin_div_needRevert;
  reg                 memory_MulDivIterativePlugin_div_counter_willIncrement;
  reg                 memory_MulDivIterativePlugin_div_counter_willClear;
  reg        [5:0]    memory_MulDivIterativePlugin_div_counter_valueNext;
  reg        [5:0]    memory_MulDivIterativePlugin_div_counter_value;
  wire                memory_MulDivIterativePlugin_div_counter_willOverflowIfInc;
  wire                memory_MulDivIterativePlugin_div_counter_willOverflow;
  reg                 memory_MulDivIterativePlugin_div_done;
  wire                when_MulDivIterativePlugin_l126;
  wire                when_MulDivIterativePlugin_l126_1;
  reg        [31:0]   memory_MulDivIterativePlugin_div_result;
  wire                when_MulDivIterativePlugin_l128;
  wire                when_MulDivIterativePlugin_l129;
  wire                when_MulDivIterativePlugin_l132;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_MulDivIterativePlugin_div_stage_0_outNumerator;
  wire                when_MulDivIterativePlugin_l151;
  wire       [31:0]   _zz_memory_MulDivIterativePlugin_div_result;
  wire                when_MulDivIterativePlugin_l162;
  wire                _zz_memory_MulDivIterativePlugin_rs2;
  wire                _zz_memory_MulDivIterativePlugin_rs1;
  reg        [32:0]   _zz_memory_MulDivIterativePlugin_rs1_1;
  reg        [1:0]    _zz_CsrPlugin_privilege;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  reg        [1:0]    CsrPlugin_mtvec_mode;
  reg        [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg        [31:0]   CsrPlugin_mscratch;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg        [63:0]   CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg                 CsrPlugin_medeleg_IAM;
  reg                 CsrPlugin_medeleg_IAF;
  reg                 CsrPlugin_medeleg_II;
  reg                 CsrPlugin_medeleg_LAM;
  reg                 CsrPlugin_medeleg_LAF;
  reg                 CsrPlugin_medeleg_SAM;
  reg                 CsrPlugin_medeleg_SAF;
  reg                 CsrPlugin_medeleg_EU;
  reg                 CsrPlugin_medeleg_ES;
  reg                 CsrPlugin_medeleg_IPF;
  reg                 CsrPlugin_medeleg_LPF;
  reg                 CsrPlugin_medeleg_SPF;
  reg                 CsrPlugin_mideleg_ST;
  reg                 CsrPlugin_mideleg_SE;
  reg                 CsrPlugin_mideleg_SS;
  reg                 CsrPlugin_sstatus_SIE;
  reg                 CsrPlugin_sstatus_SPIE;
  reg        [0:0]    CsrPlugin_sstatus_SPP;
  reg                 CsrPlugin_sip_SEIP_SOFT;
  reg                 CsrPlugin_sip_SEIP_INPUT;
  wire                CsrPlugin_sip_SEIP_OR;
  reg                 CsrPlugin_sip_STIP;
  reg                 CsrPlugin_sip_SSIP;
  reg                 CsrPlugin_sie_SEIE;
  reg                 CsrPlugin_sie_STIE;
  reg                 CsrPlugin_sie_SSIE;
  reg        [1:0]    CsrPlugin_stvec_mode;
  reg        [29:0]   CsrPlugin_stvec_base;
  reg        [31:0]   CsrPlugin_sscratch;
  reg                 CsrPlugin_scause_interrupt;
  reg        [3:0]    CsrPlugin_scause_exceptionCode;
  reg        [31:0]   CsrPlugin_stval;
  reg        [31:0]   CsrPlugin_sepc;
  reg        [21:0]   CsrPlugin_satp_PPN;
  reg        [8:0]    CsrPlugin_satp_ASID;
  reg        [0:0]    CsrPlugin_satp_MODE;
  reg                 CsrPlugin_rescheduleLogic_rescheduleNext;
  wire                when_CsrPlugin_l803;
  wire                _zz_when_CsrPlugin_l952;
  wire                _zz_when_CsrPlugin_l952_1;
  wire                _zz_when_CsrPlugin_l952_2;
  wire                _zz_when_CsrPlugin_l952_3;
  wire                _zz_when_CsrPlugin_l952_4;
  wire                _zz_when_CsrPlugin_l952_5;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  reg        [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire                when_CsrPlugin_l866;
  wire                when_CsrPlugin_l866_1;
  wire                when_CsrPlugin_l866_2;
  wire                when_CsrPlugin_l866_3;
  wire                when_CsrPlugin_l866_4;
  wire                when_CsrPlugin_l866_5;
  wire                when_CsrPlugin_l866_6;
  wire                when_CsrPlugin_l866_7;
  wire                when_CsrPlugin_l866_8;
  wire                when_CsrPlugin_l866_9;
  wire                when_CsrPlugin_l866_10;
  wire                when_CsrPlugin_l866_11;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire       [1:0]    _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  wire                _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire                when_CsrPlugin_l909;
  wire                when_CsrPlugin_l909_1;
  wire                when_CsrPlugin_l909_2;
  wire                when_CsrPlugin_l909_3;
  wire                when_CsrPlugin_l922;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                when_CsrPlugin_l946;
  wire                when_CsrPlugin_l946_1;
  wire                when_CsrPlugin_l952;
  wire                when_CsrPlugin_l952_1;
  wire                when_CsrPlugin_l952_2;
  wire                when_CsrPlugin_l952_3;
  wire                when_CsrPlugin_l952_4;
  wire                when_CsrPlugin_l952_5;
  wire                when_CsrPlugin_l952_6;
  wire                when_CsrPlugin_l952_7;
  wire                when_CsrPlugin_l952_8;
  wire                CsrPlugin_exception;
  reg                 CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  wire                when_CsrPlugin_l980;
  wire                when_CsrPlugin_l980_1;
  wire                when_CsrPlugin_l980_2;
  wire                when_CsrPlugin_l985;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                when_CsrPlugin_l991;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  wire                when_CsrPlugin_l1019;
  wire                when_CsrPlugin_l1064;
  wire       [1:0]    switch_CsrPlugin_l1068;
  reg                 execute_CsrPlugin_wfiWake;
  wire                when_CsrPlugin_l1108;
  wire                when_CsrPlugin_l1110;
  wire                when_CsrPlugin_l1116;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire                when_CsrPlugin_l1129;
  wire                when_CsrPlugin_l1136;
  wire                when_CsrPlugin_l1137;
  wire                when_CsrPlugin_l1144;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  reg        [31:0]   execute_CsrPlugin_readToWriteData;
  wire                switch_Misc_l199_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_writeDataSignal;
  wire                when_CsrPlugin_l1176;
  wire                when_CsrPlugin_l1180;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  wire                when_DebugPlugin_l225;
  reg                 DebugPlugin_haltedByBreak;
  reg                 DebugPlugin_debugUsed /* verilator public */ ;
  reg                 DebugPlugin_disableEbreak;
  wire                DebugPlugin_allowEBreak;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_when_DebugPlugin_l244;
  wire                when_DebugPlugin_l244;
  wire       [5:0]    switch_DebugPlugin_l256;
  wire                when_DebugPlugin_l260;
  wire                when_DebugPlugin_l260_1;
  wire                when_DebugPlugin_l261;
  wire                when_DebugPlugin_l261_1;
  wire                when_DebugPlugin_l262;
  wire                when_DebugPlugin_l263;
  wire                when_DebugPlugin_l264;
  wire                when_DebugPlugin_l264_1;
  wire                when_DebugPlugin_l284;
  wire                when_DebugPlugin_l287;
  wire                when_DebugPlugin_l300;
  reg                 DebugPlugin_resetIt_regNext;
  wire                when_DebugPlugin_l316;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    switch_Misc_l199_2;
  reg                 _zz_execute_BRANCH_COND_RESULT;
  reg                 _zz_execute_BRANCH_COND_RESULT_1;
  wire                _zz_execute_BranchPlugin_missAlignedTarget;
  reg        [19:0]   _zz_execute_BranchPlugin_missAlignedTarget_1;
  wire                _zz_execute_BranchPlugin_missAlignedTarget_2;
  reg        [10:0]   _zz_execute_BranchPlugin_missAlignedTarget_3;
  wire                _zz_execute_BranchPlugin_missAlignedTarget_4;
  reg        [18:0]   _zz_execute_BranchPlugin_missAlignedTarget_5;
  reg                 _zz_execute_BranchPlugin_missAlignedTarget_6;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_execute_BranchPlugin_branch_src2;
  reg        [19:0]   _zz_execute_BranchPlugin_branch_src2_1;
  wire                _zz_execute_BranchPlugin_branch_src2_2;
  reg        [10:0]   _zz_execute_BranchPlugin_branch_src2_3;
  wire                _zz_execute_BranchPlugin_branch_src2_4;
  reg        [18:0]   _zz_execute_BranchPlugin_branch_src2_5;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg                 MmuPlugin_status_sum;
  reg                 MmuPlugin_status_mxr;
  reg                 MmuPlugin_status_mprv;
  reg                 MmuPlugin_satp_mode;
  reg        [8:0]    MmuPlugin_satp_asid;
  reg        [19:0]   MmuPlugin_satp_ppn;
  reg                 MmuPlugin_ports_0_cache_0_valid;
  reg                 MmuPlugin_ports_0_cache_0_exception;
  reg                 MmuPlugin_ports_0_cache_0_superPage;
  reg        [9:0]    MmuPlugin_ports_0_cache_0_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_0_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_0_cache_0_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_0_physicalAddress_1;
  reg                 MmuPlugin_ports_0_cache_0_allowRead;
  reg                 MmuPlugin_ports_0_cache_0_allowWrite;
  reg                 MmuPlugin_ports_0_cache_0_allowExecute;
  reg                 MmuPlugin_ports_0_cache_0_allowUser;
  reg                 MmuPlugin_ports_0_cache_1_valid;
  reg                 MmuPlugin_ports_0_cache_1_exception;
  reg                 MmuPlugin_ports_0_cache_1_superPage;
  reg        [9:0]    MmuPlugin_ports_0_cache_1_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_1_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_0_cache_1_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_1_physicalAddress_1;
  reg                 MmuPlugin_ports_0_cache_1_allowRead;
  reg                 MmuPlugin_ports_0_cache_1_allowWrite;
  reg                 MmuPlugin_ports_0_cache_1_allowExecute;
  reg                 MmuPlugin_ports_0_cache_1_allowUser;
  reg                 MmuPlugin_ports_0_cache_2_valid;
  reg                 MmuPlugin_ports_0_cache_2_exception;
  reg                 MmuPlugin_ports_0_cache_2_superPage;
  reg        [9:0]    MmuPlugin_ports_0_cache_2_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_2_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_0_cache_2_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_2_physicalAddress_1;
  reg                 MmuPlugin_ports_0_cache_2_allowRead;
  reg                 MmuPlugin_ports_0_cache_2_allowWrite;
  reg                 MmuPlugin_ports_0_cache_2_allowExecute;
  reg                 MmuPlugin_ports_0_cache_2_allowUser;
  reg                 MmuPlugin_ports_0_cache_3_valid;
  reg                 MmuPlugin_ports_0_cache_3_exception;
  reg                 MmuPlugin_ports_0_cache_3_superPage;
  reg        [9:0]    MmuPlugin_ports_0_cache_3_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_3_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_0_cache_3_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_0_cache_3_physicalAddress_1;
  reg                 MmuPlugin_ports_0_cache_3_allowRead;
  reg                 MmuPlugin_ports_0_cache_3_allowWrite;
  reg                 MmuPlugin_ports_0_cache_3_allowExecute;
  reg                 MmuPlugin_ports_0_cache_3_allowUser;
  wire                MmuPlugin_ports_0_dirty;
  reg                 MmuPlugin_ports_0_requireMmuLockupCalc;
  wire                when_MmuPlugin_l125;
  wire                when_MmuPlugin_l126;
  wire       [3:0]    MmuPlugin_ports_0_cacheHitsCalc;
  wire                MmuPlugin_ports_0_cacheHit;
  wire                _zz_MmuPlugin_ports_0_cacheLine_valid;
  wire                _zz_MmuPlugin_ports_0_cacheLine_valid_1;
  wire                _zz_MmuPlugin_ports_0_cacheLine_valid_2;
  wire       [1:0]    _zz_MmuPlugin_ports_0_cacheLine_valid_3;
  wire                MmuPlugin_ports_0_cacheLine_valid;
  wire                MmuPlugin_ports_0_cacheLine_exception;
  wire                MmuPlugin_ports_0_cacheLine_superPage;
  wire       [9:0]    MmuPlugin_ports_0_cacheLine_virtualAddress_0;
  wire       [9:0]    MmuPlugin_ports_0_cacheLine_virtualAddress_1;
  wire       [9:0]    MmuPlugin_ports_0_cacheLine_physicalAddress_0;
  wire       [9:0]    MmuPlugin_ports_0_cacheLine_physicalAddress_1;
  wire                MmuPlugin_ports_0_cacheLine_allowRead;
  wire                MmuPlugin_ports_0_cacheLine_allowWrite;
  wire                MmuPlugin_ports_0_cacheLine_allowExecute;
  wire                MmuPlugin_ports_0_cacheLine_allowUser;
  reg                 MmuPlugin_ports_0_entryToReplace_willIncrement;
  wire                MmuPlugin_ports_0_entryToReplace_willClear;
  reg        [1:0]    MmuPlugin_ports_0_entryToReplace_valueNext;
  reg        [1:0]    MmuPlugin_ports_0_entryToReplace_value;
  wire                MmuPlugin_ports_0_entryToReplace_willOverflowIfInc;
  wire                MmuPlugin_ports_0_entryToReplace_willOverflow;
  reg                 MmuPlugin_ports_1_cache_0_valid;
  reg                 MmuPlugin_ports_1_cache_0_exception;
  reg                 MmuPlugin_ports_1_cache_0_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_0_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_0_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_0_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_0_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_0_allowRead;
  reg                 MmuPlugin_ports_1_cache_0_allowWrite;
  reg                 MmuPlugin_ports_1_cache_0_allowExecute;
  reg                 MmuPlugin_ports_1_cache_0_allowUser;
  reg                 MmuPlugin_ports_1_cache_1_valid;
  reg                 MmuPlugin_ports_1_cache_1_exception;
  reg                 MmuPlugin_ports_1_cache_1_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_1_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_1_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_1_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_1_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_1_allowRead;
  reg                 MmuPlugin_ports_1_cache_1_allowWrite;
  reg                 MmuPlugin_ports_1_cache_1_allowExecute;
  reg                 MmuPlugin_ports_1_cache_1_allowUser;
  reg                 MmuPlugin_ports_1_cache_2_valid;
  reg                 MmuPlugin_ports_1_cache_2_exception;
  reg                 MmuPlugin_ports_1_cache_2_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_2_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_2_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_2_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_2_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_2_allowRead;
  reg                 MmuPlugin_ports_1_cache_2_allowWrite;
  reg                 MmuPlugin_ports_1_cache_2_allowExecute;
  reg                 MmuPlugin_ports_1_cache_2_allowUser;
  reg                 MmuPlugin_ports_1_cache_3_valid;
  reg                 MmuPlugin_ports_1_cache_3_exception;
  reg                 MmuPlugin_ports_1_cache_3_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_3_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_3_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_3_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_3_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_3_allowRead;
  reg                 MmuPlugin_ports_1_cache_3_allowWrite;
  reg                 MmuPlugin_ports_1_cache_3_allowExecute;
  reg                 MmuPlugin_ports_1_cache_3_allowUser;
  wire                MmuPlugin_ports_1_dirty;
  reg                 MmuPlugin_ports_1_requireMmuLockupCalc;
  wire                when_MmuPlugin_l125_1;
  wire                when_MmuPlugin_l126_1;
  wire                when_MmuPlugin_l128;
  wire       [3:0]    MmuPlugin_ports_1_cacheHitsCalc;
  wire                MmuPlugin_ports_1_cacheHit;
  wire                _zz_MmuPlugin_ports_1_cacheLine_valid;
  wire                _zz_MmuPlugin_ports_1_cacheLine_valid_1;
  wire                _zz_MmuPlugin_ports_1_cacheLine_valid_2;
  wire       [1:0]    _zz_MmuPlugin_ports_1_cacheLine_valid_3;
  wire                MmuPlugin_ports_1_cacheLine_valid;
  wire                MmuPlugin_ports_1_cacheLine_exception;
  wire                MmuPlugin_ports_1_cacheLine_superPage;
  wire       [9:0]    MmuPlugin_ports_1_cacheLine_virtualAddress_0;
  wire       [9:0]    MmuPlugin_ports_1_cacheLine_virtualAddress_1;
  wire       [9:0]    MmuPlugin_ports_1_cacheLine_physicalAddress_0;
  wire       [9:0]    MmuPlugin_ports_1_cacheLine_physicalAddress_1;
  wire                MmuPlugin_ports_1_cacheLine_allowRead;
  wire                MmuPlugin_ports_1_cacheLine_allowWrite;
  wire                MmuPlugin_ports_1_cacheLine_allowExecute;
  wire                MmuPlugin_ports_1_cacheLine_allowUser;
  reg                 MmuPlugin_ports_1_entryToReplace_willIncrement;
  wire                MmuPlugin_ports_1_entryToReplace_willClear;
  reg        [1:0]    MmuPlugin_ports_1_entryToReplace_valueNext;
  reg        [1:0]    MmuPlugin_ports_1_entryToReplace_value;
  wire                MmuPlugin_ports_1_entryToReplace_willOverflowIfInc;
  wire                MmuPlugin_ports_1_entryToReplace_willOverflow;
  reg        `MmuPlugin_shared_State_defaultEncoding_type MmuPlugin_shared_state_1;
  reg        [9:0]    MmuPlugin_shared_vpn_0;
  reg        [9:0]    MmuPlugin_shared_vpn_1;
  reg        [1:0]    MmuPlugin_shared_portSortedOh;
  reg                 MmuPlugin_shared_dBusRspStaged_valid;
  reg        [31:0]   MmuPlugin_shared_dBusRspStaged_payload_data;
  reg                 MmuPlugin_shared_dBusRspStaged_payload_error;
  reg                 MmuPlugin_shared_dBusRspStaged_payload_redo;
  wire                MmuPlugin_shared_dBusRsp_pte_V;
  wire                MmuPlugin_shared_dBusRsp_pte_R;
  wire                MmuPlugin_shared_dBusRsp_pte_W;
  wire                MmuPlugin_shared_dBusRsp_pte_X;
  wire                MmuPlugin_shared_dBusRsp_pte_U;
  wire                MmuPlugin_shared_dBusRsp_pte_G;
  wire                MmuPlugin_shared_dBusRsp_pte_A;
  wire                MmuPlugin_shared_dBusRsp_pte_D;
  wire       [1:0]    MmuPlugin_shared_dBusRsp_pte_RSW;
  wire       [9:0]    MmuPlugin_shared_dBusRsp_pte_PPN0;
  wire       [11:0]   MmuPlugin_shared_dBusRsp_pte_PPN1;
  wire                MmuPlugin_shared_dBusRsp_exception;
  wire                MmuPlugin_shared_dBusRsp_leaf;
  wire                when_MmuPlugin_l205;
  reg                 MmuPlugin_shared_pteBuffer_V;
  reg                 MmuPlugin_shared_pteBuffer_R;
  reg                 MmuPlugin_shared_pteBuffer_W;
  reg                 MmuPlugin_shared_pteBuffer_X;
  reg                 MmuPlugin_shared_pteBuffer_U;
  reg                 MmuPlugin_shared_pteBuffer_G;
  reg                 MmuPlugin_shared_pteBuffer_A;
  reg                 MmuPlugin_shared_pteBuffer_D;
  reg        [1:0]    MmuPlugin_shared_pteBuffer_RSW;
  reg        [9:0]    MmuPlugin_shared_pteBuffer_PPN0;
  reg        [11:0]   MmuPlugin_shared_pteBuffer_PPN1;
  wire       [1:0]    _zz_MmuPlugin_shared_refills;
  reg        [1:0]    _zz_MmuPlugin_shared_refills_1;
  wire       [1:0]    MmuPlugin_shared_refills;
  wire       [1:0]    _zz_MmuPlugin_shared_refills_2;
  reg        [1:0]    _zz_MmuPlugin_shared_refills_3;
  wire                when_MmuPlugin_l217;
  wire       [31:0]   _zz_MmuPlugin_shared_vpn_0;
  wire                when_MmuPlugin_l243;
  wire                when_MmuPlugin_l272;
  wire                when_MmuPlugin_l274;
  wire                when_MmuPlugin_l280;
  wire                when_MmuPlugin_l280_1;
  wire                when_MmuPlugin_l280_2;
  wire                when_MmuPlugin_l280_3;
  wire                when_MmuPlugin_l274_1;
  wire                when_MmuPlugin_l280_4;
  wire                when_MmuPlugin_l280_5;
  wire                when_MmuPlugin_l280_6;
  wire                when_MmuPlugin_l280_7;
  wire                when_MmuPlugin_l304;
  wire                when_Pipeline_l124;
  reg        [31:0]   decode_to_execute_PC;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   execute_to_memory_PC;
  wire                when_Pipeline_l124_2;
  reg        [31:0]   memory_to_writeBack_PC;
  wire                when_Pipeline_l124_3;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  wire                when_Pipeline_l124_4;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  wire                when_Pipeline_l124_5;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  wire                when_Pipeline_l124_6;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_7;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_8;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_9;
  reg                 decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  wire                when_Pipeline_l124_10;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  wire                when_Pipeline_l124_11;
  reg                 decode_to_execute_MEMORY_ENABLE;
  wire                when_Pipeline_l124_12;
  reg                 execute_to_memory_MEMORY_ENABLE;
  wire                when_Pipeline_l124_13;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  wire                when_Pipeline_l124_14;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  wire                when_Pipeline_l124_15;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_16;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_17;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_18;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  wire                when_Pipeline_l124_19;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_20;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_21;
  reg                 decode_to_execute_MEMORY_WR;
  wire                when_Pipeline_l124_22;
  reg                 execute_to_memory_MEMORY_WR;
  wire                when_Pipeline_l124_23;
  reg                 memory_to_writeBack_MEMORY_WR;
  wire                when_Pipeline_l124_24;
  reg                 decode_to_execute_MEMORY_LRSC;
  wire                when_Pipeline_l124_25;
  reg                 execute_to_memory_MEMORY_LRSC;
  wire                when_Pipeline_l124_26;
  reg                 memory_to_writeBack_MEMORY_LRSC;
  wire                when_Pipeline_l124_27;
  reg                 decode_to_execute_MEMORY_AMO;
  wire                when_Pipeline_l124_28;
  reg                 decode_to_execute_MEMORY_MANAGMENT;
  wire                when_Pipeline_l124_29;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  wire                when_Pipeline_l124_30;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  wire                when_Pipeline_l124_31;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  wire                when_Pipeline_l124_32;
  reg        `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  wire                when_Pipeline_l124_33;
  reg                 decode_to_execute_IS_MUL;
  wire                when_Pipeline_l124_34;
  reg                 execute_to_memory_IS_MUL;
  wire                when_Pipeline_l124_35;
  reg                 memory_to_writeBack_IS_MUL;
  wire                when_Pipeline_l124_36;
  reg                 decode_to_execute_IS_DIV;
  wire                when_Pipeline_l124_37;
  reg                 execute_to_memory_IS_DIV;
  wire                when_Pipeline_l124_38;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  wire                when_Pipeline_l124_39;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  wire                when_Pipeline_l124_40;
  reg                 decode_to_execute_IS_CSR;
  wire                when_Pipeline_l124_41;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  wire                when_Pipeline_l124_42;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  wire                when_Pipeline_l124_43;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  wire                when_Pipeline_l124_44;
  reg                 decode_to_execute_IS_SFENCE_VMA;
  wire                when_Pipeline_l124_45;
  reg                 decode_to_execute_IS_SFENCE_VMA2;
  wire                when_Pipeline_l124_46;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  wire                when_Pipeline_l124_47;
  reg        [31:0]   decode_to_execute_RS1;
  wire                when_Pipeline_l124_48;
  reg        [31:0]   decode_to_execute_RS2;
  wire                when_Pipeline_l124_49;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  wire                when_Pipeline_l124_50;
  reg        [31:0]   decode_to_execute_SRC1;
  wire                when_Pipeline_l124_51;
  reg        [31:0]   decode_to_execute_SRC2;
  wire                when_Pipeline_l124_52;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  wire                when_Pipeline_l124_53;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  wire                when_Pipeline_l124_54;
  reg                 decode_to_execute_DO_EBREAK;
  wire                when_Pipeline_l124_55;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  wire                when_Pipeline_l124_56;
  reg        [31:0]   execute_to_memory_MEMORY_STORE_DATA_RF;
  wire                when_Pipeline_l124_57;
  reg        [31:0]   memory_to_writeBack_MEMORY_STORE_DATA_RF;
  wire                when_Pipeline_l124_58;
  reg                 execute_to_memory_IS_DBUS_SHARING;
  wire                when_Pipeline_l124_59;
  reg                 memory_to_writeBack_IS_DBUS_SHARING;
  wire                when_Pipeline_l124_60;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_61;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_62;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  wire                when_Pipeline_l124_63;
  reg        [31:0]   execute_to_memory_MUL_LL;
  wire                when_Pipeline_l124_64;
  reg        [33:0]   execute_to_memory_MUL_LH;
  wire                when_Pipeline_l124_65;
  reg        [33:0]   execute_to_memory_MUL_HL;
  wire                when_Pipeline_l124_66;
  reg        [33:0]   execute_to_memory_MUL_HH;
  wire                when_Pipeline_l124_67;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  wire                when_Pipeline_l124_68;
  reg                 execute_to_memory_BRANCH_DO;
  wire                when_Pipeline_l124_69;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  wire                when_Pipeline_l124_70;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  reg        [2:0]    switch_Fetcher_l362;
  wire                when_Fetcher_l378;
  wire                when_CsrPlugin_l1264;
  reg                 execute_CsrPlugin_csr_3857;
  wire                when_CsrPlugin_l1264_1;
  reg                 execute_CsrPlugin_csr_3858;
  wire                when_CsrPlugin_l1264_2;
  reg                 execute_CsrPlugin_csr_3859;
  wire                when_CsrPlugin_l1264_3;
  reg                 execute_CsrPlugin_csr_3860;
  wire                when_CsrPlugin_l1264_4;
  reg                 execute_CsrPlugin_csr_768;
  wire                when_CsrPlugin_l1264_5;
  reg                 execute_CsrPlugin_csr_836;
  wire                when_CsrPlugin_l1264_6;
  reg                 execute_CsrPlugin_csr_772;
  wire                when_CsrPlugin_l1264_7;
  reg                 execute_CsrPlugin_csr_773;
  wire                when_CsrPlugin_l1264_8;
  reg                 execute_CsrPlugin_csr_833;
  wire                when_CsrPlugin_l1264_9;
  reg                 execute_CsrPlugin_csr_832;
  wire                when_CsrPlugin_l1264_10;
  reg                 execute_CsrPlugin_csr_834;
  wire                when_CsrPlugin_l1264_11;
  reg                 execute_CsrPlugin_csr_835;
  wire                when_CsrPlugin_l1264_12;
  reg                 execute_CsrPlugin_csr_770;
  wire                when_CsrPlugin_l1264_13;
  reg                 execute_CsrPlugin_csr_771;
  wire                when_CsrPlugin_l1264_14;
  reg                 execute_CsrPlugin_csr_256;
  wire                when_CsrPlugin_l1264_15;
  reg                 execute_CsrPlugin_csr_324;
  wire                when_CsrPlugin_l1264_16;
  reg                 execute_CsrPlugin_csr_260;
  wire                when_CsrPlugin_l1264_17;
  reg                 execute_CsrPlugin_csr_261;
  wire                when_CsrPlugin_l1264_18;
  reg                 execute_CsrPlugin_csr_321;
  wire                when_CsrPlugin_l1264_19;
  reg                 execute_CsrPlugin_csr_320;
  wire                when_CsrPlugin_l1264_20;
  reg                 execute_CsrPlugin_csr_322;
  wire                when_CsrPlugin_l1264_21;
  reg                 execute_CsrPlugin_csr_323;
  wire                when_CsrPlugin_l1264_22;
  reg                 execute_CsrPlugin_csr_384;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_3;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_4;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_5;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_6;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_7;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_8;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_9;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_10;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_11;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_12;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_13;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_14;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_15;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_16;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_17;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_18;
  wire                when_CsrPlugin_l1297;
  wire                when_CsrPlugin_l1302;
  `ifndef SYNTHESIS
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_1_string;
  reg [39:0] _zz_memory_to_writeBack_ENV_CTRL_string;
  reg [39:0] _zz_memory_to_writeBack_ENV_CTRL_1_string;
  reg [39:0] _zz_execute_to_memory_ENV_CTRL_string;
  reg [39:0] _zz_execute_to_memory_ENV_CTRL_1_string;
  reg [39:0] decode_ENV_CTRL_string;
  reg [39:0] _zz_decode_ENV_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ENV_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ENV_CTRL_1_string;
  reg [55:0] _zz_execute_to_memory_SHIFT_CTRL_string;
  reg [55:0] _zz_execute_to_memory_SHIFT_CTRL_1_string;
  reg [55:0] decode_SHIFT_CTRL_string;
  reg [55:0] _zz_decode_SHIFT_CTRL_string;
  reg [55:0] _zz_decode_to_execute_SHIFT_CTRL_string;
  reg [55:0] _zz_decode_to_execute_SHIFT_CTRL_1_string;
  reg [23:0] decode_ALU_BITWISE_CTRL_string;
  reg [23:0] _zz_decode_ALU_BITWISE_CTRL_string;
  reg [23:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [23:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_1_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_execute_BRANCH_CTRL_string;
  reg [39:0] memory_ENV_CTRL_string;
  reg [39:0] _zz_memory_ENV_CTRL_string;
  reg [39:0] execute_ENV_CTRL_string;
  reg [39:0] _zz_execute_ENV_CTRL_string;
  reg [39:0] writeBack_ENV_CTRL_string;
  reg [39:0] _zz_writeBack_ENV_CTRL_string;
  reg [55:0] memory_SHIFT_CTRL_string;
  reg [55:0] _zz_memory_SHIFT_CTRL_string;
  reg [55:0] execute_SHIFT_CTRL_string;
  reg [55:0] _zz_execute_SHIFT_CTRL_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_SRC2_CTRL_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_execute_ALU_CTRL_string;
  reg [23:0] execute_ALU_BITWISE_CTRL_string;
  reg [23:0] _zz_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_string;
  reg [39:0] _zz_decode_ENV_CTRL_1_string;
  reg [55:0] _zz_decode_SHIFT_CTRL_1_string;
  reg [23:0] _zz_decode_ALU_BITWISE_CTRL_1_string;
  reg [23:0] _zz_decode_SRC2_CTRL_1_string;
  reg [63:0] _zz_decode_ALU_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_1_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_2_string;
  reg [63:0] _zz_decode_ALU_CTRL_2_string;
  reg [23:0] _zz_decode_SRC2_CTRL_2_string;
  reg [23:0] _zz_decode_ALU_BITWISE_CTRL_2_string;
  reg [55:0] _zz_decode_SHIFT_CTRL_2_string;
  reg [39:0] _zz_decode_ENV_CTRL_2_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_2_string;
  reg [47:0] MmuPlugin_shared_state_1_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [55:0] decode_to_execute_SHIFT_CTRL_string;
  reg [55:0] execute_to_memory_SHIFT_CTRL_string;
  reg [39:0] decode_to_execute_ENV_CTRL_string;
  reg [39:0] execute_to_memory_ENV_CTRL_string;
  reg [39:0] memory_to_writeBack_ENV_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_when = ({decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid} != 2'b00);
  assign _zz_memory_MUL_LOW = ($signed(_zz_memory_MUL_LOW_1) + $signed(_zz_memory_MUL_LOW_5));
  assign _zz_memory_MUL_LOW_1 = ($signed(_zz_memory_MUL_LOW_2) + $signed(_zz_memory_MUL_LOW_3));
  assign _zz_memory_MUL_LOW_2 = 52'h0;
  assign _zz_memory_MUL_LOW_4 = {1'b0,memory_MUL_LL};
  assign _zz_memory_MUL_LOW_3 = {{19{_zz_memory_MUL_LOW_4[32]}}, _zz_memory_MUL_LOW_4};
  assign _zz_memory_MUL_LOW_6 = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_memory_MUL_LOW_5 = {{2{_zz_memory_MUL_LOW_6[49]}}, _zz_memory_MUL_LOW_6};
  assign _zz_memory_MUL_LOW_8 = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_memory_MUL_LOW_7 = {{2{_zz_memory_MUL_LOW_8[49]}}, _zz_memory_MUL_LOW_8};
  assign _zz_execute_SHIFT_RIGHT_1 = ($signed(_zz_execute_SHIFT_RIGHT_2) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT_1[31 : 0];
  assign _zz_execute_SHIFT_RIGHT_2 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1 = (_zz_IBusCachedPlugin_jump_pcLoad_payload - 5'h01);
  assign _zz_IBusCachedPlugin_fetchPc_pc_1 = {IBusCachedPlugin_fetchPc_inc,2'b00};
  assign _zz_IBusCachedPlugin_fetchPc_pc = {29'd0, _zz_IBusCachedPlugin_fetchPc_pc_1};
  assign _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2 = {{_zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_2 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_4 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz__zz_6 = {{_zz_3,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz__zz_6_1 = {{_zz_5,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 3'b111 : 3'b101);
  assign _zz_DBusCachedPlugin_exceptionBus_payload_code_1 = (writeBack_MEMORY_WR ? 3'b110 : 3'b100);
  assign _zz_writeBack_DBusCachedPlugin_rspRf = (! dataCache_1_io_cpu_writeBack_exclusiveOk);
  assign _zz__zz_execute_REGFILE_WRITE_DATA = execute_SRC_LESS;
  assign _zz__zz_decode_SRC1_1 = 3'b100;
  assign _zz__zz_decode_SRC1_1_1 = decode_INSTRUCTION[19 : 15];
  assign _zz__zz_decode_SRC2_4 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_execute_SrcPlugin_addSub = ($signed(_zz_execute_SrcPlugin_addSub_1) + $signed(_zz_execute_SrcPlugin_addSub_4));
  assign _zz_execute_SrcPlugin_addSub_1 = ($signed(_zz_execute_SrcPlugin_addSub_2) + $signed(_zz_execute_SrcPlugin_addSub_3));
  assign _zz_execute_SrcPlugin_addSub_2 = execute_SRC1;
  assign _zz_execute_SrcPlugin_addSub_3 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_execute_SrcPlugin_addSub_4 = (execute_SRC_USE_SUB_LESS ? _zz_execute_SrcPlugin_addSub_5 : _zz_execute_SrcPlugin_addSub_6);
  assign _zz_execute_SrcPlugin_addSub_5 = 32'h00000001;
  assign _zz_execute_SrcPlugin_addSub_6 = 32'h0;
  assign _zz_writeBack_MulPlugin_result = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_writeBack_MulPlugin_result_1 = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz__zz_decode_RS2_2 = writeBack_MUL_LOW[31 : 0];
  assign _zz__zz_decode_RS2_2_1 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_memory_MulDivIterativePlugin_div_counter_valueNext_1 = memory_MulDivIterativePlugin_div_counter_willIncrement;
  assign _zz_memory_MulDivIterativePlugin_div_counter_valueNext = {5'd0, _zz_memory_MulDivIterativePlugin_div_counter_valueNext_1};
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator = {1'd0, memory_MulDivIterativePlugin_rs2};
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder = memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder_1 = memory_MulDivIterativePlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_outNumerator = {_zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted,(! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_memory_MulDivIterativePlugin_div_result_1 = _zz_memory_MulDivIterativePlugin_div_result_2;
  assign _zz_memory_MulDivIterativePlugin_div_result_2 = _zz_memory_MulDivIterativePlugin_div_result_3;
  assign _zz_memory_MulDivIterativePlugin_div_result_3 = ({memory_MulDivIterativePlugin_div_needRevert,(memory_MulDivIterativePlugin_div_needRevert ? (~ _zz_memory_MulDivIterativePlugin_div_result) : _zz_memory_MulDivIterativePlugin_div_result)} + _zz_memory_MulDivIterativePlugin_div_result_4);
  assign _zz_memory_MulDivIterativePlugin_div_result_5 = memory_MulDivIterativePlugin_div_needRevert;
  assign _zz_memory_MulDivIterativePlugin_div_result_4 = {32'd0, _zz_memory_MulDivIterativePlugin_div_result_5};
  assign _zz_memory_MulDivIterativePlugin_rs1_3 = _zz_memory_MulDivIterativePlugin_rs1;
  assign _zz_memory_MulDivIterativePlugin_rs1_2 = {32'd0, _zz_memory_MulDivIterativePlugin_rs1_3};
  assign _zz_memory_MulDivIterativePlugin_rs2_2 = _zz_memory_MulDivIterativePlugin_rs2;
  assign _zz_memory_MulDivIterativePlugin_rs2_1 = {31'd0, _zz_memory_MulDivIterativePlugin_rs2_2};
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code & (~ _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1));
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code - 2'b01);
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6 = {_zz_execute_BranchPlugin_missAlignedTarget_1,execute_INSTRUCTION[31 : 20]};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1 = {{_zz_execute_BranchPlugin_missAlignedTarget_3,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2 = {{_zz_execute_BranchPlugin_missAlignedTarget_5,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz__zz_execute_BranchPlugin_branch_src2_2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_branch_src2_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_execute_BranchPlugin_branch_src2_9 = 3'b100;
  assign _zz_MmuPlugin_ports_0_entryToReplace_valueNext_1 = MmuPlugin_ports_0_entryToReplace_willIncrement;
  assign _zz_MmuPlugin_ports_0_entryToReplace_valueNext = {1'd0, _zz_MmuPlugin_ports_0_entryToReplace_valueNext_1};
  assign _zz_MmuPlugin_ports_1_entryToReplace_valueNext_1 = MmuPlugin_ports_1_entryToReplace_willIncrement;
  assign _zz_MmuPlugin_ports_1_entryToReplace_valueNext = {1'd0, _zz_MmuPlugin_ports_1_entryToReplace_valueNext_1};
  assign _zz__zz_MmuPlugin_shared_refills_2 = (_zz_MmuPlugin_shared_refills_1 - 2'b01);
  assign _zz_decode_RegFilePlugin_rs1Data = 1'b1;
  assign _zz_decode_RegFilePlugin_rs2Data = 1'b1;
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_7 = {_zz_IBusCachedPlugin_jump_pcLoad_payload_3,{_zz_IBusCachedPlugin_jump_pcLoad_payload_5,_zz_IBusCachedPlugin_jump_pcLoad_payload_4}};
  assign _zz_writeBack_DBusCachedPlugin_rspShifted_1 = dataCache_1_io_cpu_writeBack_address[1 : 0];
  assign _zz_writeBack_DBusCachedPlugin_rspShifted_3 = dataCache_1_io_cpu_writeBack_address[1 : 1];
  assign _zz_decode_LEGAL_INSTRUCTION = 32'h0000107f;
  assign _zz_decode_LEGAL_INSTRUCTION_1 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_decode_LEGAL_INSTRUCTION_2 = 32'h00002073;
  assign _zz_decode_LEGAL_INSTRUCTION_3 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_decode_LEGAL_INSTRUCTION_4 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_decode_LEGAL_INSTRUCTION_5 = {((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & 32'h0000207f) == 32'h00000003),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_6) == 32'h00000003),{(_zz_decode_LEGAL_INSTRUCTION_7 == _zz_decode_LEGAL_INSTRUCTION_8),{_zz_decode_LEGAL_INSTRUCTION_9,{_zz_decode_LEGAL_INSTRUCTION_10,_zz_decode_LEGAL_INSTRUCTION_11}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_6 = 32'h0000505f;
  assign _zz_decode_LEGAL_INSTRUCTION_7 = (decode_INSTRUCTION & 32'h0000707b);
  assign _zz_decode_LEGAL_INSTRUCTION_8 = 32'h00000063;
  assign _zz_decode_LEGAL_INSTRUCTION_9 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_decode_LEGAL_INSTRUCTION_10 = ((decode_INSTRUCTION & 32'h1800707f) == 32'h0000202f);
  assign _zz_decode_LEGAL_INSTRUCTION_11 = {((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033),{((decode_INSTRUCTION & 32'he800707f) == 32'h0800202f),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_12) == 32'h0000500f),{(_zz_decode_LEGAL_INSTRUCTION_13 == _zz_decode_LEGAL_INSTRUCTION_14),{_zz_decode_LEGAL_INSTRUCTION_15,{_zz_decode_LEGAL_INSTRUCTION_16,_zz_decode_LEGAL_INSTRUCTION_17}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_12 = 32'h01f0707f;
  assign _zz_decode_LEGAL_INSTRUCTION_13 = (decode_INSTRUCTION & 32'hbc00707f);
  assign _zz_decode_LEGAL_INSTRUCTION_14 = 32'h00005013;
  assign _zz_decode_LEGAL_INSTRUCTION_15 = ((decode_INSTRUCTION & 32'hfc00307f) == 32'h00001013);
  assign _zz_decode_LEGAL_INSTRUCTION_16 = ((decode_INSTRUCTION & 32'hbe00707f) == 32'h00005033);
  assign _zz_decode_LEGAL_INSTRUCTION_17 = {((decode_INSTRUCTION & 32'hbe00707f) == 32'h00000033),{((decode_INSTRUCTION & 32'hf9f0707f) == 32'h1000202f),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_18) == 32'h12000073),{(_zz_decode_LEGAL_INSTRUCTION_19 == _zz_decode_LEGAL_INSTRUCTION_20),{_zz_decode_LEGAL_INSTRUCTION_21,_zz_decode_LEGAL_INSTRUCTION_22}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_18 = 32'hfe007fff;
  assign _zz_decode_LEGAL_INSTRUCTION_19 = (decode_INSTRUCTION & 32'hdfffffff);
  assign _zz_decode_LEGAL_INSTRUCTION_20 = 32'h10200073;
  assign _zz_decode_LEGAL_INSTRUCTION_21 = ((decode_INSTRUCTION & 32'hffefffff) == 32'h00000073);
  assign _zz_decode_LEGAL_INSTRUCTION_22 = ((decode_INSTRUCTION & 32'hffffffff) == 32'h10500073);
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_4 = decode_INSTRUCTION[31];
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_5 = decode_INSTRUCTION[31];
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_6 = decode_INSTRUCTION[7];
  assign _zz__zz_decode_IS_SFENCE_VMA2 = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz__zz_decode_IS_SFENCE_VMA2_1 = 32'h00000004;
  assign _zz__zz_decode_IS_SFENCE_VMA2_2 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz__zz_decode_IS_SFENCE_VMA2_3 = 32'h00000040;
  assign _zz__zz_decode_IS_SFENCE_VMA2_4 = ((decode_INSTRUCTION & 32'h10103050) == 32'h00100050);
  assign _zz__zz_decode_IS_SFENCE_VMA2_5 = _zz_decode_IS_SFENCE_VMA2_7;
  assign _zz__zz_decode_IS_SFENCE_VMA2_6 = 1'b0;
  assign _zz__zz_decode_IS_SFENCE_VMA2_7 = (_zz_decode_IS_SFENCE_VMA2_7 != 1'b0);
  assign _zz__zz_decode_IS_SFENCE_VMA2_8 = ({_zz__zz_decode_IS_SFENCE_VMA2_9,_zz__zz_decode_IS_SFENCE_VMA2_10} != 2'b00);
  assign _zz__zz_decode_IS_SFENCE_VMA2_11 = {(_zz__zz_decode_IS_SFENCE_VMA2_12 != 1'b0),{(_zz__zz_decode_IS_SFENCE_VMA2_13 != _zz__zz_decode_IS_SFENCE_VMA2_18),{_zz__zz_decode_IS_SFENCE_VMA2_19,{_zz__zz_decode_IS_SFENCE_VMA2_20,_zz__zz_decode_IS_SFENCE_VMA2_21}}}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_9 = ((decode_INSTRUCTION & 32'h10103050) == 32'h00000050);
  assign _zz__zz_decode_IS_SFENCE_VMA2_10 = ((decode_INSTRUCTION & 32'h12203050) == 32'h10000050);
  assign _zz__zz_decode_IS_SFENCE_VMA2_12 = ((decode_INSTRUCTION & 32'h02103050) == 32'h00000050);
  assign _zz__zz_decode_IS_SFENCE_VMA2_13 = {(_zz__zz_decode_IS_SFENCE_VMA2_14 == _zz__zz_decode_IS_SFENCE_VMA2_15),(_zz__zz_decode_IS_SFENCE_VMA2_16 == _zz__zz_decode_IS_SFENCE_VMA2_17)};
  assign _zz__zz_decode_IS_SFENCE_VMA2_18 = 2'b00;
  assign _zz__zz_decode_IS_SFENCE_VMA2_19 = (_zz_decode_IS_SFENCE_VMA2_6 != 1'b0);
  assign _zz__zz_decode_IS_SFENCE_VMA2_20 = (_zz_decode_IS_SFENCE_VMA2_6 != 1'b0);
  assign _zz__zz_decode_IS_SFENCE_VMA2_21 = {(_zz__zz_decode_IS_SFENCE_VMA2_22 != _zz__zz_decode_IS_SFENCE_VMA2_23),{_zz__zz_decode_IS_SFENCE_VMA2_24,{_zz__zz_decode_IS_SFENCE_VMA2_26,_zz__zz_decode_IS_SFENCE_VMA2_29}}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_14 = (decode_INSTRUCTION & 32'h00001050);
  assign _zz__zz_decode_IS_SFENCE_VMA2_15 = 32'h00001050;
  assign _zz__zz_decode_IS_SFENCE_VMA2_16 = (decode_INSTRUCTION & 32'h00002050);
  assign _zz__zz_decode_IS_SFENCE_VMA2_17 = 32'h00002050;
  assign _zz__zz_decode_IS_SFENCE_VMA2_22 = ((decode_INSTRUCTION & 32'h02004064) == 32'h02004020);
  assign _zz__zz_decode_IS_SFENCE_VMA2_23 = 1'b0;
  assign _zz__zz_decode_IS_SFENCE_VMA2_24 = (((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_25) == 32'h02000030) != 1'b0);
  assign _zz__zz_decode_IS_SFENCE_VMA2_26 = ({_zz__zz_decode_IS_SFENCE_VMA2_27,_zz__zz_decode_IS_SFENCE_VMA2_28} != 2'b00);
  assign _zz__zz_decode_IS_SFENCE_VMA2_29 = {({_zz__zz_decode_IS_SFENCE_VMA2_30,_zz__zz_decode_IS_SFENCE_VMA2_32} != 3'b000),{(_zz__zz_decode_IS_SFENCE_VMA2_37 != _zz__zz_decode_IS_SFENCE_VMA2_39),{_zz__zz_decode_IS_SFENCE_VMA2_40,{_zz__zz_decode_IS_SFENCE_VMA2_43,_zz__zz_decode_IS_SFENCE_VMA2_48}}}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_25 = 32'h02004074;
  assign _zz__zz_decode_IS_SFENCE_VMA2_27 = ((decode_INSTRUCTION & 32'h00007034) == 32'h00005010);
  assign _zz__zz_decode_IS_SFENCE_VMA2_28 = ((decode_INSTRUCTION & 32'h02007064) == 32'h00005020);
  assign _zz__zz_decode_IS_SFENCE_VMA2_30 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_31) == 32'h40001010);
  assign _zz__zz_decode_IS_SFENCE_VMA2_32 = {(_zz__zz_decode_IS_SFENCE_VMA2_33 == _zz__zz_decode_IS_SFENCE_VMA2_34),(_zz__zz_decode_IS_SFENCE_VMA2_35 == _zz__zz_decode_IS_SFENCE_VMA2_36)};
  assign _zz__zz_decode_IS_SFENCE_VMA2_37 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_38) == 32'h00001000);
  assign _zz__zz_decode_IS_SFENCE_VMA2_39 = 1'b0;
  assign _zz__zz_decode_IS_SFENCE_VMA2_40 = ((_zz__zz_decode_IS_SFENCE_VMA2_41 == _zz__zz_decode_IS_SFENCE_VMA2_42) != 1'b0);
  assign _zz__zz_decode_IS_SFENCE_VMA2_43 = ({_zz__zz_decode_IS_SFENCE_VMA2_44,_zz__zz_decode_IS_SFENCE_VMA2_46} != 2'b00);
  assign _zz__zz_decode_IS_SFENCE_VMA2_48 = {(_zz__zz_decode_IS_SFENCE_VMA2_49 != _zz__zz_decode_IS_SFENCE_VMA2_51),{_zz__zz_decode_IS_SFENCE_VMA2_52,{_zz__zz_decode_IS_SFENCE_VMA2_55,_zz__zz_decode_IS_SFENCE_VMA2_65}}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_31 = 32'h40003054;
  assign _zz__zz_decode_IS_SFENCE_VMA2_33 = (decode_INSTRUCTION & 32'h00007034);
  assign _zz__zz_decode_IS_SFENCE_VMA2_34 = 32'h00001010;
  assign _zz__zz_decode_IS_SFENCE_VMA2_35 = (decode_INSTRUCTION & 32'h02007054);
  assign _zz__zz_decode_IS_SFENCE_VMA2_36 = 32'h00001010;
  assign _zz__zz_decode_IS_SFENCE_VMA2_38 = 32'h00001000;
  assign _zz__zz_decode_IS_SFENCE_VMA2_41 = (decode_INSTRUCTION & 32'h00003000);
  assign _zz__zz_decode_IS_SFENCE_VMA2_42 = 32'h00002000;
  assign _zz__zz_decode_IS_SFENCE_VMA2_44 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_45) == 32'h00002000);
  assign _zz__zz_decode_IS_SFENCE_VMA2_46 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_47) == 32'h00001000);
  assign _zz__zz_decode_IS_SFENCE_VMA2_49 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_50) == 32'h00004008);
  assign _zz__zz_decode_IS_SFENCE_VMA2_51 = 1'b0;
  assign _zz__zz_decode_IS_SFENCE_VMA2_52 = ((_zz__zz_decode_IS_SFENCE_VMA2_53 == _zz__zz_decode_IS_SFENCE_VMA2_54) != 1'b0);
  assign _zz__zz_decode_IS_SFENCE_VMA2_55 = ({_zz__zz_decode_IS_SFENCE_VMA2_56,_zz__zz_decode_IS_SFENCE_VMA2_58} != 4'b0000);
  assign _zz__zz_decode_IS_SFENCE_VMA2_65 = {(_zz__zz_decode_IS_SFENCE_VMA2_66 != _zz__zz_decode_IS_SFENCE_VMA2_68),{_zz__zz_decode_IS_SFENCE_VMA2_69,{_zz__zz_decode_IS_SFENCE_VMA2_72,_zz__zz_decode_IS_SFENCE_VMA2_91}}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_45 = 32'h00002010;
  assign _zz__zz_decode_IS_SFENCE_VMA2_47 = 32'h00005000;
  assign _zz__zz_decode_IS_SFENCE_VMA2_50 = 32'h00004048;
  assign _zz__zz_decode_IS_SFENCE_VMA2_53 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz__zz_decode_IS_SFENCE_VMA2_54 = 32'h00000024;
  assign _zz__zz_decode_IS_SFENCE_VMA2_56 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_57) == 32'h00000020);
  assign _zz__zz_decode_IS_SFENCE_VMA2_58 = {(_zz__zz_decode_IS_SFENCE_VMA2_59 == _zz__zz_decode_IS_SFENCE_VMA2_60),{_zz__zz_decode_IS_SFENCE_VMA2_61,_zz__zz_decode_IS_SFENCE_VMA2_63}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_66 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_67) == 32'h00000008);
  assign _zz__zz_decode_IS_SFENCE_VMA2_68 = 1'b0;
  assign _zz__zz_decode_IS_SFENCE_VMA2_69 = ((_zz__zz_decode_IS_SFENCE_VMA2_70 == _zz__zz_decode_IS_SFENCE_VMA2_71) != 1'b0);
  assign _zz__zz_decode_IS_SFENCE_VMA2_72 = ({_zz__zz_decode_IS_SFENCE_VMA2_73,_zz__zz_decode_IS_SFENCE_VMA2_76} != 6'h0);
  assign _zz__zz_decode_IS_SFENCE_VMA2_91 = {(_zz__zz_decode_IS_SFENCE_VMA2_92 != _zz__zz_decode_IS_SFENCE_VMA2_101),{_zz__zz_decode_IS_SFENCE_VMA2_102,{_zz__zz_decode_IS_SFENCE_VMA2_115,_zz__zz_decode_IS_SFENCE_VMA2_130}}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_57 = 32'h00000034;
  assign _zz__zz_decode_IS_SFENCE_VMA2_59 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz__zz_decode_IS_SFENCE_VMA2_60 = 32'h00000020;
  assign _zz__zz_decode_IS_SFENCE_VMA2_61 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_62) == 32'h08000020);
  assign _zz__zz_decode_IS_SFENCE_VMA2_63 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_64) == 32'h00000020);
  assign _zz__zz_decode_IS_SFENCE_VMA2_67 = 32'h10000008;
  assign _zz__zz_decode_IS_SFENCE_VMA2_70 = (decode_INSTRUCTION & 32'h10000008);
  assign _zz__zz_decode_IS_SFENCE_VMA2_71 = 32'h10000008;
  assign _zz__zz_decode_IS_SFENCE_VMA2_73 = (_zz__zz_decode_IS_SFENCE_VMA2_74 == _zz__zz_decode_IS_SFENCE_VMA2_75);
  assign _zz__zz_decode_IS_SFENCE_VMA2_76 = {_zz__zz_decode_IS_SFENCE_VMA2_77,{_zz__zz_decode_IS_SFENCE_VMA2_79,_zz__zz_decode_IS_SFENCE_VMA2_82}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_92 = {_zz__zz_decode_IS_SFENCE_VMA2_93,{_zz__zz_decode_IS_SFENCE_VMA2_95,_zz__zz_decode_IS_SFENCE_VMA2_98}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_101 = 3'b000;
  assign _zz__zz_decode_IS_SFENCE_VMA2_102 = ({_zz__zz_decode_IS_SFENCE_VMA2_103,_zz__zz_decode_IS_SFENCE_VMA2_106} != 5'h0);
  assign _zz__zz_decode_IS_SFENCE_VMA2_115 = (_zz__zz_decode_IS_SFENCE_VMA2_116 != _zz__zz_decode_IS_SFENCE_VMA2_129);
  assign _zz__zz_decode_IS_SFENCE_VMA2_130 = {_zz__zz_decode_IS_SFENCE_VMA2_131,{_zz__zz_decode_IS_SFENCE_VMA2_148,_zz__zz_decode_IS_SFENCE_VMA2_153}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_62 = 32'h08000070;
  assign _zz__zz_decode_IS_SFENCE_VMA2_64 = 32'h10000070;
  assign _zz__zz_decode_IS_SFENCE_VMA2_74 = (decode_INSTRUCTION & 32'h00002040);
  assign _zz__zz_decode_IS_SFENCE_VMA2_75 = 32'h00002040;
  assign _zz__zz_decode_IS_SFENCE_VMA2_77 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_78) == 32'h00001040);
  assign _zz__zz_decode_IS_SFENCE_VMA2_79 = (_zz__zz_decode_IS_SFENCE_VMA2_80 == _zz__zz_decode_IS_SFENCE_VMA2_81);
  assign _zz__zz_decode_IS_SFENCE_VMA2_82 = {_zz__zz_decode_IS_SFENCE_VMA2_83,{_zz__zz_decode_IS_SFENCE_VMA2_85,_zz__zz_decode_IS_SFENCE_VMA2_88}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_93 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_94) == 32'h08000020);
  assign _zz__zz_decode_IS_SFENCE_VMA2_95 = (_zz__zz_decode_IS_SFENCE_VMA2_96 == _zz__zz_decode_IS_SFENCE_VMA2_97);
  assign _zz__zz_decode_IS_SFENCE_VMA2_98 = (_zz__zz_decode_IS_SFENCE_VMA2_99 == _zz__zz_decode_IS_SFENCE_VMA2_100);
  assign _zz__zz_decode_IS_SFENCE_VMA2_103 = (_zz__zz_decode_IS_SFENCE_VMA2_104 == _zz__zz_decode_IS_SFENCE_VMA2_105);
  assign _zz__zz_decode_IS_SFENCE_VMA2_106 = {_zz__zz_decode_IS_SFENCE_VMA2_107,{_zz__zz_decode_IS_SFENCE_VMA2_109,_zz__zz_decode_IS_SFENCE_VMA2_112}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_116 = {_zz_decode_IS_SFENCE_VMA2_5,{_zz__zz_decode_IS_SFENCE_VMA2_117,_zz__zz_decode_IS_SFENCE_VMA2_120}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_129 = 5'h0;
  assign _zz__zz_decode_IS_SFENCE_VMA2_131 = ({_zz__zz_decode_IS_SFENCE_VMA2_132,_zz__zz_decode_IS_SFENCE_VMA2_133} != 7'h0);
  assign _zz__zz_decode_IS_SFENCE_VMA2_148 = (_zz__zz_decode_IS_SFENCE_VMA2_149 != _zz__zz_decode_IS_SFENCE_VMA2_152);
  assign _zz__zz_decode_IS_SFENCE_VMA2_153 = {_zz__zz_decode_IS_SFENCE_VMA2_154,{_zz__zz_decode_IS_SFENCE_VMA2_159,_zz__zz_decode_IS_SFENCE_VMA2_164}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_78 = 32'h00001040;
  assign _zz__zz_decode_IS_SFENCE_VMA2_80 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz__zz_decode_IS_SFENCE_VMA2_81 = 32'h00000040;
  assign _zz__zz_decode_IS_SFENCE_VMA2_83 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_84) == 32'h00000040);
  assign _zz__zz_decode_IS_SFENCE_VMA2_85 = (_zz__zz_decode_IS_SFENCE_VMA2_86 == _zz__zz_decode_IS_SFENCE_VMA2_87);
  assign _zz__zz_decode_IS_SFENCE_VMA2_88 = (_zz__zz_decode_IS_SFENCE_VMA2_89 == _zz__zz_decode_IS_SFENCE_VMA2_90);
  assign _zz__zz_decode_IS_SFENCE_VMA2_94 = 32'h08000020;
  assign _zz__zz_decode_IS_SFENCE_VMA2_96 = (decode_INSTRUCTION & 32'h10000020);
  assign _zz__zz_decode_IS_SFENCE_VMA2_97 = 32'h00000020;
  assign _zz__zz_decode_IS_SFENCE_VMA2_99 = (decode_INSTRUCTION & 32'h00000028);
  assign _zz__zz_decode_IS_SFENCE_VMA2_100 = 32'h00000020;
  assign _zz__zz_decode_IS_SFENCE_VMA2_104 = (decode_INSTRUCTION & 32'h00000040);
  assign _zz__zz_decode_IS_SFENCE_VMA2_105 = 32'h00000040;
  assign _zz__zz_decode_IS_SFENCE_VMA2_107 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_108) == 32'h00004020);
  assign _zz__zz_decode_IS_SFENCE_VMA2_109 = (_zz__zz_decode_IS_SFENCE_VMA2_110 == _zz__zz_decode_IS_SFENCE_VMA2_111);
  assign _zz__zz_decode_IS_SFENCE_VMA2_112 = {_zz_decode_IS_SFENCE_VMA2_5,_zz__zz_decode_IS_SFENCE_VMA2_113};
  assign _zz__zz_decode_IS_SFENCE_VMA2_117 = (_zz__zz_decode_IS_SFENCE_VMA2_118 == _zz__zz_decode_IS_SFENCE_VMA2_119);
  assign _zz__zz_decode_IS_SFENCE_VMA2_120 = {_zz__zz_decode_IS_SFENCE_VMA2_121,{_zz__zz_decode_IS_SFENCE_VMA2_123,_zz__zz_decode_IS_SFENCE_VMA2_126}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_132 = _zz_decode_IS_SFENCE_VMA2_2;
  assign _zz__zz_decode_IS_SFENCE_VMA2_133 = {_zz__zz_decode_IS_SFENCE_VMA2_134,{_zz__zz_decode_IS_SFENCE_VMA2_136,_zz__zz_decode_IS_SFENCE_VMA2_139}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_149 = {_zz_decode_IS_SFENCE_VMA2_4,_zz__zz_decode_IS_SFENCE_VMA2_150};
  assign _zz__zz_decode_IS_SFENCE_VMA2_152 = 2'b00;
  assign _zz__zz_decode_IS_SFENCE_VMA2_154 = ({_zz__zz_decode_IS_SFENCE_VMA2_155,_zz__zz_decode_IS_SFENCE_VMA2_156} != 2'b00);
  assign _zz__zz_decode_IS_SFENCE_VMA2_159 = (_zz__zz_decode_IS_SFENCE_VMA2_160 != _zz__zz_decode_IS_SFENCE_VMA2_163);
  assign _zz__zz_decode_IS_SFENCE_VMA2_164 = {_zz__zz_decode_IS_SFENCE_VMA2_165,{_zz__zz_decode_IS_SFENCE_VMA2_168,_zz__zz_decode_IS_SFENCE_VMA2_181}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_84 = 32'h02100040;
  assign _zz__zz_decode_IS_SFENCE_VMA2_86 = (decode_INSTRUCTION & 32'h00000038);
  assign _zz__zz_decode_IS_SFENCE_VMA2_87 = 32'h0;
  assign _zz__zz_decode_IS_SFENCE_VMA2_89 = (decode_INSTRUCTION & 32'h18002008);
  assign _zz__zz_decode_IS_SFENCE_VMA2_90 = 32'h10002008;
  assign _zz__zz_decode_IS_SFENCE_VMA2_108 = 32'h00004020;
  assign _zz__zz_decode_IS_SFENCE_VMA2_110 = (decode_INSTRUCTION & 32'h00000030);
  assign _zz__zz_decode_IS_SFENCE_VMA2_111 = 32'h00000010;
  assign _zz__zz_decode_IS_SFENCE_VMA2_113 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_114) == 32'h00000020);
  assign _zz__zz_decode_IS_SFENCE_VMA2_118 = (decode_INSTRUCTION & 32'h00002030);
  assign _zz__zz_decode_IS_SFENCE_VMA2_119 = 32'h00002010;
  assign _zz__zz_decode_IS_SFENCE_VMA2_121 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_122) == 32'h00000010);
  assign _zz__zz_decode_IS_SFENCE_VMA2_123 = (_zz__zz_decode_IS_SFENCE_VMA2_124 == _zz__zz_decode_IS_SFENCE_VMA2_125);
  assign _zz__zz_decode_IS_SFENCE_VMA2_126 = (_zz__zz_decode_IS_SFENCE_VMA2_127 == _zz__zz_decode_IS_SFENCE_VMA2_128);
  assign _zz__zz_decode_IS_SFENCE_VMA2_134 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_135) == 32'h00001010);
  assign _zz__zz_decode_IS_SFENCE_VMA2_136 = (_zz__zz_decode_IS_SFENCE_VMA2_137 == _zz__zz_decode_IS_SFENCE_VMA2_138);
  assign _zz__zz_decode_IS_SFENCE_VMA2_139 = {_zz__zz_decode_IS_SFENCE_VMA2_140,{_zz__zz_decode_IS_SFENCE_VMA2_142,_zz__zz_decode_IS_SFENCE_VMA2_145}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_150 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_151) == 32'h00000020);
  assign _zz__zz_decode_IS_SFENCE_VMA2_155 = _zz_decode_IS_SFENCE_VMA2_4;
  assign _zz__zz_decode_IS_SFENCE_VMA2_156 = (_zz__zz_decode_IS_SFENCE_VMA2_157 == _zz__zz_decode_IS_SFENCE_VMA2_158);
  assign _zz__zz_decode_IS_SFENCE_VMA2_160 = (_zz__zz_decode_IS_SFENCE_VMA2_161 == _zz__zz_decode_IS_SFENCE_VMA2_162);
  assign _zz__zz_decode_IS_SFENCE_VMA2_163 = 1'b0;
  assign _zz__zz_decode_IS_SFENCE_VMA2_165 = (_zz__zz_decode_IS_SFENCE_VMA2_166 != 1'b0);
  assign _zz__zz_decode_IS_SFENCE_VMA2_168 = (_zz__zz_decode_IS_SFENCE_VMA2_169 != _zz__zz_decode_IS_SFENCE_VMA2_180);
  assign _zz__zz_decode_IS_SFENCE_VMA2_181 = {_zz__zz_decode_IS_SFENCE_VMA2_182,{_zz__zz_decode_IS_SFENCE_VMA2_187,_zz__zz_decode_IS_SFENCE_VMA2_195}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_114 = 32'h02000028;
  assign _zz__zz_decode_IS_SFENCE_VMA2_122 = 32'h00001030;
  assign _zz__zz_decode_IS_SFENCE_VMA2_124 = (decode_INSTRUCTION & 32'h02003020);
  assign _zz__zz_decode_IS_SFENCE_VMA2_125 = 32'h00000020;
  assign _zz__zz_decode_IS_SFENCE_VMA2_127 = (decode_INSTRUCTION & 32'h02002068);
  assign _zz__zz_decode_IS_SFENCE_VMA2_128 = 32'h00002020;
  assign _zz__zz_decode_IS_SFENCE_VMA2_135 = 32'h00001010;
  assign _zz__zz_decode_IS_SFENCE_VMA2_137 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz__zz_decode_IS_SFENCE_VMA2_138 = 32'h00002010;
  assign _zz__zz_decode_IS_SFENCE_VMA2_140 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_141) == 32'h00002008);
  assign _zz__zz_decode_IS_SFENCE_VMA2_142 = (_zz__zz_decode_IS_SFENCE_VMA2_143 == _zz__zz_decode_IS_SFENCE_VMA2_144);
  assign _zz__zz_decode_IS_SFENCE_VMA2_145 = {_zz_decode_IS_SFENCE_VMA2_5,_zz__zz_decode_IS_SFENCE_VMA2_146};
  assign _zz__zz_decode_IS_SFENCE_VMA2_151 = 32'h00000070;
  assign _zz__zz_decode_IS_SFENCE_VMA2_157 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz__zz_decode_IS_SFENCE_VMA2_158 = 32'h0;
  assign _zz__zz_decode_IS_SFENCE_VMA2_161 = (decode_INSTRUCTION & 32'h00004014);
  assign _zz__zz_decode_IS_SFENCE_VMA2_162 = 32'h00004010;
  assign _zz__zz_decode_IS_SFENCE_VMA2_166 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_167) == 32'h00002010);
  assign _zz__zz_decode_IS_SFENCE_VMA2_169 = {_zz__zz_decode_IS_SFENCE_VMA2_170,{_zz__zz_decode_IS_SFENCE_VMA2_172,_zz__zz_decode_IS_SFENCE_VMA2_175}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_180 = 5'h0;
  assign _zz__zz_decode_IS_SFENCE_VMA2_182 = ({_zz__zz_decode_IS_SFENCE_VMA2_183,_zz__zz_decode_IS_SFENCE_VMA2_184} != 2'b00);
  assign _zz__zz_decode_IS_SFENCE_VMA2_187 = (_zz__zz_decode_IS_SFENCE_VMA2_188 != _zz__zz_decode_IS_SFENCE_VMA2_194);
  assign _zz__zz_decode_IS_SFENCE_VMA2_195 = {_zz__zz_decode_IS_SFENCE_VMA2_196,{_zz__zz_decode_IS_SFENCE_VMA2_201,_zz__zz_decode_IS_SFENCE_VMA2_206}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_141 = 32'h00002008;
  assign _zz__zz_decode_IS_SFENCE_VMA2_143 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz__zz_decode_IS_SFENCE_VMA2_144 = 32'h00000010;
  assign _zz__zz_decode_IS_SFENCE_VMA2_146 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_147) == 32'h0);
  assign _zz__zz_decode_IS_SFENCE_VMA2_167 = 32'h00006014;
  assign _zz__zz_decode_IS_SFENCE_VMA2_170 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_171) == 32'h0);
  assign _zz__zz_decode_IS_SFENCE_VMA2_172 = (_zz__zz_decode_IS_SFENCE_VMA2_173 == _zz__zz_decode_IS_SFENCE_VMA2_174);
  assign _zz__zz_decode_IS_SFENCE_VMA2_175 = {_zz__zz_decode_IS_SFENCE_VMA2_176,{_zz__zz_decode_IS_SFENCE_VMA2_177,_zz__zz_decode_IS_SFENCE_VMA2_179}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_183 = _zz_decode_IS_SFENCE_VMA2_3;
  assign _zz__zz_decode_IS_SFENCE_VMA2_184 = (_zz__zz_decode_IS_SFENCE_VMA2_185 == _zz__zz_decode_IS_SFENCE_VMA2_186);
  assign _zz__zz_decode_IS_SFENCE_VMA2_188 = {_zz__zz_decode_IS_SFENCE_VMA2_189,{_zz__zz_decode_IS_SFENCE_VMA2_190,_zz__zz_decode_IS_SFENCE_VMA2_192}};
  assign _zz__zz_decode_IS_SFENCE_VMA2_194 = 3'b000;
  assign _zz__zz_decode_IS_SFENCE_VMA2_196 = ({_zz__zz_decode_IS_SFENCE_VMA2_197,_zz__zz_decode_IS_SFENCE_VMA2_198} != 3'b000);
  assign _zz__zz_decode_IS_SFENCE_VMA2_201 = (_zz__zz_decode_IS_SFENCE_VMA2_202 != _zz__zz_decode_IS_SFENCE_VMA2_205);
  assign _zz__zz_decode_IS_SFENCE_VMA2_206 = (_zz__zz_decode_IS_SFENCE_VMA2_207 != _zz__zz_decode_IS_SFENCE_VMA2_209);
  assign _zz__zz_decode_IS_SFENCE_VMA2_147 = 32'h00000028;
  assign _zz__zz_decode_IS_SFENCE_VMA2_171 = 32'h00000044;
  assign _zz__zz_decode_IS_SFENCE_VMA2_173 = (decode_INSTRUCTION & 32'h00000018);
  assign _zz__zz_decode_IS_SFENCE_VMA2_174 = 32'h0;
  assign _zz__zz_decode_IS_SFENCE_VMA2_176 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz__zz_decode_IS_SFENCE_VMA2_177 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_178) == 32'h00001000);
  assign _zz__zz_decode_IS_SFENCE_VMA2_179 = _zz_decode_IS_SFENCE_VMA2_3;
  assign _zz__zz_decode_IS_SFENCE_VMA2_185 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz__zz_decode_IS_SFENCE_VMA2_186 = 32'h0;
  assign _zz__zz_decode_IS_SFENCE_VMA2_189 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000040);
  assign _zz__zz_decode_IS_SFENCE_VMA2_190 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_191) == 32'h00002010);
  assign _zz__zz_decode_IS_SFENCE_VMA2_192 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_193) == 32'h40000030);
  assign _zz__zz_decode_IS_SFENCE_VMA2_197 = _zz_decode_IS_SFENCE_VMA2_2;
  assign _zz__zz_decode_IS_SFENCE_VMA2_198 = {_zz_decode_IS_SFENCE_VMA2_1,(_zz__zz_decode_IS_SFENCE_VMA2_199 == _zz__zz_decode_IS_SFENCE_VMA2_200)};
  assign _zz__zz_decode_IS_SFENCE_VMA2_202 = {_zz_decode_IS_SFENCE_VMA2_1,(_zz__zz_decode_IS_SFENCE_VMA2_203 == _zz__zz_decode_IS_SFENCE_VMA2_204)};
  assign _zz__zz_decode_IS_SFENCE_VMA2_205 = 2'b00;
  assign _zz__zz_decode_IS_SFENCE_VMA2_207 = ((decode_INSTRUCTION & _zz__zz_decode_IS_SFENCE_VMA2_208) == 32'h00001008);
  assign _zz__zz_decode_IS_SFENCE_VMA2_209 = 1'b0;
  assign _zz__zz_decode_IS_SFENCE_VMA2_178 = 32'h00005004;
  assign _zz__zz_decode_IS_SFENCE_VMA2_191 = 32'h00002014;
  assign _zz__zz_decode_IS_SFENCE_VMA2_193 = 32'h40000034;
  assign _zz__zz_decode_IS_SFENCE_VMA2_199 = (decode_INSTRUCTION & 32'h00002014);
  assign _zz__zz_decode_IS_SFENCE_VMA2_200 = 32'h00000004;
  assign _zz__zz_decode_IS_SFENCE_VMA2_203 = (decode_INSTRUCTION & 32'h0000004c);
  assign _zz__zz_decode_IS_SFENCE_VMA2_204 = 32'h00000004;
  assign _zz__zz_decode_IS_SFENCE_VMA2_208 = 32'h00005048;
  assign _zz_execute_BranchPlugin_branch_src2_6 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_7 = execute_INSTRUCTION[31];
  assign _zz_execute_BranchPlugin_branch_src2_8 = execute_INSTRUCTION[7];
  assign _zz_MmuPlugin_ports_0_cacheHitsCalc = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22];
  assign _zz_MmuPlugin_ports_0_cacheHitsCalc_1 = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12];
  assign _zz_MmuPlugin_ports_0_cacheHitsCalc_2 = (MmuPlugin_ports_0_cache_1_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22]);
  assign _zz_MmuPlugin_ports_0_cacheHitsCalc_3 = (MmuPlugin_ports_0_cache_1_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12]);
  assign _zz_MmuPlugin_ports_0_cacheHitsCalc_4 = (MmuPlugin_ports_0_cache_0_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22]);
  assign _zz_MmuPlugin_ports_0_cacheHitsCalc_5 = (MmuPlugin_ports_0_cache_0_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12]);
  assign _zz_MmuPlugin_ports_1_cacheHitsCalc = DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22];
  assign _zz_MmuPlugin_ports_1_cacheHitsCalc_1 = DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12];
  assign _zz_MmuPlugin_ports_1_cacheHitsCalc_2 = (MmuPlugin_ports_1_cache_1_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22]);
  assign _zz_MmuPlugin_ports_1_cacheHitsCalc_3 = (MmuPlugin_ports_1_cache_1_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12]);
  assign _zz_MmuPlugin_ports_1_cacheHitsCalc_4 = (MmuPlugin_ports_1_cache_0_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22]);
  assign _zz_MmuPlugin_ports_1_cacheHitsCalc_5 = (MmuPlugin_ports_1_cache_0_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12]);
  assign _zz_CsrPlugin_csrMapping_readDataInit_19 = 32'h0;
  always @(posedge clk) begin
    if(_zz_decode_RegFilePlugin_rs1Data) begin
      _zz_RegFilePlugin_regFile_port0 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @(posedge clk) begin
    if(_zz_decode_RegFilePlugin_rs2Data) begin
      _zz_RegFilePlugin_regFile_port1 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache (
    .io_flush                                 (IBusCachedPlugin_cache_io_flush                       ), //i
    .io_cpu_prefetch_isValid                  (IBusCachedPlugin_cache_io_cpu_prefetch_isValid        ), //i
    .io_cpu_prefetch_haltIt                   (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt         ), //o
    .io_cpu_prefetch_pc                       (IBusCachedPlugin_iBusRsp_stages_0_input_payload       ), //i
    .io_cpu_fetch_isValid                     (IBusCachedPlugin_cache_io_cpu_fetch_isValid           ), //i
    .io_cpu_fetch_isStuck                     (IBusCachedPlugin_cache_io_cpu_fetch_isStuck           ), //i
    .io_cpu_fetch_isRemoved                   (IBusCachedPlugin_cache_io_cpu_fetch_isRemoved         ), //i
    .io_cpu_fetch_pc                          (IBusCachedPlugin_iBusRsp_stages_1_input_payload       ), //i
    .io_cpu_fetch_data                        (IBusCachedPlugin_cache_io_cpu_fetch_data              ), //o
    .io_cpu_fetch_mmuRsp_physicalAddress      (IBusCachedPlugin_mmuBus_rsp_physicalAddress           ), //i
    .io_cpu_fetch_mmuRsp_isIoAccess           (IBusCachedPlugin_mmuBus_rsp_isIoAccess                ), //i
    .io_cpu_fetch_mmuRsp_isPaging             (IBusCachedPlugin_mmuBus_rsp_isPaging                  ), //i
    .io_cpu_fetch_mmuRsp_allowRead            (IBusCachedPlugin_mmuBus_rsp_allowRead                 ), //i
    .io_cpu_fetch_mmuRsp_allowWrite           (IBusCachedPlugin_mmuBus_rsp_allowWrite                ), //i
    .io_cpu_fetch_mmuRsp_allowExecute         (IBusCachedPlugin_mmuBus_rsp_allowExecute              ), //i
    .io_cpu_fetch_mmuRsp_exception            (IBusCachedPlugin_mmuBus_rsp_exception                 ), //i
    .io_cpu_fetch_mmuRsp_refilling            (IBusCachedPlugin_mmuBus_rsp_refilling                 ), //i
    .io_cpu_fetch_mmuRsp_bypassTranslation    (IBusCachedPlugin_mmuBus_rsp_bypassTranslation         ), //i
    .io_cpu_fetch_mmuRsp_ways_0_sel           (IBusCachedPlugin_mmuBus_rsp_ways_0_sel                ), //i
    .io_cpu_fetch_mmuRsp_ways_0_physical      (IBusCachedPlugin_mmuBus_rsp_ways_0_physical           ), //i
    .io_cpu_fetch_mmuRsp_ways_1_sel           (IBusCachedPlugin_mmuBus_rsp_ways_1_sel                ), //i
    .io_cpu_fetch_mmuRsp_ways_1_physical      (IBusCachedPlugin_mmuBus_rsp_ways_1_physical           ), //i
    .io_cpu_fetch_mmuRsp_ways_2_sel           (IBusCachedPlugin_mmuBus_rsp_ways_2_sel                ), //i
    .io_cpu_fetch_mmuRsp_ways_2_physical      (IBusCachedPlugin_mmuBus_rsp_ways_2_physical           ), //i
    .io_cpu_fetch_mmuRsp_ways_3_sel           (IBusCachedPlugin_mmuBus_rsp_ways_3_sel                ), //i
    .io_cpu_fetch_mmuRsp_ways_3_physical      (IBusCachedPlugin_mmuBus_rsp_ways_3_physical           ), //i
    .io_cpu_fetch_physicalAddress             (IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress   ), //o
    .io_cpu_decode_isValid                    (IBusCachedPlugin_cache_io_cpu_decode_isValid          ), //i
    .io_cpu_decode_isStuck                    (IBusCachedPlugin_cache_io_cpu_decode_isStuck          ), //i
    .io_cpu_decode_pc                         (IBusCachedPlugin_iBusRsp_stages_2_input_payload       ), //i
    .io_cpu_decode_physicalAddress            (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress  ), //o
    .io_cpu_decode_data                       (IBusCachedPlugin_cache_io_cpu_decode_data             ), //o
    .io_cpu_decode_cacheMiss                  (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss        ), //o
    .io_cpu_decode_error                      (IBusCachedPlugin_cache_io_cpu_decode_error            ), //o
    .io_cpu_decode_mmuRefilling               (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling     ), //o
    .io_cpu_decode_mmuException               (IBusCachedPlugin_cache_io_cpu_decode_mmuException     ), //o
    .io_cpu_decode_isUser                     (IBusCachedPlugin_cache_io_cpu_decode_isUser           ), //i
    .io_cpu_fill_valid                        (IBusCachedPlugin_cache_io_cpu_fill_valid              ), //i
    .io_cpu_fill_payload                      (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress  ), //i
    .io_mem_cmd_valid                         (IBusCachedPlugin_cache_io_mem_cmd_valid               ), //o
    .io_mem_cmd_ready                         (iBus_cmd_ready                                        ), //i
    .io_mem_cmd_payload_address               (IBusCachedPlugin_cache_io_mem_cmd_payload_address     ), //o
    .io_mem_cmd_payload_size                  (IBusCachedPlugin_cache_io_mem_cmd_payload_size        ), //o
    .io_mem_rsp_valid                         (iBus_rsp_valid                                        ), //i
    .io_mem_rsp_payload_data                  (iBus_rsp_payload_data                                 ), //i
    .io_mem_rsp_payload_error                 (iBus_rsp_payload_error                                ), //i
    ._zz_when_Fetcher_l398                    (switch_Fetcher_l362                                   ), //i
    ._zz_io_cpu_fetch_data_regNextWhen        (IBusCachedPlugin_injectionPort_payload                ), //i
    .clk                                      (clk                                                   ), //i
    .reset                                    (reset                                                 )  //i
  );
  DataCache dataCache_1 (
    .io_cpu_execute_isValid                    (dataCache_1_io_cpu_execute_isValid             ), //i
    .io_cpu_execute_address                    (dataCache_1_io_cpu_execute_address             ), //i
    .io_cpu_execute_haltIt                     (dataCache_1_io_cpu_execute_haltIt              ), //o
    .io_cpu_execute_args_wr                    (dataCache_1_io_cpu_execute_args_wr             ), //i
    .io_cpu_execute_args_size                  (dataCache_1_io_cpu_execute_args_size           ), //i
    .io_cpu_execute_args_isLrsc                (dataCache_1_io_cpu_execute_args_isLrsc         ), //i
    .io_cpu_execute_args_isAmo                 (execute_MEMORY_AMO                             ), //i
    .io_cpu_execute_args_amoCtrl_swap          (dataCache_1_io_cpu_execute_args_amoCtrl_swap   ), //i
    .io_cpu_execute_args_amoCtrl_alu           (dataCache_1_io_cpu_execute_args_amoCtrl_alu    ), //i
    .io_cpu_execute_args_totalyConsistent      (execute_MEMORY_FORCE_CONSTISTENCY              ), //i
    .io_cpu_execute_refilling                  (dataCache_1_io_cpu_execute_refilling           ), //o
    .io_cpu_memory_isValid                     (dataCache_1_io_cpu_memory_isValid              ), //i
    .io_cpu_memory_isStuck                     (memory_arbitration_isStuck                     ), //i
    .io_cpu_memory_isWrite                     (dataCache_1_io_cpu_memory_isWrite              ), //o
    .io_cpu_memory_address                     (dataCache_1_io_cpu_memory_address              ), //i
    .io_cpu_memory_mmuRsp_physicalAddress      (DBusCachedPlugin_mmuBus_rsp_physicalAddress    ), //i
    .io_cpu_memory_mmuRsp_isIoAccess           (dataCache_1_io_cpu_memory_mmuRsp_isIoAccess    ), //i
    .io_cpu_memory_mmuRsp_isPaging             (DBusCachedPlugin_mmuBus_rsp_isPaging           ), //i
    .io_cpu_memory_mmuRsp_allowRead            (DBusCachedPlugin_mmuBus_rsp_allowRead          ), //i
    .io_cpu_memory_mmuRsp_allowWrite           (DBusCachedPlugin_mmuBus_rsp_allowWrite         ), //i
    .io_cpu_memory_mmuRsp_allowExecute         (DBusCachedPlugin_mmuBus_rsp_allowExecute       ), //i
    .io_cpu_memory_mmuRsp_exception            (DBusCachedPlugin_mmuBus_rsp_exception          ), //i
    .io_cpu_memory_mmuRsp_refilling            (DBusCachedPlugin_mmuBus_rsp_refilling          ), //i
    .io_cpu_memory_mmuRsp_bypassTranslation    (DBusCachedPlugin_mmuBus_rsp_bypassTranslation  ), //i
    .io_cpu_memory_mmuRsp_ways_0_sel           (DBusCachedPlugin_mmuBus_rsp_ways_0_sel         ), //i
    .io_cpu_memory_mmuRsp_ways_0_physical      (DBusCachedPlugin_mmuBus_rsp_ways_0_physical    ), //i
    .io_cpu_memory_mmuRsp_ways_1_sel           (DBusCachedPlugin_mmuBus_rsp_ways_1_sel         ), //i
    .io_cpu_memory_mmuRsp_ways_1_physical      (DBusCachedPlugin_mmuBus_rsp_ways_1_physical    ), //i
    .io_cpu_memory_mmuRsp_ways_2_sel           (DBusCachedPlugin_mmuBus_rsp_ways_2_sel         ), //i
    .io_cpu_memory_mmuRsp_ways_2_physical      (DBusCachedPlugin_mmuBus_rsp_ways_2_physical    ), //i
    .io_cpu_memory_mmuRsp_ways_3_sel           (DBusCachedPlugin_mmuBus_rsp_ways_3_sel         ), //i
    .io_cpu_memory_mmuRsp_ways_3_physical      (DBusCachedPlugin_mmuBus_rsp_ways_3_physical    ), //i
    .io_cpu_writeBack_isValid                  (dataCache_1_io_cpu_writeBack_isValid           ), //i
    .io_cpu_writeBack_isStuck                  (writeBack_arbitration_isStuck                  ), //i
    .io_cpu_writeBack_isUser                   (dataCache_1_io_cpu_writeBack_isUser            ), //i
    .io_cpu_writeBack_haltIt                   (dataCache_1_io_cpu_writeBack_haltIt            ), //o
    .io_cpu_writeBack_isWrite                  (dataCache_1_io_cpu_writeBack_isWrite           ), //o
    .io_cpu_writeBack_storeData                (dataCache_1_io_cpu_writeBack_storeData         ), //i
    .io_cpu_writeBack_data                     (dataCache_1_io_cpu_writeBack_data              ), //o
    .io_cpu_writeBack_address                  (dataCache_1_io_cpu_writeBack_address           ), //i
    .io_cpu_writeBack_mmuException             (dataCache_1_io_cpu_writeBack_mmuException      ), //o
    .io_cpu_writeBack_unalignedAccess          (dataCache_1_io_cpu_writeBack_unalignedAccess   ), //o
    .io_cpu_writeBack_accessError              (dataCache_1_io_cpu_writeBack_accessError       ), //o
    .io_cpu_writeBack_keepMemRspData           (dataCache_1_io_cpu_writeBack_keepMemRspData    ), //o
    .io_cpu_writeBack_fence_SW                 (dataCache_1_io_cpu_writeBack_fence_SW          ), //i
    .io_cpu_writeBack_fence_SR                 (dataCache_1_io_cpu_writeBack_fence_SR          ), //i
    .io_cpu_writeBack_fence_SO                 (dataCache_1_io_cpu_writeBack_fence_SO          ), //i
    .io_cpu_writeBack_fence_SI                 (dataCache_1_io_cpu_writeBack_fence_SI          ), //i
    .io_cpu_writeBack_fence_PW                 (dataCache_1_io_cpu_writeBack_fence_PW          ), //i
    .io_cpu_writeBack_fence_PR                 (dataCache_1_io_cpu_writeBack_fence_PR          ), //i
    .io_cpu_writeBack_fence_PO                 (dataCache_1_io_cpu_writeBack_fence_PO          ), //i
    .io_cpu_writeBack_fence_PI                 (dataCache_1_io_cpu_writeBack_fence_PI          ), //i
    .io_cpu_writeBack_fence_FM                 (dataCache_1_io_cpu_writeBack_fence_FM          ), //i
    .io_cpu_writeBack_exclusiveOk              (dataCache_1_io_cpu_writeBack_exclusiveOk       ), //o
    .io_cpu_redo                               (dataCache_1_io_cpu_redo                        ), //o
    .io_cpu_flush_valid                        (dataCache_1_io_cpu_flush_valid                 ), //i
    .io_cpu_flush_ready                        (dataCache_1_io_cpu_flush_ready                 ), //o
    .io_mem_cmd_valid                          (dataCache_1_io_mem_cmd_valid                   ), //o
    .io_mem_cmd_ready                          (dataCache_1_io_mem_cmd_ready                   ), //i
    .io_mem_cmd_payload_wr                     (dataCache_1_io_mem_cmd_payload_wr              ), //o
    .io_mem_cmd_payload_uncached               (dataCache_1_io_mem_cmd_payload_uncached        ), //o
    .io_mem_cmd_payload_address                (dataCache_1_io_mem_cmd_payload_address         ), //o
    .io_mem_cmd_payload_data                   (dataCache_1_io_mem_cmd_payload_data            ), //o
    .io_mem_cmd_payload_mask                   (dataCache_1_io_mem_cmd_payload_mask            ), //o
    .io_mem_cmd_payload_size                   (dataCache_1_io_mem_cmd_payload_size            ), //o
    .io_mem_cmd_payload_last                   (dataCache_1_io_mem_cmd_payload_last            ), //o
    .io_mem_rsp_valid                          (dBus_rsp_regNext_valid                         ), //i
    .io_mem_rsp_payload_last                   (dBus_rsp_regNext_payload_last                  ), //i
    .io_mem_rsp_payload_data                   (dBus_rsp_regNext_payload_data                  ), //i
    .io_mem_rsp_payload_error                  (dBus_rsp_regNext_payload_error                 ), //i
    .clk                                       (clk                                            ), //i
    .reset                                     (reset                                          )  //i
  );
  always @(*) begin
    case(_zz_IBusCachedPlugin_jump_pcLoad_payload_7)
      3'b000 : begin
        _zz_IBusCachedPlugin_jump_pcLoad_payload_6 = DBusCachedPlugin_redoBranch_payload;
      end
      3'b001 : begin
        _zz_IBusCachedPlugin_jump_pcLoad_payload_6 = CsrPlugin_jumpInterface_payload;
      end
      3'b010 : begin
        _zz_IBusCachedPlugin_jump_pcLoad_payload_6 = BranchPlugin_jumpInterface_payload;
      end
      3'b011 : begin
        _zz_IBusCachedPlugin_jump_pcLoad_payload_6 = CsrPlugin_redoInterface_payload;
      end
      default : begin
        _zz_IBusCachedPlugin_jump_pcLoad_payload_6 = IBusCachedPlugin_predictionJumpInterface_payload;
      end
    endcase
  end

  always @(*) begin
    case(_zz_writeBack_DBusCachedPlugin_rspShifted_1)
      2'b00 : begin
        _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_0;
      end
      2'b01 : begin
        _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_1;
      end
      2'b10 : begin
        _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_2;
      end
      default : begin
        _zz_writeBack_DBusCachedPlugin_rspShifted = writeBack_DBusCachedPlugin_rspSplits_3;
      end
    endcase
  end

  always @(*) begin
    case(_zz_writeBack_DBusCachedPlugin_rspShifted_3)
      1'b0 : begin
        _zz_writeBack_DBusCachedPlugin_rspShifted_2 = writeBack_DBusCachedPlugin_rspSplits_1;
      end
      default : begin
        _zz_writeBack_DBusCachedPlugin_rspShifted_2 = writeBack_DBusCachedPlugin_rspSplits_3;
      end
    endcase
  end

  always @(*) begin
    case(_zz_MmuPlugin_ports_0_cacheLine_valid_3)
      2'b00 : begin
        _zz_MmuPlugin_ports_0_cacheLine_valid_4 = MmuPlugin_ports_0_cache_0_valid;
        _zz_MmuPlugin_ports_0_cacheLine_exception = MmuPlugin_ports_0_cache_0_exception;
        _zz_MmuPlugin_ports_0_cacheLine_superPage = MmuPlugin_ports_0_cache_0_superPage;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_0 = MmuPlugin_ports_0_cache_0_virtualAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_1 = MmuPlugin_ports_0_cache_0_virtualAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_0 = MmuPlugin_ports_0_cache_0_physicalAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_1 = MmuPlugin_ports_0_cache_0_physicalAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_allowRead = MmuPlugin_ports_0_cache_0_allowRead;
        _zz_MmuPlugin_ports_0_cacheLine_allowWrite = MmuPlugin_ports_0_cache_0_allowWrite;
        _zz_MmuPlugin_ports_0_cacheLine_allowExecute = MmuPlugin_ports_0_cache_0_allowExecute;
        _zz_MmuPlugin_ports_0_cacheLine_allowUser = MmuPlugin_ports_0_cache_0_allowUser;
      end
      2'b01 : begin
        _zz_MmuPlugin_ports_0_cacheLine_valid_4 = MmuPlugin_ports_0_cache_1_valid;
        _zz_MmuPlugin_ports_0_cacheLine_exception = MmuPlugin_ports_0_cache_1_exception;
        _zz_MmuPlugin_ports_0_cacheLine_superPage = MmuPlugin_ports_0_cache_1_superPage;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_0 = MmuPlugin_ports_0_cache_1_virtualAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_1 = MmuPlugin_ports_0_cache_1_virtualAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_0 = MmuPlugin_ports_0_cache_1_physicalAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_1 = MmuPlugin_ports_0_cache_1_physicalAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_allowRead = MmuPlugin_ports_0_cache_1_allowRead;
        _zz_MmuPlugin_ports_0_cacheLine_allowWrite = MmuPlugin_ports_0_cache_1_allowWrite;
        _zz_MmuPlugin_ports_0_cacheLine_allowExecute = MmuPlugin_ports_0_cache_1_allowExecute;
        _zz_MmuPlugin_ports_0_cacheLine_allowUser = MmuPlugin_ports_0_cache_1_allowUser;
      end
      2'b10 : begin
        _zz_MmuPlugin_ports_0_cacheLine_valid_4 = MmuPlugin_ports_0_cache_2_valid;
        _zz_MmuPlugin_ports_0_cacheLine_exception = MmuPlugin_ports_0_cache_2_exception;
        _zz_MmuPlugin_ports_0_cacheLine_superPage = MmuPlugin_ports_0_cache_2_superPage;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_0 = MmuPlugin_ports_0_cache_2_virtualAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_1 = MmuPlugin_ports_0_cache_2_virtualAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_0 = MmuPlugin_ports_0_cache_2_physicalAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_1 = MmuPlugin_ports_0_cache_2_physicalAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_allowRead = MmuPlugin_ports_0_cache_2_allowRead;
        _zz_MmuPlugin_ports_0_cacheLine_allowWrite = MmuPlugin_ports_0_cache_2_allowWrite;
        _zz_MmuPlugin_ports_0_cacheLine_allowExecute = MmuPlugin_ports_0_cache_2_allowExecute;
        _zz_MmuPlugin_ports_0_cacheLine_allowUser = MmuPlugin_ports_0_cache_2_allowUser;
      end
      default : begin
        _zz_MmuPlugin_ports_0_cacheLine_valid_4 = MmuPlugin_ports_0_cache_3_valid;
        _zz_MmuPlugin_ports_0_cacheLine_exception = MmuPlugin_ports_0_cache_3_exception;
        _zz_MmuPlugin_ports_0_cacheLine_superPage = MmuPlugin_ports_0_cache_3_superPage;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_0 = MmuPlugin_ports_0_cache_3_virtualAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_1 = MmuPlugin_ports_0_cache_3_virtualAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_0 = MmuPlugin_ports_0_cache_3_physicalAddress_0;
        _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_1 = MmuPlugin_ports_0_cache_3_physicalAddress_1;
        _zz_MmuPlugin_ports_0_cacheLine_allowRead = MmuPlugin_ports_0_cache_3_allowRead;
        _zz_MmuPlugin_ports_0_cacheLine_allowWrite = MmuPlugin_ports_0_cache_3_allowWrite;
        _zz_MmuPlugin_ports_0_cacheLine_allowExecute = MmuPlugin_ports_0_cache_3_allowExecute;
        _zz_MmuPlugin_ports_0_cacheLine_allowUser = MmuPlugin_ports_0_cache_3_allowUser;
      end
    endcase
  end

  always @(*) begin
    case(_zz_MmuPlugin_ports_1_cacheLine_valid_3)
      2'b00 : begin
        _zz_MmuPlugin_ports_1_cacheLine_valid_4 = MmuPlugin_ports_1_cache_0_valid;
        _zz_MmuPlugin_ports_1_cacheLine_exception = MmuPlugin_ports_1_cache_0_exception;
        _zz_MmuPlugin_ports_1_cacheLine_superPage = MmuPlugin_ports_1_cache_0_superPage;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_0 = MmuPlugin_ports_1_cache_0_virtualAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_1 = MmuPlugin_ports_1_cache_0_virtualAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_0 = MmuPlugin_ports_1_cache_0_physicalAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_1 = MmuPlugin_ports_1_cache_0_physicalAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_allowRead = MmuPlugin_ports_1_cache_0_allowRead;
        _zz_MmuPlugin_ports_1_cacheLine_allowWrite = MmuPlugin_ports_1_cache_0_allowWrite;
        _zz_MmuPlugin_ports_1_cacheLine_allowExecute = MmuPlugin_ports_1_cache_0_allowExecute;
        _zz_MmuPlugin_ports_1_cacheLine_allowUser = MmuPlugin_ports_1_cache_0_allowUser;
      end
      2'b01 : begin
        _zz_MmuPlugin_ports_1_cacheLine_valid_4 = MmuPlugin_ports_1_cache_1_valid;
        _zz_MmuPlugin_ports_1_cacheLine_exception = MmuPlugin_ports_1_cache_1_exception;
        _zz_MmuPlugin_ports_1_cacheLine_superPage = MmuPlugin_ports_1_cache_1_superPage;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_0 = MmuPlugin_ports_1_cache_1_virtualAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_1 = MmuPlugin_ports_1_cache_1_virtualAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_0 = MmuPlugin_ports_1_cache_1_physicalAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_1 = MmuPlugin_ports_1_cache_1_physicalAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_allowRead = MmuPlugin_ports_1_cache_1_allowRead;
        _zz_MmuPlugin_ports_1_cacheLine_allowWrite = MmuPlugin_ports_1_cache_1_allowWrite;
        _zz_MmuPlugin_ports_1_cacheLine_allowExecute = MmuPlugin_ports_1_cache_1_allowExecute;
        _zz_MmuPlugin_ports_1_cacheLine_allowUser = MmuPlugin_ports_1_cache_1_allowUser;
      end
      2'b10 : begin
        _zz_MmuPlugin_ports_1_cacheLine_valid_4 = MmuPlugin_ports_1_cache_2_valid;
        _zz_MmuPlugin_ports_1_cacheLine_exception = MmuPlugin_ports_1_cache_2_exception;
        _zz_MmuPlugin_ports_1_cacheLine_superPage = MmuPlugin_ports_1_cache_2_superPage;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_0 = MmuPlugin_ports_1_cache_2_virtualAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_1 = MmuPlugin_ports_1_cache_2_virtualAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_0 = MmuPlugin_ports_1_cache_2_physicalAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_1 = MmuPlugin_ports_1_cache_2_physicalAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_allowRead = MmuPlugin_ports_1_cache_2_allowRead;
        _zz_MmuPlugin_ports_1_cacheLine_allowWrite = MmuPlugin_ports_1_cache_2_allowWrite;
        _zz_MmuPlugin_ports_1_cacheLine_allowExecute = MmuPlugin_ports_1_cache_2_allowExecute;
        _zz_MmuPlugin_ports_1_cacheLine_allowUser = MmuPlugin_ports_1_cache_2_allowUser;
      end
      default : begin
        _zz_MmuPlugin_ports_1_cacheLine_valid_4 = MmuPlugin_ports_1_cache_3_valid;
        _zz_MmuPlugin_ports_1_cacheLine_exception = MmuPlugin_ports_1_cache_3_exception;
        _zz_MmuPlugin_ports_1_cacheLine_superPage = MmuPlugin_ports_1_cache_3_superPage;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_0 = MmuPlugin_ports_1_cache_3_virtualAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_1 = MmuPlugin_ports_1_cache_3_virtualAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_0 = MmuPlugin_ports_1_cache_3_physicalAddress_0;
        _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_1 = MmuPlugin_ports_1_cache_3_physicalAddress_1;
        _zz_MmuPlugin_ports_1_cacheLine_allowRead = MmuPlugin_ports_1_cache_3_allowRead;
        _zz_MmuPlugin_ports_1_cacheLine_allowWrite = MmuPlugin_ports_1_cache_3_allowWrite;
        _zz_MmuPlugin_ports_1_cacheLine_allowExecute = MmuPlugin_ports_1_cache_3_allowExecute;
        _zz_MmuPlugin_ports_1_cacheLine_allowUser = MmuPlugin_ports_1_cache_3_allowUser;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL_1)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_decode_to_execute_BRANCH_CTRL_1_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_decode_to_execute_BRANCH_CTRL_1_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_memory_to_writeBack_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_memory_to_writeBack_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_memory_to_writeBack_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_memory_to_writeBack_ENV_CTRL_string = "ECALL";
      default : _zz_memory_to_writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL_1)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_memory_to_writeBack_ENV_CTRL_1_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_memory_to_writeBack_ENV_CTRL_1_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_memory_to_writeBack_ENV_CTRL_1_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_memory_to_writeBack_ENV_CTRL_1_string = "ECALL";
      default : _zz_memory_to_writeBack_ENV_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_execute_to_memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_execute_to_memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_execute_to_memory_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_execute_to_memory_ENV_CTRL_string = "ECALL";
      default : _zz_execute_to_memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL_1)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_execute_to_memory_ENV_CTRL_1_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_execute_to_memory_ENV_CTRL_1_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_execute_to_memory_ENV_CTRL_1_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_execute_to_memory_ENV_CTRL_1_string = "ECALL";
      default : _zz_execute_to_memory_ENV_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : decode_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_ENV_CTRL_string = "ECALL";
      default : decode_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_decode_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_decode_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_decode_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_decode_ENV_CTRL_string = "ECALL";
      default : _zz_decode_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_decode_to_execute_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_decode_to_execute_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_decode_to_execute_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_decode_to_execute_ENV_CTRL_string = "ECALL";
      default : _zz_decode_to_execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL_1)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_decode_to_execute_ENV_CTRL_1_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_decode_to_execute_ENV_CTRL_1_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_decode_to_execute_ENV_CTRL_1_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_decode_to_execute_ENV_CTRL_1_string = "ECALL";
      default : _zz_decode_to_execute_ENV_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : _zz_execute_to_memory_SHIFT_CTRL_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : _zz_execute_to_memory_SHIFT_CTRL_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : _zz_execute_to_memory_SHIFT_CTRL_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : _zz_execute_to_memory_SHIFT_CTRL_string = "SRA    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL_1)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : _zz_execute_to_memory_SHIFT_CTRL_1_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRA    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_1_string = "???????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : decode_SHIFT_CTRL_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : decode_SHIFT_CTRL_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : decode_SHIFT_CTRL_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : decode_SHIFT_CTRL_string = "SRA    ";
      default : decode_SHIFT_CTRL_string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : _zz_decode_SHIFT_CTRL_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : _zz_decode_SHIFT_CTRL_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : _zz_decode_SHIFT_CTRL_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : _zz_decode_SHIFT_CTRL_string = "SRA    ";
      default : _zz_decode_SHIFT_CTRL_string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : _zz_decode_to_execute_SHIFT_CTRL_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : _zz_decode_to_execute_SHIFT_CTRL_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : _zz_decode_to_execute_SHIFT_CTRL_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : _zz_decode_to_execute_SHIFT_CTRL_string = "SRA    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL_1)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : _zz_decode_to_execute_SHIFT_CTRL_1_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRA    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_1_string = "???????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR : decode_ALU_BITWISE_CTRL_string = "XOR";
      `AluBitwiseCtrlEnum_defaultEncoding_OR : decode_ALU_BITWISE_CTRL_string = "OR ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND : decode_ALU_BITWISE_CTRL_string = "AND";
      default : decode_ALU_BITWISE_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR : _zz_decode_ALU_BITWISE_CTRL_string = "XOR";
      `AluBitwiseCtrlEnum_defaultEncoding_OR : _zz_decode_ALU_BITWISE_CTRL_string = "OR ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND : _zz_decode_ALU_BITWISE_CTRL_string = "AND";
      default : _zz_decode_ALU_BITWISE_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "XOR";
      `AluBitwiseCtrlEnum_defaultEncoding_OR : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "OR ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "AND";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL_1)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "XOR";
      `AluBitwiseCtrlEnum_defaultEncoding_OR : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "OR ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "AND";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_decode_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL_1)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_1_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_1_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_decode_to_execute_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : memory_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_ENV_CTRL_string = "ECALL";
      default : memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_memory_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_memory_ENV_CTRL_string = "ECALL";
      default : _zz_memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : execute_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_ENV_CTRL_string = "ECALL";
      default : execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_execute_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_execute_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_execute_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_execute_ENV_CTRL_string = "ECALL";
      default : _zz_execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : writeBack_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : writeBack_ENV_CTRL_string = "ECALL";
      default : writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_writeBack_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_writeBack_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_writeBack_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_writeBack_ENV_CTRL_string = "ECALL";
      default : _zz_writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : memory_SHIFT_CTRL_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : memory_SHIFT_CTRL_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : memory_SHIFT_CTRL_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : memory_SHIFT_CTRL_string = "SRA    ";
      default : memory_SHIFT_CTRL_string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : _zz_memory_SHIFT_CTRL_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : _zz_memory_SHIFT_CTRL_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : _zz_memory_SHIFT_CTRL_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : _zz_memory_SHIFT_CTRL_string = "SRA    ";
      default : _zz_memory_SHIFT_CTRL_string = "???????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : execute_SHIFT_CTRL_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : execute_SHIFT_CTRL_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : execute_SHIFT_CTRL_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : execute_SHIFT_CTRL_string = "SRA    ";
      default : execute_SHIFT_CTRL_string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : _zz_execute_SHIFT_CTRL_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : _zz_execute_SHIFT_CTRL_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : _zz_execute_SHIFT_CTRL_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : _zz_execute_SHIFT_CTRL_string = "SRA    ";
      default : _zz_execute_SHIFT_CTRL_string = "???????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_decode_SRC2_CTRL_string = "PC ";
      default : _zz_decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_decode_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR : execute_ALU_BITWISE_CTRL_string = "XOR";
      `AluBitwiseCtrlEnum_defaultEncoding_OR : execute_ALU_BITWISE_CTRL_string = "OR ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND : execute_ALU_BITWISE_CTRL_string = "AND";
      default : execute_ALU_BITWISE_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR : _zz_execute_ALU_BITWISE_CTRL_string = "XOR";
      `AluBitwiseCtrlEnum_defaultEncoding_OR : _zz_execute_ALU_BITWISE_CTRL_string = "OR ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND : _zz_execute_ALU_BITWISE_CTRL_string = "AND";
      default : _zz_execute_ALU_BITWISE_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_decode_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_1)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_decode_ENV_CTRL_1_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_decode_ENV_CTRL_1_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_decode_ENV_CTRL_1_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_decode_ENV_CTRL_1_string = "ECALL";
      default : _zz_decode_ENV_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_1)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : _zz_decode_SHIFT_CTRL_1_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : _zz_decode_SHIFT_CTRL_1_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : _zz_decode_SHIFT_CTRL_1_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : _zz_decode_SHIFT_CTRL_1_string = "SRA    ";
      default : _zz_decode_SHIFT_CTRL_1_string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_1)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR : _zz_decode_ALU_BITWISE_CTRL_1_string = "XOR";
      `AluBitwiseCtrlEnum_defaultEncoding_OR : _zz_decode_ALU_BITWISE_CTRL_1_string = "OR ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND : _zz_decode_ALU_BITWISE_CTRL_1_string = "AND";
      default : _zz_decode_ALU_BITWISE_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_1)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_decode_SRC2_CTRL_1_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_decode_SRC2_CTRL_1_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_decode_SRC2_CTRL_1_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_decode_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_1)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_decode_ALU_CTRL_1_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_decode_ALU_CTRL_1_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_decode_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_1)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_decode_SRC1_CTRL_1_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_decode_SRC1_CTRL_1_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_decode_SRC1_CTRL_1_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_decode_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_1)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_decode_BRANCH_CTRL_1_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_decode_BRANCH_CTRL_1_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_decode_BRANCH_CTRL_1_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_decode_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_2)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_decode_SRC1_CTRL_2_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_decode_SRC1_CTRL_2_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_decode_SRC1_CTRL_2_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_decode_SRC1_CTRL_2_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_2_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_2)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_decode_ALU_CTRL_2_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_decode_ALU_CTRL_2_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_decode_ALU_CTRL_2_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_2_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_2)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_decode_SRC2_CTRL_2_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_decode_SRC2_CTRL_2_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_decode_SRC2_CTRL_2_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_decode_SRC2_CTRL_2_string = "PC ";
      default : _zz_decode_SRC2_CTRL_2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_2)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR : _zz_decode_ALU_BITWISE_CTRL_2_string = "XOR";
      `AluBitwiseCtrlEnum_defaultEncoding_OR : _zz_decode_ALU_BITWISE_CTRL_2_string = "OR ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND : _zz_decode_ALU_BITWISE_CTRL_2_string = "AND";
      default : _zz_decode_ALU_BITWISE_CTRL_2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_2)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : _zz_decode_SHIFT_CTRL_2_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : _zz_decode_SHIFT_CTRL_2_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : _zz_decode_SHIFT_CTRL_2_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : _zz_decode_SHIFT_CTRL_2_string = "SRA    ";
      default : _zz_decode_SHIFT_CTRL_2_string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_2)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_decode_ENV_CTRL_2_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_decode_ENV_CTRL_2_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : _zz_decode_ENV_CTRL_2_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_decode_ENV_CTRL_2_string = "ECALL";
      default : _zz_decode_ENV_CTRL_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_2)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_decode_BRANCH_CTRL_2_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_decode_BRANCH_CTRL_2_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_decode_BRANCH_CTRL_2_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_decode_BRANCH_CTRL_2_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(MmuPlugin_shared_state_1)
      `MmuPlugin_shared_State_defaultEncoding_IDLE : MmuPlugin_shared_state_1_string = "IDLE  ";
      `MmuPlugin_shared_State_defaultEncoding_L1_CMD : MmuPlugin_shared_state_1_string = "L1_CMD";
      `MmuPlugin_shared_State_defaultEncoding_L1_RSP : MmuPlugin_shared_state_1_string = "L1_RSP";
      `MmuPlugin_shared_State_defaultEncoding_L0_CMD : MmuPlugin_shared_state_1_string = "L0_CMD";
      `MmuPlugin_shared_State_defaultEncoding_L0_RSP : MmuPlugin_shared_state_1_string = "L0_RSP";
      default : MmuPlugin_shared_state_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR";
      `AluBitwiseCtrlEnum_defaultEncoding_OR : decode_to_execute_ALU_BITWISE_CTRL_string = "OR ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND : decode_to_execute_ALU_BITWISE_CTRL_string = "AND";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : decode_to_execute_SHIFT_CTRL_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : decode_to_execute_SHIFT_CTRL_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : decode_to_execute_SHIFT_CTRL_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : decode_to_execute_SHIFT_CTRL_string = "SRA    ";
      default : decode_to_execute_SHIFT_CTRL_string = "???????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE : execute_to_memory_SHIFT_CTRL_string = "DISABLE";
      `ShiftCtrlEnum_defaultEncoding_SLL : execute_to_memory_SHIFT_CTRL_string = "SLL    ";
      `ShiftCtrlEnum_defaultEncoding_SRL : execute_to_memory_SHIFT_CTRL_string = "SRL    ";
      `ShiftCtrlEnum_defaultEncoding_SRA : execute_to_memory_SHIFT_CTRL_string = "SRA    ";
      default : execute_to_memory_SHIFT_CTRL_string = "???????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : decode_to_execute_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_to_execute_ENV_CTRL_string = "ECALL";
      default : decode_to_execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : execute_to_memory_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_to_memory_ENV_CTRL_string = "ECALL";
      default : execute_to_memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_WFI : memory_to_writeBack_ENV_CTRL_string = "WFI  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_to_writeBack_ENV_CTRL_string = "ECALL";
      default : memory_to_writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign memory_MUL_LOW = ($signed(_zz_memory_MUL_LOW) + $signed(_zz_memory_MUL_LOW_7));
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT;
  assign execute_REGFILE_WRITE_DATA = _zz_execute_REGFILE_WRITE_DATA;
  assign execute_IS_DBUS_SHARING = (MmuPlugin_dBusAccess_cmd_valid && MmuPlugin_dBusAccess_cmd_ready);
  assign memory_MEMORY_STORE_DATA_RF = execute_to_memory_MEMORY_STORE_DATA_RF;
  assign execute_MEMORY_STORE_DATA_RF = _zz_execute_MEMORY_STORE_DATA_RF;
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0)) && DebugPlugin_allowEBreak);
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_SRC2 = _zz_decode_SRC2_6;
  assign decode_SRC1 = _zz_decode_SRC1_1;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign _zz_decode_to_execute_BRANCH_CTRL = _zz_decode_to_execute_BRANCH_CTRL_1;
  assign decode_IS_SFENCE_VMA2 = _zz_decode_IS_SFENCE_VMA2[33];
  assign decode_IS_SFENCE_VMA = _zz_decode_IS_SFENCE_VMA2[32];
  assign _zz_memory_to_writeBack_ENV_CTRL = _zz_memory_to_writeBack_ENV_CTRL_1;
  assign _zz_execute_to_memory_ENV_CTRL = _zz_execute_to_memory_ENV_CTRL_1;
  assign decode_ENV_CTRL = _zz_decode_ENV_CTRL;
  assign _zz_decode_to_execute_ENV_CTRL = _zz_decode_to_execute_ENV_CTRL_1;
  assign decode_IS_CSR = _zz_decode_IS_SFENCE_VMA2[29];
  assign decode_IS_RS2_SIGNED = _zz_decode_IS_SFENCE_VMA2[28];
  assign decode_IS_RS1_SIGNED = _zz_decode_IS_SFENCE_VMA2[27];
  assign decode_IS_DIV = _zz_decode_IS_SFENCE_VMA2[26];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_decode_IS_SFENCE_VMA2[25];
  assign _zz_execute_to_memory_SHIFT_CTRL = _zz_execute_to_memory_SHIFT_CTRL_1;
  assign decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL = _zz_decode_to_execute_SHIFT_CTRL_1;
  assign decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL = _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  assign decode_SRC_LESS_UNSIGNED = _zz_decode_IS_SFENCE_VMA2[20];
  assign decode_MEMORY_MANAGMENT = _zz_decode_IS_SFENCE_VMA2[19];
  assign memory_MEMORY_LRSC = execute_to_memory_MEMORY_LRSC;
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign decode_MEMORY_WR = _zz_decode_IS_SFENCE_VMA2[13];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_decode_IS_SFENCE_VMA2[12];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_decode_IS_SFENCE_VMA2[11];
  assign decode_ALU_CTRL = _zz_decode_ALU_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL = _zz_decode_to_execute_ALU_CTRL_1;
  assign decode_MEMORY_FORCE_CONSTISTENCY = _zz_decode_MEMORY_FORCE_CONSTISTENCY;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign memory_PC = execute_to_memory_PC;
  assign execute_IS_SFENCE_VMA2 = decode_to_execute_IS_SFENCE_VMA2;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_BRANCH_COND_RESULT = _zz_execute_BRANCH_COND_RESULT_1;
  assign execute_BRANCH_CTRL = _zz_execute_BRANCH_CTRL;
  assign execute_PC = decode_to_execute_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_decode_IS_SFENCE_VMA2[34];
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_memory_ENV_CTRL;
  assign execute_ENV_CTRL = _zz_execute_ENV_CTRL;
  assign writeBack_ENV_CTRL = _zz_writeBack_ENV_CTRL;
  assign execute_IS_SFENCE_VMA = decode_to_execute_IS_SFENCE_VMA;
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign execute_RS1 = decode_to_execute_RS1;
  assign decode_RS2_USE = _zz_decode_IS_SFENCE_VMA2[17];
  assign decode_RS1_USE = _zz_decode_IS_SFENCE_VMA2[5];
  always @(*) begin
    _zz_decode_RS2 = execute_REGFILE_WRITE_DATA;
    if(when_CsrPlugin_l1176) begin
      _zz_decode_RS2 = CsrPlugin_csrMapping_readDataSignal;
    end
    if(DBusCachedPlugin_forceDatapath) begin
      _zz_decode_RS2 = MmuPlugin_dBusAccess_cmd_payload_address;
    end
  end

  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr1Match) begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l51) begin
          decode_RS2 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l51_1) begin
          decode_RS2 = _zz_decode_RS2_1;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l51_2) begin
          decode_RS2 = _zz_decode_RS2;
        end
      end
    end
  end

  always @(*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr0Match) begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l48) begin
          decode_RS1 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l48_1) begin
          decode_RS1 = _zz_decode_RS2_1;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l48_2) begin
          decode_RS1 = _zz_decode_RS2;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @(*) begin
    _zz_decode_RS2_1 = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid) begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL : begin
          _zz_decode_RS2_1 = _zz_decode_RS2_3;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL, `ShiftCtrlEnum_defaultEncoding_SRA : begin
          _zz_decode_RS2_1 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(when_MulDivIterativePlugin_l128) begin
      _zz_decode_RS2_1 = memory_MulDivIterativePlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_memory_SHIFT_CTRL;
  assign execute_SHIFT_CTRL = _zz_execute_SHIFT_CTRL;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_decode_SRC2 = decode_PC;
  assign _zz_decode_SRC2_1 = decode_RS2;
  assign decode_SRC2_CTRL = _zz_decode_SRC2_CTRL;
  assign _zz_decode_SRC1 = decode_RS1;
  assign decode_SRC1_CTRL = _zz_decode_SRC1_CTRL;
  assign decode_SRC_USE_SUB_LESS = _zz_decode_IS_SFENCE_VMA2[3];
  assign decode_SRC_ADD_ZERO = _zz_decode_IS_SFENCE_VMA2[18];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_execute_ALU_CTRL;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = _zz_execute_ALU_BITWISE_CTRL;
  assign _zz_lastStageRegFileWrite_payload_address = writeBack_INSTRUCTION;
  assign _zz_lastStageRegFileWrite_valid = writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    _zz_1 = 1'b0;
    if(lastStageRegFileWrite_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_cache_io_cpu_fetch_data);
  always @(*) begin
    decode_REGFILE_WRITE_VALID = _zz_decode_IS_SFENCE_VMA2[10];
    if(when_RegFilePlugin_l63) begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = ({((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & 32'h0000106f) == 32'h00000003),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION) == 32'h00001073),{(_zz_decode_LEGAL_INSTRUCTION_1 == _zz_decode_LEGAL_INSTRUCTION_2),{_zz_decode_LEGAL_INSTRUCTION_3,{_zz_decode_LEGAL_INSTRUCTION_4,_zz_decode_LEGAL_INSTRUCTION_5}}}}}}} != 25'h0);
  assign writeBack_IS_DBUS_SHARING = memory_to_writeBack_IS_DBUS_SHARING;
  assign memory_IS_DBUS_SHARING = execute_to_memory_IS_DBUS_SHARING;
  always @(*) begin
    _zz_decode_RS2_2 = writeBack_REGFILE_WRITE_DATA;
    if(when_DBusCachedPlugin_l484) begin
      _zz_decode_RS2_2 = writeBack_DBusCachedPlugin_rspFormated;
    end
    if(when_MulPlugin_l147) begin
      case(switch_MulPlugin_l148)
        2'b00 : begin
          _zz_decode_RS2_2 = _zz__zz_decode_RS2_2;
        end
        default : begin
          _zz_decode_RS2_2 = _zz__zz_decode_RS2_2_1;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_LRSC = memory_to_writeBack_MEMORY_LRSC;
  assign writeBack_MEMORY_WR = memory_to_writeBack_MEMORY_WR;
  assign writeBack_MEMORY_STORE_DATA_RF = memory_to_writeBack_MEMORY_STORE_DATA_RF;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  always @(*) begin
    execute_MEMORY_AMO = decode_to_execute_MEMORY_AMO;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l498) begin
        execute_MEMORY_AMO = 1'b0;
      end
    end
  end

  always @(*) begin
    execute_MEMORY_LRSC = decode_to_execute_MEMORY_LRSC;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l498) begin
        execute_MEMORY_LRSC = 1'b0;
      end
    end
  end

  assign execute_MEMORY_FORCE_CONSTISTENCY = decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_MEMORY_AMO = _zz_decode_IS_SFENCE_VMA2[16];
  assign decode_MEMORY_LRSC = _zz_decode_IS_SFENCE_VMA2[15];
  assign decode_MEMORY_ENABLE = _zz_decode_IS_SFENCE_VMA2[4];
  assign decode_FLUSH_ALL = _zz_decode_IS_SFENCE_VMA2[0];
  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_4 = IBusCachedPlugin_rsp_issueDetected_3;
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_rsp_issueDetected_4 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_3 = IBusCachedPlugin_rsp_issueDetected_2;
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_rsp_issueDetected_3 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_2 = IBusCachedPlugin_rsp_issueDetected_1;
    if(when_IBusCachedPlugin_l244) begin
      IBusCachedPlugin_rsp_issueDetected_2 = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_rsp_issueDetected_1 = IBusCachedPlugin_rsp_issueDetected;
    if(when_IBusCachedPlugin_l239) begin
      IBusCachedPlugin_rsp_issueDetected_1 = 1'b1;
    end
  end

  assign decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_1;
  assign decode_INSTRUCTION = IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  always @(*) begin
    _zz_memory_to_writeBack_FORMAL_PC_NEXT = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid) begin
      _zz_memory_to_writeBack_FORMAL_PC_NEXT = BranchPlugin_jumpInterface_payload;
    end
  end

  always @(*) begin
    _zz_execute_to_memory_FORMAL_PC_NEXT = execute_FORMAL_PC_NEXT;
    if(CsrPlugin_redoInterface_valid) begin
      _zz_execute_to_memory_FORMAL_PC_NEXT = CsrPlugin_redoInterface_payload;
    end
  end

  always @(*) begin
    _zz_decode_to_execute_FORMAL_PC_NEXT = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_predictionJumpInterface_valid) begin
      _zz_decode_to_execute_FORMAL_PC_NEXT = IBusCachedPlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @(*) begin
    decode_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l303) begin
      decode_arbitration_haltItself = 1'b1;
    end
    case(switch_Fetcher_l362)
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_HazardSimplePlugin_l113) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_rescheduleLogic_rescheduleNext) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_CsrPlugin_l1116) begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_when) begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @(*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusCachedPlugin_predictionJumpInterface_valid) begin
      decode_arbitration_flushNext = 1'b1;
    end
    if(_zz_when) begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l343) begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(when_CsrPlugin_l1108) begin
      if(when_CsrPlugin_l1110) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(when_CsrPlugin_l1180) begin
      if(execute_CsrPlugin_blockedBySideEffects) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(when_DBusCachedPlugin_l359) begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if(when_DebugPlugin_l284) begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(CsrPlugin_selfException_valid) begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_flushIt = 1'b0;
    if(when_DebugPlugin_l284) begin
      if(when_DebugPlugin_l287) begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_flushNext = 1'b0;
    if(CsrPlugin_rescheduleLogic_rescheduleNext) begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(CsrPlugin_selfException_valid) begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(when_DebugPlugin_l284) begin
      if(when_DebugPlugin_l287) begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_arbitration_haltItself = 1'b0;
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l129) begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memory_arbitration_removeIt = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid) begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @(*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
    if(BranchPlugin_jumpInterface_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if(when_DBusCachedPlugin_l458) begin
      writeBack_arbitration_haltItself = 1'b1;
    end
  end

  assign writeBack_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(DBusCachedPlugin_exceptionBus_valid) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
    if(writeBack_arbitration_isFlushed) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_flushIt = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid) begin
      writeBack_arbitration_flushIt = 1'b1;
    end
  end

  always @(*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(DBusCachedPlugin_exceptionBus_valid) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1019) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1064) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @(*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(when_CsrPlugin_l922) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1019) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1064) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l284) begin
      if(when_DebugPlugin_l287) begin
        IBusCachedPlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l300) begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if(when_Fetcher_l240) begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  always @(*) begin
    _zz_when_DBusCachedPlugin_l386 = 1'b0;
    if(DebugPlugin_godmode) begin
      _zz_when_DBusCachedPlugin_l386 = 1'b1;
    end
  end

  assign CsrPlugin_csrMapping_allowCsrSignal = 1'b0;
  assign CsrPlugin_csrMapping_readDataSignal = CsrPlugin_csrMapping_readDataInit;
  always @(*) begin
    CsrPlugin_inWfi = 1'b0;
    if(when_CsrPlugin_l1108) begin
      CsrPlugin_inWfi = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt) begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(when_CsrPlugin_l1019) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(when_CsrPlugin_l1064) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_CsrPlugin_l1019) begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(when_CsrPlugin_l1064) begin
      case(switch_CsrPlugin_l1068)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        2'b01 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_sepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode) begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if(when_DebugPlugin_l316) begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode) begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowEbreakException = 1'b1;
    if(DebugPlugin_allowEBreak) begin
      CsrPlugin_allowEbreakException = 1'b0;
    end
  end

  assign IBusCachedPlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusCachedPlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,{CsrPlugin_redoInterface_valid,{CsrPlugin_jumpInterface_valid,{DBusCachedPlugin_redoBranch_valid,IBusCachedPlugin_predictionJumpInterface_valid}}}} != 5'h0);
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload = {IBusCachedPlugin_predictionJumpInterface_valid,{CsrPlugin_redoInterface_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}}};
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_1 = (_zz_IBusCachedPlugin_jump_pcLoad_payload & (~ _zz__zz_IBusCachedPlugin_jump_pcLoad_payload_1));
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_2 = _zz_IBusCachedPlugin_jump_pcLoad_payload_1[3];
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_3 = _zz_IBusCachedPlugin_jump_pcLoad_payload_1[4];
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_4 = (_zz_IBusCachedPlugin_jump_pcLoad_payload_1[1] || _zz_IBusCachedPlugin_jump_pcLoad_payload_2);
  assign _zz_IBusCachedPlugin_jump_pcLoad_payload_5 = (_zz_IBusCachedPlugin_jump_pcLoad_payload_1[2] || _zz_IBusCachedPlugin_jump_pcLoad_payload_2);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_IBusCachedPlugin_jump_pcLoad_payload_6;
  always @(*) begin
    IBusCachedPlugin_fetchPc_correction = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
  end

  assign when_Fetcher_l127 = (IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready);
  assign IBusCachedPlugin_fetchPc_corrected = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_correctionReg);
  always @(*) begin
    IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready) begin
      IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  assign when_Fetcher_l131 = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_pcRegPropagate);
  assign when_Fetcher_l131_1 = (IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready);
  assign when_Fetcher_l131_2 = ((! IBusCachedPlugin_fetchPc_output_valid) && IBusCachedPlugin_fetchPc_output_ready);
  always @(*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_IBusCachedPlugin_fetchPc_pc);
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_fetchPc_redo_payload;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
    IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
  end

  always @(*) begin
    IBusCachedPlugin_fetchPc_flushed = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid) begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid) begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign when_Fetcher_l158 = (IBusCachedPlugin_fetchPc_booted && ((IBusCachedPlugin_fetchPc_output_ready || IBusCachedPlugin_fetchPc_correction) || IBusCachedPlugin_fetchPc_pcRegPropagate));
  assign IBusCachedPlugin_fetchPc_output_valid = ((! IBusCachedPlugin_fetcherHalt) && IBusCachedPlugin_fetchPc_booted);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_pc;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_redoFetch = 1'b0;
    if(IBusCachedPlugin_rsp_redoFetch) begin
      IBusCachedPlugin_iBusRsp_redoFetch = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt) begin
      IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_0_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_mmuBus_busy) begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if(when_IBusCachedPlugin_l267) begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_output_ready && _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  assign IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_iBusRsp_flush = ((decode_arbitration_removeIt || (decode_arbitration_flushNext && (! decode_arbitration_isStuck))) || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  assign _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready = ((1'b0 && (! _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_1)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_1 = _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_2;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_1;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid)) || IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid = _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload = _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_ready = IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  always @(*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if(when_Fetcher_l320) begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign when_Fetcher_l240 = (IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_stages_2_input_valid);
  assign when_Fetcher_l320 = (! IBusCachedPlugin_pcValids_0);
  assign when_Fetcher_l329 = (! (! IBusCachedPlugin_iBusRsp_stages_1_input_ready));
  assign when_Fetcher_l329_1 = (! (! IBusCachedPlugin_iBusRsp_stages_2_input_ready));
  assign when_Fetcher_l329_2 = (! execute_arbitration_isStuck);
  assign when_Fetcher_l329_3 = (! memory_arbitration_isStuck);
  assign when_Fetcher_l329_4 = (! writeBack_arbitration_isStuck);
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_4;
  assign IBusCachedPlugin_iBusRsp_output_ready = (! decode_arbitration_isStuck);
  always @(*) begin
    decode_arbitration_isValid = IBusCachedPlugin_iBusRsp_output_valid;
    case(switch_Fetcher_l362)
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch = _zz__zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch[11];
  always @(*) begin
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[18] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[17] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[16] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[15] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[14] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[13] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[12] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[11] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[10] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[9] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[8] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[7] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[6] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[5] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[4] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[3] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[2] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[1] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
    _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_1[0] = _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  end

  always @(*) begin
    IBusCachedPlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_IBusCachedPlugin_decodePrediction_cmd_hadBranch_2[31]));
    if(_zz_6) begin
      IBusCachedPlugin_decodePrediction_cmd_hadBranch = 1'b0;
    end
  end

  assign _zz_2 = _zz__zz_2[19];
  always @(*) begin
    _zz_3[10] = _zz_2;
    _zz_3[9] = _zz_2;
    _zz_3[8] = _zz_2;
    _zz_3[7] = _zz_2;
    _zz_3[6] = _zz_2;
    _zz_3[5] = _zz_2;
    _zz_3[4] = _zz_2;
    _zz_3[3] = _zz_2;
    _zz_3[2] = _zz_2;
    _zz_3[1] = _zz_2;
    _zz_3[0] = _zz_2;
  end

  assign _zz_4 = _zz__zz_4[11];
  always @(*) begin
    _zz_5[18] = _zz_4;
    _zz_5[17] = _zz_4;
    _zz_5[16] = _zz_4;
    _zz_5[15] = _zz_4;
    _zz_5[14] = _zz_4;
    _zz_5[13] = _zz_4;
    _zz_5[12] = _zz_4;
    _zz_5[11] = _zz_4;
    _zz_5[10] = _zz_4;
    _zz_5[9] = _zz_4;
    _zz_5[8] = _zz_4;
    _zz_5[7] = _zz_4;
    _zz_5[6] = _zz_4;
    _zz_5[5] = _zz_4;
    _zz_5[4] = _zz_4;
    _zz_5[3] = _zz_4;
    _zz_5[2] = _zz_4;
    _zz_5[1] = _zz_4;
    _zz_5[0] = _zz_4;
  end

  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_6 = _zz__zz_6[1];
      end
      default : begin
        _zz_6 = _zz__zz_6_1[1];
      end
    endcase
  end

  assign IBusCachedPlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusCachedPlugin_decodePrediction_cmd_hadBranch);
  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload = _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload[19];
  always @(*) begin
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[10] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[9] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[8] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[7] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[6] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[5] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[4] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[3] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[2] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[1] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_1[0] = _zz_IBusCachedPlugin_predictionJumpInterface_payload;
  end

  assign _zz_IBusCachedPlugin_predictionJumpInterface_payload_2 = _zz__zz_IBusCachedPlugin_predictionJumpInterface_payload_2[11];
  always @(*) begin
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[18] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[17] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[16] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[15] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[14] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[13] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[12] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[11] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[10] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[9] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[8] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[7] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[6] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[5] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[4] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[3] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[2] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[1] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
    _zz_IBusCachedPlugin_predictionJumpInterface_payload_3[0] = _zz_IBusCachedPlugin_predictionJumpInterface_payload_2;
  end

  assign IBusCachedPlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_IBusCachedPlugin_predictionJumpInterface_payload_1,{{{_zz_IBusCachedPlugin_predictionJumpInterface_payload_4,decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_IBusCachedPlugin_predictionJumpInterface_payload_3,{{{_zz_IBusCachedPlugin_predictionJumpInterface_payload_5,_zz_IBusCachedPlugin_predictionJumpInterface_payload_6},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @(*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign IBusCachedPlugin_cache_io_cpu_prefetch_isValid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_fetch_isValid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_fetch_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_isValid = IBusCachedPlugin_cache_io_cpu_fetch_isValid;
  assign IBusCachedPlugin_mmuBus_cmd_0_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_virtualAddress = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign IBusCachedPlugin_mmuBus_end = (IBusCachedPlugin_iBusRsp_stages_1_input_ready || IBusCachedPlugin_externalFlush);
  assign IBusCachedPlugin_cache_io_cpu_decode_isValid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign IBusCachedPlugin_cache_io_cpu_decode_isStuck = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign IBusCachedPlugin_cache_io_cpu_decode_isUser = (CsrPlugin_privilege == 2'b00);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @(*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(when_IBusCachedPlugin_l239) begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_cache_io_cpu_fill_valid = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(when_IBusCachedPlugin_l250) begin
      IBusCachedPlugin_cache_io_cpu_fill_valid = 1'b1;
    end
  end

  always @(*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(when_IBusCachedPlugin_l244) begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @(*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(when_IBusCachedPlugin_l244) begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b1100;
    end
    if(when_IBusCachedPlugin_l256) begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b0001;
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_2_input_payload[31 : 2],2'b00};
  assign when_IBusCachedPlugin_l239 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign when_IBusCachedPlugin_l244 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! IBusCachedPlugin_rsp_issueDetected_1));
  assign when_IBusCachedPlugin_l250 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! IBusCachedPlugin_rsp_issueDetected_2));
  assign when_IBusCachedPlugin_l256 = ((IBusCachedPlugin_cache_io_cpu_decode_isValid && IBusCachedPlugin_cache_io_cpu_decode_error) && (! IBusCachedPlugin_rsp_issueDetected_3));
  assign when_IBusCachedPlugin_l267 = (IBusCachedPlugin_rsp_issueDetected_4 || IBusCachedPlugin_rsp_iBusRspOutputHalt);
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  assign IBusCachedPlugin_cache_io_flush = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign dataCache_1_io_mem_cmd_s2mPipe_valid = (dataCache_1_io_mem_cmd_valid || dataCache_1_io_mem_cmd_s2mPipe_rValid);
  assign dataCache_1_io_mem_cmd_ready = (! dataCache_1_io_mem_cmd_s2mPipe_rValid);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_wr = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_wr : dataCache_1_io_mem_cmd_payload_wr);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_uncached = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_uncached : dataCache_1_io_mem_cmd_payload_uncached);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_address = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_address : dataCache_1_io_mem_cmd_payload_address);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_data = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_data : dataCache_1_io_mem_cmd_payload_data);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_mask = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_mask : dataCache_1_io_mem_cmd_payload_mask);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_size = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_size : dataCache_1_io_mem_cmd_payload_size);
  assign dataCache_1_io_mem_cmd_s2mPipe_payload_last = (dataCache_1_io_mem_cmd_s2mPipe_rValid ? dataCache_1_io_mem_cmd_s2mPipe_rData_last : dataCache_1_io_mem_cmd_payload_last);
  assign when_Stream_l365 = (dataCache_1_io_mem_cmd_ready && (! dataCache_1_io_mem_cmd_s2mPipe_ready));
  assign dataCache_1_io_mem_cmd_s2mPipe_ready = ((1'b1 && (! dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid)) || dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_ready);
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid = dataCache_1_io_mem_cmd_s2mPipe_rValid_1;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_wr = dataCache_1_io_mem_cmd_s2mPipe_rData_wr_1;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_uncached = dataCache_1_io_mem_cmd_s2mPipe_rData_uncached_1;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_address = dataCache_1_io_mem_cmd_s2mPipe_rData_address_1;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_data = dataCache_1_io_mem_cmd_s2mPipe_rData_data_1;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_mask = dataCache_1_io_mem_cmd_s2mPipe_rData_mask_1;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_size = dataCache_1_io_mem_cmd_s2mPipe_rData_size_1;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_last = dataCache_1_io_mem_cmd_s2mPipe_rData_last_1;
  assign dBus_cmd_valid = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_valid;
  assign dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_ready = dBus_cmd_ready;
  assign dBus_cmd_payload_wr = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_wr;
  assign dBus_cmd_payload_uncached = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_uncached;
  assign dBus_cmd_payload_address = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_address;
  assign dBus_cmd_payload_data = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_data;
  assign dBus_cmd_payload_mask = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_mask;
  assign dBus_cmd_payload_size = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_size;
  assign dBus_cmd_payload_last = dataCache_1_io_mem_cmd_s2mPipe_m2sPipe_payload_last;
  assign when_DBusCachedPlugin_l303 = ((DBusCachedPlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE);
  always @(*) begin
    _zz_decode_MEMORY_FORCE_CONSTISTENCY = 1'b0;
    if(when_DBusCachedPlugin_l311) begin
      if(decode_MEMORY_LRSC) begin
        _zz_decode_MEMORY_FORCE_CONSTISTENCY = 1'b1;
      end
      if(decode_MEMORY_AMO) begin
        _zz_decode_MEMORY_FORCE_CONSTISTENCY = 1'b1;
      end
    end
  end

  assign when_DBusCachedPlugin_l311 = decode_INSTRUCTION[25];
  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    dataCache_1_io_cpu_execute_isValid = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l498) begin
        if(when_DBusCachedPlugin_l499) begin
          dataCache_1_io_cpu_execute_isValid = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    dataCache_1_io_cpu_execute_address = execute_SRC_ADD;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l498) begin
        dataCache_1_io_cpu_execute_address = MmuPlugin_dBusAccess_cmd_payload_address;
      end
    end
  end

  always @(*) begin
    dataCache_1_io_cpu_execute_args_wr = execute_MEMORY_WR;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l498) begin
        dataCache_1_io_cpu_execute_args_wr = 1'b0;
      end
    end
  end

  always @(*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_execute_MEMORY_STORE_DATA_RF = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_execute_MEMORY_STORE_DATA_RF = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_execute_MEMORY_STORE_DATA_RF = execute_RS2[31 : 0];
      end
    endcase
  end

  always @(*) begin
    dataCache_1_io_cpu_execute_args_size = execute_DBusCachedPlugin_size;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l498) begin
        dataCache_1_io_cpu_execute_args_size = MmuPlugin_dBusAccess_cmd_payload_size;
      end
    end
  end

  assign dataCache_1_io_cpu_flush_valid = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  assign when_DBusCachedPlugin_l343 = ((dataCache_1_io_cpu_flush_valid && (! dataCache_1_io_cpu_flush_ready)) || dataCache_1_io_cpu_execute_haltIt);
  always @(*) begin
    dataCache_1_io_cpu_execute_args_isLrsc = 1'b0;
    if(execute_MEMORY_LRSC) begin
      dataCache_1_io_cpu_execute_args_isLrsc = 1'b1;
    end
  end

  assign dataCache_1_io_cpu_execute_args_amoCtrl_alu = execute_INSTRUCTION[31 : 29];
  assign dataCache_1_io_cpu_execute_args_amoCtrl_swap = execute_INSTRUCTION[27];
  assign when_DBusCachedPlugin_l359 = (dataCache_1_io_cpu_execute_refilling && execute_arbitration_isValid);
  always @(*) begin
    dataCache_1_io_cpu_memory_isValid = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
    if(memory_IS_DBUS_SHARING) begin
      dataCache_1_io_cpu_memory_isValid = 1'b1;
    end
  end

  assign dataCache_1_io_cpu_memory_address = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_mmuBus_cmd_0_isValid = dataCache_1_io_cpu_memory_isValid;
  assign DBusCachedPlugin_mmuBus_cmd_0_isStuck = memory_arbitration_isStuck;
  assign DBusCachedPlugin_mmuBus_cmd_0_virtualAddress = dataCache_1_io_cpu_memory_address;
  always @(*) begin
    DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
    if(memory_IS_DBUS_SHARING) begin
      DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b1;
    end
  end

  assign DBusCachedPlugin_mmuBus_end = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  always @(*) begin
    dataCache_1_io_cpu_memory_mmuRsp_isIoAccess = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if(when_DBusCachedPlugin_l386) begin
      dataCache_1_io_cpu_memory_mmuRsp_isIoAccess = 1'b1;
    end
  end

  assign when_DBusCachedPlugin_l386 = (_zz_when_DBusCachedPlugin_l386 && (! dataCache_1_io_cpu_memory_isWrite));
  always @(*) begin
    dataCache_1_io_cpu_writeBack_isValid = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
    if(writeBack_IS_DBUS_SHARING) begin
      dataCache_1_io_cpu_writeBack_isValid = 1'b1;
    end
    if(writeBack_arbitration_haltByOther) begin
      dataCache_1_io_cpu_writeBack_isValid = 1'b0;
    end
  end

  assign dataCache_1_io_cpu_writeBack_isUser = (CsrPlugin_privilege == 2'b00);
  assign dataCache_1_io_cpu_writeBack_address = writeBack_REGFILE_WRITE_DATA;
  assign dataCache_1_io_cpu_writeBack_storeData[31 : 0] = writeBack_MEMORY_STORE_DATA_RF;
  always @(*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if(when_DBusCachedPlugin_l438) begin
      if(dataCache_1_io_cpu_redo) begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
      end
    end
  end

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @(*) begin
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    if(when_DBusCachedPlugin_l438) begin
      if(dataCache_1_io_cpu_writeBack_accessError) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_mmuException) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_redo) begin
        DBusCachedPlugin_exceptionBus_valid = 1'b0;
      end
    end
  end

  assign DBusCachedPlugin_exceptionBus_payload_badAddr = writeBack_REGFILE_WRITE_DATA;
  always @(*) begin
    DBusCachedPlugin_exceptionBus_payload_code = 4'bxxxx;
    if(when_DBusCachedPlugin_l438) begin
      if(dataCache_1_io_cpu_writeBack_accessError) begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_DBusCachedPlugin_exceptionBus_payload_code};
      end
      if(dataCache_1_io_cpu_writeBack_mmuException) begin
        DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 4'b1111 : 4'b1101);
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess) begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_DBusCachedPlugin_exceptionBus_payload_code_1};
      end
    end
  end

  assign when_DBusCachedPlugin_l438 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign when_DBusCachedPlugin_l458 = (dataCache_1_io_cpu_writeBack_isValid && dataCache_1_io_cpu_writeBack_haltIt);
  assign writeBack_DBusCachedPlugin_rspSplits_0 = dataCache_1_io_cpu_writeBack_data[7 : 0];
  assign writeBack_DBusCachedPlugin_rspSplits_1 = dataCache_1_io_cpu_writeBack_data[15 : 8];
  assign writeBack_DBusCachedPlugin_rspSplits_2 = dataCache_1_io_cpu_writeBack_data[23 : 16];
  assign writeBack_DBusCachedPlugin_rspSplits_3 = dataCache_1_io_cpu_writeBack_data[31 : 24];
  always @(*) begin
    writeBack_DBusCachedPlugin_rspShifted[7 : 0] = _zz_writeBack_DBusCachedPlugin_rspShifted;
    writeBack_DBusCachedPlugin_rspShifted[15 : 8] = _zz_writeBack_DBusCachedPlugin_rspShifted_2;
    writeBack_DBusCachedPlugin_rspShifted[23 : 16] = writeBack_DBusCachedPlugin_rspSplits_2;
    writeBack_DBusCachedPlugin_rspShifted[31 : 24] = writeBack_DBusCachedPlugin_rspSplits_3;
  end

  always @(*) begin
    writeBack_DBusCachedPlugin_rspRf = writeBack_DBusCachedPlugin_rspShifted[31 : 0];
    if(when_DBusCachedPlugin_l474) begin
      writeBack_DBusCachedPlugin_rspRf = {31'd0, _zz_writeBack_DBusCachedPlugin_rspRf};
    end
  end

  assign when_DBusCachedPlugin_l474 = (writeBack_MEMORY_LRSC && writeBack_MEMORY_WR);
  assign switch_Misc_l199 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_writeBack_DBusCachedPlugin_rspFormated = (writeBack_DBusCachedPlugin_rspRf[7] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[31] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[30] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[29] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[28] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[27] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[26] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[25] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[24] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[23] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[22] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[21] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[20] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[19] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[18] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[17] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[16] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[15] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[14] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[13] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[12] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[11] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[10] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[9] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[8] = _zz_writeBack_DBusCachedPlugin_rspFormated;
    _zz_writeBack_DBusCachedPlugin_rspFormated_1[7 : 0] = writeBack_DBusCachedPlugin_rspRf[7 : 0];
  end

  assign _zz_writeBack_DBusCachedPlugin_rspFormated_2 = (writeBack_DBusCachedPlugin_rspRf[15] && (! writeBack_INSTRUCTION[14]));
  always @(*) begin
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[31] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[30] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[29] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[28] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[27] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[26] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[25] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[24] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[23] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[22] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[21] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[20] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[19] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[18] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[17] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[16] = _zz_writeBack_DBusCachedPlugin_rspFormated_2;
    _zz_writeBack_DBusCachedPlugin_rspFormated_3[15 : 0] = writeBack_DBusCachedPlugin_rspRf[15 : 0];
  end

  always @(*) begin
    case(switch_Misc_l199)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_writeBack_DBusCachedPlugin_rspFormated_1;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_writeBack_DBusCachedPlugin_rspFormated_3;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspRf;
      end
    endcase
  end

  assign when_DBusCachedPlugin_l484 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  always @(*) begin
    MmuPlugin_dBusAccess_cmd_ready = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l498) begin
        if(when_DBusCachedPlugin_l499) begin
          MmuPlugin_dBusAccess_cmd_ready = (! execute_arbitration_isStuck);
        end
      end
    end
  end

  always @(*) begin
    DBusCachedPlugin_forceDatapath = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid) begin
      if(when_DBusCachedPlugin_l498) begin
        DBusCachedPlugin_forceDatapath = 1'b1;
      end
    end
  end

  assign when_DBusCachedPlugin_l498 = (! ({(writeBack_arbitration_isValid || CsrPlugin_exceptionPendings_3),{(memory_arbitration_isValid || CsrPlugin_exceptionPendings_2),(execute_arbitration_isValid || CsrPlugin_exceptionPendings_1)}} != 3'b000));
  assign when_DBusCachedPlugin_l499 = (! dataCache_1_io_cpu_execute_refilling);
  assign MmuPlugin_dBusAccess_rsp_valid = ((writeBack_IS_DBUS_SHARING && (! dataCache_1_io_cpu_writeBack_isWrite)) && (dataCache_1_io_cpu_redo || (! dataCache_1_io_cpu_writeBack_haltIt)));
  assign MmuPlugin_dBusAccess_rsp_payload_data = writeBack_DBusCachedPlugin_rspRf;
  assign MmuPlugin_dBusAccess_rsp_payload_error = (dataCache_1_io_cpu_writeBack_unalignedAccess || dataCache_1_io_cpu_writeBack_accessError);
  assign MmuPlugin_dBusAccess_rsp_payload_redo = dataCache_1_io_cpu_redo;
  assign _zz_decode_IS_SFENCE_VMA2_1 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_decode_IS_SFENCE_VMA2_2 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_decode_IS_SFENCE_VMA2_3 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002000);
  assign _zz_decode_IS_SFENCE_VMA2_4 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_decode_IS_SFENCE_VMA2_5 = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000004);
  assign _zz_decode_IS_SFENCE_VMA2_6 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_decode_IS_SFENCE_VMA2_7 = ((decode_INSTRUCTION & 32'h02003050) == 32'h02000050);
  assign _zz_decode_IS_SFENCE_VMA2 = {({_zz_decode_IS_SFENCE_VMA2_2,(_zz__zz_decode_IS_SFENCE_VMA2 == _zz__zz_decode_IS_SFENCE_VMA2_1)} != 2'b00),{((_zz__zz_decode_IS_SFENCE_VMA2_2 == _zz__zz_decode_IS_SFENCE_VMA2_3) != 1'b0),{(_zz__zz_decode_IS_SFENCE_VMA2_4 != 1'b0),{(_zz__zz_decode_IS_SFENCE_VMA2_5 != _zz__zz_decode_IS_SFENCE_VMA2_6),{_zz__zz_decode_IS_SFENCE_VMA2_7,{_zz__zz_decode_IS_SFENCE_VMA2_8,_zz__zz_decode_IS_SFENCE_VMA2_11}}}}}};
  assign _zz_decode_SRC1_CTRL_2 = _zz_decode_IS_SFENCE_VMA2[2 : 1];
  assign _zz_decode_SRC1_CTRL_1 = _zz_decode_SRC1_CTRL_2;
  assign _zz_decode_ALU_CTRL_2 = _zz_decode_IS_SFENCE_VMA2[7 : 6];
  assign _zz_decode_ALU_CTRL_1 = _zz_decode_ALU_CTRL_2;
  assign _zz_decode_SRC2_CTRL_2 = _zz_decode_IS_SFENCE_VMA2[9 : 8];
  assign _zz_decode_SRC2_CTRL_1 = _zz_decode_SRC2_CTRL_2;
  assign _zz_decode_ALU_BITWISE_CTRL_2 = _zz_decode_IS_SFENCE_VMA2[22 : 21];
  assign _zz_decode_ALU_BITWISE_CTRL_1 = _zz_decode_ALU_BITWISE_CTRL_2;
  assign _zz_decode_SHIFT_CTRL_2 = _zz_decode_IS_SFENCE_VMA2[24 : 23];
  assign _zz_decode_SHIFT_CTRL_1 = _zz_decode_SHIFT_CTRL_2;
  assign _zz_decode_ENV_CTRL_2 = _zz_decode_IS_SFENCE_VMA2[31 : 30];
  assign _zz_decode_ENV_CTRL_1 = _zz_decode_ENV_CTRL_2;
  assign _zz_decode_BRANCH_CTRL_2 = _zz_decode_IS_SFENCE_VMA2[36 : 35];
  assign _zz_decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_2;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign when_RegFilePlugin_l63 = (decode_INSTRUCTION[11 : 7] == 5'h0);
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_RegFilePlugin_regFile_port0;
  assign decode_RegFilePlugin_rs2Data = _zz_RegFilePlugin_regFile_port1;
  always @(*) begin
    lastStageRegFileWrite_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
    if(_zz_7) begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
    if(_zz_7) begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_data = _zz_decode_RS2_2;
    if(_zz_7) begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_execute_REGFILE_WRITE_DATA = {31'd0, _zz__zz_execute_REGFILE_WRITE_DATA};
      end
      default : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_decode_SRC1_1 = _zz_decode_SRC1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_decode_SRC1_1 = {29'd0, _zz__zz_decode_SRC1_1};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_decode_SRC1_1 = {decode_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_decode_SRC1_1 = {27'd0, _zz__zz_decode_SRC1_1_1};
      end
    endcase
  end

  assign _zz_decode_SRC2_2 = decode_INSTRUCTION[31];
  always @(*) begin
    _zz_decode_SRC2_3[19] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[18] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[17] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[16] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[15] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[14] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[13] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[12] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[11] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[10] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[9] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[8] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[7] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[6] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[5] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[4] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[3] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[2] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[1] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[0] = _zz_decode_SRC2_2;
  end

  assign _zz_decode_SRC2_4 = _zz__zz_decode_SRC2_4[11];
  always @(*) begin
    _zz_decode_SRC2_5[19] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[18] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[17] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[16] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[15] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[14] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[13] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[12] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[11] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[10] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[9] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[8] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[7] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[6] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[5] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[4] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[3] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[2] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[1] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[0] = _zz_decode_SRC2_4;
  end

  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_decode_SRC2_6 = _zz_decode_SRC2_1;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_decode_SRC2_6 = {_zz_decode_SRC2_3,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_decode_SRC2_6 = {_zz_decode_SRC2_5,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_decode_SRC2_6 = _zz_decode_SRC2;
      end
    endcase
  end

  always @(*) begin
    execute_SrcPlugin_addSub = _zz_execute_SrcPlugin_addSub;
    if(execute_SRC2_FORCE_ZERO) begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @(*) begin
    _zz_execute_FullBarrelShifterPlugin_reversed[0] = execute_SRC1[31];
    _zz_execute_FullBarrelShifterPlugin_reversed[1] = execute_SRC1[30];
    _zz_execute_FullBarrelShifterPlugin_reversed[2] = execute_SRC1[29];
    _zz_execute_FullBarrelShifterPlugin_reversed[3] = execute_SRC1[28];
    _zz_execute_FullBarrelShifterPlugin_reversed[4] = execute_SRC1[27];
    _zz_execute_FullBarrelShifterPlugin_reversed[5] = execute_SRC1[26];
    _zz_execute_FullBarrelShifterPlugin_reversed[6] = execute_SRC1[25];
    _zz_execute_FullBarrelShifterPlugin_reversed[7] = execute_SRC1[24];
    _zz_execute_FullBarrelShifterPlugin_reversed[8] = execute_SRC1[23];
    _zz_execute_FullBarrelShifterPlugin_reversed[9] = execute_SRC1[22];
    _zz_execute_FullBarrelShifterPlugin_reversed[10] = execute_SRC1[21];
    _zz_execute_FullBarrelShifterPlugin_reversed[11] = execute_SRC1[20];
    _zz_execute_FullBarrelShifterPlugin_reversed[12] = execute_SRC1[19];
    _zz_execute_FullBarrelShifterPlugin_reversed[13] = execute_SRC1[18];
    _zz_execute_FullBarrelShifterPlugin_reversed[14] = execute_SRC1[17];
    _zz_execute_FullBarrelShifterPlugin_reversed[15] = execute_SRC1[16];
    _zz_execute_FullBarrelShifterPlugin_reversed[16] = execute_SRC1[15];
    _zz_execute_FullBarrelShifterPlugin_reversed[17] = execute_SRC1[14];
    _zz_execute_FullBarrelShifterPlugin_reversed[18] = execute_SRC1[13];
    _zz_execute_FullBarrelShifterPlugin_reversed[19] = execute_SRC1[12];
    _zz_execute_FullBarrelShifterPlugin_reversed[20] = execute_SRC1[11];
    _zz_execute_FullBarrelShifterPlugin_reversed[21] = execute_SRC1[10];
    _zz_execute_FullBarrelShifterPlugin_reversed[22] = execute_SRC1[9];
    _zz_execute_FullBarrelShifterPlugin_reversed[23] = execute_SRC1[8];
    _zz_execute_FullBarrelShifterPlugin_reversed[24] = execute_SRC1[7];
    _zz_execute_FullBarrelShifterPlugin_reversed[25] = execute_SRC1[6];
    _zz_execute_FullBarrelShifterPlugin_reversed[26] = execute_SRC1[5];
    _zz_execute_FullBarrelShifterPlugin_reversed[27] = execute_SRC1[4];
    _zz_execute_FullBarrelShifterPlugin_reversed[28] = execute_SRC1[3];
    _zz_execute_FullBarrelShifterPlugin_reversed[29] = execute_SRC1[2];
    _zz_execute_FullBarrelShifterPlugin_reversed[30] = execute_SRC1[1];
    _zz_execute_FullBarrelShifterPlugin_reversed[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL) ? _zz_execute_FullBarrelShifterPlugin_reversed : execute_SRC1);
  always @(*) begin
    _zz_decode_RS2_3[0] = memory_SHIFT_RIGHT[31];
    _zz_decode_RS2_3[1] = memory_SHIFT_RIGHT[30];
    _zz_decode_RS2_3[2] = memory_SHIFT_RIGHT[29];
    _zz_decode_RS2_3[3] = memory_SHIFT_RIGHT[28];
    _zz_decode_RS2_3[4] = memory_SHIFT_RIGHT[27];
    _zz_decode_RS2_3[5] = memory_SHIFT_RIGHT[26];
    _zz_decode_RS2_3[6] = memory_SHIFT_RIGHT[25];
    _zz_decode_RS2_3[7] = memory_SHIFT_RIGHT[24];
    _zz_decode_RS2_3[8] = memory_SHIFT_RIGHT[23];
    _zz_decode_RS2_3[9] = memory_SHIFT_RIGHT[22];
    _zz_decode_RS2_3[10] = memory_SHIFT_RIGHT[21];
    _zz_decode_RS2_3[11] = memory_SHIFT_RIGHT[20];
    _zz_decode_RS2_3[12] = memory_SHIFT_RIGHT[19];
    _zz_decode_RS2_3[13] = memory_SHIFT_RIGHT[18];
    _zz_decode_RS2_3[14] = memory_SHIFT_RIGHT[17];
    _zz_decode_RS2_3[15] = memory_SHIFT_RIGHT[16];
    _zz_decode_RS2_3[16] = memory_SHIFT_RIGHT[15];
    _zz_decode_RS2_3[17] = memory_SHIFT_RIGHT[14];
    _zz_decode_RS2_3[18] = memory_SHIFT_RIGHT[13];
    _zz_decode_RS2_3[19] = memory_SHIFT_RIGHT[12];
    _zz_decode_RS2_3[20] = memory_SHIFT_RIGHT[11];
    _zz_decode_RS2_3[21] = memory_SHIFT_RIGHT[10];
    _zz_decode_RS2_3[22] = memory_SHIFT_RIGHT[9];
    _zz_decode_RS2_3[23] = memory_SHIFT_RIGHT[8];
    _zz_decode_RS2_3[24] = memory_SHIFT_RIGHT[7];
    _zz_decode_RS2_3[25] = memory_SHIFT_RIGHT[6];
    _zz_decode_RS2_3[26] = memory_SHIFT_RIGHT[5];
    _zz_decode_RS2_3[27] = memory_SHIFT_RIGHT[4];
    _zz_decode_RS2_3[28] = memory_SHIFT_RIGHT[3];
    _zz_decode_RS2_3[29] = memory_SHIFT_RIGHT[2];
    _zz_decode_RS2_3[30] = memory_SHIFT_RIGHT[1];
    _zz_decode_RS2_3[31] = memory_SHIFT_RIGHT[0];
  end

  always @(*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l48) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l48_1) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l48_2) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l105) begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @(*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l51) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l51_1) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l51_2) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l108) begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_decode_RS2_2;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l47 = 1'b1;
  assign when_HazardSimplePlugin_l48 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58 = (1'b0 || (! when_HazardSimplePlugin_l47));
  assign when_HazardSimplePlugin_l48_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_1 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign when_HazardSimplePlugin_l48_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_2 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign when_HazardSimplePlugin_l105 = (! decode_RS1_USE);
  assign when_HazardSimplePlugin_l108 = (! decode_RS2_USE);
  assign when_HazardSimplePlugin_l113 = (decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard));
  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  assign switch_MulPlugin_l87 = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(switch_MulPlugin_l87)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(switch_MulPlugin_l87)
      2'b01 : begin
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign writeBack_MulPlugin_result = ($signed(_zz_writeBack_MulPlugin_result) + $signed(_zz_writeBack_MulPlugin_result_1));
  assign when_MulPlugin_l147 = (writeBack_arbitration_isValid && writeBack_IS_MUL);
  assign switch_MulPlugin_l148 = writeBack_INSTRUCTION[13 : 12];
  assign memory_MulDivIterativePlugin_frontendOk = 1'b1;
  always @(*) begin
    memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b0;
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_MulDivIterativePlugin_div_counter_willClear = 1'b0;
    if(when_MulDivIterativePlugin_l162) begin
      memory_MulDivIterativePlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_div_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_div_counter_value == 6'h21);
  assign memory_MulDivIterativePlugin_div_counter_willOverflow = (memory_MulDivIterativePlugin_div_counter_willOverflowIfInc && memory_MulDivIterativePlugin_div_counter_willIncrement);
  always @(*) begin
    if(memory_MulDivIterativePlugin_div_counter_willOverflow) begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (memory_MulDivIterativePlugin_div_counter_value + _zz_memory_MulDivIterativePlugin_div_counter_valueNext);
    end
    if(memory_MulDivIterativePlugin_div_counter_willClear) begin
      memory_MulDivIterativePlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign when_MulDivIterativePlugin_l126 = (memory_MulDivIterativePlugin_div_counter_value == 6'h20);
  assign when_MulDivIterativePlugin_l126_1 = (! memory_arbitration_isStuck);
  assign when_MulDivIterativePlugin_l128 = (memory_arbitration_isValid && memory_IS_DIV);
  assign when_MulDivIterativePlugin_l129 = ((! memory_MulDivIterativePlugin_frontendOk) || (! memory_MulDivIterativePlugin_div_done));
  assign when_MulDivIterativePlugin_l132 = (memory_MulDivIterativePlugin_frontendOk && (! memory_MulDivIterativePlugin_div_done));
  assign _zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted = memory_MulDivIterativePlugin_rs1[31 : 0];
  assign memory_MulDivIterativePlugin_div_stage_0_remainderShifted = {memory_MulDivIterativePlugin_accumulator[31 : 0],_zz_memory_MulDivIterativePlugin_div_stage_0_remainderShifted[31]};
  assign memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator = (memory_MulDivIterativePlugin_div_stage_0_remainderShifted - _zz_memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator);
  assign memory_MulDivIterativePlugin_div_stage_0_outRemainder = ((! memory_MulDivIterativePlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder : _zz_memory_MulDivIterativePlugin_div_stage_0_outRemainder_1);
  assign memory_MulDivIterativePlugin_div_stage_0_outNumerator = _zz_memory_MulDivIterativePlugin_div_stage_0_outNumerator[31:0];
  assign when_MulDivIterativePlugin_l151 = (memory_MulDivIterativePlugin_div_counter_value == 6'h20);
  assign _zz_memory_MulDivIterativePlugin_div_result = (memory_INSTRUCTION[13] ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_rs1[31 : 0]);
  assign when_MulDivIterativePlugin_l162 = (! memory_arbitration_isStuck);
  assign _zz_memory_MulDivIterativePlugin_rs2 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_memory_MulDivIterativePlugin_rs1 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @(*) begin
    _zz_memory_MulDivIterativePlugin_rs1_1[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_memory_MulDivIterativePlugin_rs1_1[31 : 0] = execute_RS1;
  end

  always @(*) begin
    CsrPlugin_privilege = _zz_CsrPlugin_privilege;
    if(CsrPlugin_forceMachineWire) begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0;
  assign CsrPlugin_sip_SEIP_OR = (CsrPlugin_sip_SEIP_SOFT || CsrPlugin_sip_SEIP_INPUT);
  always @(*) begin
    CsrPlugin_redoInterface_valid = 1'b0;
    if(CsrPlugin_rescheduleLogic_rescheduleNext) begin
      CsrPlugin_redoInterface_valid = 1'b1;
    end
  end

  assign CsrPlugin_redoInterface_payload = decode_PC;
  always @(*) begin
    CsrPlugin_rescheduleLogic_rescheduleNext = 1'b0;
    if(when_CsrPlugin_l803) begin
      CsrPlugin_rescheduleLogic_rescheduleNext = 1'b1;
    end
    if(execute_CsrPlugin_csr_384) begin
      if(execute_CsrPlugin_writeInstruction) begin
        CsrPlugin_rescheduleLogic_rescheduleNext = 1'b1;
      end
    end
  end

  assign when_CsrPlugin_l803 = (execute_arbitration_isValid && execute_IS_SFENCE_VMA);
  assign _zz_when_CsrPlugin_l952 = (CsrPlugin_sip_STIP && CsrPlugin_sie_STIE);
  assign _zz_when_CsrPlugin_l952_1 = (CsrPlugin_sip_SSIP && CsrPlugin_sie_SSIE);
  assign _zz_when_CsrPlugin_l952_2 = (CsrPlugin_sip_SEIP_OR && CsrPlugin_sie_SEIE);
  assign _zz_when_CsrPlugin_l952_3 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_when_CsrPlugin_l952_4 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_when_CsrPlugin_l952_5 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
    case(CsrPlugin_exceptionPortCtrl_exceptionContext_code)
      4'b0000 : begin
        if(when_CsrPlugin_l866) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0001 : begin
        if(when_CsrPlugin_l866_1) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0010 : begin
        if(when_CsrPlugin_l866_2) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0100 : begin
        if(when_CsrPlugin_l866_3) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0101 : begin
        if(when_CsrPlugin_l866_4) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0110 : begin
        if(when_CsrPlugin_l866_5) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b0111 : begin
        if(when_CsrPlugin_l866_6) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1000 : begin
        if(when_CsrPlugin_l866_7) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1001 : begin
        if(when_CsrPlugin_l866_8) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1100 : begin
        if(when_CsrPlugin_l866_9) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1101 : begin
        if(when_CsrPlugin_l866_10) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      4'b1111 : begin
        if(when_CsrPlugin_l866_11) begin
          CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b01;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_CsrPlugin_l866 = ((1'b1 && CsrPlugin_medeleg_IAM) && (! 1'b0));
  assign when_CsrPlugin_l866_1 = ((1'b1 && CsrPlugin_medeleg_IAF) && (! 1'b0));
  assign when_CsrPlugin_l866_2 = ((1'b1 && CsrPlugin_medeleg_II) && (! 1'b0));
  assign when_CsrPlugin_l866_3 = ((1'b1 && CsrPlugin_medeleg_LAM) && (! 1'b0));
  assign when_CsrPlugin_l866_4 = ((1'b1 && CsrPlugin_medeleg_LAF) && (! 1'b0));
  assign when_CsrPlugin_l866_5 = ((1'b1 && CsrPlugin_medeleg_SAM) && (! 1'b0));
  assign when_CsrPlugin_l866_6 = ((1'b1 && CsrPlugin_medeleg_SAF) && (! 1'b0));
  assign when_CsrPlugin_l866_7 = ((1'b1 && CsrPlugin_medeleg_EU) && (! 1'b0));
  assign when_CsrPlugin_l866_8 = ((1'b1 && CsrPlugin_medeleg_ES) && (! 1'b0));
  assign when_CsrPlugin_l866_9 = ((1'b1 && CsrPlugin_medeleg_IPF) && (! 1'b0));
  assign when_CsrPlugin_l866_10 = ((1'b1 && CsrPlugin_medeleg_LPF) && (! 1'b0));
  assign when_CsrPlugin_l866_11 = ((1'b1 && CsrPlugin_medeleg_SPF) && (! 1'b0));
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1[0];
  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(CsrPlugin_selfException_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(BranchPlugin_branchExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(DBusCachedPlugin_exceptionBus_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b1;
    end
    if(writeBack_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign when_CsrPlugin_l909 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l909_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l909_2 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l909_3 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l922 = ({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != 4'b0000);
  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign when_CsrPlugin_l946 = ((CsrPlugin_sstatus_SIE && (CsrPlugin_privilege == 2'b01)) || (CsrPlugin_privilege < 2'b01));
  assign when_CsrPlugin_l946_1 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign when_CsrPlugin_l952 = ((_zz_when_CsrPlugin_l952 && (1'b1 && CsrPlugin_mideleg_ST)) && (! 1'b0));
  assign when_CsrPlugin_l952_1 = ((_zz_when_CsrPlugin_l952_1 && (1'b1 && CsrPlugin_mideleg_SS)) && (! 1'b0));
  assign when_CsrPlugin_l952_2 = ((_zz_when_CsrPlugin_l952_2 && (1'b1 && CsrPlugin_mideleg_SE)) && (! 1'b0));
  assign when_CsrPlugin_l952_3 = ((_zz_when_CsrPlugin_l952 && 1'b1) && (! (CsrPlugin_mideleg_ST != 1'b0)));
  assign when_CsrPlugin_l952_4 = ((_zz_when_CsrPlugin_l952_1 && 1'b1) && (! (CsrPlugin_mideleg_SS != 1'b0)));
  assign when_CsrPlugin_l952_5 = ((_zz_when_CsrPlugin_l952_2 && 1'b1) && (! (CsrPlugin_mideleg_SE != 1'b0)));
  assign when_CsrPlugin_l952_6 = ((_zz_when_CsrPlugin_l952_3 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l952_7 = ((_zz_when_CsrPlugin_l952_4 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l952_8 = ((_zz_when_CsrPlugin_l952_5 && 1'b1) && (! 1'b0));
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  assign when_CsrPlugin_l980 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l980_1 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l980_2 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l985 = ((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt);
  always @(*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(when_CsrPlugin_l991) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign when_CsrPlugin_l991 = ({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != 3'b000);
  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @(*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException) begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @(*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException) begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  always @(*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b01 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_stvec_mode;
      end
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b01 : begin
        CsrPlugin_xtvec_base = CsrPlugin_stvec_base;
      end
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign when_CsrPlugin_l1019 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign when_CsrPlugin_l1064 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign switch_CsrPlugin_l1068 = writeBack_INSTRUCTION[29 : 28];
  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign when_CsrPlugin_l1108 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_WFI));
  assign when_CsrPlugin_l1110 = (! execute_CsrPlugin_wfiWake);
  assign when_CsrPlugin_l1116 = ({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != 3'b000);
  assign execute_CsrPlugin_blockedBySideEffects = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) || 1'b0);
  always @(*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_3857) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3858) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3859) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3860) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_768) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773) begin
      if(execute_CSR_WRITE_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_833) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_832) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_835) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_770) begin
      if(execute_CSR_WRITE_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_771) begin
      if(execute_CSR_WRITE_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_256) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_324) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_260) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_261) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_321) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_320) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_322) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_323) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_384) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(CsrPlugin_csrMapping_allowCsrSignal) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(when_CsrPlugin_l1297) begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(when_CsrPlugin_l1302) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if(when_CsrPlugin_l1136) begin
      if(when_CsrPlugin_l1137) begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @(*) begin
    CsrPlugin_selfException_valid = 1'b0;
    if(when_CsrPlugin_l1129) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(when_CsrPlugin_l1144) begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_selfException_payload_code = 4'bxxxx;
    if(when_CsrPlugin_l1129) begin
      CsrPlugin_selfException_payload_code = 4'b0010;
    end
    if(when_CsrPlugin_l1144) begin
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = 4'b1000;
        end
        2'b01 : begin
          CsrPlugin_selfException_payload_code = 4'b1001;
        end
        default : begin
          CsrPlugin_selfException_payload_code = 4'b1011;
        end
      endcase
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  assign when_CsrPlugin_l1129 = (execute_CsrPlugin_illegalAccess || execute_CsrPlugin_illegalInstruction);
  assign when_CsrPlugin_l1136 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign when_CsrPlugin_l1137 = (CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]);
  assign when_CsrPlugin_l1144 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL));
  always @(*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(when_CsrPlugin_l1297) begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(when_CsrPlugin_l1297) begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign CsrPlugin_csrMapping_hazardFree = (! execute_CsrPlugin_blockedBySideEffects);
  always @(*) begin
    execute_CsrPlugin_readToWriteData = CsrPlugin_csrMapping_readDataSignal;
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_readToWriteData[9 : 9] = CsrPlugin_sip_SEIP_SOFT;
    end
    if(execute_CsrPlugin_csr_324) begin
      execute_CsrPlugin_readToWriteData[9 : 9] = CsrPlugin_sip_SEIP_SOFT;
    end
  end

  assign switch_Misc_l199_1 = execute_INSTRUCTION[13];
  always @(*) begin
    case(switch_Misc_l199_1)
      1'b0 : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = execute_SRC1;
      end
      default : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign CsrPlugin_csrMapping_writeDataSignal = _zz_CsrPlugin_csrMapping_writeDataSignal;
  assign when_CsrPlugin_l1176 = (execute_arbitration_isValid && execute_IS_CSR);
  assign when_CsrPlugin_l1180 = (execute_arbitration_isValid && (execute_IS_CSR || execute_IS_SFENCE_VMA));
  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign when_DebugPlugin_l225 = (DebugPlugin_haltIt && (! DebugPlugin_isPipBusy));
  assign DebugPlugin_allowEBreak = (DebugPlugin_debugUsed && (! DebugPlugin_disableEbreak));
  always @(*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l256)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            debug_bus_cmd_ready = IBusCachedPlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if(when_DebugPlugin_l244) begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign when_DebugPlugin_l244 = (! _zz_when_DebugPlugin_l244);
  always @(*) begin
    IBusCachedPlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l256)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            IBusCachedPlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusCachedPlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign switch_DebugPlugin_l256 = debug_bus_cmd_payload_address[7 : 2];
  assign when_DebugPlugin_l260 = debug_bus_cmd_payload_data[16];
  assign when_DebugPlugin_l260_1 = debug_bus_cmd_payload_data[24];
  assign when_DebugPlugin_l261 = debug_bus_cmd_payload_data[17];
  assign when_DebugPlugin_l261_1 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l262 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l263 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l264 = debug_bus_cmd_payload_data[18];
  assign when_DebugPlugin_l264_1 = debug_bus_cmd_payload_data[26];
  assign when_DebugPlugin_l284 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign when_DebugPlugin_l287 = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) == 1'b0);
  assign when_DebugPlugin_l300 = (DebugPlugin_stepIt && IBusCachedPlugin_incomingInstruction);
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign when_DebugPlugin_l316 = (DebugPlugin_haltIt || DebugPlugin_stepIt);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign switch_Misc_l199_2 = execute_INSTRUCTION[14 : 12];
  always @(*) begin
    casez(switch_Misc_l199_2)
      3'b000 : begin
        _zz_execute_BRANCH_COND_RESULT = execute_BranchPlugin_eq;
      end
      3'b001 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_BranchPlugin_eq);
      end
      3'b1?1 : begin
        _zz_execute_BRANCH_COND_RESULT = (! execute_SRC_LESS);
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT = execute_SRC_LESS;
      end
    endcase
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_execute_BRANCH_COND_RESULT_1 = 1'b1;
      end
      default : begin
        _zz_execute_BRANCH_COND_RESULT_1 = _zz_execute_BRANCH_COND_RESULT;
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_1[19] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[18] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[17] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[16] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[15] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[14] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[13] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[12] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[11] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[10] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[9] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[8] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[7] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[6] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[5] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[4] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[3] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[2] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[1] = _zz_execute_BranchPlugin_missAlignedTarget;
    _zz_execute_BranchPlugin_missAlignedTarget_1[0] = _zz_execute_BranchPlugin_missAlignedTarget;
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget_2 = _zz__zz_execute_BranchPlugin_missAlignedTarget_2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_3[10] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[9] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[8] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[7] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[6] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[5] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[4] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[3] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[2] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[1] = _zz_execute_BranchPlugin_missAlignedTarget_2;
    _zz_execute_BranchPlugin_missAlignedTarget_3[0] = _zz_execute_BranchPlugin_missAlignedTarget_2;
  end

  assign _zz_execute_BranchPlugin_missAlignedTarget_4 = _zz__zz_execute_BranchPlugin_missAlignedTarget_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_missAlignedTarget_5[18] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[17] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[16] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[15] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[14] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[13] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[12] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[11] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[10] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[9] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[8] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[7] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[6] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[5] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[4] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[3] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[2] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[1] = _zz_execute_BranchPlugin_missAlignedTarget_4;
    _zz_execute_BranchPlugin_missAlignedTarget_5[0] = _zz_execute_BranchPlugin_missAlignedTarget_4;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = (_zz__zz_execute_BranchPlugin_missAlignedTarget_6[1] ^ execute_RS1[1]);
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = _zz__zz_execute_BranchPlugin_missAlignedTarget_6_1[1];
      end
      default : begin
        _zz_execute_BranchPlugin_missAlignedTarget_6 = _zz__zz_execute_BranchPlugin_missAlignedTarget_6_2[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_execute_BranchPlugin_missAlignedTarget_6);
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_1[19] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[18] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[17] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[16] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[15] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[14] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[13] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[12] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[11] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[10] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[9] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[8] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[7] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[6] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[5] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[4] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[3] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[2] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[1] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[0] = _zz_execute_BranchPlugin_branch_src2;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_execute_BranchPlugin_branch_src2_1,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_execute_BranchPlugin_branch_src2_3,{{{_zz_execute_BranchPlugin_branch_src2_6,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_execute_BranchPlugin_branch_src2_5,{{{_zz_execute_BranchPlugin_branch_src2_7,_zz_execute_BranchPlugin_branch_src2_8},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2) begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_execute_BranchPlugin_branch_src2_9};
        end
      end
    endcase
  end

  assign _zz_execute_BranchPlugin_branch_src2_2 = _zz__zz_execute_BranchPlugin_branch_src2_2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_3[10] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[9] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[8] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[7] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[6] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[5] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[4] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[3] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[2] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[1] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[0] = _zz_execute_BranchPlugin_branch_src2_2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_4 = _zz__zz_execute_BranchPlugin_branch_src2_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_5[18] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[17] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[16] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[15] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[14] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[13] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[12] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[11] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[10] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[9] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[8] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[7] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[6] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[5] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[4] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[3] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[2] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[1] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[0] = _zz_execute_BranchPlugin_branch_src2_4;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign BranchPlugin_branchExceptionPort_valid = (memory_arbitration_isValid && (memory_BRANCH_DO && memory_BRANCH_CALC[1]));
  assign BranchPlugin_branchExceptionPort_payload_code = 4'b0000;
  assign BranchPlugin_branchExceptionPort_payload_badAddr = memory_BRANCH_CALC;
  assign IBusCachedPlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  assign MmuPlugin_ports_0_dirty = 1'b0;
  always @(*) begin
    MmuPlugin_ports_0_requireMmuLockupCalc = ((1'b1 && (! IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation)) && MmuPlugin_satp_mode);
    if(when_MmuPlugin_l125) begin
      MmuPlugin_ports_0_requireMmuLockupCalc = 1'b0;
    end
    if(when_MmuPlugin_l126) begin
      MmuPlugin_ports_0_requireMmuLockupCalc = 1'b0;
    end
  end

  assign when_MmuPlugin_l125 = ((! MmuPlugin_status_mprv) && (CsrPlugin_privilege == 2'b11));
  assign when_MmuPlugin_l126 = (CsrPlugin_privilege == 2'b11);
  assign MmuPlugin_ports_0_cacheHitsCalc = {((MmuPlugin_ports_0_cache_3_valid && (MmuPlugin_ports_0_cache_3_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_3_superPage || (MmuPlugin_ports_0_cache_3_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12]))),{((MmuPlugin_ports_0_cache_2_valid && (MmuPlugin_ports_0_cache_2_virtualAddress_1 == _zz_MmuPlugin_ports_0_cacheHitsCalc)) && (MmuPlugin_ports_0_cache_2_superPage || (MmuPlugin_ports_0_cache_2_virtualAddress_0 == _zz_MmuPlugin_ports_0_cacheHitsCalc_1))),{((MmuPlugin_ports_0_cache_1_valid && _zz_MmuPlugin_ports_0_cacheHitsCalc_2) && (MmuPlugin_ports_0_cache_1_superPage || _zz_MmuPlugin_ports_0_cacheHitsCalc_3)),((MmuPlugin_ports_0_cache_0_valid && _zz_MmuPlugin_ports_0_cacheHitsCalc_4) && (MmuPlugin_ports_0_cache_0_superPage || _zz_MmuPlugin_ports_0_cacheHitsCalc_5))}}};
  assign MmuPlugin_ports_0_cacheHit = (MmuPlugin_ports_0_cacheHitsCalc != 4'b0000);
  assign _zz_MmuPlugin_ports_0_cacheLine_valid = MmuPlugin_ports_0_cacheHitsCalc[3];
  assign _zz_MmuPlugin_ports_0_cacheLine_valid_1 = (MmuPlugin_ports_0_cacheHitsCalc[1] || _zz_MmuPlugin_ports_0_cacheLine_valid);
  assign _zz_MmuPlugin_ports_0_cacheLine_valid_2 = (MmuPlugin_ports_0_cacheHitsCalc[2] || _zz_MmuPlugin_ports_0_cacheLine_valid);
  assign _zz_MmuPlugin_ports_0_cacheLine_valid_3 = {_zz_MmuPlugin_ports_0_cacheLine_valid_2,_zz_MmuPlugin_ports_0_cacheLine_valid_1};
  assign MmuPlugin_ports_0_cacheLine_valid = _zz_MmuPlugin_ports_0_cacheLine_valid_4;
  assign MmuPlugin_ports_0_cacheLine_exception = _zz_MmuPlugin_ports_0_cacheLine_exception;
  assign MmuPlugin_ports_0_cacheLine_superPage = _zz_MmuPlugin_ports_0_cacheLine_superPage;
  assign MmuPlugin_ports_0_cacheLine_virtualAddress_0 = _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_0;
  assign MmuPlugin_ports_0_cacheLine_virtualAddress_1 = _zz_MmuPlugin_ports_0_cacheLine_virtualAddress_1;
  assign MmuPlugin_ports_0_cacheLine_physicalAddress_0 = _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_0;
  assign MmuPlugin_ports_0_cacheLine_physicalAddress_1 = _zz_MmuPlugin_ports_0_cacheLine_physicalAddress_1;
  assign MmuPlugin_ports_0_cacheLine_allowRead = _zz_MmuPlugin_ports_0_cacheLine_allowRead;
  assign MmuPlugin_ports_0_cacheLine_allowWrite = _zz_MmuPlugin_ports_0_cacheLine_allowWrite;
  assign MmuPlugin_ports_0_cacheLine_allowExecute = _zz_MmuPlugin_ports_0_cacheLine_allowExecute;
  assign MmuPlugin_ports_0_cacheLine_allowUser = _zz_MmuPlugin_ports_0_cacheLine_allowUser;
  always @(*) begin
    MmuPlugin_ports_0_entryToReplace_willIncrement = 1'b0;
    if(when_MmuPlugin_l272) begin
      if(when_MmuPlugin_l274) begin
        MmuPlugin_ports_0_entryToReplace_willIncrement = 1'b1;
      end
    end
  end

  assign MmuPlugin_ports_0_entryToReplace_willClear = 1'b0;
  assign MmuPlugin_ports_0_entryToReplace_willOverflowIfInc = (MmuPlugin_ports_0_entryToReplace_value == 2'b11);
  assign MmuPlugin_ports_0_entryToReplace_willOverflow = (MmuPlugin_ports_0_entryToReplace_willOverflowIfInc && MmuPlugin_ports_0_entryToReplace_willIncrement);
  always @(*) begin
    MmuPlugin_ports_0_entryToReplace_valueNext = (MmuPlugin_ports_0_entryToReplace_value + _zz_MmuPlugin_ports_0_entryToReplace_valueNext);
    if(MmuPlugin_ports_0_entryToReplace_willClear) begin
      MmuPlugin_ports_0_entryToReplace_valueNext = 2'b00;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc) begin
      IBusCachedPlugin_mmuBus_rsp_physicalAddress = {{MmuPlugin_ports_0_cacheLine_physicalAddress_1,(MmuPlugin_ports_0_cacheLine_superPage ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_0_cacheLine_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
    end else begin
      IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc) begin
      IBusCachedPlugin_mmuBus_rsp_allowRead = (MmuPlugin_ports_0_cacheLine_allowRead || (MmuPlugin_status_mxr && MmuPlugin_ports_0_cacheLine_allowExecute));
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc) begin
      IBusCachedPlugin_mmuBus_rsp_allowWrite = MmuPlugin_ports_0_cacheLine_allowWrite;
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc) begin
      IBusCachedPlugin_mmuBus_rsp_allowExecute = MmuPlugin_ports_0_cacheLine_allowExecute;
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc) begin
      IBusCachedPlugin_mmuBus_rsp_exception = (((! MmuPlugin_ports_0_dirty) && MmuPlugin_ports_0_cacheHit) && ((MmuPlugin_ports_0_cacheLine_exception || ((MmuPlugin_ports_0_cacheLine_allowUser && (CsrPlugin_privilege == 2'b01)) && (! MmuPlugin_status_sum))) || ((! MmuPlugin_ports_0_cacheLine_allowUser) && (CsrPlugin_privilege == 2'b00))));
    end else begin
      IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc) begin
      IBusCachedPlugin_mmuBus_rsp_refilling = (MmuPlugin_ports_0_dirty || (! MmuPlugin_ports_0_cacheHit));
    end else begin
      IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc) begin
      IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b1;
    end else begin
      IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
    end
  end

  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = (((IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1011) || (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1110)) || (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1111));
  assign IBusCachedPlugin_mmuBus_rsp_bypassTranslation = (! MmuPlugin_ports_0_requireMmuLockupCalc);
  assign IBusCachedPlugin_mmuBus_rsp_ways_0_sel = MmuPlugin_ports_0_cacheHitsCalc[0];
  assign IBusCachedPlugin_mmuBus_rsp_ways_0_physical = {{MmuPlugin_ports_0_cache_0_physicalAddress_1,(MmuPlugin_ports_0_cache_0_superPage ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_0_cache_0_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign IBusCachedPlugin_mmuBus_rsp_ways_1_sel = MmuPlugin_ports_0_cacheHitsCalc[1];
  assign IBusCachedPlugin_mmuBus_rsp_ways_1_physical = {{MmuPlugin_ports_0_cache_1_physicalAddress_1,(MmuPlugin_ports_0_cache_1_superPage ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_0_cache_1_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign IBusCachedPlugin_mmuBus_rsp_ways_2_sel = MmuPlugin_ports_0_cacheHitsCalc[2];
  assign IBusCachedPlugin_mmuBus_rsp_ways_2_physical = {{MmuPlugin_ports_0_cache_2_physicalAddress_1,(MmuPlugin_ports_0_cache_2_superPage ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_0_cache_2_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign IBusCachedPlugin_mmuBus_rsp_ways_3_sel = MmuPlugin_ports_0_cacheHitsCalc[3];
  assign IBusCachedPlugin_mmuBus_rsp_ways_3_physical = {{MmuPlugin_ports_0_cache_3_physicalAddress_1,(MmuPlugin_ports_0_cache_3_superPage ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_0_cache_3_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign MmuPlugin_ports_1_dirty = 1'b0;
  always @(*) begin
    MmuPlugin_ports_1_requireMmuLockupCalc = ((1'b1 && (! DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation)) && MmuPlugin_satp_mode);
    if(when_MmuPlugin_l125_1) begin
      MmuPlugin_ports_1_requireMmuLockupCalc = 1'b0;
    end
    if(when_MmuPlugin_l126_1) begin
      if(when_MmuPlugin_l128) begin
        MmuPlugin_ports_1_requireMmuLockupCalc = 1'b0;
      end
    end
  end

  assign when_MmuPlugin_l125_1 = ((! MmuPlugin_status_mprv) && (CsrPlugin_privilege == 2'b11));
  assign when_MmuPlugin_l126_1 = (CsrPlugin_privilege == 2'b11);
  assign when_MmuPlugin_l128 = ((! MmuPlugin_status_mprv) || (CsrPlugin_mstatus_MPP == 2'b11));
  assign MmuPlugin_ports_1_cacheHitsCalc = {((MmuPlugin_ports_1_cache_3_valid && (MmuPlugin_ports_1_cache_3_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_3_superPage || (MmuPlugin_ports_1_cache_3_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12]))),{((MmuPlugin_ports_1_cache_2_valid && (MmuPlugin_ports_1_cache_2_virtualAddress_1 == _zz_MmuPlugin_ports_1_cacheHitsCalc)) && (MmuPlugin_ports_1_cache_2_superPage || (MmuPlugin_ports_1_cache_2_virtualAddress_0 == _zz_MmuPlugin_ports_1_cacheHitsCalc_1))),{((MmuPlugin_ports_1_cache_1_valid && _zz_MmuPlugin_ports_1_cacheHitsCalc_2) && (MmuPlugin_ports_1_cache_1_superPage || _zz_MmuPlugin_ports_1_cacheHitsCalc_3)),((MmuPlugin_ports_1_cache_0_valid && _zz_MmuPlugin_ports_1_cacheHitsCalc_4) && (MmuPlugin_ports_1_cache_0_superPage || _zz_MmuPlugin_ports_1_cacheHitsCalc_5))}}};
  assign MmuPlugin_ports_1_cacheHit = (MmuPlugin_ports_1_cacheHitsCalc != 4'b0000);
  assign _zz_MmuPlugin_ports_1_cacheLine_valid = MmuPlugin_ports_1_cacheHitsCalc[3];
  assign _zz_MmuPlugin_ports_1_cacheLine_valid_1 = (MmuPlugin_ports_1_cacheHitsCalc[1] || _zz_MmuPlugin_ports_1_cacheLine_valid);
  assign _zz_MmuPlugin_ports_1_cacheLine_valid_2 = (MmuPlugin_ports_1_cacheHitsCalc[2] || _zz_MmuPlugin_ports_1_cacheLine_valid);
  assign _zz_MmuPlugin_ports_1_cacheLine_valid_3 = {_zz_MmuPlugin_ports_1_cacheLine_valid_2,_zz_MmuPlugin_ports_1_cacheLine_valid_1};
  assign MmuPlugin_ports_1_cacheLine_valid = _zz_MmuPlugin_ports_1_cacheLine_valid_4;
  assign MmuPlugin_ports_1_cacheLine_exception = _zz_MmuPlugin_ports_1_cacheLine_exception;
  assign MmuPlugin_ports_1_cacheLine_superPage = _zz_MmuPlugin_ports_1_cacheLine_superPage;
  assign MmuPlugin_ports_1_cacheLine_virtualAddress_0 = _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_0;
  assign MmuPlugin_ports_1_cacheLine_virtualAddress_1 = _zz_MmuPlugin_ports_1_cacheLine_virtualAddress_1;
  assign MmuPlugin_ports_1_cacheLine_physicalAddress_0 = _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_0;
  assign MmuPlugin_ports_1_cacheLine_physicalAddress_1 = _zz_MmuPlugin_ports_1_cacheLine_physicalAddress_1;
  assign MmuPlugin_ports_1_cacheLine_allowRead = _zz_MmuPlugin_ports_1_cacheLine_allowRead;
  assign MmuPlugin_ports_1_cacheLine_allowWrite = _zz_MmuPlugin_ports_1_cacheLine_allowWrite;
  assign MmuPlugin_ports_1_cacheLine_allowExecute = _zz_MmuPlugin_ports_1_cacheLine_allowExecute;
  assign MmuPlugin_ports_1_cacheLine_allowUser = _zz_MmuPlugin_ports_1_cacheLine_allowUser;
  always @(*) begin
    MmuPlugin_ports_1_entryToReplace_willIncrement = 1'b0;
    if(when_MmuPlugin_l272) begin
      if(when_MmuPlugin_l274_1) begin
        MmuPlugin_ports_1_entryToReplace_willIncrement = 1'b1;
      end
    end
  end

  assign MmuPlugin_ports_1_entryToReplace_willClear = 1'b0;
  assign MmuPlugin_ports_1_entryToReplace_willOverflowIfInc = (MmuPlugin_ports_1_entryToReplace_value == 2'b11);
  assign MmuPlugin_ports_1_entryToReplace_willOverflow = (MmuPlugin_ports_1_entryToReplace_willOverflowIfInc && MmuPlugin_ports_1_entryToReplace_willIncrement);
  always @(*) begin
    MmuPlugin_ports_1_entryToReplace_valueNext = (MmuPlugin_ports_1_entryToReplace_value + _zz_MmuPlugin_ports_1_entryToReplace_valueNext);
    if(MmuPlugin_ports_1_entryToReplace_willClear) begin
      MmuPlugin_ports_1_entryToReplace_valueNext = 2'b00;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc) begin
      DBusCachedPlugin_mmuBus_rsp_physicalAddress = {{MmuPlugin_ports_1_cacheLine_physicalAddress_1,(MmuPlugin_ports_1_cacheLine_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cacheLine_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
    end else begin
      DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc) begin
      DBusCachedPlugin_mmuBus_rsp_allowRead = (MmuPlugin_ports_1_cacheLine_allowRead || (MmuPlugin_status_mxr && MmuPlugin_ports_1_cacheLine_allowExecute));
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc) begin
      DBusCachedPlugin_mmuBus_rsp_allowWrite = MmuPlugin_ports_1_cacheLine_allowWrite;
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc) begin
      DBusCachedPlugin_mmuBus_rsp_allowExecute = MmuPlugin_ports_1_cacheLine_allowExecute;
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc) begin
      DBusCachedPlugin_mmuBus_rsp_exception = (((! MmuPlugin_ports_1_dirty) && MmuPlugin_ports_1_cacheHit) && ((MmuPlugin_ports_1_cacheLine_exception || ((MmuPlugin_ports_1_cacheLine_allowUser && (CsrPlugin_privilege == 2'b01)) && (! MmuPlugin_status_sum))) || ((! MmuPlugin_ports_1_cacheLine_allowUser) && (CsrPlugin_privilege == 2'b00))));
    end else begin
      DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc) begin
      DBusCachedPlugin_mmuBus_rsp_refilling = (MmuPlugin_ports_1_dirty || (! MmuPlugin_ports_1_cacheHit));
    end else begin
      DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
    end
  end

  always @(*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc) begin
      DBusCachedPlugin_mmuBus_rsp_isPaging = 1'b1;
    end else begin
      DBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
    end
  end

  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = (((DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1011) || (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1110)) || (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1111));
  assign DBusCachedPlugin_mmuBus_rsp_bypassTranslation = (! MmuPlugin_ports_1_requireMmuLockupCalc);
  assign DBusCachedPlugin_mmuBus_rsp_ways_0_sel = MmuPlugin_ports_1_cacheHitsCalc[0];
  assign DBusCachedPlugin_mmuBus_rsp_ways_0_physical = {{MmuPlugin_ports_1_cache_0_physicalAddress_1,(MmuPlugin_ports_1_cache_0_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_0_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_1_sel = MmuPlugin_ports_1_cacheHitsCalc[1];
  assign DBusCachedPlugin_mmuBus_rsp_ways_1_physical = {{MmuPlugin_ports_1_cache_1_physicalAddress_1,(MmuPlugin_ports_1_cache_1_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_1_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_2_sel = MmuPlugin_ports_1_cacheHitsCalc[2];
  assign DBusCachedPlugin_mmuBus_rsp_ways_2_physical = {{MmuPlugin_ports_1_cache_2_physicalAddress_1,(MmuPlugin_ports_1_cache_2_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_2_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_3_sel = MmuPlugin_ports_1_cacheHitsCalc[3];
  assign DBusCachedPlugin_mmuBus_rsp_ways_3_physical = {{MmuPlugin_ports_1_cache_3_physicalAddress_1,(MmuPlugin_ports_1_cache_3_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_3_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign MmuPlugin_shared_dBusRsp_pte_V = MmuPlugin_shared_dBusRspStaged_payload_data[0];
  assign MmuPlugin_shared_dBusRsp_pte_R = MmuPlugin_shared_dBusRspStaged_payload_data[1];
  assign MmuPlugin_shared_dBusRsp_pte_W = MmuPlugin_shared_dBusRspStaged_payload_data[2];
  assign MmuPlugin_shared_dBusRsp_pte_X = MmuPlugin_shared_dBusRspStaged_payload_data[3];
  assign MmuPlugin_shared_dBusRsp_pte_U = MmuPlugin_shared_dBusRspStaged_payload_data[4];
  assign MmuPlugin_shared_dBusRsp_pte_G = MmuPlugin_shared_dBusRspStaged_payload_data[5];
  assign MmuPlugin_shared_dBusRsp_pte_A = MmuPlugin_shared_dBusRspStaged_payload_data[6];
  assign MmuPlugin_shared_dBusRsp_pte_D = MmuPlugin_shared_dBusRspStaged_payload_data[7];
  assign MmuPlugin_shared_dBusRsp_pte_RSW = MmuPlugin_shared_dBusRspStaged_payload_data[9 : 8];
  assign MmuPlugin_shared_dBusRsp_pte_PPN0 = MmuPlugin_shared_dBusRspStaged_payload_data[19 : 10];
  assign MmuPlugin_shared_dBusRsp_pte_PPN1 = MmuPlugin_shared_dBusRspStaged_payload_data[31 : 20];
  assign MmuPlugin_shared_dBusRsp_exception = (((! MmuPlugin_shared_dBusRsp_pte_V) || ((! MmuPlugin_shared_dBusRsp_pte_R) && MmuPlugin_shared_dBusRsp_pte_W)) || MmuPlugin_shared_dBusRspStaged_payload_error);
  assign MmuPlugin_shared_dBusRsp_leaf = (MmuPlugin_shared_dBusRsp_pte_R || MmuPlugin_shared_dBusRsp_pte_X);
  assign when_MmuPlugin_l205 = (MmuPlugin_shared_dBusRspStaged_valid && (! MmuPlugin_shared_dBusRspStaged_payload_redo));
  always @(*) begin
    MmuPlugin_dBusAccess_cmd_valid = 1'b0;
    case(MmuPlugin_shared_state_1)
      `MmuPlugin_shared_State_defaultEncoding_IDLE : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_CMD : begin
        MmuPlugin_dBusAccess_cmd_valid = 1'b1;
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_RSP : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L0_CMD : begin
        MmuPlugin_dBusAccess_cmd_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign MmuPlugin_dBusAccess_cmd_payload_write = 1'b0;
  assign MmuPlugin_dBusAccess_cmd_payload_size = 2'b10;
  always @(*) begin
    MmuPlugin_dBusAccess_cmd_payload_address = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(MmuPlugin_shared_state_1)
      `MmuPlugin_shared_State_defaultEncoding_IDLE : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_CMD : begin
        MmuPlugin_dBusAccess_cmd_payload_address = {{MmuPlugin_satp_ppn,MmuPlugin_shared_vpn_1},2'b00};
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_RSP : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L0_CMD : begin
        MmuPlugin_dBusAccess_cmd_payload_address = {{{MmuPlugin_shared_pteBuffer_PPN1[9 : 0],MmuPlugin_shared_pteBuffer_PPN0},MmuPlugin_shared_vpn_0},2'b00};
      end
      default : begin
      end
    endcase
  end

  assign MmuPlugin_dBusAccess_cmd_payload_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  assign MmuPlugin_dBusAccess_cmd_payload_writeMask = 4'bxxxx;
  assign _zz_MmuPlugin_shared_refills = {(((DBusCachedPlugin_mmuBus_cmd_0_isValid && MmuPlugin_ports_1_requireMmuLockupCalc) && (! MmuPlugin_ports_1_dirty)) && (! MmuPlugin_ports_1_cacheHit)),(((IBusCachedPlugin_mmuBus_cmd_0_isValid && MmuPlugin_ports_0_requireMmuLockupCalc) && (! MmuPlugin_ports_0_dirty)) && (! MmuPlugin_ports_0_cacheHit))};
  always @(*) begin
    _zz_MmuPlugin_shared_refills_1[0] = _zz_MmuPlugin_shared_refills[1];
    _zz_MmuPlugin_shared_refills_1[1] = _zz_MmuPlugin_shared_refills[0];
  end

  assign _zz_MmuPlugin_shared_refills_2 = (_zz_MmuPlugin_shared_refills_1 & (~ _zz__zz_MmuPlugin_shared_refills_2));
  always @(*) begin
    _zz_MmuPlugin_shared_refills_3[0] = _zz_MmuPlugin_shared_refills_2[1];
    _zz_MmuPlugin_shared_refills_3[1] = _zz_MmuPlugin_shared_refills_2[0];
  end

  assign MmuPlugin_shared_refills = _zz_MmuPlugin_shared_refills_3;
  assign when_MmuPlugin_l217 = (MmuPlugin_shared_refills != 2'b00);
  assign _zz_MmuPlugin_shared_vpn_0 = (MmuPlugin_shared_refills[0] ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress : DBusCachedPlugin_mmuBus_cmd_0_virtualAddress);
  assign when_MmuPlugin_l243 = (MmuPlugin_shared_dBusRsp_leaf || MmuPlugin_shared_dBusRsp_exception);
  assign IBusCachedPlugin_mmuBus_busy = ((MmuPlugin_shared_state_1 != `MmuPlugin_shared_State_defaultEncoding_IDLE) && MmuPlugin_shared_portSortedOh[0]);
  assign DBusCachedPlugin_mmuBus_busy = ((MmuPlugin_shared_state_1 != `MmuPlugin_shared_State_defaultEncoding_IDLE) && MmuPlugin_shared_portSortedOh[1]);
  assign when_MmuPlugin_l272 = ((MmuPlugin_shared_dBusRspStaged_valid && (! MmuPlugin_shared_dBusRspStaged_payload_redo)) && (MmuPlugin_shared_dBusRsp_leaf || MmuPlugin_shared_dBusRsp_exception));
  assign when_MmuPlugin_l274 = MmuPlugin_shared_portSortedOh[0];
  assign when_MmuPlugin_l280 = (MmuPlugin_ports_0_entryToReplace_value == 2'b00);
  assign when_MmuPlugin_l280_1 = (MmuPlugin_ports_0_entryToReplace_value == 2'b01);
  assign when_MmuPlugin_l280_2 = (MmuPlugin_ports_0_entryToReplace_value == 2'b10);
  assign when_MmuPlugin_l280_3 = (MmuPlugin_ports_0_entryToReplace_value == 2'b11);
  assign when_MmuPlugin_l274_1 = MmuPlugin_shared_portSortedOh[1];
  assign when_MmuPlugin_l280_4 = (MmuPlugin_ports_1_entryToReplace_value == 2'b00);
  assign when_MmuPlugin_l280_5 = (MmuPlugin_ports_1_entryToReplace_value == 2'b01);
  assign when_MmuPlugin_l280_6 = (MmuPlugin_ports_1_entryToReplace_value == 2'b10);
  assign when_MmuPlugin_l280_7 = (MmuPlugin_ports_1_entryToReplace_value == 2'b11);
  assign when_MmuPlugin_l304 = ((execute_arbitration_isValid && execute_arbitration_isFiring) && execute_IS_SFENCE_VMA2);
  assign when_Pipeline_l124 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_2 = ((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack));
  assign when_Pipeline_l124_3 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_4 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_5 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_6 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_7 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_8 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_9 = (! execute_arbitration_isStuck);
  assign _zz_decode_SRC1_CTRL = _zz_decode_SRC1_CTRL_1;
  assign when_Pipeline_l124_10 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_11 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_12 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_13 = (! writeBack_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_CTRL_1 = decode_ALU_CTRL;
  assign _zz_decode_ALU_CTRL = _zz_decode_ALU_CTRL_1;
  assign when_Pipeline_l124_14 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_CTRL = decode_to_execute_ALU_CTRL;
  assign _zz_decode_SRC2_CTRL = _zz_decode_SRC2_CTRL_1;
  assign when_Pipeline_l124_15 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_16 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_17 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_18 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_19 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_20 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_21 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_22 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_23 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_24 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_25 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_26 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_27 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_28 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_29 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL_1 = decode_ALU_BITWISE_CTRL;
  assign _zz_decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL_1;
  assign when_Pipeline_l124_30 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_BITWISE_CTRL = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL_1 = decode_SHIFT_CTRL;
  assign _zz_execute_to_memory_SHIFT_CTRL_1 = execute_SHIFT_CTRL;
  assign _zz_decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL_1;
  assign when_Pipeline_l124_31 = (! execute_arbitration_isStuck);
  assign _zz_execute_SHIFT_CTRL = decode_to_execute_SHIFT_CTRL;
  assign when_Pipeline_l124_32 = (! memory_arbitration_isStuck);
  assign _zz_memory_SHIFT_CTRL = execute_to_memory_SHIFT_CTRL;
  assign when_Pipeline_l124_33 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_34 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_35 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_36 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_37 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_38 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_39 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_40 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ENV_CTRL_1 = decode_ENV_CTRL;
  assign _zz_execute_to_memory_ENV_CTRL_1 = execute_ENV_CTRL;
  assign _zz_memory_to_writeBack_ENV_CTRL_1 = memory_ENV_CTRL;
  assign _zz_decode_ENV_CTRL = _zz_decode_ENV_CTRL_1;
  assign when_Pipeline_l124_41 = (! execute_arbitration_isStuck);
  assign _zz_execute_ENV_CTRL = decode_to_execute_ENV_CTRL;
  assign when_Pipeline_l124_42 = (! memory_arbitration_isStuck);
  assign _zz_memory_ENV_CTRL = execute_to_memory_ENV_CTRL;
  assign when_Pipeline_l124_43 = (! writeBack_arbitration_isStuck);
  assign _zz_writeBack_ENV_CTRL = memory_to_writeBack_ENV_CTRL;
  assign when_Pipeline_l124_44 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_45 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_BRANCH_CTRL_1 = decode_BRANCH_CTRL;
  assign _zz_decode_BRANCH_CTRL_1 = _zz_decode_BRANCH_CTRL;
  assign when_Pipeline_l124_46 = (! execute_arbitration_isStuck);
  assign _zz_execute_BRANCH_CTRL = decode_to_execute_BRANCH_CTRL;
  assign when_Pipeline_l124_47 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_48 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_49 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_50 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_51 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_52 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_53 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_54 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_55 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_56 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_57 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_58 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_59 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_60 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_61 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_62 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_63 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_64 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_65 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_66 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_67 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_68 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_69 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_70 = (! writeBack_arbitration_isStuck);
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != 3'b000) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != 4'b0000));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != 2'b00) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != 3'b000));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != 1'b0) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != 2'b00));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != 1'b0));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  assign when_Pipeline_l151 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l151_2 = ((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt);
  assign when_Pipeline_l154_2 = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  always @(*) begin
    IBusCachedPlugin_injectionPort_ready = 1'b0;
    case(switch_Fetcher_l362)
      3'b100 : begin
        IBusCachedPlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Fetcher_l378 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l1264 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_2 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_3 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_4 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_5 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_6 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_7 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_8 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_9 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_10 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_11 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_12 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_13 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_14 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_15 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_16 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_17 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_18 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_19 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_20 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_21 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_22 = (! execute_arbitration_isStuck);
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit = 32'h0;
    if(execute_CsrPlugin_csr_3857) begin
      _zz_CsrPlugin_csrMapping_readDataInit[0 : 0] = 1'b1;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_1 = 32'h0;
    if(execute_CsrPlugin_csr_3858) begin
      _zz_CsrPlugin_csrMapping_readDataInit_1[1 : 0] = 2'b10;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_2 = 32'h0;
    if(execute_CsrPlugin_csr_3859) begin
      _zz_CsrPlugin_csrMapping_readDataInit_2[1 : 0] = 2'b11;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_3 = 32'h0;
    if(execute_CsrPlugin_csr_768) begin
      _zz_CsrPlugin_csrMapping_readDataInit_3[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_CsrPlugin_csrMapping_readDataInit_3[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_CsrPlugin_csrMapping_readDataInit_3[3 : 3] = CsrPlugin_mstatus_MIE;
      _zz_CsrPlugin_csrMapping_readDataInit_3[8 : 8] = CsrPlugin_sstatus_SPP;
      _zz_CsrPlugin_csrMapping_readDataInit_3[5 : 5] = CsrPlugin_sstatus_SPIE;
      _zz_CsrPlugin_csrMapping_readDataInit_3[1 : 1] = CsrPlugin_sstatus_SIE;
      _zz_CsrPlugin_csrMapping_readDataInit_3[19 : 19] = MmuPlugin_status_mxr;
      _zz_CsrPlugin_csrMapping_readDataInit_3[18 : 18] = MmuPlugin_status_sum;
      _zz_CsrPlugin_csrMapping_readDataInit_3[17 : 17] = MmuPlugin_status_mprv;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_4 = 32'h0;
    if(execute_CsrPlugin_csr_836) begin
      _zz_CsrPlugin_csrMapping_readDataInit_4[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_CsrPlugin_csrMapping_readDataInit_4[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_CsrPlugin_csrMapping_readDataInit_4[3 : 3] = CsrPlugin_mip_MSIP;
      _zz_CsrPlugin_csrMapping_readDataInit_4[5 : 5] = CsrPlugin_sip_STIP;
      _zz_CsrPlugin_csrMapping_readDataInit_4[1 : 1] = CsrPlugin_sip_SSIP;
      _zz_CsrPlugin_csrMapping_readDataInit_4[9 : 9] = CsrPlugin_sip_SEIP_OR;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_5 = 32'h0;
    if(execute_CsrPlugin_csr_772) begin
      _zz_CsrPlugin_csrMapping_readDataInit_5[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_5[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_CsrPlugin_csrMapping_readDataInit_5[3 : 3] = CsrPlugin_mie_MSIE;
      _zz_CsrPlugin_csrMapping_readDataInit_5[9 : 9] = CsrPlugin_sie_SEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_5[5 : 5] = CsrPlugin_sie_STIE;
      _zz_CsrPlugin_csrMapping_readDataInit_5[1 : 1] = CsrPlugin_sie_SSIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_6 = 32'h0;
    if(execute_CsrPlugin_csr_833) begin
      _zz_CsrPlugin_csrMapping_readDataInit_6[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_7 = 32'h0;
    if(execute_CsrPlugin_csr_832) begin
      _zz_CsrPlugin_csrMapping_readDataInit_7[31 : 0] = CsrPlugin_mscratch;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_8 = 32'h0;
    if(execute_CsrPlugin_csr_834) begin
      _zz_CsrPlugin_csrMapping_readDataInit_8[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_8[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_9 = 32'h0;
    if(execute_CsrPlugin_csr_835) begin
      _zz_CsrPlugin_csrMapping_readDataInit_9[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_10 = 32'h0;
    if(execute_CsrPlugin_csr_256) begin
      _zz_CsrPlugin_csrMapping_readDataInit_10[8 : 8] = CsrPlugin_sstatus_SPP;
      _zz_CsrPlugin_csrMapping_readDataInit_10[5 : 5] = CsrPlugin_sstatus_SPIE;
      _zz_CsrPlugin_csrMapping_readDataInit_10[1 : 1] = CsrPlugin_sstatus_SIE;
      _zz_CsrPlugin_csrMapping_readDataInit_10[19 : 19] = MmuPlugin_status_mxr;
      _zz_CsrPlugin_csrMapping_readDataInit_10[18 : 18] = MmuPlugin_status_sum;
      _zz_CsrPlugin_csrMapping_readDataInit_10[17 : 17] = MmuPlugin_status_mprv;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_11 = 32'h0;
    if(execute_CsrPlugin_csr_324) begin
      _zz_CsrPlugin_csrMapping_readDataInit_11[5 : 5] = CsrPlugin_sip_STIP;
      _zz_CsrPlugin_csrMapping_readDataInit_11[1 : 1] = CsrPlugin_sip_SSIP;
      _zz_CsrPlugin_csrMapping_readDataInit_11[9 : 9] = CsrPlugin_sip_SEIP_OR;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_12 = 32'h0;
    if(execute_CsrPlugin_csr_260) begin
      _zz_CsrPlugin_csrMapping_readDataInit_12[9 : 9] = CsrPlugin_sie_SEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_12[5 : 5] = CsrPlugin_sie_STIE;
      _zz_CsrPlugin_csrMapping_readDataInit_12[1 : 1] = CsrPlugin_sie_SSIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_13 = 32'h0;
    if(execute_CsrPlugin_csr_261) begin
      _zz_CsrPlugin_csrMapping_readDataInit_13[31 : 2] = CsrPlugin_stvec_base;
      _zz_CsrPlugin_csrMapping_readDataInit_13[1 : 0] = CsrPlugin_stvec_mode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_14 = 32'h0;
    if(execute_CsrPlugin_csr_321) begin
      _zz_CsrPlugin_csrMapping_readDataInit_14[31 : 0] = CsrPlugin_sepc;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_15 = 32'h0;
    if(execute_CsrPlugin_csr_320) begin
      _zz_CsrPlugin_csrMapping_readDataInit_15[31 : 0] = CsrPlugin_sscratch;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_16 = 32'h0;
    if(execute_CsrPlugin_csr_322) begin
      _zz_CsrPlugin_csrMapping_readDataInit_16[31 : 31] = CsrPlugin_scause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_16[3 : 0] = CsrPlugin_scause_exceptionCode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_17 = 32'h0;
    if(execute_CsrPlugin_csr_323) begin
      _zz_CsrPlugin_csrMapping_readDataInit_17[31 : 0] = CsrPlugin_stval;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_18 = 32'h0;
    if(execute_CsrPlugin_csr_384) begin
      _zz_CsrPlugin_csrMapping_readDataInit_18[31 : 31] = MmuPlugin_satp_mode;
      _zz_CsrPlugin_csrMapping_readDataInit_18[30 : 22] = MmuPlugin_satp_asid;
      _zz_CsrPlugin_csrMapping_readDataInit_18[19 : 0] = MmuPlugin_satp_ppn;
    end
  end

  assign CsrPlugin_csrMapping_readDataInit = (((((_zz_CsrPlugin_csrMapping_readDataInit | _zz_CsrPlugin_csrMapping_readDataInit_1) | (_zz_CsrPlugin_csrMapping_readDataInit_2 | _zz_CsrPlugin_csrMapping_readDataInit_19)) | ((_zz_CsrPlugin_csrMapping_readDataInit_3 | _zz_CsrPlugin_csrMapping_readDataInit_4) | (_zz_CsrPlugin_csrMapping_readDataInit_5 | _zz_CsrPlugin_csrMapping_readDataInit_6))) | (((_zz_CsrPlugin_csrMapping_readDataInit_7 | _zz_CsrPlugin_csrMapping_readDataInit_8) | (_zz_CsrPlugin_csrMapping_readDataInit_9 | _zz_CsrPlugin_csrMapping_readDataInit_10)) | ((_zz_CsrPlugin_csrMapping_readDataInit_11 | _zz_CsrPlugin_csrMapping_readDataInit_12) | (_zz_CsrPlugin_csrMapping_readDataInit_13 | _zz_CsrPlugin_csrMapping_readDataInit_14)))) | ((_zz_CsrPlugin_csrMapping_readDataInit_15 | _zz_CsrPlugin_csrMapping_readDataInit_16) | (_zz_CsrPlugin_csrMapping_readDataInit_17 | _zz_CsrPlugin_csrMapping_readDataInit_18)));
  assign when_CsrPlugin_l1297 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign when_CsrPlugin_l1302 = ((! execute_arbitration_isValid) || (! execute_IS_CSR));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      IBusCachedPlugin_fetchPc_pcReg <= 32'h80000000;
      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_2 <= 1'b0;
      _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_IBusCachedPlugin_rspCounter;
      IBusCachedPlugin_rspCounter <= 32'h0;
      dataCache_1_io_mem_cmd_s2mPipe_rValid <= 1'b0;
      dataCache_1_io_mem_cmd_s2mPipe_rValid_1 <= 1'b0;
      dBus_rsp_regNext_valid <= 1'b0;
      DBusCachedPlugin_rspCounter <= _zz_DBusCachedPlugin_rspCounter;
      DBusCachedPlugin_rspCounter <= 32'h0;
      _zz_7 <= 1'b1;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      memory_MulDivIterativePlugin_div_counter_value <= 6'h0;
      _zz_CsrPlugin_privilege <= 2'b11;
      CsrPlugin_mtvec_mode <= 2'b00;
      CsrPlugin_mtvec_base <= 30'h20000008;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_medeleg_IAM <= 1'b0;
      CsrPlugin_medeleg_IAF <= 1'b0;
      CsrPlugin_medeleg_II <= 1'b0;
      CsrPlugin_medeleg_LAM <= 1'b0;
      CsrPlugin_medeleg_LAF <= 1'b0;
      CsrPlugin_medeleg_SAM <= 1'b0;
      CsrPlugin_medeleg_SAF <= 1'b0;
      CsrPlugin_medeleg_EU <= 1'b0;
      CsrPlugin_medeleg_ES <= 1'b0;
      CsrPlugin_medeleg_IPF <= 1'b0;
      CsrPlugin_medeleg_LPF <= 1'b0;
      CsrPlugin_medeleg_SPF <= 1'b0;
      CsrPlugin_mideleg_ST <= 1'b0;
      CsrPlugin_mideleg_SE <= 1'b0;
      CsrPlugin_mideleg_SS <= 1'b0;
      CsrPlugin_sstatus_SIE <= 1'b0;
      CsrPlugin_sstatus_SPIE <= 1'b0;
      CsrPlugin_sstatus_SPP <= 1'b1;
      CsrPlugin_sip_SEIP_SOFT <= 1'b0;
      CsrPlugin_sip_STIP <= 1'b0;
      CsrPlugin_sip_SSIP <= 1'b0;
      CsrPlugin_sie_SEIE <= 1'b0;
      CsrPlugin_sie_STIE <= 1'b0;
      CsrPlugin_sie_SSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_lastStageWasWfi <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      MmuPlugin_status_sum <= 1'b0;
      MmuPlugin_status_mxr <= 1'b0;
      MmuPlugin_status_mprv <= 1'b0;
      MmuPlugin_satp_mode <= 1'b0;
      MmuPlugin_ports_0_cache_0_valid <= 1'b0;
      MmuPlugin_ports_0_cache_1_valid <= 1'b0;
      MmuPlugin_ports_0_cache_2_valid <= 1'b0;
      MmuPlugin_ports_0_cache_3_valid <= 1'b0;
      MmuPlugin_ports_0_entryToReplace_value <= 2'b00;
      MmuPlugin_ports_1_cache_0_valid <= 1'b0;
      MmuPlugin_ports_1_cache_1_valid <= 1'b0;
      MmuPlugin_ports_1_cache_2_valid <= 1'b0;
      MmuPlugin_ports_1_cache_3_valid <= 1'b0;
      MmuPlugin_ports_1_entryToReplace_value <= 2'b00;
      MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_IDLE;
      MmuPlugin_shared_dBusRspStaged_valid <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      switch_Fetcher_l362 <= 3'b000;
      execute_to_memory_IS_DBUS_SHARING <= 1'b0;
      memory_to_writeBack_IS_DBUS_SHARING <= 1'b0;
    end else begin
      if(IBusCachedPlugin_fetchPc_correction) begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b1;
      end
      if(when_Fetcher_l127) begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusCachedPlugin_fetchPc_booted <= 1'b1;
      if(when_Fetcher_l131) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(when_Fetcher_l131_1) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(when_Fetcher_l131_2) begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(when_Fetcher_l158) begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      if(IBusCachedPlugin_iBusRsp_flush) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_2 <= 1'b0;
      end
      if(_zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_0_output_ready_2 <= (IBusCachedPlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready) begin
        _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_valid <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if(when_Fetcher_l329) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(when_Fetcher_l329_1) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(when_Fetcher_l329_2) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(when_Fetcher_l329_3) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(when_Fetcher_l329_4) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= IBusCachedPlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusCachedPlugin_fetchPc_flushed) begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(iBus_rsp_valid) begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + 32'h00000001);
      end
      if(dataCache_1_io_mem_cmd_s2mPipe_ready) begin
        dataCache_1_io_mem_cmd_s2mPipe_rValid <= 1'b0;
      end
      if(when_Stream_l365) begin
        dataCache_1_io_mem_cmd_s2mPipe_rValid <= dataCache_1_io_mem_cmd_valid;
      end
      if(dataCache_1_io_mem_cmd_s2mPipe_ready) begin
        dataCache_1_io_mem_cmd_s2mPipe_rValid_1 <= dataCache_1_io_mem_cmd_s2mPipe_valid;
      end
      dBus_rsp_regNext_valid <= dBus_rsp_valid;
      if(dBus_rsp_valid) begin
        DBusCachedPlugin_rspCounter <= (DBusCachedPlugin_rspCounter + 32'h00000001);
      end
      _zz_7 <= 1'b0;
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      memory_MulDivIterativePlugin_div_counter_value <= memory_MulDivIterativePlugin_div_counter_valueNext;
      if(when_CsrPlugin_l909) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if(when_CsrPlugin_l909_1) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if(when_CsrPlugin_l909_2) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if(when_CsrPlugin_l909_3) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(when_CsrPlugin_l946) begin
        if(when_CsrPlugin_l952) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l952_1) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l952_2) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(when_CsrPlugin_l946_1) begin
        if(when_CsrPlugin_l952_3) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l952_4) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l952_5) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l952_6) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l952_7) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l952_8) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      CsrPlugin_lastStageWasWfi <= (writeBack_arbitration_isFiring && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_WFI));
      if(CsrPlugin_pipelineLiberator_active) begin
        if(when_CsrPlugin_l980) begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if(when_CsrPlugin_l980_1) begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if(when_CsrPlugin_l980_2) begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(when_CsrPlugin_l985) begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump) begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(when_CsrPlugin_l1019) begin
        _zz_CsrPlugin_privilege <= CsrPlugin_targetPrivilege;
        case(CsrPlugin_targetPrivilege)
          2'b01 : begin
            CsrPlugin_sstatus_SIE <= 1'b0;
            CsrPlugin_sstatus_SPIE <= CsrPlugin_sstatus_SIE;
            CsrPlugin_sstatus_SPP <= CsrPlugin_privilege[0 : 0];
          end
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(when_CsrPlugin_l1064) begin
        case(switch_CsrPlugin_l1068)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
            _zz_CsrPlugin_privilege <= CsrPlugin_mstatus_MPP;
          end
          2'b01 : begin
            CsrPlugin_sstatus_SPP <= 1'b0;
            CsrPlugin_sstatus_SIE <= CsrPlugin_sstatus_SPIE;
            CsrPlugin_sstatus_SPIE <= 1'b1;
            _zz_CsrPlugin_privilege <= {1'b0,CsrPlugin_sstatus_SPP};
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_when_CsrPlugin_l952_5,{_zz_when_CsrPlugin_l952_4,{_zz_when_CsrPlugin_l952_3,{_zz_when_CsrPlugin_l952_2,{_zz_when_CsrPlugin_l952_1,_zz_when_CsrPlugin_l952}}}}} != 6'h0) || CsrPlugin_thirdPartyWake);
      MmuPlugin_ports_0_entryToReplace_value <= MmuPlugin_ports_0_entryToReplace_valueNext;
      if(contextSwitching) begin
        if(MmuPlugin_ports_0_cache_0_exception) begin
          MmuPlugin_ports_0_cache_0_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_1_exception) begin
          MmuPlugin_ports_0_cache_1_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_2_exception) begin
          MmuPlugin_ports_0_cache_2_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_3_exception) begin
          MmuPlugin_ports_0_cache_3_valid <= 1'b0;
        end
      end
      MmuPlugin_ports_1_entryToReplace_value <= MmuPlugin_ports_1_entryToReplace_valueNext;
      if(contextSwitching) begin
        if(MmuPlugin_ports_1_cache_0_exception) begin
          MmuPlugin_ports_1_cache_0_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_1_exception) begin
          MmuPlugin_ports_1_cache_1_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_2_exception) begin
          MmuPlugin_ports_1_cache_2_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_3_exception) begin
          MmuPlugin_ports_1_cache_3_valid <= 1'b0;
        end
      end
      MmuPlugin_shared_dBusRspStaged_valid <= MmuPlugin_dBusAccess_rsp_valid;
      case(MmuPlugin_shared_state_1)
        `MmuPlugin_shared_State_defaultEncoding_IDLE : begin
          if(when_MmuPlugin_l217) begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L1_CMD;
          end
        end
        `MmuPlugin_shared_State_defaultEncoding_L1_CMD : begin
          if(MmuPlugin_dBusAccess_cmd_ready) begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L1_RSP;
          end
        end
        `MmuPlugin_shared_State_defaultEncoding_L1_RSP : begin
          if(MmuPlugin_shared_dBusRspStaged_valid) begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L0_CMD;
            if(when_MmuPlugin_l243) begin
              MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_IDLE;
            end
            if(MmuPlugin_shared_dBusRspStaged_payload_redo) begin
              MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L1_CMD;
            end
          end
        end
        `MmuPlugin_shared_State_defaultEncoding_L0_CMD : begin
          if(MmuPlugin_dBusAccess_cmd_ready) begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L0_RSP;
          end
        end
        default : begin
          if(MmuPlugin_shared_dBusRspStaged_valid) begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_IDLE;
            if(MmuPlugin_shared_dBusRspStaged_payload_redo) begin
              MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L0_CMD;
            end
          end
        end
      endcase
      if(when_MmuPlugin_l272) begin
        if(when_MmuPlugin_l274) begin
          if(when_MmuPlugin_l280) begin
            MmuPlugin_ports_0_cache_0_valid <= 1'b1;
          end
          if(when_MmuPlugin_l280_1) begin
            MmuPlugin_ports_0_cache_1_valid <= 1'b1;
          end
          if(when_MmuPlugin_l280_2) begin
            MmuPlugin_ports_0_cache_2_valid <= 1'b1;
          end
          if(when_MmuPlugin_l280_3) begin
            MmuPlugin_ports_0_cache_3_valid <= 1'b1;
          end
        end
        if(when_MmuPlugin_l274_1) begin
          if(when_MmuPlugin_l280_4) begin
            MmuPlugin_ports_1_cache_0_valid <= 1'b1;
          end
          if(when_MmuPlugin_l280_5) begin
            MmuPlugin_ports_1_cache_1_valid <= 1'b1;
          end
          if(when_MmuPlugin_l280_6) begin
            MmuPlugin_ports_1_cache_2_valid <= 1'b1;
          end
          if(when_MmuPlugin_l280_7) begin
            MmuPlugin_ports_1_cache_3_valid <= 1'b1;
          end
        end
      end
      if(when_MmuPlugin_l304) begin
        MmuPlugin_ports_0_cache_0_valid <= 1'b0;
        MmuPlugin_ports_0_cache_1_valid <= 1'b0;
        MmuPlugin_ports_0_cache_2_valid <= 1'b0;
        MmuPlugin_ports_0_cache_3_valid <= 1'b0;
        MmuPlugin_ports_1_cache_0_valid <= 1'b0;
        MmuPlugin_ports_1_cache_1_valid <= 1'b0;
        MmuPlugin_ports_1_cache_2_valid <= 1'b0;
        MmuPlugin_ports_1_cache_3_valid <= 1'b0;
      end
      if(when_Pipeline_l124_58) begin
        execute_to_memory_IS_DBUS_SHARING <= execute_IS_DBUS_SHARING;
      end
      if(when_Pipeline_l124_59) begin
        memory_to_writeBack_IS_DBUS_SHARING <= memory_IS_DBUS_SHARING;
      end
      if(when_Pipeline_l151) begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(when_Pipeline_l151_2) begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_2) begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(switch_Fetcher_l362)
        3'b000 : begin
          if(IBusCachedPlugin_injectionPort_valid) begin
            switch_Fetcher_l362 <= 3'b001;
          end
        end
        3'b001 : begin
          switch_Fetcher_l362 <= 3'b010;
        end
        3'b010 : begin
          switch_Fetcher_l362 <= 3'b011;
        end
        3'b011 : begin
          if(when_Fetcher_l378) begin
            switch_Fetcher_l362 <= 3'b100;
          end
        end
        3'b100 : begin
          switch_Fetcher_l362 <= 3'b000;
        end
        default : begin
        end
      endcase
      if(MmuPlugin_dBusAccess_rsp_valid) begin
        memory_to_writeBack_IS_DBUS_SHARING <= 1'b0;
      end
      if(MmuPlugin_dBusAccess_rsp_valid) begin
        memory_to_writeBack_IS_DBUS_SHARING <= 1'b0;
      end
      if(execute_CsrPlugin_csr_768) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mstatus_MPP <= CsrPlugin_csrMapping_writeDataSignal[12 : 11];
          CsrPlugin_mstatus_MPIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mstatus_MIE <= CsrPlugin_csrMapping_writeDataSignal[3];
          CsrPlugin_sstatus_SPP <= CsrPlugin_csrMapping_writeDataSignal[8 : 8];
          CsrPlugin_sstatus_SPIE <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sstatus_SIE <= CsrPlugin_csrMapping_writeDataSignal[1];
          MmuPlugin_status_mxr <= CsrPlugin_csrMapping_writeDataSignal[19];
          MmuPlugin_status_sum <= CsrPlugin_csrMapping_writeDataSignal[18];
          MmuPlugin_status_mprv <= CsrPlugin_csrMapping_writeDataSignal[17];
        end
      end
      if(execute_CsrPlugin_csr_836) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_sip_STIP <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sip_SSIP <= CsrPlugin_csrMapping_writeDataSignal[1];
          CsrPlugin_sip_SEIP_SOFT <= CsrPlugin_csrMapping_writeDataSignal[9];
        end
      end
      if(execute_CsrPlugin_csr_772) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mie_MEIE <= CsrPlugin_csrMapping_writeDataSignal[11];
          CsrPlugin_mie_MTIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mie_MSIE <= CsrPlugin_csrMapping_writeDataSignal[3];
          CsrPlugin_sie_SEIE <= CsrPlugin_csrMapping_writeDataSignal[9];
          CsrPlugin_sie_STIE <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sie_SSIE <= CsrPlugin_csrMapping_writeDataSignal[1];
        end
      end
      if(execute_CsrPlugin_csr_773) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mtvec_base <= CsrPlugin_csrMapping_writeDataSignal[31 : 2];
          CsrPlugin_mtvec_mode <= CsrPlugin_csrMapping_writeDataSignal[1 : 0];
        end
      end
      if(execute_CsrPlugin_csr_770) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_medeleg_IAM <= CsrPlugin_csrMapping_writeDataSignal[0];
          CsrPlugin_medeleg_IAF <= CsrPlugin_csrMapping_writeDataSignal[1];
          CsrPlugin_medeleg_II <= CsrPlugin_csrMapping_writeDataSignal[2];
          CsrPlugin_medeleg_LAM <= CsrPlugin_csrMapping_writeDataSignal[4];
          CsrPlugin_medeleg_LAF <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_medeleg_SAM <= CsrPlugin_csrMapping_writeDataSignal[6];
          CsrPlugin_medeleg_SAF <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_medeleg_EU <= CsrPlugin_csrMapping_writeDataSignal[8];
          CsrPlugin_medeleg_ES <= CsrPlugin_csrMapping_writeDataSignal[9];
          CsrPlugin_medeleg_IPF <= CsrPlugin_csrMapping_writeDataSignal[12];
          CsrPlugin_medeleg_LPF <= CsrPlugin_csrMapping_writeDataSignal[13];
          CsrPlugin_medeleg_SPF <= CsrPlugin_csrMapping_writeDataSignal[15];
        end
      end
      if(execute_CsrPlugin_csr_771) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mideleg_SE <= CsrPlugin_csrMapping_writeDataSignal[9];
          CsrPlugin_mideleg_ST <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_mideleg_SS <= CsrPlugin_csrMapping_writeDataSignal[1];
        end
      end
      if(execute_CsrPlugin_csr_256) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_sstatus_SPP <= CsrPlugin_csrMapping_writeDataSignal[8 : 8];
          CsrPlugin_sstatus_SPIE <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sstatus_SIE <= CsrPlugin_csrMapping_writeDataSignal[1];
          MmuPlugin_status_mxr <= CsrPlugin_csrMapping_writeDataSignal[19];
          MmuPlugin_status_sum <= CsrPlugin_csrMapping_writeDataSignal[18];
          MmuPlugin_status_mprv <= CsrPlugin_csrMapping_writeDataSignal[17];
        end
      end
      if(execute_CsrPlugin_csr_324) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_sip_STIP <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sip_SSIP <= CsrPlugin_csrMapping_writeDataSignal[1];
          CsrPlugin_sip_SEIP_SOFT <= CsrPlugin_csrMapping_writeDataSignal[9];
        end
      end
      if(execute_CsrPlugin_csr_260) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_sie_SEIE <= CsrPlugin_csrMapping_writeDataSignal[9];
          CsrPlugin_sie_STIE <= CsrPlugin_csrMapping_writeDataSignal[5];
          CsrPlugin_sie_SSIE <= CsrPlugin_csrMapping_writeDataSignal[1];
        end
      end
      if(execute_CsrPlugin_csr_384) begin
        if(execute_CsrPlugin_writeEnable) begin
          MmuPlugin_satp_mode <= CsrPlugin_csrMapping_writeDataSignal[31];
          MmuPlugin_ports_0_cache_0_valid <= 1'b0;
          MmuPlugin_ports_0_cache_1_valid <= 1'b0;
          MmuPlugin_ports_0_cache_2_valid <= 1'b0;
          MmuPlugin_ports_0_cache_3_valid <= 1'b0;
          MmuPlugin_ports_1_cache_0_valid <= 1'b0;
          MmuPlugin_ports_1_cache_1_valid <= 1'b0;
          MmuPlugin_ports_1_cache_2_valid <= 1'b0;
          MmuPlugin_ports_1_cache_3_valid <= 1'b0;
        end
      end
    end
  end

  always @(posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready) begin
      _zz_IBusCachedPlugin_iBusRsp_stages_1_output_m2sPipe_payload <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready) begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready) begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if(when_Stream_l365) begin
      dataCache_1_io_mem_cmd_s2mPipe_rData_wr <= dataCache_1_io_mem_cmd_payload_wr;
      dataCache_1_io_mem_cmd_s2mPipe_rData_uncached <= dataCache_1_io_mem_cmd_payload_uncached;
      dataCache_1_io_mem_cmd_s2mPipe_rData_address <= dataCache_1_io_mem_cmd_payload_address;
      dataCache_1_io_mem_cmd_s2mPipe_rData_data <= dataCache_1_io_mem_cmd_payload_data;
      dataCache_1_io_mem_cmd_s2mPipe_rData_mask <= dataCache_1_io_mem_cmd_payload_mask;
      dataCache_1_io_mem_cmd_s2mPipe_rData_size <= dataCache_1_io_mem_cmd_payload_size;
      dataCache_1_io_mem_cmd_s2mPipe_rData_last <= dataCache_1_io_mem_cmd_payload_last;
    end
    if(dataCache_1_io_mem_cmd_s2mPipe_ready) begin
      dataCache_1_io_mem_cmd_s2mPipe_rData_wr_1 <= dataCache_1_io_mem_cmd_s2mPipe_payload_wr;
      dataCache_1_io_mem_cmd_s2mPipe_rData_uncached_1 <= dataCache_1_io_mem_cmd_s2mPipe_payload_uncached;
      dataCache_1_io_mem_cmd_s2mPipe_rData_address_1 <= dataCache_1_io_mem_cmd_s2mPipe_payload_address;
      dataCache_1_io_mem_cmd_s2mPipe_rData_data_1 <= dataCache_1_io_mem_cmd_s2mPipe_payload_data;
      dataCache_1_io_mem_cmd_s2mPipe_rData_mask_1 <= dataCache_1_io_mem_cmd_s2mPipe_payload_mask;
      dataCache_1_io_mem_cmd_s2mPipe_rData_size_1 <= dataCache_1_io_mem_cmd_s2mPipe_payload_size;
      dataCache_1_io_mem_cmd_s2mPipe_rData_last_1 <= dataCache_1_io_mem_cmd_s2mPipe_payload_last;
    end
    dBus_rsp_regNext_payload_last <= dBus_rsp_payload_last;
    dBus_rsp_regNext_payload_data <= dBus_rsp_payload_data;
    dBus_rsp_regNext_payload_error <= dBus_rsp_payload_error;
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    if(when_MulDivIterativePlugin_l126) begin
      memory_MulDivIterativePlugin_div_done <= 1'b1;
    end
    if(when_MulDivIterativePlugin_l126_1) begin
      memory_MulDivIterativePlugin_div_done <= 1'b0;
    end
    if(when_MulDivIterativePlugin_l128) begin
      if(when_MulDivIterativePlugin_l132) begin
        memory_MulDivIterativePlugin_rs1[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outNumerator;
        memory_MulDivIterativePlugin_accumulator[31 : 0] <= memory_MulDivIterativePlugin_div_stage_0_outRemainder;
        if(when_MulDivIterativePlugin_l151) begin
          memory_MulDivIterativePlugin_div_result <= _zz_memory_MulDivIterativePlugin_div_result_1[31:0];
        end
      end
    end
    if(when_MulDivIterativePlugin_l162) begin
      memory_MulDivIterativePlugin_accumulator <= 65'h0;
      memory_MulDivIterativePlugin_rs1 <= ((_zz_memory_MulDivIterativePlugin_rs1 ? (~ _zz_memory_MulDivIterativePlugin_rs1_1) : _zz_memory_MulDivIterativePlugin_rs1_1) + _zz_memory_MulDivIterativePlugin_rs1_2);
      memory_MulDivIterativePlugin_rs2 <= ((_zz_memory_MulDivIterativePlugin_rs2 ? (~ execute_RS2) : execute_RS2) + _zz_memory_MulDivIterativePlugin_rs2_1);
      memory_MulDivIterativePlugin_div_needRevert <= ((_zz_memory_MulDivIterativePlugin_rs1 ^ (_zz_memory_MulDivIterativePlugin_rs2 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_sip_SEIP_INPUT <= externalInterruptS;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring) begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(CsrPlugin_selfException_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(BranchPlugin_branchExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= BranchPlugin_branchExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= BranchPlugin_branchExceptionPort_payload_badAddr;
    end
    if(DBusCachedPlugin_exceptionBus_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusCachedPlugin_exceptionBus_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusCachedPlugin_exceptionBus_payload_badAddr;
    end
    if(when_CsrPlugin_l946) begin
      if(when_CsrPlugin_l952) begin
        CsrPlugin_interrupt_code <= 4'b0101;
        CsrPlugin_interrupt_targetPrivilege <= 2'b01;
      end
      if(when_CsrPlugin_l952_1) begin
        CsrPlugin_interrupt_code <= 4'b0001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b01;
      end
      if(when_CsrPlugin_l952_2) begin
        CsrPlugin_interrupt_code <= 4'b1001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b01;
      end
    end
    if(when_CsrPlugin_l946_1) begin
      if(when_CsrPlugin_l952_3) begin
        CsrPlugin_interrupt_code <= 4'b0101;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l952_4) begin
        CsrPlugin_interrupt_code <= 4'b0001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l952_5) begin
        CsrPlugin_interrupt_code <= 4'b1001;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l952_6) begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l952_7) begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l952_8) begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(when_CsrPlugin_l1019) begin
      case(CsrPlugin_targetPrivilege)
        2'b01 : begin
          CsrPlugin_scause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_scause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_sepc <= writeBack_PC;
          if(CsrPlugin_hadException) begin
            CsrPlugin_stval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= writeBack_PC;
          if(CsrPlugin_hadException) begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    MmuPlugin_shared_dBusRspStaged_payload_data <= MmuPlugin_dBusAccess_rsp_payload_data;
    MmuPlugin_shared_dBusRspStaged_payload_error <= MmuPlugin_dBusAccess_rsp_payload_error;
    MmuPlugin_shared_dBusRspStaged_payload_redo <= MmuPlugin_dBusAccess_rsp_payload_redo;
    if(when_MmuPlugin_l205) begin
      MmuPlugin_shared_pteBuffer_V <= MmuPlugin_shared_dBusRsp_pte_V;
      MmuPlugin_shared_pteBuffer_R <= MmuPlugin_shared_dBusRsp_pte_R;
      MmuPlugin_shared_pteBuffer_W <= MmuPlugin_shared_dBusRsp_pte_W;
      MmuPlugin_shared_pteBuffer_X <= MmuPlugin_shared_dBusRsp_pte_X;
      MmuPlugin_shared_pteBuffer_U <= MmuPlugin_shared_dBusRsp_pte_U;
      MmuPlugin_shared_pteBuffer_G <= MmuPlugin_shared_dBusRsp_pte_G;
      MmuPlugin_shared_pteBuffer_A <= MmuPlugin_shared_dBusRsp_pte_A;
      MmuPlugin_shared_pteBuffer_D <= MmuPlugin_shared_dBusRsp_pte_D;
      MmuPlugin_shared_pteBuffer_RSW <= MmuPlugin_shared_dBusRsp_pte_RSW;
      MmuPlugin_shared_pteBuffer_PPN0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
      MmuPlugin_shared_pteBuffer_PPN1 <= MmuPlugin_shared_dBusRsp_pte_PPN1;
    end
    case(MmuPlugin_shared_state_1)
      `MmuPlugin_shared_State_defaultEncoding_IDLE : begin
        if(when_MmuPlugin_l217) begin
          MmuPlugin_shared_portSortedOh <= MmuPlugin_shared_refills;
          MmuPlugin_shared_vpn_1 <= _zz_MmuPlugin_shared_vpn_0[31 : 22];
          MmuPlugin_shared_vpn_0 <= _zz_MmuPlugin_shared_vpn_0[21 : 12];
        end
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_CMD : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L1_RSP : begin
      end
      `MmuPlugin_shared_State_defaultEncoding_L0_CMD : begin
      end
      default : begin
      end
    endcase
    if(when_MmuPlugin_l272) begin
      if(when_MmuPlugin_l274) begin
        if(when_MmuPlugin_l280) begin
          MmuPlugin_ports_0_cache_0_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_0_cache_0_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_0_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_0_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_0_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_0_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_0_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_0_cache_0_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_0_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_0_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(when_MmuPlugin_l280_1) begin
          MmuPlugin_ports_0_cache_1_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_0_cache_1_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_1_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_1_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_1_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_1_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_1_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_0_cache_1_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_1_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_1_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(when_MmuPlugin_l280_2) begin
          MmuPlugin_ports_0_cache_2_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_0_cache_2_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_2_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_2_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_2_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_2_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_2_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_0_cache_2_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_2_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_2_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(when_MmuPlugin_l280_3) begin
          MmuPlugin_ports_0_cache_3_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_0_cache_3_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_0_cache_3_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_0_cache_3_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_0_cache_3_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_0_cache_3_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_0_cache_3_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_0_cache_3_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_0_cache_3_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_0_cache_3_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
      end
      if(when_MmuPlugin_l274_1) begin
        if(when_MmuPlugin_l280_4) begin
          MmuPlugin_ports_1_cache_0_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_1_cache_0_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_0_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_0_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_0_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_0_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_0_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_0_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_0_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_0_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(when_MmuPlugin_l280_5) begin
          MmuPlugin_ports_1_cache_1_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_1_cache_1_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_1_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_1_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_1_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_1_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_1_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_1_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_1_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_1_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(when_MmuPlugin_l280_6) begin
          MmuPlugin_ports_1_cache_2_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_1_cache_2_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_2_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_2_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_2_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_2_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_2_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_2_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_2_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_2_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(when_MmuPlugin_l280_7) begin
          MmuPlugin_ports_1_cache_3_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_1_cache_3_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_3_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_3_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_3_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_3_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_3_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_3_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_3_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_3_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
      end
    end
    if(when_Pipeline_l124) begin
      decode_to_execute_PC <= _zz_decode_SRC2;
    end
    if(when_Pipeline_l124_1) begin
      execute_to_memory_PC <= execute_PC;
    end
    if(when_Pipeline_l124_2) begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if(when_Pipeline_l124_3) begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if(when_Pipeline_l124_4) begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if(when_Pipeline_l124_5) begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if(when_Pipeline_l124_6) begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_decode_to_execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_7) begin
      execute_to_memory_FORMAL_PC_NEXT <= _zz_execute_to_memory_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_8) begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_memory_to_writeBack_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_9) begin
      decode_to_execute_MEMORY_FORCE_CONSTISTENCY <= decode_MEMORY_FORCE_CONSTISTENCY;
    end
    if(when_Pipeline_l124_10) begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if(when_Pipeline_l124_11) begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_12) begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_13) begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_14) begin
      decode_to_execute_ALU_CTRL <= _zz_decode_to_execute_ALU_CTRL;
    end
    if(when_Pipeline_l124_15) begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_16) begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_17) begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_18) begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if(when_Pipeline_l124_19) begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_20) begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_21) begin
      decode_to_execute_MEMORY_WR <= decode_MEMORY_WR;
    end
    if(when_Pipeline_l124_22) begin
      execute_to_memory_MEMORY_WR <= execute_MEMORY_WR;
    end
    if(when_Pipeline_l124_23) begin
      memory_to_writeBack_MEMORY_WR <= memory_MEMORY_WR;
    end
    if(when_Pipeline_l124_24) begin
      decode_to_execute_MEMORY_LRSC <= decode_MEMORY_LRSC;
    end
    if(when_Pipeline_l124_25) begin
      execute_to_memory_MEMORY_LRSC <= execute_MEMORY_LRSC;
    end
    if(when_Pipeline_l124_26) begin
      memory_to_writeBack_MEMORY_LRSC <= memory_MEMORY_LRSC;
    end
    if(when_Pipeline_l124_27) begin
      decode_to_execute_MEMORY_AMO <= decode_MEMORY_AMO;
    end
    if(when_Pipeline_l124_28) begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if(when_Pipeline_l124_29) begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if(when_Pipeline_l124_30) begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_decode_to_execute_ALU_BITWISE_CTRL;
    end
    if(when_Pipeline_l124_31) begin
      decode_to_execute_SHIFT_CTRL <= _zz_decode_to_execute_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_32) begin
      execute_to_memory_SHIFT_CTRL <= _zz_execute_to_memory_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_33) begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if(when_Pipeline_l124_34) begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if(when_Pipeline_l124_35) begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if(when_Pipeline_l124_36) begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if(when_Pipeline_l124_37) begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if(when_Pipeline_l124_38) begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if(when_Pipeline_l124_39) begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if(when_Pipeline_l124_40) begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if(when_Pipeline_l124_41) begin
      decode_to_execute_ENV_CTRL <= _zz_decode_to_execute_ENV_CTRL;
    end
    if(when_Pipeline_l124_42) begin
      execute_to_memory_ENV_CTRL <= _zz_execute_to_memory_ENV_CTRL;
    end
    if(when_Pipeline_l124_43) begin
      memory_to_writeBack_ENV_CTRL <= _zz_memory_to_writeBack_ENV_CTRL;
    end
    if(when_Pipeline_l124_44) begin
      decode_to_execute_IS_SFENCE_VMA <= decode_IS_SFENCE_VMA;
    end
    if(when_Pipeline_l124_45) begin
      decode_to_execute_IS_SFENCE_VMA2 <= decode_IS_SFENCE_VMA2;
    end
    if(when_Pipeline_l124_46) begin
      decode_to_execute_BRANCH_CTRL <= _zz_decode_to_execute_BRANCH_CTRL;
    end
    if(when_Pipeline_l124_47) begin
      decode_to_execute_RS1 <= _zz_decode_SRC1;
    end
    if(when_Pipeline_l124_48) begin
      decode_to_execute_RS2 <= _zz_decode_SRC2_1;
    end
    if(when_Pipeline_l124_49) begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if(when_Pipeline_l124_50) begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if(when_Pipeline_l124_51) begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if(when_Pipeline_l124_52) begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if(when_Pipeline_l124_53) begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if(when_Pipeline_l124_54) begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if(when_Pipeline_l124_55) begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if(when_Pipeline_l124_56) begin
      execute_to_memory_MEMORY_STORE_DATA_RF <= execute_MEMORY_STORE_DATA_RF;
    end
    if(when_Pipeline_l124_57) begin
      memory_to_writeBack_MEMORY_STORE_DATA_RF <= memory_MEMORY_STORE_DATA_RF;
    end
    if(when_Pipeline_l124_60) begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_decode_RS2;
    end
    if(when_Pipeline_l124_61) begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_decode_RS2_1;
    end
    if(when_Pipeline_l124_62) begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if(when_Pipeline_l124_63) begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if(when_Pipeline_l124_64) begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if(when_Pipeline_l124_65) begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if(when_Pipeline_l124_66) begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if(when_Pipeline_l124_67) begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if(when_Pipeline_l124_68) begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if(when_Pipeline_l124_69) begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if(when_Pipeline_l124_70) begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if(when_CsrPlugin_l1264) begin
      execute_CsrPlugin_csr_3857 <= (decode_INSTRUCTION[31 : 20] == 12'hf11);
    end
    if(when_CsrPlugin_l1264_1) begin
      execute_CsrPlugin_csr_3858 <= (decode_INSTRUCTION[31 : 20] == 12'hf12);
    end
    if(when_CsrPlugin_l1264_2) begin
      execute_CsrPlugin_csr_3859 <= (decode_INSTRUCTION[31 : 20] == 12'hf13);
    end
    if(when_CsrPlugin_l1264_3) begin
      execute_CsrPlugin_csr_3860 <= (decode_INSTRUCTION[31 : 20] == 12'hf14);
    end
    if(when_CsrPlugin_l1264_4) begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if(when_CsrPlugin_l1264_5) begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if(when_CsrPlugin_l1264_6) begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if(when_CsrPlugin_l1264_7) begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if(when_CsrPlugin_l1264_8) begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if(when_CsrPlugin_l1264_9) begin
      execute_CsrPlugin_csr_832 <= (decode_INSTRUCTION[31 : 20] == 12'h340);
    end
    if(when_CsrPlugin_l1264_10) begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if(when_CsrPlugin_l1264_11) begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if(when_CsrPlugin_l1264_12) begin
      execute_CsrPlugin_csr_770 <= (decode_INSTRUCTION[31 : 20] == 12'h302);
    end
    if(when_CsrPlugin_l1264_13) begin
      execute_CsrPlugin_csr_771 <= (decode_INSTRUCTION[31 : 20] == 12'h303);
    end
    if(when_CsrPlugin_l1264_14) begin
      execute_CsrPlugin_csr_256 <= (decode_INSTRUCTION[31 : 20] == 12'h100);
    end
    if(when_CsrPlugin_l1264_15) begin
      execute_CsrPlugin_csr_324 <= (decode_INSTRUCTION[31 : 20] == 12'h144);
    end
    if(when_CsrPlugin_l1264_16) begin
      execute_CsrPlugin_csr_260 <= (decode_INSTRUCTION[31 : 20] == 12'h104);
    end
    if(when_CsrPlugin_l1264_17) begin
      execute_CsrPlugin_csr_261 <= (decode_INSTRUCTION[31 : 20] == 12'h105);
    end
    if(when_CsrPlugin_l1264_18) begin
      execute_CsrPlugin_csr_321 <= (decode_INSTRUCTION[31 : 20] == 12'h141);
    end
    if(when_CsrPlugin_l1264_19) begin
      execute_CsrPlugin_csr_320 <= (decode_INSTRUCTION[31 : 20] == 12'h140);
    end
    if(when_CsrPlugin_l1264_20) begin
      execute_CsrPlugin_csr_322 <= (decode_INSTRUCTION[31 : 20] == 12'h142);
    end
    if(when_CsrPlugin_l1264_21) begin
      execute_CsrPlugin_csr_323 <= (decode_INSTRUCTION[31 : 20] == 12'h143);
    end
    if(when_CsrPlugin_l1264_22) begin
      execute_CsrPlugin_csr_384 <= (decode_INSTRUCTION[31 : 20] == 12'h180);
    end
    if(execute_CsrPlugin_csr_836) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mip_MSIP <= CsrPlugin_csrMapping_writeDataSignal[3];
      end
    end
    if(execute_CsrPlugin_csr_833) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mepc <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_832) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mscratch <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_261) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_stvec_base <= CsrPlugin_csrMapping_writeDataSignal[31 : 2];
        CsrPlugin_stvec_mode <= CsrPlugin_csrMapping_writeDataSignal[1 : 0];
      end
    end
    if(execute_CsrPlugin_csr_321) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_sepc <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_320) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_sscratch <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_322) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_scause_interrupt <= CsrPlugin_csrMapping_writeDataSignal[31];
        CsrPlugin_scause_exceptionCode <= CsrPlugin_csrMapping_writeDataSignal[3 : 0];
      end
    end
    if(execute_CsrPlugin_csr_323) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_stval <= CsrPlugin_csrMapping_writeDataSignal[31 : 0];
      end
    end
    if(execute_CsrPlugin_csr_384) begin
      if(execute_CsrPlugin_writeEnable) begin
        MmuPlugin_satp_asid <= CsrPlugin_csrMapping_writeDataSignal[30 : 22];
        MmuPlugin_satp_ppn <= CsrPlugin_csrMapping_writeDataSignal[19 : 0];
      end
    end
  end

  always @(posedge clk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready) begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != 4'b0000) || IBusCachedPlugin_incomingInstruction);
    if(writeBack_arbitration_isValid) begin
      DebugPlugin_busReadDataReg <= _zz_decode_RS2_2;
    end
    _zz_when_DebugPlugin_l244 <= debug_bus_cmd_payload_address[2];
    if(when_DebugPlugin_l284) begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @(posedge clk or posedge debugReset) begin
    if(debugReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      DebugPlugin_debugUsed <= 1'b0;
      DebugPlugin_disableEbreak <= 1'b0;
    end else begin
      if(when_DebugPlugin_l225) begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        DebugPlugin_debugUsed <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        case(switch_DebugPlugin_l256)
          6'h0 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(when_DebugPlugin_l260) begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(when_DebugPlugin_l260_1) begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(when_DebugPlugin_l261) begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(when_DebugPlugin_l261_1) begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(when_DebugPlugin_l262) begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(when_DebugPlugin_l263) begin
                DebugPlugin_godmode <= 1'b0;
              end
              if(when_DebugPlugin_l264) begin
                DebugPlugin_disableEbreak <= 1'b1;
              end
              if(when_DebugPlugin_l264_1) begin
                DebugPlugin_disableEbreak <= 1'b0;
              end
            end
          end
          default : begin
          end
        endcase
      end
      if(when_DebugPlugin_l284) begin
        if(when_DebugPlugin_l287) begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(when_DebugPlugin_l300) begin
        if(decode_arbitration_isValid) begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
    end
  end


endmodule

module DataCache (
  input               io_cpu_execute_isValid,
  input      [31:0]   io_cpu_execute_address,
  output reg          io_cpu_execute_haltIt,
  input               io_cpu_execute_args_wr,
  input      [1:0]    io_cpu_execute_args_size,
  input               io_cpu_execute_args_isLrsc,
  input               io_cpu_execute_args_isAmo,
  input               io_cpu_execute_args_amoCtrl_swap,
  input      [2:0]    io_cpu_execute_args_amoCtrl_alu,
  input               io_cpu_execute_args_totalyConsistent,
  output              io_cpu_execute_refilling,
  input               io_cpu_memory_isValid,
  input               io_cpu_memory_isStuck,
  output              io_cpu_memory_isWrite,
  input      [31:0]   io_cpu_memory_address,
  input      [31:0]   io_cpu_memory_mmuRsp_physicalAddress,
  input               io_cpu_memory_mmuRsp_isIoAccess,
  input               io_cpu_memory_mmuRsp_isPaging,
  input               io_cpu_memory_mmuRsp_allowRead,
  input               io_cpu_memory_mmuRsp_allowWrite,
  input               io_cpu_memory_mmuRsp_allowExecute,
  input               io_cpu_memory_mmuRsp_exception,
  input               io_cpu_memory_mmuRsp_refilling,
  input               io_cpu_memory_mmuRsp_bypassTranslation,
  input               io_cpu_memory_mmuRsp_ways_0_sel,
  input      [31:0]   io_cpu_memory_mmuRsp_ways_0_physical,
  input               io_cpu_memory_mmuRsp_ways_1_sel,
  input      [31:0]   io_cpu_memory_mmuRsp_ways_1_physical,
  input               io_cpu_memory_mmuRsp_ways_2_sel,
  input      [31:0]   io_cpu_memory_mmuRsp_ways_2_physical,
  input               io_cpu_memory_mmuRsp_ways_3_sel,
  input      [31:0]   io_cpu_memory_mmuRsp_ways_3_physical,
  input               io_cpu_writeBack_isValid,
  input               io_cpu_writeBack_isStuck,
  input               io_cpu_writeBack_isUser,
  output reg          io_cpu_writeBack_haltIt,
  output              io_cpu_writeBack_isWrite,
  input      [31:0]   io_cpu_writeBack_storeData,
  output reg [31:0]   io_cpu_writeBack_data,
  input      [31:0]   io_cpu_writeBack_address,
  output              io_cpu_writeBack_mmuException,
  output              io_cpu_writeBack_unalignedAccess,
  output reg          io_cpu_writeBack_accessError,
  output              io_cpu_writeBack_keepMemRspData,
  input               io_cpu_writeBack_fence_SW,
  input               io_cpu_writeBack_fence_SR,
  input               io_cpu_writeBack_fence_SO,
  input               io_cpu_writeBack_fence_SI,
  input               io_cpu_writeBack_fence_PW,
  input               io_cpu_writeBack_fence_PR,
  input               io_cpu_writeBack_fence_PO,
  input               io_cpu_writeBack_fence_PI,
  input      [3:0]    io_cpu_writeBack_fence_FM,
  output              io_cpu_writeBack_exclusiveOk,
  output reg          io_cpu_redo,
  input               io_cpu_flush_valid,
  output              io_cpu_flush_ready,
  output reg          io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output reg          io_mem_cmd_payload_wr,
  output              io_mem_cmd_payload_uncached,
  output reg [31:0]   io_mem_cmd_payload_address,
  output     [31:0]   io_mem_cmd_payload_data,
  output     [3:0]    io_mem_cmd_payload_mask,
  output reg [2:0]    io_mem_cmd_payload_size,
  output              io_mem_cmd_payload_last,
  input               io_mem_rsp_valid,
  input               io_mem_rsp_payload_last,
  input      [31:0]   io_mem_rsp_payload_data,
  input               io_mem_rsp_payload_error,
  input               clk,
  input               reset
);
  reg        [21:0]   _zz_ways_0_tags_port0;
  reg        [31:0]   _zz_ways_0_data_port0;
  wire       [21:0]   _zz_ways_0_tags_port;
  wire       [9:0]    _zz_stage0_dataColisions;
  wire       [9:0]    _zz__zz_stageA_dataColisions;
  wire       [31:0]   _zz_stageB_amo_addSub;
  wire       [31:0]   _zz_stageB_amo_addSub_1;
  wire       [31:0]   _zz_stageB_amo_addSub_2;
  wire       [31:0]   _zz_stageB_amo_addSub_3;
  wire       [31:0]   _zz_stageB_amo_addSub_4;
  wire       [1:0]    _zz_stageB_amo_addSub_5;
  wire       [1:0]    _zz_stageB_amo_addSub_6;
  wire       [1:0]    _zz_stageB_amo_addSub_7;
  wire       [0:0]    _zz_when;
  wire       [2:0]    _zz_loader_counter_valueNext;
  wire       [0:0]    _zz_loader_counter_valueNext_1;
  wire       [1:0]    _zz_loader_waysAllocator;
  reg                 _zz_1;
  reg                 _zz_2;
  wire                haltCpu;
  reg                 tagsReadCmd_valid;
  reg        [6:0]    tagsReadCmd_payload;
  reg                 tagsWriteCmd_valid;
  reg        [0:0]    tagsWriteCmd_payload_way;
  reg        [6:0]    tagsWriteCmd_payload_address;
  reg                 tagsWriteCmd_payload_data_valid;
  reg                 tagsWriteCmd_payload_data_error;
  reg        [19:0]   tagsWriteCmd_payload_data_address;
  reg                 tagsWriteLastCmd_valid;
  reg        [0:0]    tagsWriteLastCmd_payload_way;
  reg        [6:0]    tagsWriteLastCmd_payload_address;
  reg                 tagsWriteLastCmd_payload_data_valid;
  reg                 tagsWriteLastCmd_payload_data_error;
  reg        [19:0]   tagsWriteLastCmd_payload_data_address;
  reg                 dataReadCmd_valid;
  reg        [9:0]    dataReadCmd_payload;
  reg                 dataWriteCmd_valid;
  reg        [0:0]    dataWriteCmd_payload_way;
  reg        [9:0]    dataWriteCmd_payload_address;
  reg        [31:0]   dataWriteCmd_payload_data;
  reg        [3:0]    dataWriteCmd_payload_mask;
  wire                _zz_ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_error;
  wire       [19:0]   ways_0_tagsReadRsp_address;
  wire       [21:0]   _zz_ways_0_tagsReadRsp_valid_1;
  wire                _zz_ways_0_dataReadRspMem;
  wire       [31:0]   ways_0_dataReadRspMem;
  wire       [31:0]   ways_0_dataReadRsp;
  wire                when_DataCache_l634;
  wire                when_DataCache_l637;
  wire                when_DataCache_l656;
  wire                rspSync;
  wire                rspLast;
  reg                 memCmdSent;
  wire                when_DataCache_l678;
  wire                when_DataCache_l678_1;
  reg        [3:0]    _zz_stage0_mask;
  wire       [3:0]    stage0_mask;
  wire       [0:0]    stage0_dataColisions;
  wire       [0:0]    stage0_wayInvalidate;
  wire                when_DataCache_l763;
  reg                 stageA_request_wr;
  reg        [1:0]    stageA_request_size;
  reg                 stageA_request_isLrsc;
  reg                 stageA_request_isAmo;
  reg                 stageA_request_amoCtrl_swap;
  reg        [2:0]    stageA_request_amoCtrl_alu;
  reg                 stageA_request_totalyConsistent;
  wire                when_DataCache_l763_1;
  reg        [3:0]    stageA_mask;
  wire       [0:0]    stageA_wayHits;
  wire                when_DataCache_l763_2;
  reg        [0:0]    stageA_wayInvalidate;
  wire                when_DataCache_l763_3;
  reg        [0:0]    stage0_dataColisions_regNextWhen;
  wire       [0:0]    _zz_stageA_dataColisions;
  wire       [0:0]    stageA_dataColisions;
  wire                when_DataCache_l814;
  reg                 stageB_request_wr;
  reg        [1:0]    stageB_request_size;
  reg                 stageB_request_isLrsc;
  reg                 stageB_request_isAmo;
  reg                 stageB_request_amoCtrl_swap;
  reg        [2:0]    stageB_request_amoCtrl_alu;
  reg                 stageB_request_totalyConsistent;
  reg                 stageB_mmuRspFreeze;
  wire                when_DataCache_l816;
  reg        [31:0]   stageB_mmuRsp_physicalAddress;
  reg                 stageB_mmuRsp_isIoAccess;
  reg                 stageB_mmuRsp_isPaging;
  reg                 stageB_mmuRsp_allowRead;
  reg                 stageB_mmuRsp_allowWrite;
  reg                 stageB_mmuRsp_allowExecute;
  reg                 stageB_mmuRsp_exception;
  reg                 stageB_mmuRsp_refilling;
  reg                 stageB_mmuRsp_bypassTranslation;
  reg                 stageB_mmuRsp_ways_0_sel;
  reg        [31:0]   stageB_mmuRsp_ways_0_physical;
  reg                 stageB_mmuRsp_ways_1_sel;
  reg        [31:0]   stageB_mmuRsp_ways_1_physical;
  reg                 stageB_mmuRsp_ways_2_sel;
  reg        [31:0]   stageB_mmuRsp_ways_2_physical;
  reg                 stageB_mmuRsp_ways_3_sel;
  reg        [31:0]   stageB_mmuRsp_ways_3_physical;
  wire                when_DataCache_l813;
  reg                 stageB_tagsReadRsp_0_valid;
  reg                 stageB_tagsReadRsp_0_error;
  reg        [19:0]   stageB_tagsReadRsp_0_address;
  wire                when_DataCache_l813_1;
  reg        [31:0]   stageB_dataReadRsp_0;
  wire                when_DataCache_l812;
  reg        [0:0]    stageB_wayInvalidate;
  wire                stageB_consistancyHazard;
  wire                when_DataCache_l812_1;
  reg        [0:0]    stageB_dataColisions;
  wire                when_DataCache_l812_2;
  reg                 stageB_unaligned;
  wire                when_DataCache_l812_3;
  reg        [0:0]    stageB_waysHitsBeforeInvalidate;
  wire       [0:0]    stageB_waysHits;
  wire                stageB_waysHit;
  wire       [31:0]   stageB_dataMux;
  wire                when_DataCache_l812_4;
  reg        [3:0]    stageB_mask;
  reg                 stageB_loaderValid;
  wire       [31:0]   stageB_ioMemRspMuxed;
  reg                 stageB_flusher_waitDone;
  wire                stageB_flusher_hold;
  reg        [7:0]    stageB_flusher_counter;
  wire                when_DataCache_l842;
  wire                when_DataCache_l848;
  reg                 stageB_flusher_start;
  reg                 stageB_lrSc_reserved;
  wire                when_DataCache_l866;
  wire                stageB_isExternalLsrc;
  wire                stageB_isExternalAmo;
  reg        [31:0]   stageB_requestDataBypass;
  wire                stageB_amo_compare;
  wire                stageB_amo_unsigned;
  wire       [31:0]   stageB_amo_addSub;
  wire                stageB_amo_less;
  wire                stageB_amo_selectRf;
  wire       [2:0]    switch_Misc_l199;
  reg        [31:0]   stageB_amo_result;
  reg        [31:0]   stageB_amo_resultReg;
  reg                 stageB_amo_internal_resultRegValid;
  reg                 stageB_cpuWriteToCache;
  wire                when_DataCache_l911;
  wire                stageB_badPermissions;
  wire                stageB_loadStoreFault;
  wire                stageB_bypassCache;
  wire                when_DataCache_l980;
  wire                when_DataCache_l984;
  wire                when_DataCache_l989;
  wire                when_DataCache_l994;
  wire                when_DataCache_l997;
  wire                when_DataCache_l1005;
  wire                when_DataCache_l1010;
  wire                when_DataCache_l1017;
  wire                when_DataCache_l976;
  wire                when_DataCache_l1051;
  wire                when_DataCache_l1060;
  reg                 loader_valid;
  reg                 loader_counter_willIncrement;
  wire                loader_counter_willClear;
  reg        [2:0]    loader_counter_valueNext;
  reg        [2:0]    loader_counter_value;
  wire                loader_counter_willOverflowIfInc;
  wire                loader_counter_willOverflow;
  reg        [0:0]    loader_waysAllocator;
  reg                 loader_error;
  wire                loader_kill;
  reg                 loader_killReg;
  wire                when_DataCache_l1075;
  wire                loader_done;
  wire                when_DataCache_l1103;
  reg                 loader_valid_regNext;
  wire                when_DataCache_l1107;
  wire                when_DataCache_l1110;
  reg [21:0] ways_0_tags [0:127];
  reg [7:0] ways_0_data_symbol0 [0:1023];
  reg [7:0] ways_0_data_symbol1 [0:1023];
  reg [7:0] ways_0_data_symbol2 [0:1023];
  reg [7:0] ways_0_data_symbol3 [0:1023];
  reg [7:0] _zz_ways_0_datasymbol_read;
  reg [7:0] _zz_ways_0_datasymbol_read_1;
  reg [7:0] _zz_ways_0_datasymbol_read_2;
  reg [7:0] _zz_ways_0_datasymbol_read_3;

  assign _zz_stage0_dataColisions = (io_cpu_execute_address[11 : 2] >>> 0);
  assign _zz__zz_stageA_dataColisions = (io_cpu_memory_address[11 : 2] >>> 0);
  assign _zz_stageB_amo_addSub = ($signed(_zz_stageB_amo_addSub_1) + $signed(_zz_stageB_amo_addSub_4));
  assign _zz_stageB_amo_addSub_1 = ($signed(_zz_stageB_amo_addSub_2) + $signed(_zz_stageB_amo_addSub_3));
  assign _zz_stageB_amo_addSub_2 = io_cpu_writeBack_storeData[31 : 0];
  assign _zz_stageB_amo_addSub_3 = (stageB_amo_compare ? (~ stageB_dataMux[31 : 0]) : stageB_dataMux[31 : 0]);
  assign _zz_stageB_amo_addSub_5 = (stageB_amo_compare ? _zz_stageB_amo_addSub_6 : _zz_stageB_amo_addSub_7);
  assign _zz_stageB_amo_addSub_4 = {{30{_zz_stageB_amo_addSub_5[1]}}, _zz_stageB_amo_addSub_5};
  assign _zz_stageB_amo_addSub_6 = 2'b01;
  assign _zz_stageB_amo_addSub_7 = 2'b00;
  assign _zz_when = 1'b1;
  assign _zz_loader_counter_valueNext_1 = loader_counter_willIncrement;
  assign _zz_loader_counter_valueNext = {2'd0, _zz_loader_counter_valueNext_1};
  assign _zz_loader_waysAllocator = {loader_waysAllocator,loader_waysAllocator[0]};
  assign _zz_ways_0_tags_port = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  always @(posedge clk) begin
    if(_zz_ways_0_tagsReadRsp_valid) begin
      _zz_ways_0_tags_port0 <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @(posedge clk) begin
    if(_zz_2) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= _zz_ways_0_tags_port;
    end
  end

  always @(*) begin
    _zz_ways_0_data_port0 = {_zz_ways_0_datasymbol_read_3, _zz_ways_0_datasymbol_read_2, _zz_ways_0_datasymbol_read_1, _zz_ways_0_datasymbol_read};
  end
  always @(posedge clk) begin
    if(_zz_ways_0_dataReadRspMem) begin
      _zz_ways_0_datasymbol_read <= ways_0_data_symbol0[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_1 <= ways_0_data_symbol1[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_2 <= ways_0_data_symbol2[dataReadCmd_payload];
      _zz_ways_0_datasymbol_read_3 <= ways_0_data_symbol3[dataReadCmd_payload];
    end
  end

  always @(posedge clk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_1) begin
      ways_0_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_1) begin
      ways_0_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_1) begin
      ways_0_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_1) begin
      ways_0_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_DataCache_l637) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_DataCache_l634) begin
      _zz_2 = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  assign _zz_ways_0_tagsReadRsp_valid = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_ways_0_tagsReadRsp_valid_1 = _zz_ways_0_tags_port0;
  assign ways_0_tagsReadRsp_valid = _zz_ways_0_tagsReadRsp_valid_1[0];
  assign ways_0_tagsReadRsp_error = _zz_ways_0_tagsReadRsp_valid_1[1];
  assign ways_0_tagsReadRsp_address = _zz_ways_0_tagsReadRsp_valid_1[21 : 2];
  assign _zz_ways_0_dataReadRspMem = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_0_dataReadRspMem = _zz_ways_0_data_port0;
  assign ways_0_dataReadRsp = ways_0_dataReadRspMem[31 : 0];
  assign when_DataCache_l634 = (tagsWriteCmd_valid && tagsWriteCmd_payload_way[0]);
  assign when_DataCache_l637 = (dataWriteCmd_valid && dataWriteCmd_payload_way[0]);
  always @(*) begin
    tagsReadCmd_valid = 1'b0;
    if(when_DataCache_l656) begin
      tagsReadCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    tagsReadCmd_payload = 7'bxxxxxxx;
    if(when_DataCache_l656) begin
      tagsReadCmd_payload = io_cpu_execute_address[11 : 5];
    end
  end

  always @(*) begin
    dataReadCmd_valid = 1'b0;
    if(when_DataCache_l656) begin
      dataReadCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    dataReadCmd_payload = 10'bxxxxxxxxxx;
    if(when_DataCache_l656) begin
      dataReadCmd_payload = io_cpu_execute_address[11 : 2];
    end
  end

  always @(*) begin
    tagsWriteCmd_valid = 1'b0;
    if(when_DataCache_l842) begin
      tagsWriteCmd_valid = 1'b1;
    end
    if(when_DataCache_l1051) begin
      tagsWriteCmd_valid = 1'b0;
    end
    if(loader_done) begin
      tagsWriteCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_way = 1'bx;
    if(when_DataCache_l842) begin
      tagsWriteCmd_payload_way = 1'b1;
    end
    if(loader_done) begin
      tagsWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_address = 7'bxxxxxxx;
    if(when_DataCache_l842) begin
      tagsWriteCmd_payload_address = stageB_flusher_counter[6:0];
    end
    if(loader_done) begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_valid = 1'bx;
    if(when_DataCache_l842) begin
      tagsWriteCmd_payload_data_valid = 1'b0;
    end
    if(loader_done) begin
      tagsWriteCmd_payload_data_valid = (! (loader_kill || loader_killReg));
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_error = 1'bx;
    if(loader_done) begin
      tagsWriteCmd_payload_data_error = (loader_error || (io_mem_rsp_valid && io_mem_rsp_payload_error));
    end
  end

  always @(*) begin
    tagsWriteCmd_payload_data_address = 20'bxxxxxxxxxxxxxxxxxxxx;
    if(loader_done) begin
      tagsWriteCmd_payload_data_address = stageB_mmuRsp_physicalAddress[31 : 12];
    end
  end

  always @(*) begin
    dataWriteCmd_valid = 1'b0;
    if(stageB_cpuWriteToCache) begin
      if(when_DataCache_l911) begin
        dataWriteCmd_valid = 1'b1;
      end
    end
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l976) begin
          if(when_DataCache_l989) begin
            if(stageB_request_isAmo) begin
              if(when_DataCache_l997) begin
                dataWriteCmd_valid = 1'b0;
              end
            end
            if(when_DataCache_l1010) begin
              dataWriteCmd_valid = 1'b0;
            end
          end
        end
      end
    end
    if(when_DataCache_l1051) begin
      dataWriteCmd_valid = 1'b0;
    end
    if(when_DataCache_l1075) begin
      dataWriteCmd_valid = 1'b1;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_way = 1'bx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_way = stageB_waysHits;
    end
    if(when_DataCache_l1075) begin
      dataWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_address = 10'bxxxxxxxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 2];
    end
    if(when_DataCache_l1075) begin
      dataWriteCmd_payload_address = {stageB_mmuRsp_physicalAddress[11 : 5],loader_counter_value};
    end
  end

  always @(*) begin
    dataWriteCmd_payload_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_data[31 : 0] = stageB_requestDataBypass;
    end
    if(when_DataCache_l1075) begin
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
    end
  end

  always @(*) begin
    dataWriteCmd_payload_mask = 4'bxxxx;
    if(stageB_cpuWriteToCache) begin
      dataWriteCmd_payload_mask = 4'b0000;
      if(_zz_when[0]) begin
        dataWriteCmd_payload_mask[3 : 0] = stageB_mask;
      end
    end
    if(when_DataCache_l1075) begin
      dataWriteCmd_payload_mask = 4'b1111;
    end
  end

  assign when_DataCache_l656 = (io_cpu_execute_isValid && (! io_cpu_memory_isStuck));
  always @(*) begin
    io_cpu_execute_haltIt = 1'b0;
    if(when_DataCache_l842) begin
      io_cpu_execute_haltIt = 1'b1;
    end
  end

  assign rspSync = 1'b1;
  assign rspLast = 1'b1;
  assign when_DataCache_l678 = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign when_DataCache_l678_1 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    _zz_stage0_mask = 4'bxxxx;
    case(io_cpu_execute_args_size)
      2'b00 : begin
        _zz_stage0_mask = 4'b0001;
      end
      2'b01 : begin
        _zz_stage0_mask = 4'b0011;
      end
      2'b10 : begin
        _zz_stage0_mask = 4'b1111;
      end
      default : begin
      end
    endcase
  end

  assign stage0_mask = (_zz_stage0_mask <<< io_cpu_execute_address[1 : 0]);
  assign stage0_dataColisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_stage0_dataColisions)) && ((stage0_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stage0_wayInvalidate = 1'b0;
  assign when_DataCache_l763 = (! io_cpu_memory_isStuck);
  assign when_DataCache_l763_1 = (! io_cpu_memory_isStuck);
  assign io_cpu_memory_isWrite = stageA_request_wr;
  assign stageA_wayHits = ((io_cpu_memory_mmuRsp_physicalAddress[31 : 12] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign when_DataCache_l763_2 = (! io_cpu_memory_isStuck);
  assign when_DataCache_l763_3 = (! io_cpu_memory_isStuck);
  assign _zz_stageA_dataColisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz__zz_stageA_dataColisions)) && ((stageA_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stageA_dataColisions = (stage0_dataColisions_regNextWhen | _zz_stageA_dataColisions);
  assign when_DataCache_l814 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    stageB_mmuRspFreeze = 1'b0;
    if(when_DataCache_l1110) begin
      stageB_mmuRspFreeze = 1'b1;
    end
  end

  assign when_DataCache_l816 = ((! io_cpu_writeBack_isStuck) && (! stageB_mmuRspFreeze));
  assign when_DataCache_l813 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l813_1 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l812 = (! io_cpu_writeBack_isStuck);
  assign stageB_consistancyHazard = 1'b0;
  assign when_DataCache_l812_1 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l812_2 = (! io_cpu_writeBack_isStuck);
  assign when_DataCache_l812_3 = (! io_cpu_writeBack_isStuck);
  assign stageB_waysHits = (stageB_waysHitsBeforeInvalidate & (~ stageB_wayInvalidate));
  assign stageB_waysHit = (stageB_waysHits != 1'b0);
  assign stageB_dataMux = stageB_dataReadRsp_0;
  assign when_DataCache_l812_4 = (! io_cpu_writeBack_isStuck);
  always @(*) begin
    stageB_loaderValid = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l976) begin
          if(!when_DataCache_l989) begin
            if(io_mem_cmd_ready) begin
              stageB_loaderValid = 1'b1;
            end
          end
        end
      end
    end
    if(when_DataCache_l1051) begin
      stageB_loaderValid = 1'b0;
    end
  end

  assign stageB_ioMemRspMuxed = io_mem_rsp_payload_data[31 : 0];
  always @(*) begin
    io_cpu_writeBack_haltIt = 1'b1;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(when_DataCache_l976) begin
          if(when_DataCache_l980) begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
          if(when_DataCache_l984) begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
        end else begin
          if(when_DataCache_l989) begin
            if(when_DataCache_l994) begin
              io_cpu_writeBack_haltIt = 1'b0;
            end
            if(stageB_request_isAmo) begin
              if(when_DataCache_l997) begin
                io_cpu_writeBack_haltIt = 1'b1;
              end
            end
            if(when_DataCache_l1010) begin
              io_cpu_writeBack_haltIt = 1'b0;
            end
          end
        end
      end
    end
    if(when_DataCache_l1051) begin
      io_cpu_writeBack_haltIt = 1'b0;
    end
  end

  assign stageB_flusher_hold = 1'b0;
  assign when_DataCache_l842 = (! stageB_flusher_counter[7]);
  assign when_DataCache_l848 = (! stageB_flusher_hold);
  assign io_cpu_flush_ready = (stageB_flusher_waitDone && stageB_flusher_counter[7]);
  assign when_DataCache_l866 = ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_isStuck)) && stageB_request_isLrsc);
  assign stageB_isExternalLsrc = 1'b0;
  assign stageB_isExternalAmo = 1'b0;
  always @(*) begin
    stageB_requestDataBypass = io_cpu_writeBack_storeData;
    if(stageB_request_isAmo) begin
      stageB_requestDataBypass[31 : 0] = stageB_amo_resultReg;
    end
  end

  assign stageB_amo_compare = stageB_request_amoCtrl_alu[2];
  assign stageB_amo_unsigned = (stageB_request_amoCtrl_alu[2 : 1] == 2'b11);
  assign stageB_amo_addSub = _zz_stageB_amo_addSub;
  assign stageB_amo_less = ((io_cpu_writeBack_storeData[31] == stageB_dataMux[31]) ? stageB_amo_addSub[31] : (stageB_amo_unsigned ? stageB_dataMux[31] : io_cpu_writeBack_storeData[31]));
  assign stageB_amo_selectRf = (stageB_request_amoCtrl_swap ? 1'b1 : (stageB_request_amoCtrl_alu[0] ^ stageB_amo_less));
  assign switch_Misc_l199 = (stageB_request_amoCtrl_alu | {stageB_request_amoCtrl_swap,2'b00});
  always @(*) begin
    case(switch_Misc_l199)
      3'b000 : begin
        stageB_amo_result = stageB_amo_addSub;
      end
      3'b001 : begin
        stageB_amo_result = (io_cpu_writeBack_storeData[31 : 0] ^ stageB_dataMux[31 : 0]);
      end
      3'b010 : begin
        stageB_amo_result = (io_cpu_writeBack_storeData[31 : 0] | stageB_dataMux[31 : 0]);
      end
      3'b011 : begin
        stageB_amo_result = (io_cpu_writeBack_storeData[31 : 0] & stageB_dataMux[31 : 0]);
      end
      default : begin
        stageB_amo_result = (stageB_amo_selectRf ? io_cpu_writeBack_storeData[31 : 0] : stageB_dataMux[31 : 0]);
      end
    endcase
  end

  always @(*) begin
    stageB_cpuWriteToCache = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l976) begin
          if(when_DataCache_l989) begin
            stageB_cpuWriteToCache = 1'b1;
          end
        end
      end
    end
  end

  assign when_DataCache_l911 = (stageB_request_wr && stageB_waysHit);
  assign stageB_badPermissions = (((! stageB_mmuRsp_allowWrite) && stageB_request_wr) || ((! stageB_mmuRsp_allowRead) && ((! stageB_request_wr) || stageB_request_isAmo)));
  assign stageB_loadStoreFault = (io_cpu_writeBack_isValid && (stageB_mmuRsp_exception || stageB_badPermissions));
  always @(*) begin
    io_cpu_redo = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l976) begin
          if(when_DataCache_l989) begin
            if(when_DataCache_l1005) begin
              io_cpu_redo = 1'b1;
            end
          end
        end
      end
    end
    if(when_DataCache_l1060) begin
      io_cpu_redo = 1'b1;
    end
    if(when_DataCache_l1107) begin
      io_cpu_redo = 1'b1;
    end
  end

  always @(*) begin
    io_cpu_writeBack_accessError = 1'b0;
    if(stageB_bypassCache) begin
      io_cpu_writeBack_accessError = ((((! stageB_request_wr) && 1'b1) && io_mem_rsp_valid) && io_mem_rsp_payload_error);
    end else begin
      io_cpu_writeBack_accessError = (((stageB_waysHits & stageB_tagsReadRsp_0_error) != 1'b0) || (stageB_loadStoreFault && (! stageB_mmuRsp_isPaging)));
    end
  end

  assign io_cpu_writeBack_mmuException = (stageB_loadStoreFault && stageB_mmuRsp_isPaging);
  assign io_cpu_writeBack_unalignedAccess = (io_cpu_writeBack_isValid && stageB_unaligned);
  assign io_cpu_writeBack_isWrite = stageB_request_wr;
  always @(*) begin
    io_mem_cmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(when_DataCache_l976) begin
          io_mem_cmd_valid = (! memCmdSent);
          if(when_DataCache_l984) begin
            io_mem_cmd_valid = 1'b0;
          end
        end else begin
          if(when_DataCache_l989) begin
            if(stageB_request_wr) begin
              io_mem_cmd_valid = 1'b1;
            end
            if(stageB_request_isAmo) begin
              if(when_DataCache_l997) begin
                io_mem_cmd_valid = 1'b0;
              end
            end
            if(when_DataCache_l1005) begin
              io_mem_cmd_valid = 1'b0;
            end
            if(when_DataCache_l1010) begin
              io_mem_cmd_valid = 1'b0;
            end
          end else begin
            if(when_DataCache_l1017) begin
              io_mem_cmd_valid = 1'b1;
            end
          end
        end
      end
    end
    if(when_DataCache_l1051) begin
      io_mem_cmd_valid = 1'b0;
    end
  end

  always @(*) begin
    io_mem_cmd_payload_address = stageB_mmuRsp_physicalAddress;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l976) begin
          if(!when_DataCache_l989) begin
            io_mem_cmd_payload_address[4 : 0] = 5'h0;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_last = 1'b1;
  always @(*) begin
    io_mem_cmd_payload_wr = stageB_request_wr;
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l976) begin
          if(!when_DataCache_l989) begin
            io_mem_cmd_payload_wr = 1'b0;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_mask = stageB_mask;
  assign io_mem_cmd_payload_data = stageB_requestDataBypass;
  assign io_mem_cmd_payload_uncached = stageB_mmuRsp_isIoAccess;
  always @(*) begin
    io_mem_cmd_payload_size = {1'd0, stageB_request_size};
    if(io_cpu_writeBack_isValid) begin
      if(!stageB_isExternalAmo) begin
        if(!when_DataCache_l976) begin
          if(!when_DataCache_l989) begin
            io_mem_cmd_payload_size = 3'b101;
          end
        end
      end
    end
  end

  assign stageB_bypassCache = ((stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc) || stageB_isExternalAmo);
  assign io_cpu_writeBack_keepMemRspData = 1'b0;
  assign when_DataCache_l980 = ((! stageB_request_wr) ? (io_mem_rsp_valid && rspSync) : io_mem_cmd_ready);
  assign when_DataCache_l984 = (stageB_request_isLrsc && (! stageB_lrSc_reserved));
  assign when_DataCache_l989 = (stageB_waysHit || (stageB_request_wr && (! stageB_request_isAmo)));
  assign when_DataCache_l994 = ((! stageB_request_wr) || io_mem_cmd_ready);
  assign when_DataCache_l997 = (! stageB_amo_internal_resultRegValid);
  assign when_DataCache_l1005 = (((! stageB_request_wr) || stageB_request_isAmo) && ((stageB_dataColisions & stageB_waysHits) != 1'b0));
  assign when_DataCache_l1010 = (stageB_request_isLrsc && (! stageB_lrSc_reserved));
  assign when_DataCache_l1017 = (! memCmdSent);
  assign when_DataCache_l976 = (stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc);
  always @(*) begin
    if(stageB_bypassCache) begin
      io_cpu_writeBack_data = stageB_ioMemRspMuxed;
    end else begin
      io_cpu_writeBack_data = stageB_dataMux;
    end
  end

  assign io_cpu_writeBack_exclusiveOk = stageB_lrSc_reserved;
  assign when_DataCache_l1051 = ((((stageB_consistancyHazard || stageB_mmuRsp_refilling) || io_cpu_writeBack_accessError) || io_cpu_writeBack_mmuException) || io_cpu_writeBack_unalignedAccess);
  assign when_DataCache_l1060 = (io_cpu_writeBack_isValid && (stageB_mmuRsp_refilling || stageB_consistancyHazard));
  always @(*) begin
    loader_counter_willIncrement = 1'b0;
    if(when_DataCache_l1075) begin
      loader_counter_willIncrement = 1'b1;
    end
  end

  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == 3'b111);
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @(*) begin
    loader_counter_valueNext = (loader_counter_value + _zz_loader_counter_valueNext);
    if(loader_counter_willClear) begin
      loader_counter_valueNext = 3'b000;
    end
  end

  assign loader_kill = 1'b0;
  assign when_DataCache_l1075 = ((loader_valid && io_mem_rsp_valid) && rspLast);
  assign loader_done = loader_counter_willOverflow;
  assign when_DataCache_l1103 = (! loader_valid);
  assign when_DataCache_l1107 = (loader_valid && (! loader_valid_regNext));
  assign io_cpu_execute_refilling = loader_valid;
  assign when_DataCache_l1110 = (stageB_loaderValid || loader_valid);
  always @(posedge clk) begin
    tagsWriteLastCmd_valid <= tagsWriteCmd_valid;
    tagsWriteLastCmd_payload_way <= tagsWriteCmd_payload_way;
    tagsWriteLastCmd_payload_address <= tagsWriteCmd_payload_address;
    tagsWriteLastCmd_payload_data_valid <= tagsWriteCmd_payload_data_valid;
    tagsWriteLastCmd_payload_data_error <= tagsWriteCmd_payload_data_error;
    tagsWriteLastCmd_payload_data_address <= tagsWriteCmd_payload_data_address;
    if(when_DataCache_l763) begin
      stageA_request_wr <= io_cpu_execute_args_wr;
      stageA_request_size <= io_cpu_execute_args_size;
      stageA_request_isLrsc <= io_cpu_execute_args_isLrsc;
      stageA_request_isAmo <= io_cpu_execute_args_isAmo;
      stageA_request_amoCtrl_swap <= io_cpu_execute_args_amoCtrl_swap;
      stageA_request_amoCtrl_alu <= io_cpu_execute_args_amoCtrl_alu;
      stageA_request_totalyConsistent <= io_cpu_execute_args_totalyConsistent;
    end
    if(when_DataCache_l763_1) begin
      stageA_mask <= stage0_mask;
    end
    if(when_DataCache_l763_2) begin
      stageA_wayInvalidate <= stage0_wayInvalidate;
    end
    if(when_DataCache_l763_3) begin
      stage0_dataColisions_regNextWhen <= stage0_dataColisions;
    end
    if(when_DataCache_l814) begin
      stageB_request_wr <= stageA_request_wr;
      stageB_request_size <= stageA_request_size;
      stageB_request_isLrsc <= stageA_request_isLrsc;
      stageB_request_isAmo <= stageA_request_isAmo;
      stageB_request_amoCtrl_swap <= stageA_request_amoCtrl_swap;
      stageB_request_amoCtrl_alu <= stageA_request_amoCtrl_alu;
      stageB_request_totalyConsistent <= stageA_request_totalyConsistent;
    end
    if(when_DataCache_l816) begin
      stageB_mmuRsp_physicalAddress <= io_cpu_memory_mmuRsp_physicalAddress;
      stageB_mmuRsp_isIoAccess <= io_cpu_memory_mmuRsp_isIoAccess;
      stageB_mmuRsp_isPaging <= io_cpu_memory_mmuRsp_isPaging;
      stageB_mmuRsp_allowRead <= io_cpu_memory_mmuRsp_allowRead;
      stageB_mmuRsp_allowWrite <= io_cpu_memory_mmuRsp_allowWrite;
      stageB_mmuRsp_allowExecute <= io_cpu_memory_mmuRsp_allowExecute;
      stageB_mmuRsp_exception <= io_cpu_memory_mmuRsp_exception;
      stageB_mmuRsp_refilling <= io_cpu_memory_mmuRsp_refilling;
      stageB_mmuRsp_bypassTranslation <= io_cpu_memory_mmuRsp_bypassTranslation;
      stageB_mmuRsp_ways_0_sel <= io_cpu_memory_mmuRsp_ways_0_sel;
      stageB_mmuRsp_ways_0_physical <= io_cpu_memory_mmuRsp_ways_0_physical;
      stageB_mmuRsp_ways_1_sel <= io_cpu_memory_mmuRsp_ways_1_sel;
      stageB_mmuRsp_ways_1_physical <= io_cpu_memory_mmuRsp_ways_1_physical;
      stageB_mmuRsp_ways_2_sel <= io_cpu_memory_mmuRsp_ways_2_sel;
      stageB_mmuRsp_ways_2_physical <= io_cpu_memory_mmuRsp_ways_2_physical;
      stageB_mmuRsp_ways_3_sel <= io_cpu_memory_mmuRsp_ways_3_sel;
      stageB_mmuRsp_ways_3_physical <= io_cpu_memory_mmuRsp_ways_3_physical;
    end
    if(when_DataCache_l813) begin
      stageB_tagsReadRsp_0_valid <= ways_0_tagsReadRsp_valid;
      stageB_tagsReadRsp_0_error <= ways_0_tagsReadRsp_error;
      stageB_tagsReadRsp_0_address <= ways_0_tagsReadRsp_address;
    end
    if(when_DataCache_l813_1) begin
      stageB_dataReadRsp_0 <= ways_0_dataReadRsp;
    end
    if(when_DataCache_l812) begin
      stageB_wayInvalidate <= stageA_wayInvalidate;
    end
    if(when_DataCache_l812_1) begin
      stageB_dataColisions <= stageA_dataColisions;
    end
    if(when_DataCache_l812_2) begin
      stageB_unaligned <= ({((stageA_request_size == 2'b10) && (io_cpu_memory_address[1 : 0] != 2'b00)),((stageA_request_size == 2'b01) && (io_cpu_memory_address[0 : 0] != 1'b0))} != 2'b00);
    end
    if(when_DataCache_l812_3) begin
      stageB_waysHitsBeforeInvalidate <= stageA_wayHits;
    end
    if(when_DataCache_l812_4) begin
      stageB_mask <= stageA_mask;
    end
    stageB_amo_internal_resultRegValid <= io_cpu_writeBack_isStuck;
    stageB_amo_resultReg <= stageB_amo_result;
    loader_valid_regNext <= loader_valid;
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      memCmdSent <= 1'b0;
      stageB_flusher_waitDone <= 1'b0;
      stageB_flusher_counter <= 8'h0;
      stageB_flusher_start <= 1'b1;
      stageB_lrSc_reserved <= 1'b0;
      loader_valid <= 1'b0;
      loader_counter_value <= 3'b000;
      loader_waysAllocator <= 1'b1;
      loader_error <= 1'b0;
      loader_killReg <= 1'b0;
    end else begin
      if(when_DataCache_l678) begin
        memCmdSent <= 1'b1;
      end
      if(when_DataCache_l678_1) begin
        memCmdSent <= 1'b0;
      end
      if(io_cpu_flush_ready) begin
        stageB_flusher_waitDone <= 1'b0;
      end
      if(when_DataCache_l842) begin
        if(when_DataCache_l848) begin
          stageB_flusher_counter <= (stageB_flusher_counter + 8'h01);
        end
      end
      stageB_flusher_start <= (((((((! stageB_flusher_waitDone) && (! stageB_flusher_start)) && io_cpu_flush_valid) && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
      if(stageB_flusher_start) begin
        stageB_flusher_waitDone <= 1'b1;
        stageB_flusher_counter <= 8'h0;
      end
      if(when_DataCache_l866) begin
        stageB_lrSc_reserved <= (! stageB_request_wr);
      end
      if(when_DataCache_l1051) begin
        stageB_lrSc_reserved <= stageB_lrSc_reserved;
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck)));
        `else
          if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))) begin
            $display("ERROR writeBack stuck by another plugin is not allowed");
          end
        `endif
      `endif
      if(stageB_loaderValid) begin
        loader_valid <= 1'b1;
      end
      loader_counter_value <= loader_counter_valueNext;
      if(loader_kill) begin
        loader_killReg <= 1'b1;
      end
      if(when_DataCache_l1075) begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_done) begin
        loader_valid <= 1'b0;
        loader_error <= 1'b0;
        loader_killReg <= 1'b0;
      end
      if(when_DataCache_l1103) begin
        loader_waysAllocator <= _zz_loader_waysAllocator[0:0];
      end
    end
  end


endmodule

module InstructionCache (
  input               io_flush,
  input               io_cpu_prefetch_isValid,
  output reg          io_cpu_prefetch_haltIt,
  input      [31:0]   io_cpu_prefetch_pc,
  input               io_cpu_fetch_isValid,
  input               io_cpu_fetch_isStuck,
  input               io_cpu_fetch_isRemoved,
  input      [31:0]   io_cpu_fetch_pc,
  output     [31:0]   io_cpu_fetch_data,
  input      [31:0]   io_cpu_fetch_mmuRsp_physicalAddress,
  input               io_cpu_fetch_mmuRsp_isIoAccess,
  input               io_cpu_fetch_mmuRsp_isPaging,
  input               io_cpu_fetch_mmuRsp_allowRead,
  input               io_cpu_fetch_mmuRsp_allowWrite,
  input               io_cpu_fetch_mmuRsp_allowExecute,
  input               io_cpu_fetch_mmuRsp_exception,
  input               io_cpu_fetch_mmuRsp_refilling,
  input               io_cpu_fetch_mmuRsp_bypassTranslation,
  input               io_cpu_fetch_mmuRsp_ways_0_sel,
  input      [31:0]   io_cpu_fetch_mmuRsp_ways_0_physical,
  input               io_cpu_fetch_mmuRsp_ways_1_sel,
  input      [31:0]   io_cpu_fetch_mmuRsp_ways_1_physical,
  input               io_cpu_fetch_mmuRsp_ways_2_sel,
  input      [31:0]   io_cpu_fetch_mmuRsp_ways_2_physical,
  input               io_cpu_fetch_mmuRsp_ways_3_sel,
  input      [31:0]   io_cpu_fetch_mmuRsp_ways_3_physical,
  output     [31:0]   io_cpu_fetch_physicalAddress,
  input               io_cpu_decode_isValid,
  input               io_cpu_decode_isStuck,
  input      [31:0]   io_cpu_decode_pc,
  output     [31:0]   io_cpu_decode_physicalAddress,
  output     [31:0]   io_cpu_decode_data,
  output              io_cpu_decode_cacheMiss,
  output              io_cpu_decode_error,
  output              io_cpu_decode_mmuRefilling,
  output              io_cpu_decode_mmuException,
  input               io_cpu_decode_isUser,
  input               io_cpu_fill_valid,
  input      [31:0]   io_cpu_fill_payload,
  output              io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output     [31:0]   io_mem_cmd_payload_address,
  output     [2:0]    io_mem_cmd_payload_size,
  input               io_mem_rsp_valid,
  input      [31:0]   io_mem_rsp_payload_data,
  input               io_mem_rsp_payload_error,
  input      [2:0]    _zz_when_Fetcher_l398,
  input      [31:0]   _zz_io_cpu_fetch_data_regNextWhen,
  input               clk,
  input               reset
);
  reg        [31:0]   _zz_banks_0_port1;
  reg        [21:0]   _zz_ways_0_tags_port1;
  wire       [21:0]   _zz_ways_0_tags_port;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 lineLoader_fire;
  reg                 lineLoader_valid;
  (* keep , syn_keep *) reg        [31:0]   lineLoader_address /* synthesis syn_keep = 1 */ ;
  reg                 lineLoader_hadError;
  reg                 lineLoader_flushPending;
  reg        [7:0]    lineLoader_flushCounter;
  wire                when_InstructionCache_l338;
  reg                 _zz_when_InstructionCache_l342;
  wire                when_InstructionCache_l342;
  wire                when_InstructionCache_l351;
  reg                 lineLoader_cmdSent;
  wire                when_InstructionCache_l358;
  wire                when_Utils_l357;
  reg                 lineLoader_wayToAllocate_willIncrement;
  wire                lineLoader_wayToAllocate_willClear;
  wire                lineLoader_wayToAllocate_willOverflowIfInc;
  wire                lineLoader_wayToAllocate_willOverflow;
  (* keep , syn_keep *) reg        [2:0]    lineLoader_wordIndex /* synthesis syn_keep = 1 */ ;
  wire                lineLoader_write_tag_0_valid;
  wire       [6:0]    lineLoader_write_tag_0_payload_address;
  wire                lineLoader_write_tag_0_payload_data_valid;
  wire                lineLoader_write_tag_0_payload_data_error;
  wire       [19:0]   lineLoader_write_tag_0_payload_data_address;
  wire                lineLoader_write_data_0_valid;
  wire       [9:0]    lineLoader_write_data_0_payload_address;
  wire       [31:0]   lineLoader_write_data_0_payload_data;
  wire                when_InstructionCache_l401;
  wire       [9:0]    _zz_fetchStage_read_banksValue_0_dataMem;
  wire                _zz_fetchStage_read_banksValue_0_dataMem_1;
  wire       [31:0]   fetchStage_read_banksValue_0_dataMem;
  wire       [31:0]   fetchStage_read_banksValue_0_data;
  wire       [6:0]    _zz_fetchStage_read_waysValues_0_tag_valid;
  wire                _zz_fetchStage_read_waysValues_0_tag_valid_1;
  wire                fetchStage_read_waysValues_0_tag_valid;
  wire                fetchStage_read_waysValues_0_tag_error;
  wire       [19:0]   fetchStage_read_waysValues_0_tag_address;
  wire       [21:0]   _zz_fetchStage_read_waysValues_0_tag_valid_2;
  wire                fetchStage_hit_hits_0;
  wire                fetchStage_hit_valid;
  wire                fetchStage_hit_error;
  wire       [31:0]   fetchStage_hit_data;
  wire       [31:0]   fetchStage_hit_word;
  wire                when_InstructionCache_l435;
  reg        [31:0]   io_cpu_fetch_data_regNextWhen;
  wire                when_InstructionCache_l459;
  reg        [31:0]   decodeStage_mmuRsp_physicalAddress;
  reg                 decodeStage_mmuRsp_isIoAccess;
  reg                 decodeStage_mmuRsp_isPaging;
  reg                 decodeStage_mmuRsp_allowRead;
  reg                 decodeStage_mmuRsp_allowWrite;
  reg                 decodeStage_mmuRsp_allowExecute;
  reg                 decodeStage_mmuRsp_exception;
  reg                 decodeStage_mmuRsp_refilling;
  reg                 decodeStage_mmuRsp_bypassTranslation;
  reg                 decodeStage_mmuRsp_ways_0_sel;
  reg        [31:0]   decodeStage_mmuRsp_ways_0_physical;
  reg                 decodeStage_mmuRsp_ways_1_sel;
  reg        [31:0]   decodeStage_mmuRsp_ways_1_physical;
  reg                 decodeStage_mmuRsp_ways_2_sel;
  reg        [31:0]   decodeStage_mmuRsp_ways_2_physical;
  reg                 decodeStage_mmuRsp_ways_3_sel;
  reg        [31:0]   decodeStage_mmuRsp_ways_3_physical;
  wire                when_InstructionCache_l459_1;
  reg                 decodeStage_hit_valid;
  wire                when_InstructionCache_l459_2;
  reg                 decodeStage_hit_error;
  wire                when_Fetcher_l398;
  reg [31:0] banks_0 [0:1023];
  reg [21:0] ways_0_tags [0:127];

  assign _zz_ways_0_tags_port = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  always @(posedge clk) begin
    if(_zz_1) begin
      banks_0[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @(posedge clk) begin
    if(_zz_fetchStage_read_banksValue_0_dataMem_1) begin
      _zz_banks_0_port1 <= banks_0[_zz_fetchStage_read_banksValue_0_dataMem];
    end
  end

  always @(posedge clk) begin
    if(_zz_2) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_ways_0_tags_port;
    end
  end

  always @(posedge clk) begin
    if(_zz_fetchStage_read_waysValues_0_tag_valid_1) begin
      _zz_ways_0_tags_port1 <= ways_0_tags[_zz_fetchStage_read_waysValues_0_tag_valid];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(lineLoader_write_data_0_valid) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(lineLoader_write_tag_0_valid) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid) begin
      if(when_InstructionCache_l401) begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @(*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(when_InstructionCache_l338) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(when_InstructionCache_l342) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush) begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  assign when_InstructionCache_l338 = (! lineLoader_flushCounter[7]);
  assign when_InstructionCache_l342 = (! _zz_when_InstructionCache_l342);
  assign when_InstructionCache_l351 = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign when_InstructionCache_l358 = (io_mem_cmd_valid && io_mem_cmd_ready);
  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 5],5'h0};
  assign io_mem_cmd_payload_size = 3'b101;
  assign when_Utils_l357 = (! lineLoader_valid);
  always @(*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if(when_Utils_l357) begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = 1'b1;
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  assign lineLoader_write_tag_0_valid = ((1'b1 && lineLoader_fire) || (! lineLoader_flushCounter[7]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[7] ? lineLoader_address[11 : 5] : lineLoader_flushCounter[6 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[7];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && 1'b1);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[11 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign when_InstructionCache_l401 = (lineLoader_wordIndex == 3'b111);
  assign _zz_fetchStage_read_banksValue_0_dataMem = io_cpu_prefetch_pc[11 : 2];
  assign _zz_fetchStage_read_banksValue_0_dataMem_1 = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_banksValue_0_dataMem = _zz_banks_0_port1;
  assign fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[31 : 0];
  assign _zz_fetchStage_read_waysValues_0_tag_valid = io_cpu_prefetch_pc[11 : 5];
  assign _zz_fetchStage_read_waysValues_0_tag_valid_1 = (! io_cpu_fetch_isStuck);
  assign _zz_fetchStage_read_waysValues_0_tag_valid_2 = _zz_ways_0_tags_port1;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_fetchStage_read_waysValues_0_tag_valid_2[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_fetchStage_read_waysValues_0_tag_valid_2[1];
  assign fetchStage_read_waysValues_0_tag_address = _zz_fetchStage_read_waysValues_0_tag_valid_2[21 : 2];
  assign fetchStage_hit_hits_0 = (fetchStage_read_waysValues_0_tag_valid && (fetchStage_read_waysValues_0_tag_address == io_cpu_fetch_mmuRsp_physicalAddress[31 : 12]));
  assign fetchStage_hit_valid = (fetchStage_hit_hits_0 != 1'b0);
  assign fetchStage_hit_error = fetchStage_read_waysValues_0_tag_error;
  assign fetchStage_hit_data = fetchStage_read_banksValue_0_data;
  assign fetchStage_hit_word = fetchStage_hit_data;
  assign io_cpu_fetch_data = fetchStage_hit_word;
  assign when_InstructionCache_l435 = (! io_cpu_decode_isStuck);
  assign io_cpu_decode_data = io_cpu_fetch_data_regNextWhen;
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuRsp_physicalAddress;
  assign when_InstructionCache_l459 = (! io_cpu_decode_isStuck);
  assign when_InstructionCache_l459_1 = (! io_cpu_decode_isStuck);
  assign when_InstructionCache_l459_2 = (! io_cpu_decode_isStuck);
  assign io_cpu_decode_cacheMiss = (! decodeStage_hit_valid);
  assign io_cpu_decode_error = (decodeStage_hit_error || ((! decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute))));
  assign io_cpu_decode_mmuRefilling = decodeStage_mmuRsp_refilling;
  assign io_cpu_decode_mmuException = (((! decodeStage_mmuRsp_refilling) && decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute)));
  assign io_cpu_decode_physicalAddress = decodeStage_mmuRsp_physicalAddress;
  assign when_Fetcher_l398 = (_zz_when_Fetcher_l398 != 3'b000);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
      lineLoader_wordIndex <= 3'b000;
    end else begin
      if(lineLoader_fire) begin
        lineLoader_valid <= 1'b0;
      end
      if(lineLoader_fire) begin
        lineLoader_hadError <= 1'b0;
      end
      if(io_cpu_fill_valid) begin
        lineLoader_valid <= 1'b1;
      end
      if(io_flush) begin
        lineLoader_flushPending <= 1'b1;
      end
      if(when_InstructionCache_l351) begin
        lineLoader_flushPending <= 1'b0;
      end
      if(when_InstructionCache_l358) begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire) begin
        lineLoader_cmdSent <= 1'b0;
      end
      if(io_mem_rsp_valid) begin
        lineLoader_wordIndex <= (lineLoader_wordIndex + 3'b001);
        if(io_mem_rsp_payload_error) begin
          lineLoader_hadError <= 1'b1;
        end
      end
    end
  end

  always @(posedge clk) begin
    if(io_cpu_fill_valid) begin
      lineLoader_address <= io_cpu_fill_payload;
    end
    if(when_InstructionCache_l338) begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + 8'h01);
    end
    _zz_when_InstructionCache_l342 <= lineLoader_flushCounter[7];
    if(when_InstructionCache_l351) begin
      lineLoader_flushCounter <= 8'h0;
    end
    if(when_InstructionCache_l435) begin
      io_cpu_fetch_data_regNextWhen <= io_cpu_fetch_data;
    end
    if(when_InstructionCache_l459) begin
      decodeStage_mmuRsp_physicalAddress <= io_cpu_fetch_mmuRsp_physicalAddress;
      decodeStage_mmuRsp_isIoAccess <= io_cpu_fetch_mmuRsp_isIoAccess;
      decodeStage_mmuRsp_isPaging <= io_cpu_fetch_mmuRsp_isPaging;
      decodeStage_mmuRsp_allowRead <= io_cpu_fetch_mmuRsp_allowRead;
      decodeStage_mmuRsp_allowWrite <= io_cpu_fetch_mmuRsp_allowWrite;
      decodeStage_mmuRsp_allowExecute <= io_cpu_fetch_mmuRsp_allowExecute;
      decodeStage_mmuRsp_exception <= io_cpu_fetch_mmuRsp_exception;
      decodeStage_mmuRsp_refilling <= io_cpu_fetch_mmuRsp_refilling;
      decodeStage_mmuRsp_bypassTranslation <= io_cpu_fetch_mmuRsp_bypassTranslation;
      decodeStage_mmuRsp_ways_0_sel <= io_cpu_fetch_mmuRsp_ways_0_sel;
      decodeStage_mmuRsp_ways_0_physical <= io_cpu_fetch_mmuRsp_ways_0_physical;
      decodeStage_mmuRsp_ways_1_sel <= io_cpu_fetch_mmuRsp_ways_1_sel;
      decodeStage_mmuRsp_ways_1_physical <= io_cpu_fetch_mmuRsp_ways_1_physical;
      decodeStage_mmuRsp_ways_2_sel <= io_cpu_fetch_mmuRsp_ways_2_sel;
      decodeStage_mmuRsp_ways_2_physical <= io_cpu_fetch_mmuRsp_ways_2_physical;
      decodeStage_mmuRsp_ways_3_sel <= io_cpu_fetch_mmuRsp_ways_3_sel;
      decodeStage_mmuRsp_ways_3_physical <= io_cpu_fetch_mmuRsp_ways_3_physical;
    end
    if(when_InstructionCache_l459_1) begin
      decodeStage_hit_valid <= fetchStage_hit_valid;
    end
    if(when_InstructionCache_l459_2) begin
      decodeStage_hit_error <= fetchStage_hit_error;
    end
    if(when_Fetcher_l398) begin
      io_cpu_fetch_data_regNextWhen <= _zz_io_cpu_fetch_data_regNextWhen;
    end
  end


endmodule
