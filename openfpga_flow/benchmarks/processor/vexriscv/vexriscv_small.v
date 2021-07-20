// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : VexRiscv
// Git hash  : 36b3cd918896c94c4e8a224d97c559ab6dbf3ec9


`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define EnvCtrlEnum_defaultEncoding_type [0:0]
`define EnvCtrlEnum_defaultEncoding_NONE 1'b0
`define EnvCtrlEnum_defaultEncoding_XRET 1'b1

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


module VexRiscv (
  output              iBus_cmd_valid,
  input               iBus_cmd_ready,
  output     [31:0]   iBus_cmd_payload_pc,
  input               iBus_rsp_valid,
  input               iBus_rsp_payload_error,
  input      [31:0]   iBus_rsp_payload_inst,
  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt,
  output              dBus_cmd_valid,
  input               dBus_cmd_ready,
  output              dBus_cmd_payload_wr,
  output     [31:0]   dBus_cmd_payload_address,
  output     [31:0]   dBus_cmd_payload_data,
  output     [1:0]    dBus_cmd_payload_size,
  input               dBus_rsp_ready,
  input               dBus_rsp_error,
  input      [31:0]   dBus_rsp_data,
  input               clk,
  input               reset
);
  wire                _zz_107;
  wire                _zz_108;
  reg        [31:0]   _zz_109;
  reg        [31:0]   _zz_110;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire                _zz_111;
  wire                _zz_112;
  wire                _zz_113;
  wire                _zz_114;
  wire       [1:0]    _zz_115;
  wire                _zz_116;
  wire                _zz_117;
  wire                _zz_118;
  wire                _zz_119;
  wire                _zz_120;
  wire                _zz_121;
  wire                _zz_122;
  wire                _zz_123;
  wire                _zz_124;
  wire                _zz_125;
  wire                _zz_126;
  wire                _zz_127;
  wire       [1:0]    _zz_128;
  wire                _zz_129;
  wire       [0:0]    _zz_130;
  wire       [0:0]    _zz_131;
  wire       [0:0]    _zz_132;
  wire       [0:0]    _zz_133;
  wire       [0:0]    _zz_134;
  wire       [0:0]    _zz_135;
  wire       [0:0]    _zz_136;
  wire       [0:0]    _zz_137;
  wire       [0:0]    _zz_138;
  wire       [0:0]    _zz_139;
  wire       [0:0]    _zz_140;
  wire       [1:0]    _zz_141;
  wire       [1:0]    _zz_142;
  wire       [2:0]    _zz_143;
  wire       [31:0]   _zz_144;
  wire       [2:0]    _zz_145;
  wire       [0:0]    _zz_146;
  wire       [2:0]    _zz_147;
  wire       [0:0]    _zz_148;
  wire       [2:0]    _zz_149;
  wire       [0:0]    _zz_150;
  wire       [2:0]    _zz_151;
  wire       [0:0]    _zz_152;
  wire       [2:0]    _zz_153;
  wire       [0:0]    _zz_154;
  wire       [2:0]    _zz_155;
  wire       [4:0]    _zz_156;
  wire       [11:0]   _zz_157;
  wire       [11:0]   _zz_158;
  wire       [31:0]   _zz_159;
  wire       [31:0]   _zz_160;
  wire       [31:0]   _zz_161;
  wire       [31:0]   _zz_162;
  wire       [31:0]   _zz_163;
  wire       [31:0]   _zz_164;
  wire       [31:0]   _zz_165;
  wire       [31:0]   _zz_166;
  wire       [32:0]   _zz_167;
  wire       [19:0]   _zz_168;
  wire       [11:0]   _zz_169;
  wire       [11:0]   _zz_170;
  wire       [0:0]    _zz_171;
  wire       [0:0]    _zz_172;
  wire       [0:0]    _zz_173;
  wire       [0:0]    _zz_174;
  wire       [0:0]    _zz_175;
  wire       [0:0]    _zz_176;
  wire                _zz_177;
  wire                _zz_178;
  wire       [31:0]   _zz_179;
  wire       [31:0]   _zz_180;
  wire       [31:0]   _zz_181;
  wire       [31:0]   _zz_182;
  wire                _zz_183;
  wire       [1:0]    _zz_184;
  wire       [1:0]    _zz_185;
  wire                _zz_186;
  wire       [0:0]    _zz_187;
  wire       [18:0]   _zz_188;
  wire       [31:0]   _zz_189;
  wire       [31:0]   _zz_190;
  wire       [31:0]   _zz_191;
  wire       [31:0]   _zz_192;
  wire                _zz_193;
  wire                _zz_194;
  wire                _zz_195;
  wire       [0:0]    _zz_196;
  wire       [0:0]    _zz_197;
  wire                _zz_198;
  wire       [0:0]    _zz_199;
  wire       [15:0]   _zz_200;
  wire       [31:0]   _zz_201;
  wire                _zz_202;
  wire                _zz_203;
  wire       [0:0]    _zz_204;
  wire       [0:0]    _zz_205;
  wire       [0:0]    _zz_206;
  wire       [0:0]    _zz_207;
  wire                _zz_208;
  wire       [0:0]    _zz_209;
  wire       [12:0]   _zz_210;
  wire       [31:0]   _zz_211;
  wire       [31:0]   _zz_212;
  wire                _zz_213;
  wire                _zz_214;
  wire                _zz_215;
  wire       [1:0]    _zz_216;
  wire       [1:0]    _zz_217;
  wire                _zz_218;
  wire       [0:0]    _zz_219;
  wire       [9:0]    _zz_220;
  wire       [31:0]   _zz_221;
  wire       [31:0]   _zz_222;
  wire       [31:0]   _zz_223;
  wire       [31:0]   _zz_224;
  wire                _zz_225;
  wire                _zz_226;
  wire                _zz_227;
  wire       [0:0]    _zz_228;
  wire       [0:0]    _zz_229;
  wire                _zz_230;
  wire       [0:0]    _zz_231;
  wire       [6:0]    _zz_232;
  wire       [31:0]   _zz_233;
  wire       [0:0]    _zz_234;
  wire       [4:0]    _zz_235;
  wire       [1:0]    _zz_236;
  wire       [1:0]    _zz_237;
  wire                _zz_238;
  wire       [0:0]    _zz_239;
  wire       [3:0]    _zz_240;
  wire       [31:0]   _zz_241;
  wire       [31:0]   _zz_242;
  wire                _zz_243;
  wire       [0:0]    _zz_244;
  wire       [1:0]    _zz_245;
  wire       [31:0]   _zz_246;
  wire       [31:0]   _zz_247;
  wire                _zz_248;
  wire       [0:0]    _zz_249;
  wire       [2:0]    _zz_250;
  wire       [0:0]    _zz_251;
  wire       [0:0]    _zz_252;
  wire                _zz_253;
  wire       [0:0]    _zz_254;
  wire       [0:0]    _zz_255;
  wire       [31:0]   _zz_256;
  wire                _zz_257;
  wire                _zz_258;
  wire       [31:0]   _zz_259;
  wire       [31:0]   _zz_260;
  wire       [31:0]   _zz_261;
  wire                _zz_262;
  wire       [0:0]    _zz_263;
  wire       [0:0]    _zz_264;
  wire       [31:0]   _zz_265;
  wire       [31:0]   _zz_266;
  wire       [0:0]    _zz_267;
  wire       [1:0]    _zz_268;
  wire       [1:0]    _zz_269;
  wire       [1:0]    _zz_270;
  wire       [1:0]    _zz_271;
  wire       [1:0]    _zz_272;
  wire       [31:0]   _zz_273;
  wire       [31:0]   _zz_274;
  wire       [31:0]   _zz_275;
  wire       [31:0]   _zz_276;
  wire       [31:0]   _zz_277;
  wire       [31:0]   _zz_278;
  wire       [31:0]   _zz_279;
  wire       [31:0]   _zz_280;
  wire       [31:0]   _zz_281;
  wire       [31:0]   _zz_282;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire       [31:0]   decode_SRC2;
  wire       [31:0]   decode_SRC1;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [31:0]   decode_RS2;
  wire       [31:0]   decode_RS1;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_1;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_2;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_3;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_4;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_5;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_6;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_7;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_8;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_9;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_10;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_11;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_12;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_13;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_14;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_15;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_16;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_17;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_18;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_19;
  wire                decode_IS_CSR;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire                decode_MEMORY_ENABLE;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire       [31:0]   execute_RS1;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_20;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_21;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_22;
  wire       [31:0]   _zz_23;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_24;
  wire       [31:0]   _zz_25;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_26;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_27;
  wire       [31:0]   execute_SRC2;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_28;
  wire       [31:0]   _zz_29;
  wire                _zz_30;
  reg                 _zz_31;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_32;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_33;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_34;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_35;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_36;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_37;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_38;
  reg        [31:0]   _zz_39;
  wire       [31:0]   execute_SRC1;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_40;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_41;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_42;
  wire                writeBack_MEMORY_STORE;
  reg        [31:0]   _zz_43;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  wire       [31:0]   execute_RS2;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  reg        [31:0]   _zz_44;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  wire                decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  wire                decode_arbitration_flushNext;
  wire                decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  wire                execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  wire                execute_arbitration_flushIt;
  wire                execute_arbitration_flushNext;
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
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
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
  reg                 IBusSimplePlugin_fetcherHalt;
  reg                 IBusSimplePlugin_incomingInstruction;
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  wire                CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  wire                CsrPlugin_forceMachineWire;
  wire                CsrPlugin_allowInterrupts;
  wire                CsrPlugin_allowException;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [1:0]    _zz_45;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  wire                IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                _zz_46;
  wire                _zz_47;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_48;
  wire                _zz_49;
  reg                 _zz_50;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_51;
  reg        [31:0]   _zz_52;
  reg                 _zz_53;
  reg        [31:0]   _zz_54;
  reg                 _zz_55;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_4;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire                IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                _zz_56;
  wire                _zz_57;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_58;
  reg        [3:0]    _zz_59;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire                _zz_60;
  reg        [31:0]   _zz_61;
  wire                _zz_62;
  reg        [31:0]   _zz_63;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  wire       [1:0]    CsrPlugin_mtvec_mode;
  wire       [29:0]   CsrPlugin_mtvec_base;
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
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg        [63:0]   CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire                _zz_64;
  wire                _zz_65;
  wire                _zz_66;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  wire       [1:0]    CsrPlugin_targetPrivilege;
  wire       [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  reg                 execute_CsrPlugin_wfiWake;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire       [31:0]   execute_CsrPlugin_readData;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  reg        [31:0]   execute_CsrPlugin_writeData;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  wire       [24:0]   _zz_67;
  wire                _zz_68;
  wire                _zz_69;
  wire                _zz_70;
  wire                _zz_71;
  wire                _zz_72;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_73;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_74;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_75;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_76;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_77;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_78;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_79;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_80;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_81;
  reg        [31:0]   _zz_82;
  wire                _zz_83;
  reg        [19:0]   _zz_84;
  wire                _zz_85;
  reg        [19:0]   _zz_86;
  reg        [31:0]   _zz_87;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  reg                 execute_LightShifterPlugin_isActive;
  wire                execute_LightShifterPlugin_isShift;
  reg        [4:0]    execute_LightShifterPlugin_amplitudeReg;
  wire       [4:0]    execute_LightShifterPlugin_amplitude;
  wire       [31:0]   execute_LightShifterPlugin_shiftInput;
  wire                execute_LightShifterPlugin_done;
  reg        [31:0]   _zz_88;
  reg                 _zz_89;
  reg                 _zz_90;
  reg                 _zz_91;
  reg        [4:0]    _zz_92;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_93;
  reg                 _zz_94;
  reg                 _zz_95;
  wire       [31:0]   execute_BranchPlugin_branch_src1;
  wire                _zz_96;
  reg        [10:0]   _zz_97;
  wire                _zz_98;
  reg        [19:0]   _zz_99;
  wire                _zz_100;
  reg        [18:0]   _zz_101;
  reg        [31:0]   _zz_102;
  wire       [31:0]   execute_BranchPlugin_branch_src2;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg                 decode_to_execute_MEMORY_STORE;
  reg                 execute_to_memory_MEMORY_STORE;
  reg                 memory_to_writeBack_MEMORY_STORE;
  reg                 decode_to_execute_IS_CSR;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg        [31:0]   decode_to_execute_SRC1;
  reg        [31:0]   decode_to_execute_SRC2;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg                 execute_to_memory_BRANCH_DO;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_834;
  reg        [31:0]   _zz_103;
  reg        [31:0]   _zz_104;
  reg        [31:0]   _zz_105;
  reg        [31:0]   _zz_106;
  `ifndef SYNTHESIS
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_1_string;
  reg [31:0] _zz_2_string;
  reg [31:0] _zz_3_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_4_string;
  reg [71:0] _zz_5_string;
  reg [71:0] _zz_6_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_7_string;
  reg [39:0] _zz_8_string;
  reg [39:0] _zz_9_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_10_string;
  reg [63:0] _zz_11_string;
  reg [63:0] _zz_12_string;
  reg [31:0] _zz_13_string;
  reg [31:0] _zz_14_string;
  reg [31:0] _zz_15_string;
  reg [31:0] _zz_16_string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_17_string;
  reg [31:0] _zz_18_string;
  reg [31:0] _zz_19_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_20_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_21_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_24_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_26_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_27_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_28_string;
  reg [31:0] _zz_32_string;
  reg [71:0] _zz_33_string;
  reg [39:0] _zz_34_string;
  reg [63:0] _zz_35_string;
  reg [31:0] _zz_36_string;
  reg [23:0] _zz_37_string;
  reg [95:0] _zz_38_string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_40_string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_41_string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_42_string;
  reg [95:0] _zz_73_string;
  reg [23:0] _zz_74_string;
  reg [31:0] _zz_75_string;
  reg [63:0] _zz_76_string;
  reg [39:0] _zz_77_string;
  reg [71:0] _zz_78_string;
  reg [31:0] _zz_79_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_111 = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_112 = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != 5'h0));
  assign _zz_113 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_114 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_115 = writeBack_INSTRUCTION[29 : 28];
  assign _zz_116 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign _zz_117 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_118 = (1'b1 || (! 1'b1));
  assign _zz_119 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_120 = (1'b1 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_121 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_122 = (1'b1 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_123 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign _zz_124 = ((_zz_64 && 1'b1) && (! 1'b0));
  assign _zz_125 = ((_zz_65 && 1'b1) && (! 1'b0));
  assign _zz_126 = ((_zz_66 && 1'b1) && (! 1'b0));
  assign _zz_127 = (! execute_arbitration_isStuckByOthers);
  assign _zz_128 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_129 = execute_INSTRUCTION[13];
  assign _zz_130 = _zz_67[17 : 17];
  assign _zz_131 = _zz_67[12 : 12];
  assign _zz_132 = _zz_67[10 : 10];
  assign _zz_133 = _zz_67[9 : 9];
  assign _zz_134 = _zz_67[8 : 8];
  assign _zz_135 = _zz_67[3 : 3];
  assign _zz_136 = _zz_67[11 : 11];
  assign _zz_137 = _zz_67[4 : 4];
  assign _zz_138 = _zz_67[2 : 2];
  assign _zz_139 = _zz_67[20 : 20];
  assign _zz_140 = _zz_67[7 : 7];
  assign _zz_141 = (_zz_45 & (~ _zz_142));
  assign _zz_142 = (_zz_45 - 2'b01);
  assign _zz_143 = {IBusSimplePlugin_fetchPc_inc,2'b00};
  assign _zz_144 = {29'd0, _zz_143};
  assign _zz_145 = (IBusSimplePlugin_pending_value + _zz_147);
  assign _zz_146 = IBusSimplePlugin_pending_inc;
  assign _zz_147 = {2'd0, _zz_146};
  assign _zz_148 = IBusSimplePlugin_pending_dec;
  assign _zz_149 = {2'd0, _zz_148};
  assign _zz_150 = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000));
  assign _zz_151 = {2'd0, _zz_150};
  assign _zz_152 = IBusSimplePlugin_pending_dec;
  assign _zz_153 = {2'd0, _zz_152};
  assign _zz_154 = execute_SRC_LESS;
  assign _zz_155 = 3'b100;
  assign _zz_156 = decode_INSTRUCTION[19 : 15];
  assign _zz_157 = decode_INSTRUCTION[31 : 20];
  assign _zz_158 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_159 = ($signed(_zz_160) + $signed(_zz_163));
  assign _zz_160 = ($signed(_zz_161) + $signed(_zz_162));
  assign _zz_161 = execute_SRC1;
  assign _zz_162 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_163 = (execute_SRC_USE_SUB_LESS ? _zz_164 : _zz_165);
  assign _zz_164 = 32'h00000001;
  assign _zz_165 = 32'h0;
  assign _zz_166 = (_zz_167 >>> 1);
  assign _zz_167 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_168 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_169 = execute_INSTRUCTION[31 : 20];
  assign _zz_170 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_171 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_172 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_173 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_174 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_175 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_176 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_177 = 1'b1;
  assign _zz_178 = 1'b1;
  assign _zz_179 = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz_180 = 32'h00000004;
  assign _zz_181 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_182 = 32'h00000040;
  assign _zz_183 = ((decode_INSTRUCTION & 32'h00007054) == 32'h00005010);
  assign _zz_184 = {(_zz_189 == _zz_190),(_zz_191 == _zz_192)};
  assign _zz_185 = 2'b00;
  assign _zz_186 = ({_zz_193,_zz_194} != 2'b00);
  assign _zz_187 = (_zz_195 != 1'b0);
  assign _zz_188 = {(_zz_196 != _zz_197),{_zz_198,{_zz_199,_zz_200}}};
  assign _zz_189 = (decode_INSTRUCTION & 32'h40003054);
  assign _zz_190 = 32'h40001010;
  assign _zz_191 = (decode_INSTRUCTION & 32'h00007054);
  assign _zz_192 = 32'h00001010;
  assign _zz_193 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000024);
  assign _zz_194 = ((decode_INSTRUCTION & 32'h00003054) == 32'h00001010);
  assign _zz_195 = ((decode_INSTRUCTION & 32'h00001000) == 32'h00001000);
  assign _zz_196 = ((decode_INSTRUCTION & _zz_201) == 32'h00002000);
  assign _zz_197 = 1'b0;
  assign _zz_198 = ({_zz_202,_zz_203} != 2'b00);
  assign _zz_199 = ({_zz_204,_zz_205} != 2'b00);
  assign _zz_200 = {(_zz_206 != _zz_207),{_zz_208,{_zz_209,_zz_210}}};
  assign _zz_201 = 32'h00003000;
  assign _zz_202 = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz_203 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz_204 = ((decode_INSTRUCTION & _zz_211) == 32'h00006000);
  assign _zz_205 = ((decode_INSTRUCTION & _zz_212) == 32'h00004000);
  assign _zz_206 = _zz_69;
  assign _zz_207 = 1'b0;
  assign _zz_208 = ({_zz_213,_zz_214} != 2'b00);
  assign _zz_209 = (_zz_215 != 1'b0);
  assign _zz_210 = {(_zz_216 != _zz_217),{_zz_218,{_zz_219,_zz_220}}};
  assign _zz_211 = 32'h00006004;
  assign _zz_212 = 32'h00005004;
  assign _zz_213 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000040);
  assign _zz_214 = ((decode_INSTRUCTION & 32'h00003040) == 32'h00000040);
  assign _zz_215 = ((decode_INSTRUCTION & 32'h00003050) == 32'h00000050);
  assign _zz_216 = {(_zz_221 == _zz_222),(_zz_223 == _zz_224)};
  assign _zz_217 = 2'b00;
  assign _zz_218 = ({_zz_225,_zz_226} != 2'b00);
  assign _zz_219 = (_zz_227 != 1'b0);
  assign _zz_220 = {(_zz_228 != _zz_229),{_zz_230,{_zz_231,_zz_232}}};
  assign _zz_221 = (decode_INSTRUCTION & 32'h00001050);
  assign _zz_222 = 32'h00001050;
  assign _zz_223 = (decode_INSTRUCTION & 32'h00002050);
  assign _zz_224 = 32'h00002050;
  assign _zz_225 = ((decode_INSTRUCTION & 32'h00000034) == 32'h00000020);
  assign _zz_226 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000020);
  assign _zz_227 = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz_228 = ((decode_INSTRUCTION & _zz_233) == 32'h00000010);
  assign _zz_229 = 1'b0;
  assign _zz_230 = (_zz_71 != 1'b0);
  assign _zz_231 = ({_zz_234,_zz_235} != 6'h0);
  assign _zz_232 = {(_zz_236 != _zz_237),{_zz_238,{_zz_239,_zz_240}}};
  assign _zz_233 = 32'h00000010;
  assign _zz_234 = _zz_72;
  assign _zz_235 = {(_zz_241 == _zz_242),{_zz_243,{_zz_244,_zz_245}}};
  assign _zz_236 = {_zz_70,(_zz_246 == _zz_247)};
  assign _zz_237 = 2'b00;
  assign _zz_238 = ({_zz_70,_zz_248} != 2'b00);
  assign _zz_239 = ({_zz_249,_zz_250} != 4'b0000);
  assign _zz_240 = {(_zz_251 != _zz_252),{_zz_253,{_zz_254,_zz_255}}};
  assign _zz_241 = (decode_INSTRUCTION & 32'h00001010);
  assign _zz_242 = 32'h00001010;
  assign _zz_243 = ((decode_INSTRUCTION & _zz_256) == 32'h00002010);
  assign _zz_244 = _zz_71;
  assign _zz_245 = {_zz_257,_zz_258};
  assign _zz_246 = (decode_INSTRUCTION & 32'h00000070);
  assign _zz_247 = 32'h00000020;
  assign _zz_248 = ((decode_INSTRUCTION & _zz_259) == 32'h0);
  assign _zz_249 = (_zz_260 == _zz_261);
  assign _zz_250 = {_zz_262,{_zz_263,_zz_264}};
  assign _zz_251 = (_zz_265 == _zz_266);
  assign _zz_252 = 1'b0;
  assign _zz_253 = ({_zz_267,_zz_268} != 3'b000);
  assign _zz_254 = (_zz_269 != _zz_270);
  assign _zz_255 = (_zz_271 != _zz_272);
  assign _zz_256 = 32'h00002010;
  assign _zz_257 = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000004);
  assign _zz_258 = ((decode_INSTRUCTION & 32'h00000028) == 32'h0);
  assign _zz_259 = 32'h00000020;
  assign _zz_260 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_261 = 32'h0;
  assign _zz_262 = ((decode_INSTRUCTION & 32'h00000018) == 32'h0);
  assign _zz_263 = _zz_69;
  assign _zz_264 = ((decode_INSTRUCTION & _zz_273) == 32'h00001000);
  assign _zz_265 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_266 = 32'h0;
  assign _zz_267 = ((decode_INSTRUCTION & _zz_274) == 32'h00000040);
  assign _zz_268 = {(_zz_275 == _zz_276),(_zz_277 == _zz_278)};
  assign _zz_269 = {(_zz_279 == _zz_280),_zz_68};
  assign _zz_270 = 2'b00;
  assign _zz_271 = {(_zz_281 == _zz_282),_zz_68};
  assign _zz_272 = 2'b00;
  assign _zz_273 = 32'h00005004;
  assign _zz_274 = 32'h00000044;
  assign _zz_275 = (decode_INSTRUCTION & 32'h00002014);
  assign _zz_276 = 32'h00002010;
  assign _zz_277 = (decode_INSTRUCTION & 32'h40004034);
  assign _zz_278 = 32'h40000030;
  assign _zz_279 = (decode_INSTRUCTION & 32'h00000014);
  assign _zz_280 = 32'h00000004;
  assign _zz_281 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_282 = 32'h00000004;
  always @ (posedge clk) begin
    if(_zz_177) begin
      _zz_109 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_178) begin
      _zz_110 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge clk) begin
    if(_zz_31) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid            (iBus_rsp_valid                                                  ), //i
    .io_push_ready            (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready              ), //o
    .io_push_payload_error    (iBus_rsp_payload_error                                          ), //i
    .io_push_payload_inst     (iBus_rsp_payload_inst[31:0]                                     ), //i
    .io_pop_valid             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid               ), //o
    .io_pop_ready             (_zz_107                                                         ), //i
    .io_pop_payload_error     (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error       ), //o
    .io_pop_payload_inst      (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]  ), //o
    .io_flush                 (_zz_108                                                         ), //i
    .io_occupancy             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy               ), //o
    .clk                      (clk                                                             ), //i
    .reset                    (reset                                                           )  //i
  );
  `ifndef SYNTHESIS
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
    case(_zz_1)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_1_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_1_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_1_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_1_string = "JALR";
      default : _zz_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_2)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_2_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_2_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_2_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_2_string = "JALR";
      default : _zz_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_3)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_3_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_3_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_3_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_3_string = "JALR";
      default : _zz_3_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_4)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_4_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_4_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_4_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_4_string = "SRA_1    ";
      default : _zz_4_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_5)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_5_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_5_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_5_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_5_string = "SRA_1    ";
      default : _zz_5_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_6)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_6_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_6_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_6_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_6_string = "SRA_1    ";
      default : _zz_6_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_7)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_7_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_7_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_7_string = "AND_1";
      default : _zz_7_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_8)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_8_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_8_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_8_string = "AND_1";
      default : _zz_8_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_9)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_9_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_9_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_9_string = "AND_1";
      default : _zz_9_string = "?????";
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
    case(_zz_10)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_10_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_10_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_10_string = "BITWISE ";
      default : _zz_10_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_11)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_11_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_11_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_11_string = "BITWISE ";
      default : _zz_11_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_12)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_12_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_12_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_12_string = "BITWISE ";
      default : _zz_12_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_13)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_13_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_13_string = "XRET";
      default : _zz_13_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_14)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_14_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_14_string = "XRET";
      default : _zz_14_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_15)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_15_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_15_string = "XRET";
      default : _zz_15_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_16_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_16_string = "XRET";
      default : _zz_16_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_17)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_17_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_17_string = "XRET";
      default : _zz_17_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_18)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_18_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_18_string = "XRET";
      default : _zz_18_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_19)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_19_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_19_string = "XRET";
      default : _zz_19_string = "????";
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
    case(_zz_20)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_20_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_20_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_20_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_20_string = "JALR";
      default : _zz_20_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_21)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_21_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_21_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_21_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_21_string = "SRA_1    ";
      default : _zz_21_string = "?????????";
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
    case(_zz_24)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_24_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_24_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_24_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_24_string = "PC ";
      default : _zz_24_string = "???";
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
    case(_zz_26)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_26_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_26_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_26_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_26_string = "URS1        ";
      default : _zz_26_string = "????????????";
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
    case(_zz_27)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_27_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_27_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_27_string = "BITWISE ";
      default : _zz_27_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_28)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_28_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_28_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_28_string = "AND_1";
      default : _zz_28_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_32)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_32_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_32_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_32_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_32_string = "JALR";
      default : _zz_32_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_33)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_33_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_33_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_33_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_33_string = "SRA_1    ";
      default : _zz_33_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_34)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_34_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_34_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_34_string = "AND_1";
      default : _zz_34_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_35)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_35_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_35_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_35_string = "BITWISE ";
      default : _zz_35_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_36)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_36_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_36_string = "XRET";
      default : _zz_36_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_37)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_37_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_37_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_37_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_37_string = "PC ";
      default : _zz_37_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_38)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_38_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_38_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_38_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_38_string = "URS1        ";
      default : _zz_38_string = "????????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_40)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_40_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_40_string = "XRET";
      default : _zz_40_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_41)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_41_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_41_string = "XRET";
      default : _zz_41_string = "????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_42)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_42_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_42_string = "XRET";
      default : _zz_42_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_73)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_73_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_73_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_73_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_73_string = "URS1        ";
      default : _zz_73_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_74)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_74_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_74_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_74_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_74_string = "PC ";
      default : _zz_74_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_75)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_75_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_75_string = "XRET";
      default : _zz_75_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_76)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_76_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_76_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_76_string = "BITWISE ";
      default : _zz_76_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_77)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_77_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_77_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_77_string = "AND_1";
      default : _zz_77_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_78)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_78_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_78_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_78_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_78_string = "SRA_1    ";
      default : _zz_78_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_79)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_79_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_79_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_79_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_79_string = "JALR";
      default : _zz_79_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
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
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
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

  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = _zz_95;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_81;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_SRC2 = _zz_87;
  assign decode_SRC1 = _zz_82;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_RS2 = decode_RegFilePlugin_rs2Data;
  assign decode_RS1 = decode_RegFilePlugin_rs1Data;
  assign decode_BRANCH_CTRL = _zz_1;
  assign _zz_2 = _zz_3;
  assign decode_SHIFT_CTRL = _zz_4;
  assign _zz_5 = _zz_6;
  assign decode_ALU_BITWISE_CTRL = _zz_7;
  assign _zz_8 = _zz_9;
  assign decode_SRC_LESS_UNSIGNED = _zz_130[0];
  assign decode_ALU_CTRL = _zz_10;
  assign _zz_11 = _zz_12;
  assign _zz_13 = _zz_14;
  assign _zz_15 = _zz_16;
  assign decode_ENV_CTRL = _zz_17;
  assign _zz_18 = _zz_19;
  assign decode_IS_CSR = _zz_131[0];
  assign decode_MEMORY_STORE = _zz_132[0];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_133[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_134[0];
  assign decode_MEMORY_ENABLE = _zz_135[0];
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign memory_PC = execute_to_memory_PC;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_CTRL = _zz_20;
  assign decode_RS2_USE = _zz_136[0];
  assign decode_RS1_USE = _zz_137[0];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_SHIFT_CTRL = _zz_21;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_22 = decode_PC;
  assign _zz_23 = decode_RS2;
  assign decode_SRC2_CTRL = _zz_24;
  assign _zz_25 = decode_RS1;
  assign decode_SRC1_CTRL = _zz_26;
  assign decode_SRC_USE_SUB_LESS = _zz_138[0];
  assign decode_SRC_ADD_ZERO = _zz_139[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_27;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_ALU_BITWISE_CTRL = _zz_28;
  assign _zz_29 = writeBack_INSTRUCTION;
  assign _zz_30 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_31 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_31 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_iBusRsp_output_payload_rsp_inst);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_140[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_39 = execute_REGFILE_WRITE_DATA;
    if(_zz_111)begin
      _zz_39 = execute_CsrPlugin_readData;
    end
    if(_zz_112)begin
      _zz_39 = _zz_88;
    end
  end

  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_40;
  assign execute_ENV_CTRL = _zz_41;
  assign writeBack_ENV_CTRL = _zz_42;
  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @ (*) begin
    _zz_43 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_43 = writeBack_DBusSimplePlugin_rspFormated;
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  always @ (*) begin
    _zz_44 = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_44 = BranchPlugin_jumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_arbitration_haltItself = 1'b0;
  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(CsrPlugin_pipelineLiberator_active)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != 3'b000))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if((decode_arbitration_isValid && (_zz_89 || _zz_90)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  assign decode_arbitration_flushNext = 1'b0;
  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_57)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_111)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_112)begin
      if((! execute_LightShifterPlugin_done))begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushIt = 1'b0;
  assign execute_arbitration_flushNext = 1'b0;
  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(_zz_113)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_114)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(_zz_113)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_114)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_inWfi = 1'b0;
  assign CsrPlugin_thirdPartyWake = 1'b0;
  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_113)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_114)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'h0;
    if(_zz_113)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(_zz_114)begin
      case(_zz_115)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  assign CsrPlugin_forceMachineWire = 1'b0;
  assign CsrPlugin_allowInterrupts = 1'b1;
  assign CsrPlugin_allowException = 1'b1;
  assign IBusSimplePlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusSimplePlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid} != 2'b00);
  assign _zz_45 = {BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_141[0] ? CsrPlugin_jumpInterface_payload : BranchPlugin_jumpInterface_payload);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready)begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_144);
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
    IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready))))begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_46 = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_46);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_46);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_47 = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_47);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_47);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_48;
  assign _zz_48 = ((1'b0 && (! _zz_49)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_49 = _zz_50;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_49;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
    if((! IBusSimplePlugin_pcValids_0))begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_iBusRsp_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_51;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_52;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_53;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_54;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_55;
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_4;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_145 - _zz_149);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && (IBusSimplePlugin_pending_value != 3'b111));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_cmdFork_canEmit);
  assign IBusSimplePlugin_pending_inc = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],2'b00};
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == 3'b000));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign _zz_107 = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign IBusSimplePlugin_pending_dec = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && _zz_107);
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBuffer_output_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_56 = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_56);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_56);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_57 = 1'b0;
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_57));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_58 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_58 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_58 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_58;
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_59 = 4'b0001;
      end
      2'b01 : begin
        _zz_59 = 4'b0011;
      end
      default : begin
        _zz_59 = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_59 <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  always @ (*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_60 = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_61[31] = _zz_60;
    _zz_61[30] = _zz_60;
    _zz_61[29] = _zz_60;
    _zz_61[28] = _zz_60;
    _zz_61[27] = _zz_60;
    _zz_61[26] = _zz_60;
    _zz_61[25] = _zz_60;
    _zz_61[24] = _zz_60;
    _zz_61[23] = _zz_60;
    _zz_61[22] = _zz_60;
    _zz_61[21] = _zz_60;
    _zz_61[20] = _zz_60;
    _zz_61[19] = _zz_60;
    _zz_61[18] = _zz_60;
    _zz_61[17] = _zz_60;
    _zz_61[16] = _zz_60;
    _zz_61[15] = _zz_60;
    _zz_61[14] = _zz_60;
    _zz_61[13] = _zz_60;
    _zz_61[12] = _zz_60;
    _zz_61[11] = _zz_60;
    _zz_61[10] = _zz_60;
    _zz_61[9] = _zz_60;
    _zz_61[8] = _zz_60;
    _zz_61[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_62 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_63[31] = _zz_62;
    _zz_63[30] = _zz_62;
    _zz_63[29] = _zz_62;
    _zz_63[28] = _zz_62;
    _zz_63[27] = _zz_62;
    _zz_63[26] = _zz_62;
    _zz_63[25] = _zz_62;
    _zz_63[24] = _zz_62;
    _zz_63[23] = _zz_62;
    _zz_63[22] = _zz_62;
    _zz_63[21] = _zz_62;
    _zz_63[20] = _zz_62;
    _zz_63[19] = _zz_62;
    _zz_63[18] = _zz_62;
    _zz_63[17] = _zz_62;
    _zz_63[16] = _zz_62;
    _zz_63[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_128)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_61;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_63;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign CsrPlugin_mtvec_mode = 2'b00;
  assign CsrPlugin_mtvec_base = 30'h00000008;
  assign _zz_64 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_65 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_66 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exception = 1'b0;
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  assign CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
  assign CsrPlugin_trapCause = CsrPlugin_interrupt_code;
  always @ (*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = 30'h0;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign execute_CsrPlugin_blockedBySideEffects = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) || 1'b0);
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(_zz_116)begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(_zz_116)begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(_zz_116)begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_129)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_68 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_69 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_70 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_71 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000010);
  assign _zz_72 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_67 = {({_zz_72,(_zz_179 == _zz_180)} != 2'b00),{((_zz_181 == _zz_182) != 1'b0),{(_zz_183 != 1'b0),{(_zz_184 != _zz_185),{_zz_186,{_zz_187,_zz_188}}}}}};
  assign _zz_73 = _zz_67[1 : 0];
  assign _zz_38 = _zz_73;
  assign _zz_74 = _zz_67[6 : 5];
  assign _zz_37 = _zz_74;
  assign _zz_75 = _zz_67[13 : 13];
  assign _zz_36 = _zz_75;
  assign _zz_76 = _zz_67[16 : 15];
  assign _zz_35 = _zz_76;
  assign _zz_77 = _zz_67[19 : 18];
  assign _zz_34 = _zz_77;
  assign _zz_78 = _zz_67[22 : 21];
  assign _zz_33 = _zz_78;
  assign _zz_79 = _zz_67[24 : 23];
  assign _zz_32 = _zz_79;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_109;
  assign decode_RegFilePlugin_rs2Data = _zz_110;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_30 && writeBack_arbitration_isFiring);
    if(_zz_80)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_address = _zz_29[11 : 7];
    if(_zz_80)begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_data = _zz_43;
    if(_zz_80)begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_81 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_81 = {31'd0, _zz_154};
      end
      default : begin
        _zz_81 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_82 = _zz_25;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_82 = {29'd0, _zz_155};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_82 = {decode_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_82 = {27'd0, _zz_156};
      end
    endcase
  end

  assign _zz_83 = _zz_157[11];
  always @ (*) begin
    _zz_84[19] = _zz_83;
    _zz_84[18] = _zz_83;
    _zz_84[17] = _zz_83;
    _zz_84[16] = _zz_83;
    _zz_84[15] = _zz_83;
    _zz_84[14] = _zz_83;
    _zz_84[13] = _zz_83;
    _zz_84[12] = _zz_83;
    _zz_84[11] = _zz_83;
    _zz_84[10] = _zz_83;
    _zz_84[9] = _zz_83;
    _zz_84[8] = _zz_83;
    _zz_84[7] = _zz_83;
    _zz_84[6] = _zz_83;
    _zz_84[5] = _zz_83;
    _zz_84[4] = _zz_83;
    _zz_84[3] = _zz_83;
    _zz_84[2] = _zz_83;
    _zz_84[1] = _zz_83;
    _zz_84[0] = _zz_83;
  end

  assign _zz_85 = _zz_158[11];
  always @ (*) begin
    _zz_86[19] = _zz_85;
    _zz_86[18] = _zz_85;
    _zz_86[17] = _zz_85;
    _zz_86[16] = _zz_85;
    _zz_86[15] = _zz_85;
    _zz_86[14] = _zz_85;
    _zz_86[13] = _zz_85;
    _zz_86[12] = _zz_85;
    _zz_86[11] = _zz_85;
    _zz_86[10] = _zz_85;
    _zz_86[9] = _zz_85;
    _zz_86[8] = _zz_85;
    _zz_86[7] = _zz_85;
    _zz_86[6] = _zz_85;
    _zz_86[5] = _zz_85;
    _zz_86[4] = _zz_85;
    _zz_86[3] = _zz_85;
    _zz_86[2] = _zz_85;
    _zz_86[1] = _zz_85;
    _zz_86[0] = _zz_85;
  end

  always @ (*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_87 = _zz_23;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_87 = {_zz_84,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_87 = {_zz_86,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_87 = _zz_22;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_159;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_defaultEncoding_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? memory_REGFILE_WRITE_DATA : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == 4'b0000);
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_88 = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_88 = _zz_166;
      end
    endcase
  end

  always @ (*) begin
    _zz_89 = 1'b0;
    if(_zz_91)begin
      if((_zz_92 == decode_INSTRUCTION[19 : 15]))begin
        _zz_89 = 1'b1;
      end
    end
    if(_zz_117)begin
      if(_zz_118)begin
        if((writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_89 = 1'b1;
        end
      end
    end
    if(_zz_119)begin
      if(_zz_120)begin
        if((memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_89 = 1'b1;
        end
      end
    end
    if(_zz_121)begin
      if(_zz_122)begin
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_89 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_89 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_90 = 1'b0;
    if(_zz_91)begin
      if((_zz_92 == decode_INSTRUCTION[24 : 20]))begin
        _zz_90 = 1'b1;
      end
    end
    if(_zz_117)begin
      if(_zz_118)begin
        if((writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_90 = 1'b1;
        end
      end
    end
    if(_zz_119)begin
      if(_zz_120)begin
        if((memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_90 = 1'b1;
        end
      end
    end
    if(_zz_121)begin
      if(_zz_122)begin
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_90 = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_90 = 1'b0;
    end
  end

  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_93 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_93 == 3'b000)) begin
        _zz_94 = execute_BranchPlugin_eq;
    end else if((_zz_93 == 3'b001)) begin
        _zz_94 = (! execute_BranchPlugin_eq);
    end else if((((_zz_93 & 3'b101) == 3'b101))) begin
        _zz_94 = (! execute_SRC_LESS);
    end else begin
        _zz_94 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_95 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_95 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_95 = 1'b1;
      end
      default : begin
        _zz_95 = _zz_94;
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_96 = _zz_168[19];
  always @ (*) begin
    _zz_97[10] = _zz_96;
    _zz_97[9] = _zz_96;
    _zz_97[8] = _zz_96;
    _zz_97[7] = _zz_96;
    _zz_97[6] = _zz_96;
    _zz_97[5] = _zz_96;
    _zz_97[4] = _zz_96;
    _zz_97[3] = _zz_96;
    _zz_97[2] = _zz_96;
    _zz_97[1] = _zz_96;
    _zz_97[0] = _zz_96;
  end

  assign _zz_98 = _zz_169[11];
  always @ (*) begin
    _zz_99[19] = _zz_98;
    _zz_99[18] = _zz_98;
    _zz_99[17] = _zz_98;
    _zz_99[16] = _zz_98;
    _zz_99[15] = _zz_98;
    _zz_99[14] = _zz_98;
    _zz_99[13] = _zz_98;
    _zz_99[12] = _zz_98;
    _zz_99[11] = _zz_98;
    _zz_99[10] = _zz_98;
    _zz_99[9] = _zz_98;
    _zz_99[8] = _zz_98;
    _zz_99[7] = _zz_98;
    _zz_99[6] = _zz_98;
    _zz_99[5] = _zz_98;
    _zz_99[4] = _zz_98;
    _zz_99[3] = _zz_98;
    _zz_99[2] = _zz_98;
    _zz_99[1] = _zz_98;
    _zz_99[0] = _zz_98;
  end

  assign _zz_100 = _zz_170[11];
  always @ (*) begin
    _zz_101[18] = _zz_100;
    _zz_101[17] = _zz_100;
    _zz_101[16] = _zz_100;
    _zz_101[15] = _zz_100;
    _zz_101[14] = _zz_100;
    _zz_101[13] = _zz_100;
    _zz_101[12] = _zz_100;
    _zz_101[11] = _zz_100;
    _zz_101[10] = _zz_100;
    _zz_101[9] = _zz_100;
    _zz_101[8] = _zz_100;
    _zz_101[7] = _zz_100;
    _zz_101[6] = _zz_100;
    _zz_101[5] = _zz_100;
    _zz_101[4] = _zz_100;
    _zz_101[3] = _zz_100;
    _zz_101[2] = _zz_100;
    _zz_101[1] = _zz_100;
    _zz_101[0] = _zz_100;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_102 = {{_zz_97,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_102 = {_zz_99,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_102 = {{_zz_101,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_102;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign _zz_26 = _zz_38;
  assign _zz_24 = _zz_37;
  assign _zz_19 = decode_ENV_CTRL;
  assign _zz_16 = execute_ENV_CTRL;
  assign _zz_14 = memory_ENV_CTRL;
  assign _zz_17 = _zz_36;
  assign _zz_41 = decode_to_execute_ENV_CTRL;
  assign _zz_40 = execute_to_memory_ENV_CTRL;
  assign _zz_42 = memory_to_writeBack_ENV_CTRL;
  assign _zz_12 = decode_ALU_CTRL;
  assign _zz_10 = _zz_35;
  assign _zz_27 = decode_to_execute_ALU_CTRL;
  assign _zz_9 = decode_ALU_BITWISE_CTRL;
  assign _zz_7 = _zz_34;
  assign _zz_28 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_6 = decode_SHIFT_CTRL;
  assign _zz_4 = _zz_33;
  assign _zz_21 = decode_to_execute_SHIFT_CTRL;
  assign _zz_3 = decode_BRANCH_CTRL;
  assign _zz_1 = _zz_32;
  assign _zz_20 = decode_to_execute_BRANCH_CTRL;
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
  always @ (*) begin
    _zz_103 = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_103[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_103[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_103[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_104 = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_104[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_104[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_104[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_105 = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_105[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_105[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_105[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_106 = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_106[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_106[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  assign execute_CsrPlugin_readData = ((_zz_103 | _zz_104) | (_zz_105 | _zz_106));
  assign _zz_108 = 1'b0;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      IBusSimplePlugin_fetchPc_pcReg <= 32'h80000000;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      _zz_50 <= 1'b0;
      _zz_51 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusSimplePlugin_pending_value <= 3'b000;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= 3'b000;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      _zz_80 <= 1'b1;
      execute_LightShifterPlugin_isActive <= 1'b0;
      _zz_91 <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction)begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if((IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate)))begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if(IBusSimplePlugin_iBusRsp_flush)begin
        _zz_50 <= 1'b0;
      end
      if(_zz_48)begin
        _zz_50 <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(decode_arbitration_removeIt)begin
        _zz_51 <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_output_ready)begin
        _zz_51 <= (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_iBusRsp_stages_1_input_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_injector_decodeInput_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= IBusSimplePlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_151);
      if(IBusSimplePlugin_iBusRsp_flush)begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_pending_value - _zz_153);
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck)));
        `else
          if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
            $display("FAILURE DBusSimplePlugin doesn't allow memory stage stall when read happend");
            $finish;
          end
        `endif
      `endif
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck)));
        `else
          if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck))) begin
            $display("FAILURE DBusSimplePlugin doesn't allow writeback stage stall when read happend");
            $finish;
          end
        `endif
      `endif
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_123)begin
        if(_zz_124)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_125)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_126)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active)begin
        if((! execute_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if((! memory_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if((! writeBack_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt))begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump)begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_113)begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(_zz_114)begin
        case(_zz_115)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_66,{_zz_65,_zz_64}} != 3'b000) || CsrPlugin_thirdPartyWake);
      _zz_80 <= 1'b0;
      if(_zz_112)begin
        if(_zz_127)begin
          execute_LightShifterPlugin_isActive <= 1'b1;
          if(execute_LightShifterPlugin_done)begin
            execute_LightShifterPlugin_isActive <= 1'b0;
          end
        end
      end
      if(execute_arbitration_removeIt)begin
        execute_LightShifterPlugin_isActive <= 1'b0;
      end
      _zz_91 <= (_zz_30 && writeBack_arbitration_isFiring);
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_171[0];
          CsrPlugin_mstatus_MIE <= _zz_172[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_174[0];
          CsrPlugin_mie_MTIE <= _zz_175[0];
          CsrPlugin_mie_MSIE <= _zz_176[0];
        end
      end
    end
  end

  always @ (posedge clk) begin
    if(IBusSimplePlugin_iBusRsp_output_ready)begin
      _zz_52 <= IBusSimplePlugin_iBusRsp_output_payload_pc;
      _zz_53 <= IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
      _zz_54 <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
      _zz_55 <= IBusSimplePlugin_iBusRsp_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(_zz_123)begin
      if(_zz_124)begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_125)begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_126)begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(_zz_113)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= decode_PC;
        end
        default : begin
        end
      endcase
    end
    if(_zz_112)begin
      if(_zz_127)begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - 5'h01);
      end
    end
    _zz_92 <= _zz_29[11 : 7];
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= _zz_22;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= execute_PC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_44;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_STORE <= memory_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_18;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_15;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_13;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_11;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_8;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_5;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= _zz_25;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= _zz_23;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if(((! memory_arbitration_isStuck) && (! execute_arbitration_isStuckByOthers)))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_39;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= memory_REGFILE_WRITE_DATA;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if(execute_CsrPlugin_csr_836)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mip_MSIP <= _zz_173[0];
      end
    end
  end


endmodule

module StreamFifoLowLatency (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_error,
  input      [31:0]   io_push_payload_inst,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg          io_pop_payload_error,
  output reg [31:0]   io_pop_payload_inst,
  input               io_flush,
  output     [0:0]    io_occupancy,
  input               clk,
  input               reset
);
  wire                _zz_4;
  wire       [0:0]    _zz_5;
  reg                 _zz_1;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire       [32:0]   _zz_2;
  reg        [32:0]   _zz_3;

  assign _zz_4 = (! empty);
  assign _zz_5 = _zz_2[0 : 0];
  always @ (*) begin
    _zz_1 = 1'b0;
    if(pushing)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if(_zz_4)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_2 = _zz_3;
  always @ (*) begin
    if(_zz_4)begin
      io_pop_payload_error = _zz_5[0];
    end else begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @ (*) begin
    if(_zz_4)begin
      io_pop_payload_inst = _zz_2[32 : 1];
    end else begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign io_occupancy = (risingOccupancy && ptrMatch);
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    if(_zz_1)begin
      _zz_3 <= {io_push_payload_inst,io_push_payload_error};
    end
  end


endmodule
