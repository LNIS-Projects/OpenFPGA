// Generator : SpinalHDL v1.4.3    git head : adf552d8f500e7419fff395b7049228e4bc5de26
// Component : VexRiscv
// Git hash  : 36b3cd918896c94c4e8a224d97c559ab6dbf3ec9


`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define EnvCtrlEnum_defaultEncoding_type [0:0]
`define EnvCtrlEnum_defaultEncoding_NONE 1'b0
`define EnvCtrlEnum_defaultEncoding_XRET 1'b1

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

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
  output     [2:0]    dBus_cmd_payload_length,
  output              dBus_cmd_payload_last,
  input               dBus_rsp_valid,
  input               dBus_rsp_payload_last,
  input      [31:0]   dBus_rsp_payload_data,
  input               dBus_rsp_payload_error,
  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt,
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
  wire                _zz_184;
  wire                _zz_185;
  wire                _zz_186;
  wire                _zz_187;
  wire                _zz_188;
  wire                _zz_189;
  wire                _zz_190;
  wire                _zz_191;
  reg                 _zz_192;
  reg                 _zz_193;
  reg        [31:0]   _zz_194;
  reg                 _zz_195;
  reg        [31:0]   _zz_196;
  reg        [1:0]    _zz_197;
  reg                 _zz_198;
  wire       [31:0]   _zz_199;
  reg                 _zz_200;
  reg                 _zz_201;
  wire                _zz_202;
  wire       [31:0]   _zz_203;
  wire                _zz_204;
  wire                _zz_205;
  wire                _zz_206;
  wire                _zz_207;
  wire                _zz_208;
  wire                _zz_209;
  wire                _zz_210;
  wire                _zz_211;
  wire       [3:0]    _zz_212;
  wire                _zz_213;
  reg        [1:0]    _zz_214;
  reg        [31:0]   _zz_215;
  reg        [31:0]   _zz_216;
  reg        [31:0]   _zz_217;
  reg                 _zz_218;
  reg                 _zz_219;
  reg                 _zz_220;
  reg        [9:0]    _zz_221;
  reg        [9:0]    _zz_222;
  reg        [9:0]    _zz_223;
  reg        [9:0]    _zz_224;
  reg                 _zz_225;
  reg                 _zz_226;
  reg                 _zz_227;
  reg                 _zz_228;
  reg                 _zz_229;
  reg                 _zz_230;
  reg                 _zz_231;
  reg        [9:0]    _zz_232;
  reg        [9:0]    _zz_233;
  reg        [9:0]    _zz_234;
  reg        [9:0]    _zz_235;
  reg                 _zz_236;
  reg                 _zz_237;
  reg                 _zz_238;
  reg                 _zz_239;
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
  wire                dataCache_1_io_cpu_flush_ready;
  wire                dataCache_1_io_cpu_redo;
  wire                dataCache_1_io_mem_cmd_valid;
  wire                dataCache_1_io_mem_cmd_payload_wr;
  wire                dataCache_1_io_mem_cmd_payload_uncached;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_payload_length;
  wire                dataCache_1_io_mem_cmd_payload_last;
  wire                _zz_240;
  wire                _zz_241;
  wire                _zz_242;
  wire                _zz_243;
  wire                _zz_244;
  wire                _zz_245;
  wire                _zz_246;
  wire                _zz_247;
  wire                _zz_248;
  wire                _zz_249;
  wire                _zz_250;
  wire                _zz_251;
  wire                _zz_252;
  wire                _zz_253;
  wire                _zz_254;
  wire                _zz_255;
  wire       [1:0]    _zz_256;
  wire                _zz_257;
  wire                _zz_258;
  wire                _zz_259;
  wire                _zz_260;
  wire                _zz_261;
  wire                _zz_262;
  wire                _zz_263;
  wire                _zz_264;
  wire                _zz_265;
  wire                _zz_266;
  wire                _zz_267;
  wire                _zz_268;
  wire       [1:0]    _zz_269;
  wire                _zz_270;
  wire                _zz_271;
  wire                _zz_272;
  wire       [5:0]    _zz_273;
  wire                _zz_274;
  wire                _zz_275;
  wire                _zz_276;
  wire                _zz_277;
  wire                _zz_278;
  wire                _zz_279;
  wire                _zz_280;
  wire                _zz_281;
  wire                _zz_282;
  wire                _zz_283;
  wire                _zz_284;
  wire                _zz_285;
  wire                _zz_286;
  wire                _zz_287;
  wire                _zz_288;
  wire       [1:0]    _zz_289;
  wire       [1:0]    _zz_290;
  wire                _zz_291;
  wire       [51:0]   _zz_292;
  wire       [51:0]   _zz_293;
  wire       [51:0]   _zz_294;
  wire       [32:0]   _zz_295;
  wire       [51:0]   _zz_296;
  wire       [49:0]   _zz_297;
  wire       [51:0]   _zz_298;
  wire       [49:0]   _zz_299;
  wire       [51:0]   _zz_300;
  wire       [32:0]   _zz_301;
  wire       [31:0]   _zz_302;
  wire       [32:0]   _zz_303;
  wire       [0:0]    _zz_304;
  wire       [0:0]    _zz_305;
  wire       [0:0]    _zz_306;
  wire       [0:0]    _zz_307;
  wire       [0:0]    _zz_308;
  wire       [0:0]    _zz_309;
  wire       [0:0]    _zz_310;
  wire       [0:0]    _zz_311;
  wire       [0:0]    _zz_312;
  wire       [0:0]    _zz_313;
  wire       [0:0]    _zz_314;
  wire       [0:0]    _zz_315;
  wire       [0:0]    _zz_316;
  wire       [0:0]    _zz_317;
  wire       [0:0]    _zz_318;
  wire       [0:0]    _zz_319;
  wire       [0:0]    _zz_320;
  wire       [0:0]    _zz_321;
  wire       [0:0]    _zz_322;
  wire       [3:0]    _zz_323;
  wire       [2:0]    _zz_324;
  wire       [31:0]   _zz_325;
  wire       [1:0]    _zz_326;
  wire       [1:0]    _zz_327;
  wire       [1:0]    _zz_328;
  wire       [1:0]    _zz_329;
  wire       [9:0]    _zz_330;
  wire       [29:0]   _zz_331;
  wire       [9:0]    _zz_332;
  wire       [1:0]    _zz_333;
  wire       [1:0]    _zz_334;
  wire       [1:0]    _zz_335;
  wire       [19:0]   _zz_336;
  wire       [11:0]   _zz_337;
  wire       [31:0]   _zz_338;
  wire       [31:0]   _zz_339;
  wire       [19:0]   _zz_340;
  wire       [11:0]   _zz_341;
  wire       [2:0]    _zz_342;
  wire       [2:0]    _zz_343;
  wire       [0:0]    _zz_344;
  wire       [1:0]    _zz_345;
  wire       [0:0]    _zz_346;
  wire       [2:0]    _zz_347;
  wire       [0:0]    _zz_348;
  wire       [0:0]    _zz_349;
  wire       [0:0]    _zz_350;
  wire       [0:0]    _zz_351;
  wire       [0:0]    _zz_352;
  wire       [0:0]    _zz_353;
  wire       [0:0]    _zz_354;
  wire       [0:0]    _zz_355;
  wire       [1:0]    _zz_356;
  wire       [0:0]    _zz_357;
  wire       [2:0]    _zz_358;
  wire       [4:0]    _zz_359;
  wire       [11:0]   _zz_360;
  wire       [11:0]   _zz_361;
  wire       [31:0]   _zz_362;
  wire       [31:0]   _zz_363;
  wire       [31:0]   _zz_364;
  wire       [31:0]   _zz_365;
  wire       [31:0]   _zz_366;
  wire       [31:0]   _zz_367;
  wire       [31:0]   _zz_368;
  wire       [65:0]   _zz_369;
  wire       [65:0]   _zz_370;
  wire       [31:0]   _zz_371;
  wire       [31:0]   _zz_372;
  wire       [0:0]    _zz_373;
  wire       [5:0]    _zz_374;
  wire       [32:0]   _zz_375;
  wire       [31:0]   _zz_376;
  wire       [31:0]   _zz_377;
  wire       [32:0]   _zz_378;
  wire       [32:0]   _zz_379;
  wire       [32:0]   _zz_380;
  wire       [32:0]   _zz_381;
  wire       [0:0]    _zz_382;
  wire       [32:0]   _zz_383;
  wire       [0:0]    _zz_384;
  wire       [32:0]   _zz_385;
  wire       [0:0]    _zz_386;
  wire       [31:0]   _zz_387;
  wire       [1:0]    _zz_388;
  wire       [1:0]    _zz_389;
  wire       [11:0]   _zz_390;
  wire       [19:0]   _zz_391;
  wire       [11:0]   _zz_392;
  wire       [31:0]   _zz_393;
  wire       [31:0]   _zz_394;
  wire       [31:0]   _zz_395;
  wire       [11:0]   _zz_396;
  wire       [19:0]   _zz_397;
  wire       [11:0]   _zz_398;
  wire       [2:0]    _zz_399;
  wire       [0:0]    _zz_400;
  wire       [0:0]    _zz_401;
  wire       [0:0]    _zz_402;
  wire       [0:0]    _zz_403;
  wire       [0:0]    _zz_404;
  wire       [0:0]    _zz_405;
  wire       [0:0]    _zz_406;
  wire       [0:0]    _zz_407;
  wire       [0:0]    _zz_408;
  wire       [0:0]    _zz_409;
  wire       [0:0]    _zz_410;
  wire       [0:0]    _zz_411;
  wire       [0:0]    _zz_412;
  wire       [1:0]    _zz_413;
  wire                _zz_414;
  wire                _zz_415;
  wire       [1:0]    _zz_416;
  wire       [31:0]   _zz_417;
  wire       [31:0]   _zz_418;
  wire       [31:0]   _zz_419;
  wire                _zz_420;
  wire       [0:0]    _zz_421;
  wire       [13:0]   _zz_422;
  wire       [31:0]   _zz_423;
  wire       [31:0]   _zz_424;
  wire       [31:0]   _zz_425;
  wire                _zz_426;
  wire       [0:0]    _zz_427;
  wire       [7:0]    _zz_428;
  wire       [31:0]   _zz_429;
  wire       [31:0]   _zz_430;
  wire       [31:0]   _zz_431;
  wire                _zz_432;
  wire       [0:0]    _zz_433;
  wire       [1:0]    _zz_434;
  wire                _zz_435;
  wire                _zz_436;
  wire                _zz_437;
  wire       [31:0]   _zz_438;
  wire       [31:0]   _zz_439;
  wire       [31:0]   _zz_440;
  wire       [31:0]   _zz_441;
  wire                _zz_442;
  wire       [0:0]    _zz_443;
  wire       [0:0]    _zz_444;
  wire                _zz_445;
  wire       [0:0]    _zz_446;
  wire       [26:0]   _zz_447;
  wire       [31:0]   _zz_448;
  wire       [31:0]   _zz_449;
  wire       [31:0]   _zz_450;
  wire       [31:0]   _zz_451;
  wire       [0:0]    _zz_452;
  wire       [0:0]    _zz_453;
  wire                _zz_454;
  wire       [0:0]    _zz_455;
  wire       [22:0]   _zz_456;
  wire       [31:0]   _zz_457;
  wire                _zz_458;
  wire                _zz_459;
  wire       [0:0]    _zz_460;
  wire       [1:0]    _zz_461;
  wire       [0:0]    _zz_462;
  wire       [0:0]    _zz_463;
  wire                _zz_464;
  wire       [0:0]    _zz_465;
  wire       [18:0]   _zz_466;
  wire       [31:0]   _zz_467;
  wire       [31:0]   _zz_468;
  wire       [31:0]   _zz_469;
  wire       [31:0]   _zz_470;
  wire       [31:0]   _zz_471;
  wire       [31:0]   _zz_472;
  wire       [31:0]   _zz_473;
  wire       [31:0]   _zz_474;
  wire                _zz_475;
  wire       [1:0]    _zz_476;
  wire       [1:0]    _zz_477;
  wire                _zz_478;
  wire       [0:0]    _zz_479;
  wire       [15:0]   _zz_480;
  wire       [31:0]   _zz_481;
  wire       [31:0]   _zz_482;
  wire       [31:0]   _zz_483;
  wire       [31:0]   _zz_484;
  wire       [31:0]   _zz_485;
  wire       [31:0]   _zz_486;
  wire                _zz_487;
  wire       [1:0]    _zz_488;
  wire       [1:0]    _zz_489;
  wire                _zz_490;
  wire       [0:0]    _zz_491;
  wire       [12:0]   _zz_492;
  wire       [31:0]   _zz_493;
  wire       [31:0]   _zz_494;
  wire       [31:0]   _zz_495;
  wire       [31:0]   _zz_496;
  wire                _zz_497;
  wire       [0:0]    _zz_498;
  wire       [0:0]    _zz_499;
  wire                _zz_500;
  wire       [4:0]    _zz_501;
  wire       [4:0]    _zz_502;
  wire                _zz_503;
  wire       [0:0]    _zz_504;
  wire       [9:0]    _zz_505;
  wire       [31:0]   _zz_506;
  wire       [31:0]   _zz_507;
  wire       [31:0]   _zz_508;
  wire       [31:0]   _zz_509;
  wire       [0:0]    _zz_510;
  wire       [1:0]    _zz_511;
  wire       [0:0]    _zz_512;
  wire       [2:0]    _zz_513;
  wire       [0:0]    _zz_514;
  wire       [4:0]    _zz_515;
  wire       [1:0]    _zz_516;
  wire       [1:0]    _zz_517;
  wire                _zz_518;
  wire       [0:0]    _zz_519;
  wire       [6:0]    _zz_520;
  wire       [31:0]   _zz_521;
  wire       [31:0]   _zz_522;
  wire                _zz_523;
  wire                _zz_524;
  wire       [31:0]   _zz_525;
  wire       [31:0]   _zz_526;
  wire                _zz_527;
  wire       [0:0]    _zz_528;
  wire       [0:0]    _zz_529;
  wire                _zz_530;
  wire       [0:0]    _zz_531;
  wire       [2:0]    _zz_532;
  wire                _zz_533;
  wire       [0:0]    _zz_534;
  wire       [0:0]    _zz_535;
  wire       [0:0]    _zz_536;
  wire       [0:0]    _zz_537;
  wire                _zz_538;
  wire       [0:0]    _zz_539;
  wire       [4:0]    _zz_540;
  wire       [31:0]   _zz_541;
  wire       [31:0]   _zz_542;
  wire       [31:0]   _zz_543;
  wire       [31:0]   _zz_544;
  wire       [31:0]   _zz_545;
  wire       [31:0]   _zz_546;
  wire       [31:0]   _zz_547;
  wire       [31:0]   _zz_548;
  wire       [31:0]   _zz_549;
  wire       [31:0]   _zz_550;
  wire                _zz_551;
  wire       [0:0]    _zz_552;
  wire       [0:0]    _zz_553;
  wire       [31:0]   _zz_554;
  wire       [31:0]   _zz_555;
  wire       [31:0]   _zz_556;
  wire       [31:0]   _zz_557;
  wire       [31:0]   _zz_558;
  wire                _zz_559;
  wire       [3:0]    _zz_560;
  wire       [3:0]    _zz_561;
  wire                _zz_562;
  wire       [0:0]    _zz_563;
  wire       [2:0]    _zz_564;
  wire       [31:0]   _zz_565;
  wire       [31:0]   _zz_566;
  wire       [31:0]   _zz_567;
  wire       [31:0]   _zz_568;
  wire       [31:0]   _zz_569;
  wire       [31:0]   _zz_570;
  wire                _zz_571;
  wire       [0:0]    _zz_572;
  wire       [1:0]    _zz_573;
  wire                _zz_574;
  wire       [2:0]    _zz_575;
  wire       [2:0]    _zz_576;
  wire                _zz_577;
  wire       [0:0]    _zz_578;
  wire       [0:0]    _zz_579;
  wire       [31:0]   _zz_580;
  wire       [31:0]   _zz_581;
  wire       [31:0]   _zz_582;
  wire       [31:0]   _zz_583;
  wire       [31:0]   _zz_584;
  wire       [31:0]   _zz_585;
  wire       [31:0]   _zz_586;
  wire                _zz_587;
  wire                _zz_588;
  wire                _zz_589;
  wire       [0:0]    _zz_590;
  wire       [0:0]    _zz_591;
  wire                _zz_592;
  wire                _zz_593;
  wire                _zz_594;
  wire                _zz_595;
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
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire                decode_DO_EBREAK;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_SRC2_FORCE_ZERO;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_1;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_2;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_3;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_4;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_5;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_6;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_7;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_8;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_9;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_10;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_11;
  wire                decode_IS_CSR;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_12;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_13;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_14;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_15;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_16;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_17;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_18;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_19;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                memory_IS_SFENCE_VMA;
  wire                execute_IS_SFENCE_VMA;
  wire                decode_IS_SFENCE_VMA;
  wire                decode_MEMORY_MANAGMENT;
  wire                memory_MEMORY_WR;
  wire                decode_MEMORY_WR;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_20;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_21;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_22;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_23;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_24;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_25;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_26;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_27;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_28;
  wire                decode_MEMORY_FORCE_CONSTISTENCY;
  wire                execute_PREDICTION_CONTEXT_hazard;
  wire       [1:0]    execute_PREDICTION_CONTEXT_line_history;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  wire                execute_BRANCH_COND_RESULT;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_29;
  wire       [31:0]   execute_PC;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_30;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_31;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_32;
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
  reg        [31:0]   _zz_33;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_34;
  wire       `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_35;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_36;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_37;
  wire       `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_38;
  wire       `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_39;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_40;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_41;
  wire       [31:0]   _zz_42;
  wire                _zz_43;
  reg                 _zz_44;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_45;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_46;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_47;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_48;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_49;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_50;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_51;
  wire                writeBack_IS_SFENCE_VMA;
  wire                writeBack_IS_DBUS_SHARING;
  wire                memory_IS_DBUS_SHARING;
  reg        [31:0]   _zz_52;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire                writeBack_MEMORY_WR;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire                writeBack_MEMORY_ENABLE;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_ENABLE;
  wire                execute_MEMORY_FORCE_CONSTISTENCY;
  wire                execute_MEMORY_MANAGMENT;
  (* keep , syn_keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire                execute_MEMORY_WR;
  wire       [31:0]   execute_SRC_ADD;
  wire                execute_MEMORY_ENABLE;
  wire       [31:0]   execute_INSTRUCTION;
  wire                decode_MEMORY_ENABLE;
  wire                decode_FLUSH_ALL;
  reg                 IBusCachedPlugin_rsp_issueDetected_4;
  reg                 IBusCachedPlugin_rsp_issueDetected_3;
  reg                 IBusCachedPlugin_rsp_issueDetected_2;
  reg                 IBusCachedPlugin_rsp_issueDetected_1;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_53;
  wire       [31:0]   decode_INSTRUCTION;
  wire       `BranchCtrlEnum_defaultEncoding_type memory_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_54;
  wire       [31:0]   memory_PC;
  wire                memory_PREDICTION_CONTEXT_hazard;
  wire       [1:0]    memory_PREDICTION_CONTEXT_line_history;
  wire                decode_PREDICTION_CONTEXT_hazard;
  wire       [1:0]    decode_PREDICTION_CONTEXT_line_history;
  reg                 _zz_55;
  reg        [31:0]   _zz_56;
  reg        [31:0]   _zz_57;
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
  wire                DBusCachedPlugin_mmuBus_rsp_ways_4_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_4_physical;
  wire                DBusCachedPlugin_mmuBus_rsp_ways_5_sel;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_ways_5_physical;
  wire                DBusCachedPlugin_mmuBus_end;
  wire                DBusCachedPlugin_mmuBus_busy;
  reg                 DBusCachedPlugin_redoBranch_valid;
  wire       [31:0]   DBusCachedPlugin_redoBranch_payload;
  reg                 DBusCachedPlugin_exceptionBus_valid;
  reg        [3:0]    DBusCachedPlugin_exceptionBus_payload_code;
  wire       [31:0]   DBusCachedPlugin_exceptionBus_payload_badAddr;
  reg                 _zz_58;
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
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 IBusCachedPlugin_injectionPort_valid;
  reg                 IBusCachedPlugin_injectionPort_ready;
  wire       [31:0]   IBusCachedPlugin_injectionPort_payload;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                BranchPlugin_branchExceptionPort_valid;
  wire       [3:0]    BranchPlugin_branchExceptionPort_payload_code;
  wire       [31:0]   BranchPlugin_branchExceptionPort_payload_badAddr;
  wire                IBusCachedPlugin_externalFlush;
  wire                IBusCachedPlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusCachedPlugin_jump_pcLoad_payload;
  wire       [3:0]    _zz_59;
  wire       [3:0]    _zz_60;
  wire                _zz_61;
  wire                _zz_62;
  wire                _zz_63;
  wire                IBusCachedPlugin_fetchPc_output_valid;
  wire                IBusCachedPlugin_fetchPc_output_ready;
  wire       [31:0]   IBusCachedPlugin_fetchPc_output_payload;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusCachedPlugin_fetchPc_correction;
  reg                 IBusCachedPlugin_fetchPc_correctionReg;
  wire                IBusCachedPlugin_fetchPc_corrected;
  reg                 IBusCachedPlugin_fetchPc_pcRegPropagate;
  reg                 IBusCachedPlugin_fetchPc_booted;
  reg                 IBusCachedPlugin_fetchPc_inc;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pc;
  wire                IBusCachedPlugin_fetchPc_redo_valid;
  wire       [31:0]   IBusCachedPlugin_fetchPc_redo_payload;
  reg                 IBusCachedPlugin_fetchPc_flushed;
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
  wire                _zz_64;
  wire                _zz_65;
  wire                _zz_66;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                _zz_67;
  wire                _zz_68;
  reg                 _zz_69;
  wire                _zz_70;
  reg                 _zz_71;
  reg        [31:0]   _zz_72;
  reg                 IBusCachedPlugin_iBusRsp_readyForError;
  wire                IBusCachedPlugin_iBusRsp_output_valid;
  wire                IBusCachedPlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_pc;
  wire                IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_0;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_1;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_2;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_3;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_4;
  wire                _zz_74;
  wire       [9:0]    _zz_75;
  reg                 _zz_76;
  reg        [9:0]    _zz_77;
  wire       [29:0]   _zz_78;
  wire                _zz_79;
  reg                 _zz_80;
  reg        [1:0]    _zz_81;
  wire                _zz_82;
  wire                _zz_83;
  reg        [10:0]   _zz_84;
  wire                _zz_85;
  reg        [18:0]   _zz_86;
  reg                 _zz_87;
  wire                _zz_88;
  reg        [10:0]   _zz_89;
  wire                _zz_90;
  reg        [18:0]   _zz_91;
  wire       [31:0]   _zz_92;
  reg        [31:0]   IBusCachedPlugin_rspCounter;
  wire                IBusCachedPlugin_s0_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s1_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s2_tightlyCoupledHit;
  wire                IBusCachedPlugin_rsp_iBusRspOutputHalt;
  wire                IBusCachedPlugin_rsp_issueDetected;
  reg                 IBusCachedPlugin_rsp_redoFetch;
  wire       [31:0]   _zz_93;
  reg        [31:0]   DBusCachedPlugin_rspCounter;
  wire       [1:0]    execute_DBusCachedPlugin_size;
  reg        [31:0]   _zz_94;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspShifted;
  wire                _zz_95;
  reg        [31:0]   _zz_96;
  wire                _zz_97;
  reg        [31:0]   _zz_98;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspFormated;
  reg                 DBusCachedPlugin_forceDatapath;
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
  reg        [3:0]    MmuPlugin_ports_0_cacheHitsCalc;
  wire                MmuPlugin_ports_0_cacheHit;
  wire                _zz_99;
  wire                _zz_100;
  wire                _zz_101;
  wire       [1:0]    _zz_102;
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
  reg                 MmuPlugin_ports_1_cache_4_valid;
  reg                 MmuPlugin_ports_1_cache_4_exception;
  reg                 MmuPlugin_ports_1_cache_4_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_4_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_4_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_4_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_4_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_4_allowRead;
  reg                 MmuPlugin_ports_1_cache_4_allowWrite;
  reg                 MmuPlugin_ports_1_cache_4_allowExecute;
  reg                 MmuPlugin_ports_1_cache_4_allowUser;
  reg                 MmuPlugin_ports_1_cache_5_valid;
  reg                 MmuPlugin_ports_1_cache_5_exception;
  reg                 MmuPlugin_ports_1_cache_5_superPage;
  reg        [9:0]    MmuPlugin_ports_1_cache_5_virtualAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_5_virtualAddress_1;
  reg        [9:0]    MmuPlugin_ports_1_cache_5_physicalAddress_0;
  reg        [9:0]    MmuPlugin_ports_1_cache_5_physicalAddress_1;
  reg                 MmuPlugin_ports_1_cache_5_allowRead;
  reg                 MmuPlugin_ports_1_cache_5_allowWrite;
  reg                 MmuPlugin_ports_1_cache_5_allowExecute;
  reg                 MmuPlugin_ports_1_cache_5_allowUser;
  wire                MmuPlugin_ports_1_dirty;
  reg                 MmuPlugin_ports_1_requireMmuLockupCalc;
  reg        [5:0]    MmuPlugin_ports_1_cacheHitsCalc;
  wire                MmuPlugin_ports_1_cacheHit;
  wire                _zz_103;
  wire                _zz_104;
  wire                _zz_105;
  wire                _zz_106;
  wire                _zz_107;
  wire       [2:0]    _zz_108;
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
  reg        [2:0]    MmuPlugin_ports_1_entryToReplace_valueNext;
  reg        [2:0]    MmuPlugin_ports_1_entryToReplace_value;
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
  reg        [1:0]    _zz_109;
  wire       [1:0]    _zz_110;
  reg        [1:0]    _zz_111;
  wire       [1:0]    MmuPlugin_shared_refills;
  wire       [1:0]    _zz_112;
  reg        [1:0]    _zz_113;
  wire       [31:0]   _zz_114;
  wire       [32:0]   _zz_115;
  wire                _zz_116;
  wire                _zz_117;
  wire                _zz_118;
  wire                _zz_119;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_120;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_121;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_122;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_123;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_124;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_125;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_126;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_127;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_128;
  reg        [31:0]   _zz_129;
  wire                _zz_130;
  reg        [19:0]   _zz_131;
  wire                _zz_132;
  reg        [19:0]   _zz_133;
  reg        [31:0]   _zz_134;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_135;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_136;
  reg                 _zz_137;
  reg                 _zz_138;
  reg                 _zz_139;
  reg        [4:0]    _zz_140;
  reg        [31:0]   _zz_141;
  wire                _zz_142;
  wire                _zz_143;
  wire                _zz_144;
  wire                _zz_145;
  wire                _zz_146;
  wire                _zz_147;
  reg                 execute_MulPlugin_aSigned;
  reg                 execute_MulPlugin_bSigned;
  wire       [31:0]   execute_MulPlugin_a;
  wire       [31:0]   execute_MulPlugin_b;
  wire       [15:0]   execute_MulPlugin_aULow;
  wire       [15:0]   execute_MulPlugin_bULow;
  wire       [16:0]   execute_MulPlugin_aSLow;
  wire       [16:0]   execute_MulPlugin_bSLow;
  wire       [16:0]   execute_MulPlugin_aHigh;
  wire       [16:0]   execute_MulPlugin_bHigh;
  wire       [65:0]   writeBack_MulPlugin_result;
  reg        [32:0]   memory_DivPlugin_rs1;
  reg        [31:0]   memory_DivPlugin_rs2;
  reg        [64:0]   memory_DivPlugin_accumulator;
  wire                memory_DivPlugin_frontendOk;
  reg                 memory_DivPlugin_div_needRevert;
  reg                 memory_DivPlugin_div_counter_willIncrement;
  reg                 memory_DivPlugin_div_counter_willClear;
  reg        [5:0]    memory_DivPlugin_div_counter_valueNext;
  reg        [5:0]    memory_DivPlugin_div_counter_value;
  wire                memory_DivPlugin_div_counter_willOverflowIfInc;
  wire                memory_DivPlugin_div_counter_willOverflow;
  reg                 memory_DivPlugin_div_done;
  reg        [31:0]   memory_DivPlugin_div_result;
  wire       [31:0]   _zz_148;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outNumerator;
  wire       [31:0]   _zz_149;
  wire                _zz_150;
  wire                _zz_151;
  reg        [32:0]   _zz_152;
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
  wire                _zz_153;
  wire                _zz_154;
  wire                _zz_155;
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
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire       [1:0]    _zz_156;
  wire                _zz_157;
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
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
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
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  reg                 DebugPlugin_haltedByBreak;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_158;
  wire                DebugPlugin_allowEBreak;
  reg                 DebugPlugin_resetIt_regNext;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_159;
  reg                 _zz_160;
  reg                 _zz_161;
  wire                _zz_162;
  reg        [19:0]   _zz_163;
  wire                _zz_164;
  reg        [10:0]   _zz_165;
  wire                _zz_166;
  reg        [18:0]   _zz_167;
  reg                 _zz_168;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_169;
  reg        [19:0]   _zz_170;
  wire                _zz_171;
  reg        [10:0]   _zz_172;
  wire                _zz_173;
  reg        [18:0]   _zz_174;
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
  reg                 decode_to_execute_PREDICTION_CONTEXT_hazard;
  reg        [1:0]    decode_to_execute_PREDICTION_CONTEXT_line_history;
  reg                 execute_to_memory_PREDICTION_CONTEXT_hazard;
  reg        [1:0]    execute_to_memory_PREDICTION_CONTEXT_line_history;
  reg                 decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  reg        `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg        `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg                 decode_to_execute_MEMORY_WR;
  reg                 execute_to_memory_MEMORY_WR;
  reg                 memory_to_writeBack_MEMORY_WR;
  reg                 decode_to_execute_MEMORY_MANAGMENT;
  reg                 decode_to_execute_IS_SFENCE_VMA;
  reg                 execute_to_memory_IS_SFENCE_VMA;
  reg                 memory_to_writeBack_IS_SFENCE_VMA;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg                 decode_to_execute_IS_MUL;
  reg                 execute_to_memory_IS_MUL;
  reg                 memory_to_writeBack_IS_MUL;
  reg                 decode_to_execute_IS_DIV;
  reg                 execute_to_memory_IS_DIV;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  reg                 decode_to_execute_IS_CSR;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg        `BranchCtrlEnum_defaultEncoding_type execute_to_memory_BRANCH_CTRL;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg                 decode_to_execute_DO_EBREAK;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg                 execute_to_memory_IS_DBUS_SHARING;
  reg                 memory_to_writeBack_IS_DBUS_SHARING;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  reg        [31:0]   execute_to_memory_MUL_LL;
  reg        [33:0]   execute_to_memory_MUL_LH;
  reg        [33:0]   execute_to_memory_MUL_HL;
  reg        [33:0]   execute_to_memory_MUL_HH;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  reg                 execute_to_memory_BRANCH_DO;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  reg        [2:0]    _zz_175;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_256;
  reg                 execute_CsrPlugin_csr_384;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_833;
  reg                 execute_CsrPlugin_csr_834;
  reg                 execute_CsrPlugin_csr_835;
  reg        [31:0]   _zz_176;
  reg        [31:0]   _zz_177;
  reg        [31:0]   _zz_178;
  reg        [31:0]   _zz_179;
  reg        [31:0]   _zz_180;
  reg        [31:0]   _zz_181;
  reg        [31:0]   _zz_182;
  reg        [31:0]   _zz_183;
  `ifndef SYNTHESIS
  reg [31:0] _zz_1_string;
  reg [31:0] _zz_2_string;
  reg [31:0] _zz_3_string;
  reg [31:0] _zz_4_string;
  reg [31:0] _zz_5_string;
  reg [31:0] _zz_6_string;
  reg [31:0] _zz_7_string;
  reg [31:0] _zz_8_string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_9_string;
  reg [31:0] _zz_10_string;
  reg [31:0] _zz_11_string;
  reg [71:0] _zz_12_string;
  reg [71:0] _zz_13_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_14_string;
  reg [71:0] _zz_15_string;
  reg [71:0] _zz_16_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_17_string;
  reg [39:0] _zz_18_string;
  reg [39:0] _zz_19_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_20_string;
  reg [23:0] _zz_21_string;
  reg [23:0] _zz_22_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_23_string;
  reg [63:0] _zz_24_string;
  reg [63:0] _zz_25_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_26_string;
  reg [95:0] _zz_27_string;
  reg [95:0] _zz_28_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_29_string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_30_string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_31_string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_32_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_35_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_36_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_38_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_39_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_40_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_41_string;
  reg [31:0] _zz_45_string;
  reg [31:0] _zz_46_string;
  reg [71:0] _zz_47_string;
  reg [39:0] _zz_48_string;
  reg [23:0] _zz_49_string;
  reg [63:0] _zz_50_string;
  reg [95:0] _zz_51_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_53_string;
  reg [31:0] memory_BRANCH_CTRL_string;
  reg [31:0] _zz_54_string;
  reg [47:0] MmuPlugin_shared_state_1_string;
  reg [95:0] _zz_120_string;
  reg [63:0] _zz_121_string;
  reg [23:0] _zz_122_string;
  reg [39:0] _zz_123_string;
  reg [71:0] _zz_124_string;
  reg [31:0] _zz_125_string;
  reg [31:0] _zz_126_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] execute_to_memory_BRANCH_CTRL_string;
  `endif

  reg [1:0] _zz_73 [0:1023];
  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_240 = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_241 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_242 = 1'b1;
  assign _zz_243 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_244 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_245 = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_246 = ((_zz_189 && IBusCachedPlugin_cache_io_cpu_decode_error) && (! IBusCachedPlugin_rsp_issueDetected_3));
  assign _zz_247 = ((_zz_189 && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! IBusCachedPlugin_rsp_issueDetected_2));
  assign _zz_248 = ((_zz_189 && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! IBusCachedPlugin_rsp_issueDetected_1));
  assign _zz_249 = ((_zz_189 && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign _zz_250 = ({decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid} != 2'b00);
  assign _zz_251 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_252 = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) == 1'b0);
  assign _zz_253 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_254 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_255 = (DebugPlugin_stepIt && IBusCachedPlugin_incomingInstruction);
  assign _zz_256 = writeBack_INSTRUCTION[29 : 28];
  assign _zz_257 = (! ({(writeBack_arbitration_isValid || CsrPlugin_exceptionPendings_3),{(memory_arbitration_isValid || CsrPlugin_exceptionPendings_2),(execute_arbitration_isValid || CsrPlugin_exceptionPendings_1)}} != 3'b000));
  assign _zz_258 = (! dataCache_1_io_cpu_execute_refilling);
  assign _zz_259 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_260 = ((MmuPlugin_shared_dBusRspStaged_valid && (! MmuPlugin_shared_dBusRspStaged_payload_redo)) && (MmuPlugin_shared_dBusRsp_leaf || MmuPlugin_shared_dBusRsp_exception));
  assign _zz_261 = MmuPlugin_shared_portSortedOh[0];
  assign _zz_262 = MmuPlugin_shared_portSortedOh[1];
  assign _zz_263 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_264 = (1'b0 || (! 1'b1));
  assign _zz_265 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_266 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_267 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_268 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_269 = execute_INSTRUCTION[13 : 12];
  assign _zz_270 = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_271 = (! memory_arbitration_isStuck);
  assign _zz_272 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign _zz_273 = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_274 = (MmuPlugin_shared_refills != 2'b00);
  assign _zz_275 = (MmuPlugin_ports_0_entryToReplace_value == 2'b00);
  assign _zz_276 = (MmuPlugin_ports_0_entryToReplace_value == 2'b01);
  assign _zz_277 = (MmuPlugin_ports_0_entryToReplace_value == 2'b10);
  assign _zz_278 = (MmuPlugin_ports_0_entryToReplace_value == 2'b11);
  assign _zz_279 = (MmuPlugin_ports_1_entryToReplace_value == 3'b000);
  assign _zz_280 = (MmuPlugin_ports_1_entryToReplace_value == 3'b001);
  assign _zz_281 = (MmuPlugin_ports_1_entryToReplace_value == 3'b010);
  assign _zz_282 = (MmuPlugin_ports_1_entryToReplace_value == 3'b011);
  assign _zz_283 = (MmuPlugin_ports_1_entryToReplace_value == 3'b100);
  assign _zz_284 = (MmuPlugin_ports_1_entryToReplace_value == 3'b101);
  assign _zz_285 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign _zz_286 = ((_zz_153 && 1'b1) && (! 1'b0));
  assign _zz_287 = ((_zz_154 && 1'b1) && (! 1'b0));
  assign _zz_288 = ((_zz_155 && 1'b1) && (! 1'b0));
  assign _zz_289 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_290 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_291 = execute_INSTRUCTION[13];
  assign _zz_292 = ($signed(_zz_293) + $signed(_zz_298));
  assign _zz_293 = ($signed(_zz_294) + $signed(_zz_296));
  assign _zz_294 = 52'h0;
  assign _zz_295 = {1'b0,memory_MUL_LL};
  assign _zz_296 = {{19{_zz_295[32]}}, _zz_295};
  assign _zz_297 = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_298 = {{2{_zz_297[49]}}, _zz_297};
  assign _zz_299 = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_300 = {{2{_zz_299[49]}}, _zz_299};
  assign _zz_301 = ($signed(_zz_303) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_302 = _zz_301[31 : 0];
  assign _zz_303 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_304 = _zz_115[28 : 28];
  assign _zz_305 = _zz_115[27 : 27];
  assign _zz_306 = _zz_115[26 : 26];
  assign _zz_307 = _zz_115[25 : 25];
  assign _zz_308 = _zz_115[24 : 24];
  assign _zz_309 = _zz_115[18 : 18];
  assign _zz_310 = _zz_115[17 : 17];
  assign _zz_311 = _zz_115[16 : 16];
  assign _zz_312 = _zz_115[13 : 13];
  assign _zz_313 = _zz_115[12 : 12];
  assign _zz_314 = _zz_115[11 : 11];
  assign _zz_315 = _zz_115[30 : 30];
  assign _zz_316 = _zz_115[15 : 15];
  assign _zz_317 = _zz_115[5 : 5];
  assign _zz_318 = _zz_115[3 : 3];
  assign _zz_319 = _zz_115[21 : 21];
  assign _zz_320 = _zz_115[10 : 10];
  assign _zz_321 = _zz_115[4 : 4];
  assign _zz_322 = _zz_115[0 : 0];
  assign _zz_323 = (_zz_59 - 4'b0001);
  assign _zz_324 = {IBusCachedPlugin_fetchPc_inc,2'b00};
  assign _zz_325 = {29'd0, _zz_324};
  assign _zz_326 = ($signed(memory_PREDICTION_CONTEXT_line_history) + $signed(_zz_327));
  assign _zz_327 = (_zz_82 ? _zz_328 : _zz_329);
  assign _zz_328 = 2'b11;
  assign _zz_329 = 2'b01;
  assign _zz_330 = _zz_78[9:0];
  assign _zz_331 = (IBusCachedPlugin_iBusRsp_stages_0_input_payload >>> 2);
  assign _zz_332 = _zz_331[9:0];
  assign _zz_333 = (_zz_82 ? _zz_334 : _zz_335);
  assign _zz_334 = 2'b10;
  assign _zz_335 = 2'b01;
  assign _zz_336 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_337 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_338 = {{_zz_84,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_339 = {{_zz_86,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_340 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_341 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_342 = (writeBack_MEMORY_WR ? 3'b111 : 3'b101);
  assign _zz_343 = (writeBack_MEMORY_WR ? 3'b110 : 3'b100);
  assign _zz_344 = MmuPlugin_ports_0_entryToReplace_willIncrement;
  assign _zz_345 = {1'd0, _zz_344};
  assign _zz_346 = MmuPlugin_ports_1_entryToReplace_willIncrement;
  assign _zz_347 = {2'd0, _zz_346};
  assign _zz_348 = MmuPlugin_shared_dBusRspStaged_payload_data[0 : 0];
  assign _zz_349 = MmuPlugin_shared_dBusRspStaged_payload_data[1 : 1];
  assign _zz_350 = MmuPlugin_shared_dBusRspStaged_payload_data[2 : 2];
  assign _zz_351 = MmuPlugin_shared_dBusRspStaged_payload_data[3 : 3];
  assign _zz_352 = MmuPlugin_shared_dBusRspStaged_payload_data[4 : 4];
  assign _zz_353 = MmuPlugin_shared_dBusRspStaged_payload_data[5 : 5];
  assign _zz_354 = MmuPlugin_shared_dBusRspStaged_payload_data[6 : 6];
  assign _zz_355 = MmuPlugin_shared_dBusRspStaged_payload_data[7 : 7];
  assign _zz_356 = (_zz_111 - 2'b01);
  assign _zz_357 = execute_SRC_LESS;
  assign _zz_358 = 3'b100;
  assign _zz_359 = execute_INSTRUCTION[19 : 15];
  assign _zz_360 = execute_INSTRUCTION[31 : 20];
  assign _zz_361 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_362 = ($signed(_zz_363) + $signed(_zz_366));
  assign _zz_363 = ($signed(_zz_364) + $signed(_zz_365));
  assign _zz_364 = execute_SRC1;
  assign _zz_365 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_366 = (execute_SRC_USE_SUB_LESS ? _zz_367 : _zz_368);
  assign _zz_367 = 32'h00000001;
  assign _zz_368 = 32'h0;
  assign _zz_369 = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_370 = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_371 = writeBack_MUL_LOW[31 : 0];
  assign _zz_372 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_373 = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_374 = {5'd0, _zz_373};
  assign _zz_375 = {1'd0, memory_DivPlugin_rs2};
  assign _zz_376 = memory_DivPlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_377 = memory_DivPlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_378 = {_zz_148,(! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_379 = _zz_380;
  assign _zz_380 = _zz_381;
  assign _zz_381 = ({memory_DivPlugin_div_needRevert,(memory_DivPlugin_div_needRevert ? (~ _zz_149) : _zz_149)} + _zz_383);
  assign _zz_382 = memory_DivPlugin_div_needRevert;
  assign _zz_383 = {32'd0, _zz_382};
  assign _zz_384 = _zz_151;
  assign _zz_385 = {32'd0, _zz_384};
  assign _zz_386 = _zz_150;
  assign _zz_387 = {31'd0, _zz_386};
  assign _zz_388 = (_zz_156 & (~ _zz_389));
  assign _zz_389 = (_zz_156 - 2'b01);
  assign _zz_390 = execute_INSTRUCTION[31 : 20];
  assign _zz_391 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_392 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_393 = {_zz_163,execute_INSTRUCTION[31 : 20]};
  assign _zz_394 = {{_zz_165,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_395 = {{_zz_167,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_396 = execute_INSTRUCTION[31 : 20];
  assign _zz_397 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_398 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_399 = 3'b100;
  assign _zz_400 = execute_CsrPlugin_writeData[19 : 19];
  assign _zz_401 = execute_CsrPlugin_writeData[18 : 18];
  assign _zz_402 = execute_CsrPlugin_writeData[17 : 17];
  assign _zz_403 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_404 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_405 = execute_CsrPlugin_writeData[19 : 19];
  assign _zz_406 = execute_CsrPlugin_writeData[18 : 18];
  assign _zz_407 = execute_CsrPlugin_writeData[17 : 17];
  assign _zz_408 = execute_CsrPlugin_writeData[31 : 31];
  assign _zz_409 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_410 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_411 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_412 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_413 = _zz_326;
  assign _zz_414 = 1'b1;
  assign _zz_415 = 1'b1;
  assign _zz_416 = {_zz_63,_zz_62};
  assign _zz_417 = 32'h0000107f;
  assign _zz_418 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_419 = 32'h00002073;
  assign _zz_420 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_421 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_422 = {((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & 32'h0000207f) == 32'h00000003),{((decode_INSTRUCTION & _zz_423) == 32'h00000003),{(_zz_424 == _zz_425),{_zz_426,{_zz_427,_zz_428}}}}}};
  assign _zz_423 = 32'h0000505f;
  assign _zz_424 = (decode_INSTRUCTION & 32'h0000707b);
  assign _zz_425 = 32'h00000063;
  assign _zz_426 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_427 = ((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033);
  assign _zz_428 = {((decode_INSTRUCTION & 32'h01f0707f) == 32'h0000500f),{((decode_INSTRUCTION & 32'hbc00707f) == 32'h00005013),{((decode_INSTRUCTION & _zz_429) == 32'h00001013),{(_zz_430 == _zz_431),{_zz_432,{_zz_433,_zz_434}}}}}};
  assign _zz_429 = 32'hfc00307f;
  assign _zz_430 = (decode_INSTRUCTION & 32'hbe00707f);
  assign _zz_431 = 32'h00005033;
  assign _zz_432 = ((decode_INSTRUCTION & 32'hbe00707f) == 32'h00000033);
  assign _zz_433 = ((decode_INSTRUCTION & 32'hfe007fff) == 32'h12000073);
  assign _zz_434 = {((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073),((decode_INSTRUCTION & 32'hffffffff) == 32'h00100073)};
  assign _zz_435 = decode_INSTRUCTION[31];
  assign _zz_436 = decode_INSTRUCTION[31];
  assign _zz_437 = decode_INSTRUCTION[7];
  assign _zz_438 = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz_439 = 32'h00000004;
  assign _zz_440 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_441 = 32'h00000040;
  assign _zz_442 = ((decode_INSTRUCTION & 32'h10003050) == 32'h00000050);
  assign _zz_443 = ((decode_INSTRUCTION & 32'h02103050) == 32'h00000050);
  assign _zz_444 = 1'b0;
  assign _zz_445 = ({(_zz_448 == _zz_449),(_zz_450 == _zz_451)} != 2'b00);
  assign _zz_446 = (_zz_119 != 1'b0);
  assign _zz_447 = {(_zz_119 != 1'b0),{(_zz_452 != _zz_453),{_zz_454,{_zz_455,_zz_456}}}};
  assign _zz_448 = (decode_INSTRUCTION & 32'h00001050);
  assign _zz_449 = 32'h00001050;
  assign _zz_450 = (decode_INSTRUCTION & 32'h00002050);
  assign _zz_451 = 32'h00002050;
  assign _zz_452 = ((decode_INSTRUCTION & 32'h02004064) == 32'h02004020);
  assign _zz_453 = 1'b0;
  assign _zz_454 = (((decode_INSTRUCTION & _zz_457) == 32'h02000030) != 1'b0);
  assign _zz_455 = ({_zz_458,_zz_459} != 2'b00);
  assign _zz_456 = {({_zz_460,_zz_461} != 3'b000),{(_zz_462 != _zz_463),{_zz_464,{_zz_465,_zz_466}}}};
  assign _zz_457 = 32'h02004074;
  assign _zz_458 = ((decode_INSTRUCTION & 32'h00007034) == 32'h00005010);
  assign _zz_459 = ((decode_INSTRUCTION & 32'h02007064) == 32'h00005020);
  assign _zz_460 = ((decode_INSTRUCTION & _zz_467) == 32'h40001010);
  assign _zz_461 = {(_zz_468 == _zz_469),(_zz_470 == _zz_471)};
  assign _zz_462 = ((decode_INSTRUCTION & _zz_472) == 32'h00000024);
  assign _zz_463 = 1'b0;
  assign _zz_464 = ((_zz_473 == _zz_474) != 1'b0);
  assign _zz_465 = (_zz_475 != 1'b0);
  assign _zz_466 = {(_zz_476 != _zz_477),{_zz_478,{_zz_479,_zz_480}}};
  assign _zz_467 = 32'h40003054;
  assign _zz_468 = (decode_INSTRUCTION & 32'h00007034);
  assign _zz_469 = 32'h00001010;
  assign _zz_470 = (decode_INSTRUCTION & 32'h02007054);
  assign _zz_471 = 32'h00001010;
  assign _zz_472 = 32'h00000064;
  assign _zz_473 = (decode_INSTRUCTION & 32'h00001000);
  assign _zz_474 = 32'h00001000;
  assign _zz_475 = ((decode_INSTRUCTION & 32'h00003000) == 32'h00002000);
  assign _zz_476 = {(_zz_481 == _zz_482),(_zz_483 == _zz_484)};
  assign _zz_477 = 2'b00;
  assign _zz_478 = ((_zz_485 == _zz_486) != 1'b0);
  assign _zz_479 = (_zz_487 != 1'b0);
  assign _zz_480 = {(_zz_488 != _zz_489),{_zz_490,{_zz_491,_zz_492}}};
  assign _zz_481 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_482 = 32'h00002000;
  assign _zz_483 = (decode_INSTRUCTION & 32'h00005000);
  assign _zz_484 = 32'h00001000;
  assign _zz_485 = (decode_INSTRUCTION & 32'h02003050);
  assign _zz_486 = 32'h02000050;
  assign _zz_487 = ((decode_INSTRUCTION & 32'h00004048) == 32'h00004008);
  assign _zz_488 = {(_zz_493 == _zz_494),(_zz_495 == _zz_496)};
  assign _zz_489 = 2'b00;
  assign _zz_490 = ({_zz_497,{_zz_498,_zz_499}} != 3'b000);
  assign _zz_491 = (_zz_500 != 1'b0);
  assign _zz_492 = {(_zz_501 != _zz_502),{_zz_503,{_zz_504,_zz_505}}};
  assign _zz_493 = (decode_INSTRUCTION & 32'h00000034);
  assign _zz_494 = 32'h00000020;
  assign _zz_495 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_496 = 32'h00000020;
  assign _zz_497 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000040);
  assign _zz_498 = ((decode_INSTRUCTION & _zz_506) == 32'h0);
  assign _zz_499 = ((decode_INSTRUCTION & _zz_507) == 32'h00000040);
  assign _zz_500 = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz_501 = {(_zz_508 == _zz_509),{_zz_117,{_zz_510,_zz_511}}};
  assign _zz_502 = 5'h0;
  assign _zz_503 = ({_zz_117,{_zz_512,_zz_513}} != 5'h0);
  assign _zz_504 = ({_zz_514,_zz_515} != 6'h0);
  assign _zz_505 = {(_zz_516 != _zz_517),{_zz_518,{_zz_519,_zz_520}}};
  assign _zz_506 = 32'h00000038;
  assign _zz_507 = 32'h02103040;
  assign _zz_508 = (decode_INSTRUCTION & 32'h00000040);
  assign _zz_509 = 32'h00000040;
  assign _zz_510 = (_zz_521 == _zz_522);
  assign _zz_511 = {_zz_523,_zz_524};
  assign _zz_512 = (_zz_525 == _zz_526);
  assign _zz_513 = {_zz_527,{_zz_528,_zz_529}};
  assign _zz_514 = _zz_118;
  assign _zz_515 = {_zz_530,{_zz_531,_zz_532}};
  assign _zz_516 = {_zz_117,_zz_533};
  assign _zz_517 = 2'b00;
  assign _zz_518 = ({_zz_534,_zz_535} != 2'b00);
  assign _zz_519 = (_zz_536 != _zz_537);
  assign _zz_520 = {_zz_538,{_zz_539,_zz_540}};
  assign _zz_521 = (decode_INSTRUCTION & 32'h00004020);
  assign _zz_522 = 32'h00004020;
  assign _zz_523 = ((decode_INSTRUCTION & _zz_541) == 32'h00000010);
  assign _zz_524 = ((decode_INSTRUCTION & _zz_542) == 32'h00000020);
  assign _zz_525 = (decode_INSTRUCTION & 32'h00002030);
  assign _zz_526 = 32'h00002010;
  assign _zz_527 = ((decode_INSTRUCTION & _zz_543) == 32'h00000010);
  assign _zz_528 = (_zz_544 == _zz_545);
  assign _zz_529 = (_zz_546 == _zz_547);
  assign _zz_530 = ((decode_INSTRUCTION & _zz_548) == 32'h00001010);
  assign _zz_531 = (_zz_549 == _zz_550);
  assign _zz_532 = {_zz_551,{_zz_552,_zz_553}};
  assign _zz_533 = ((decode_INSTRUCTION & _zz_554) == 32'h00000020);
  assign _zz_534 = _zz_117;
  assign _zz_535 = (_zz_555 == _zz_556);
  assign _zz_536 = (_zz_557 == _zz_558);
  assign _zz_537 = 1'b0;
  assign _zz_538 = (_zz_559 != 1'b0);
  assign _zz_539 = (_zz_560 != _zz_561);
  assign _zz_540 = {_zz_562,{_zz_563,_zz_564}};
  assign _zz_541 = 32'h00000030;
  assign _zz_542 = 32'h02000020;
  assign _zz_543 = 32'h00001030;
  assign _zz_544 = (decode_INSTRUCTION & 32'h02002060);
  assign _zz_545 = 32'h00002020;
  assign _zz_546 = (decode_INSTRUCTION & 32'h02003020);
  assign _zz_547 = 32'h00000020;
  assign _zz_548 = 32'h00001010;
  assign _zz_549 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_550 = 32'h00002010;
  assign _zz_551 = ((decode_INSTRUCTION & _zz_565) == 32'h00000010);
  assign _zz_552 = (_zz_566 == _zz_567);
  assign _zz_553 = (_zz_568 == _zz_569);
  assign _zz_554 = 32'h00000070;
  assign _zz_555 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz_556 = 32'h0;
  assign _zz_557 = (decode_INSTRUCTION & 32'h00004014);
  assign _zz_558 = 32'h00004010;
  assign _zz_559 = ((decode_INSTRUCTION & _zz_570) == 32'h00002010);
  assign _zz_560 = {_zz_571,{_zz_572,_zz_573}};
  assign _zz_561 = 4'b0000;
  assign _zz_562 = (_zz_574 != 1'b0);
  assign _zz_563 = (_zz_575 != _zz_576);
  assign _zz_564 = {_zz_577,{_zz_578,_zz_579}};
  assign _zz_565 = 32'h00000050;
  assign _zz_566 = (decode_INSTRUCTION & 32'h0000000c);
  assign _zz_567 = 32'h00000004;
  assign _zz_568 = (decode_INSTRUCTION & 32'h00000028);
  assign _zz_569 = 32'h0;
  assign _zz_570 = 32'h00006014;
  assign _zz_571 = ((decode_INSTRUCTION & 32'h00000044) == 32'h0);
  assign _zz_572 = ((decode_INSTRUCTION & _zz_580) == 32'h0);
  assign _zz_573 = {(_zz_581 == _zz_582),(_zz_583 == _zz_584)};
  assign _zz_574 = ((decode_INSTRUCTION & 32'h00000058) == 32'h0);
  assign _zz_575 = {(_zz_585 == _zz_586),{_zz_587,_zz_588}};
  assign _zz_576 = 3'b000;
  assign _zz_577 = ({_zz_589,_zz_116} != 2'b00);
  assign _zz_578 = ({_zz_590,_zz_591} != 2'b00);
  assign _zz_579 = (_zz_592 != 1'b0);
  assign _zz_580 = 32'h00000018;
  assign _zz_581 = (decode_INSTRUCTION & 32'h00006004);
  assign _zz_582 = 32'h00002000;
  assign _zz_583 = (decode_INSTRUCTION & 32'h00005004);
  assign _zz_584 = 32'h00001000;
  assign _zz_585 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_586 = 32'h00000040;
  assign _zz_587 = ((decode_INSTRUCTION & 32'h00002014) == 32'h00002010);
  assign _zz_588 = ((decode_INSTRUCTION & 32'h40000034) == 32'h40000030);
  assign _zz_589 = ((decode_INSTRUCTION & 32'h00000014) == 32'h00000004);
  assign _zz_590 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz_591 = _zz_116;
  assign _zz_592 = ((decode_INSTRUCTION & 32'h00005048) == 32'h00001008);
  assign _zz_593 = execute_INSTRUCTION[31];
  assign _zz_594 = execute_INSTRUCTION[31];
  assign _zz_595 = execute_INSTRUCTION[7];
  always @ (posedge clk) begin
    if(_zz_55) begin
      _zz_73[_zz_75] <= _zz_413;
    end
  end

  always @ (posedge clk) begin
    if(_zz_79) begin
      _zz_214 <= _zz_73[_zz_330];
    end
  end

  always @ (posedge clk) begin
    if(_zz_414) begin
      _zz_215 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_415) begin
      _zz_216 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge clk) begin
    if(_zz_44) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache (
    .io_flush                                 (_zz_184                                                     ), //i
    .io_cpu_prefetch_isValid                  (_zz_185                                                     ), //i
    .io_cpu_prefetch_haltIt                   (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt               ), //o
    .io_cpu_prefetch_pc                       (IBusCachedPlugin_iBusRsp_stages_0_input_payload[31:0]       ), //i
    .io_cpu_fetch_isValid                     (_zz_186                                                     ), //i
    .io_cpu_fetch_isStuck                     (_zz_187                                                     ), //i
    .io_cpu_fetch_isRemoved                   (_zz_188                                                     ), //i
    .io_cpu_fetch_pc                          (IBusCachedPlugin_iBusRsp_stages_1_input_payload[31:0]       ), //i
    .io_cpu_fetch_data                        (IBusCachedPlugin_cache_io_cpu_fetch_data[31:0]              ), //o
    .io_cpu_fetch_mmuRsp_physicalAddress      (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]           ), //i
    .io_cpu_fetch_mmuRsp_isIoAccess           (IBusCachedPlugin_mmuBus_rsp_isIoAccess                      ), //i
    .io_cpu_fetch_mmuRsp_isPaging             (IBusCachedPlugin_mmuBus_rsp_isPaging                        ), //i
    .io_cpu_fetch_mmuRsp_allowRead            (IBusCachedPlugin_mmuBus_rsp_allowRead                       ), //i
    .io_cpu_fetch_mmuRsp_allowWrite           (IBusCachedPlugin_mmuBus_rsp_allowWrite                      ), //i
    .io_cpu_fetch_mmuRsp_allowExecute         (IBusCachedPlugin_mmuBus_rsp_allowExecute                    ), //i
    .io_cpu_fetch_mmuRsp_exception            (IBusCachedPlugin_mmuBus_rsp_exception                       ), //i
    .io_cpu_fetch_mmuRsp_refilling            (IBusCachedPlugin_mmuBus_rsp_refilling                       ), //i
    .io_cpu_fetch_mmuRsp_bypassTranslation    (IBusCachedPlugin_mmuBus_rsp_bypassTranslation               ), //i
    .io_cpu_fetch_mmuRsp_ways_0_sel           (IBusCachedPlugin_mmuBus_rsp_ways_0_sel                      ), //i
    .io_cpu_fetch_mmuRsp_ways_0_physical      (IBusCachedPlugin_mmuBus_rsp_ways_0_physical[31:0]           ), //i
    .io_cpu_fetch_mmuRsp_ways_1_sel           (IBusCachedPlugin_mmuBus_rsp_ways_1_sel                      ), //i
    .io_cpu_fetch_mmuRsp_ways_1_physical      (IBusCachedPlugin_mmuBus_rsp_ways_1_physical[31:0]           ), //i
    .io_cpu_fetch_mmuRsp_ways_2_sel           (IBusCachedPlugin_mmuBus_rsp_ways_2_sel                      ), //i
    .io_cpu_fetch_mmuRsp_ways_2_physical      (IBusCachedPlugin_mmuBus_rsp_ways_2_physical[31:0]           ), //i
    .io_cpu_fetch_mmuRsp_ways_3_sel           (IBusCachedPlugin_mmuBus_rsp_ways_3_sel                      ), //i
    .io_cpu_fetch_mmuRsp_ways_3_physical      (IBusCachedPlugin_mmuBus_rsp_ways_3_physical[31:0]           ), //i
    .io_cpu_fetch_physicalAddress             (IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress[31:0]   ), //o
    .io_cpu_decode_isValid                    (_zz_189                                                     ), //i
    .io_cpu_decode_isStuck                    (_zz_190                                                     ), //i
    .io_cpu_decode_pc                         (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]       ), //i
    .io_cpu_decode_physicalAddress            (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]  ), //o
    .io_cpu_decode_data                       (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]             ), //o
    .io_cpu_decode_cacheMiss                  (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss              ), //o
    .io_cpu_decode_error                      (IBusCachedPlugin_cache_io_cpu_decode_error                  ), //o
    .io_cpu_decode_mmuRefilling               (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling           ), //o
    .io_cpu_decode_mmuException               (IBusCachedPlugin_cache_io_cpu_decode_mmuException           ), //o
    .io_cpu_decode_isUser                     (_zz_191                                                     ), //i
    .io_cpu_fill_valid                        (_zz_192                                                     ), //i
    .io_cpu_fill_payload                      (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]  ), //i
    .io_mem_cmd_valid                         (IBusCachedPlugin_cache_io_mem_cmd_valid                     ), //o
    .io_mem_cmd_ready                         (iBus_cmd_ready                                              ), //i
    .io_mem_cmd_payload_address               (IBusCachedPlugin_cache_io_mem_cmd_payload_address[31:0]     ), //o
    .io_mem_cmd_payload_size                  (IBusCachedPlugin_cache_io_mem_cmd_payload_size[2:0]         ), //o
    .io_mem_rsp_valid                         (iBus_rsp_valid                                              ), //i
    .io_mem_rsp_payload_data                  (iBus_rsp_payload_data[31:0]                                 ), //i
    .io_mem_rsp_payload_error                 (iBus_rsp_payload_error                                      ), //i
    ._zz_10                                   (_zz_175[2:0]                                                ), //i
    ._zz_11                                   (IBusCachedPlugin_injectionPort_payload[31:0]                ), //i
    .clk                                      (clk                                                         ), //i
    .reset                                    (reset                                                       )  //i
  );
  DataCache dataCache_1 (
    .io_cpu_execute_isValid                    (_zz_193                                            ), //i
    .io_cpu_execute_address                    (_zz_194[31:0]                                      ), //i
    .io_cpu_execute_haltIt                     (dataCache_1_io_cpu_execute_haltIt                  ), //o
    .io_cpu_execute_args_wr                    (_zz_195                                            ), //i
    .io_cpu_execute_args_data                  (_zz_196[31:0]                                      ), //i
    .io_cpu_execute_args_size                  (_zz_197[1:0]                                       ), //i
    .io_cpu_execute_args_totalyConsistent      (execute_MEMORY_FORCE_CONSTISTENCY                  ), //i
    .io_cpu_execute_refilling                  (dataCache_1_io_cpu_execute_refilling               ), //o
    .io_cpu_memory_isValid                     (_zz_198                                            ), //i
    .io_cpu_memory_isStuck                     (memory_arbitration_isStuck                         ), //i
    .io_cpu_memory_isWrite                     (dataCache_1_io_cpu_memory_isWrite                  ), //o
    .io_cpu_memory_address                     (_zz_199[31:0]                                      ), //i
    .io_cpu_memory_mmuRsp_physicalAddress      (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]  ), //i
    .io_cpu_memory_mmuRsp_isIoAccess           (_zz_200                                            ), //i
    .io_cpu_memory_mmuRsp_isPaging             (DBusCachedPlugin_mmuBus_rsp_isPaging               ), //i
    .io_cpu_memory_mmuRsp_allowRead            (DBusCachedPlugin_mmuBus_rsp_allowRead              ), //i
    .io_cpu_memory_mmuRsp_allowWrite           (DBusCachedPlugin_mmuBus_rsp_allowWrite             ), //i
    .io_cpu_memory_mmuRsp_allowExecute         (DBusCachedPlugin_mmuBus_rsp_allowExecute           ), //i
    .io_cpu_memory_mmuRsp_exception            (DBusCachedPlugin_mmuBus_rsp_exception              ), //i
    .io_cpu_memory_mmuRsp_refilling            (DBusCachedPlugin_mmuBus_rsp_refilling              ), //i
    .io_cpu_memory_mmuRsp_bypassTranslation    (DBusCachedPlugin_mmuBus_rsp_bypassTranslation      ), //i
    .io_cpu_memory_mmuRsp_ways_0_sel           (DBusCachedPlugin_mmuBus_rsp_ways_0_sel             ), //i
    .io_cpu_memory_mmuRsp_ways_0_physical      (DBusCachedPlugin_mmuBus_rsp_ways_0_physical[31:0]  ), //i
    .io_cpu_memory_mmuRsp_ways_1_sel           (DBusCachedPlugin_mmuBus_rsp_ways_1_sel             ), //i
    .io_cpu_memory_mmuRsp_ways_1_physical      (DBusCachedPlugin_mmuBus_rsp_ways_1_physical[31:0]  ), //i
    .io_cpu_memory_mmuRsp_ways_2_sel           (DBusCachedPlugin_mmuBus_rsp_ways_2_sel             ), //i
    .io_cpu_memory_mmuRsp_ways_2_physical      (DBusCachedPlugin_mmuBus_rsp_ways_2_physical[31:0]  ), //i
    .io_cpu_memory_mmuRsp_ways_3_sel           (DBusCachedPlugin_mmuBus_rsp_ways_3_sel             ), //i
    .io_cpu_memory_mmuRsp_ways_3_physical      (DBusCachedPlugin_mmuBus_rsp_ways_3_physical[31:0]  ), //i
    .io_cpu_memory_mmuRsp_ways_4_sel           (DBusCachedPlugin_mmuBus_rsp_ways_4_sel             ), //i
    .io_cpu_memory_mmuRsp_ways_4_physical      (DBusCachedPlugin_mmuBus_rsp_ways_4_physical[31:0]  ), //i
    .io_cpu_memory_mmuRsp_ways_5_sel           (DBusCachedPlugin_mmuBus_rsp_ways_5_sel             ), //i
    .io_cpu_memory_mmuRsp_ways_5_physical      (DBusCachedPlugin_mmuBus_rsp_ways_5_physical[31:0]  ), //i
    .io_cpu_writeBack_isValid                  (_zz_201                                            ), //i
    .io_cpu_writeBack_isStuck                  (writeBack_arbitration_isStuck                      ), //i
    .io_cpu_writeBack_isUser                   (_zz_202                                            ), //i
    .io_cpu_writeBack_haltIt                   (dataCache_1_io_cpu_writeBack_haltIt                ), //o
    .io_cpu_writeBack_isWrite                  (dataCache_1_io_cpu_writeBack_isWrite               ), //o
    .io_cpu_writeBack_data                     (dataCache_1_io_cpu_writeBack_data[31:0]            ), //o
    .io_cpu_writeBack_address                  (_zz_203[31:0]                                      ), //i
    .io_cpu_writeBack_mmuException             (dataCache_1_io_cpu_writeBack_mmuException          ), //o
    .io_cpu_writeBack_unalignedAccess          (dataCache_1_io_cpu_writeBack_unalignedAccess       ), //o
    .io_cpu_writeBack_accessError              (dataCache_1_io_cpu_writeBack_accessError           ), //o
    .io_cpu_writeBack_keepMemRspData           (dataCache_1_io_cpu_writeBack_keepMemRspData        ), //o
    .io_cpu_writeBack_fence_SW                 (_zz_204                                            ), //i
    .io_cpu_writeBack_fence_SR                 (_zz_205                                            ), //i
    .io_cpu_writeBack_fence_SO                 (_zz_206                                            ), //i
    .io_cpu_writeBack_fence_SI                 (_zz_207                                            ), //i
    .io_cpu_writeBack_fence_PW                 (_zz_208                                            ), //i
    .io_cpu_writeBack_fence_PR                 (_zz_209                                            ), //i
    .io_cpu_writeBack_fence_PO                 (_zz_210                                            ), //i
    .io_cpu_writeBack_fence_PI                 (_zz_211                                            ), //i
    .io_cpu_writeBack_fence_FM                 (_zz_212[3:0]                                       ), //i
    .io_cpu_redo                               (dataCache_1_io_cpu_redo                            ), //o
    .io_cpu_flush_valid                        (_zz_213                                            ), //i
    .io_cpu_flush_ready                        (dataCache_1_io_cpu_flush_ready                     ), //o
    .io_mem_cmd_valid                          (dataCache_1_io_mem_cmd_valid                       ), //o
    .io_mem_cmd_ready                          (dBus_cmd_ready                                     ), //i
    .io_mem_cmd_payload_wr                     (dataCache_1_io_mem_cmd_payload_wr                  ), //o
    .io_mem_cmd_payload_uncached               (dataCache_1_io_mem_cmd_payload_uncached            ), //o
    .io_mem_cmd_payload_address                (dataCache_1_io_mem_cmd_payload_address[31:0]       ), //o
    .io_mem_cmd_payload_data                   (dataCache_1_io_mem_cmd_payload_data[31:0]          ), //o
    .io_mem_cmd_payload_mask                   (dataCache_1_io_mem_cmd_payload_mask[3:0]           ), //o
    .io_mem_cmd_payload_length                 (dataCache_1_io_mem_cmd_payload_length[2:0]         ), //o
    .io_mem_cmd_payload_last                   (dataCache_1_io_mem_cmd_payload_last                ), //o
    .io_mem_rsp_valid                          (dBus_rsp_valid                                     ), //i
    .io_mem_rsp_payload_last                   (dBus_rsp_payload_last                              ), //i
    .io_mem_rsp_payload_data                   (dBus_rsp_payload_data[31:0]                        ), //i
    .io_mem_rsp_payload_error                  (dBus_rsp_payload_error                             ), //i
    .clk                                       (clk                                                ), //i
    .reset                                     (reset                                              )  //i
  );
  always @(*) begin
    case(_zz_416)
      2'b00 : begin
        _zz_217 = DBusCachedPlugin_redoBranch_payload;
      end
      2'b01 : begin
        _zz_217 = CsrPlugin_jumpInterface_payload;
      end
      2'b10 : begin
        _zz_217 = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_217 = IBusCachedPlugin_predictionJumpInterface_payload;
      end
    endcase
  end

  always @(*) begin
    case(_zz_102)
      2'b00 : begin
        _zz_218 = MmuPlugin_ports_0_cache_0_valid;
        _zz_219 = MmuPlugin_ports_0_cache_0_exception;
        _zz_220 = MmuPlugin_ports_0_cache_0_superPage;
        _zz_221 = MmuPlugin_ports_0_cache_0_virtualAddress_0;
        _zz_222 = MmuPlugin_ports_0_cache_0_virtualAddress_1;
        _zz_223 = MmuPlugin_ports_0_cache_0_physicalAddress_0;
        _zz_224 = MmuPlugin_ports_0_cache_0_physicalAddress_1;
        _zz_225 = MmuPlugin_ports_0_cache_0_allowRead;
        _zz_226 = MmuPlugin_ports_0_cache_0_allowWrite;
        _zz_227 = MmuPlugin_ports_0_cache_0_allowExecute;
        _zz_228 = MmuPlugin_ports_0_cache_0_allowUser;
      end
      2'b01 : begin
        _zz_218 = MmuPlugin_ports_0_cache_1_valid;
        _zz_219 = MmuPlugin_ports_0_cache_1_exception;
        _zz_220 = MmuPlugin_ports_0_cache_1_superPage;
        _zz_221 = MmuPlugin_ports_0_cache_1_virtualAddress_0;
        _zz_222 = MmuPlugin_ports_0_cache_1_virtualAddress_1;
        _zz_223 = MmuPlugin_ports_0_cache_1_physicalAddress_0;
        _zz_224 = MmuPlugin_ports_0_cache_1_physicalAddress_1;
        _zz_225 = MmuPlugin_ports_0_cache_1_allowRead;
        _zz_226 = MmuPlugin_ports_0_cache_1_allowWrite;
        _zz_227 = MmuPlugin_ports_0_cache_1_allowExecute;
        _zz_228 = MmuPlugin_ports_0_cache_1_allowUser;
      end
      2'b10 : begin
        _zz_218 = MmuPlugin_ports_0_cache_2_valid;
        _zz_219 = MmuPlugin_ports_0_cache_2_exception;
        _zz_220 = MmuPlugin_ports_0_cache_2_superPage;
        _zz_221 = MmuPlugin_ports_0_cache_2_virtualAddress_0;
        _zz_222 = MmuPlugin_ports_0_cache_2_virtualAddress_1;
        _zz_223 = MmuPlugin_ports_0_cache_2_physicalAddress_0;
        _zz_224 = MmuPlugin_ports_0_cache_2_physicalAddress_1;
        _zz_225 = MmuPlugin_ports_0_cache_2_allowRead;
        _zz_226 = MmuPlugin_ports_0_cache_2_allowWrite;
        _zz_227 = MmuPlugin_ports_0_cache_2_allowExecute;
        _zz_228 = MmuPlugin_ports_0_cache_2_allowUser;
      end
      default : begin
        _zz_218 = MmuPlugin_ports_0_cache_3_valid;
        _zz_219 = MmuPlugin_ports_0_cache_3_exception;
        _zz_220 = MmuPlugin_ports_0_cache_3_superPage;
        _zz_221 = MmuPlugin_ports_0_cache_3_virtualAddress_0;
        _zz_222 = MmuPlugin_ports_0_cache_3_virtualAddress_1;
        _zz_223 = MmuPlugin_ports_0_cache_3_physicalAddress_0;
        _zz_224 = MmuPlugin_ports_0_cache_3_physicalAddress_1;
        _zz_225 = MmuPlugin_ports_0_cache_3_allowRead;
        _zz_226 = MmuPlugin_ports_0_cache_3_allowWrite;
        _zz_227 = MmuPlugin_ports_0_cache_3_allowExecute;
        _zz_228 = MmuPlugin_ports_0_cache_3_allowUser;
      end
    endcase
  end

  always @(*) begin
    case(_zz_108)
      3'b000 : begin
        _zz_229 = MmuPlugin_ports_1_cache_0_valid;
        _zz_230 = MmuPlugin_ports_1_cache_0_exception;
        _zz_231 = MmuPlugin_ports_1_cache_0_superPage;
        _zz_232 = MmuPlugin_ports_1_cache_0_virtualAddress_0;
        _zz_233 = MmuPlugin_ports_1_cache_0_virtualAddress_1;
        _zz_234 = MmuPlugin_ports_1_cache_0_physicalAddress_0;
        _zz_235 = MmuPlugin_ports_1_cache_0_physicalAddress_1;
        _zz_236 = MmuPlugin_ports_1_cache_0_allowRead;
        _zz_237 = MmuPlugin_ports_1_cache_0_allowWrite;
        _zz_238 = MmuPlugin_ports_1_cache_0_allowExecute;
        _zz_239 = MmuPlugin_ports_1_cache_0_allowUser;
      end
      3'b001 : begin
        _zz_229 = MmuPlugin_ports_1_cache_1_valid;
        _zz_230 = MmuPlugin_ports_1_cache_1_exception;
        _zz_231 = MmuPlugin_ports_1_cache_1_superPage;
        _zz_232 = MmuPlugin_ports_1_cache_1_virtualAddress_0;
        _zz_233 = MmuPlugin_ports_1_cache_1_virtualAddress_1;
        _zz_234 = MmuPlugin_ports_1_cache_1_physicalAddress_0;
        _zz_235 = MmuPlugin_ports_1_cache_1_physicalAddress_1;
        _zz_236 = MmuPlugin_ports_1_cache_1_allowRead;
        _zz_237 = MmuPlugin_ports_1_cache_1_allowWrite;
        _zz_238 = MmuPlugin_ports_1_cache_1_allowExecute;
        _zz_239 = MmuPlugin_ports_1_cache_1_allowUser;
      end
      3'b010 : begin
        _zz_229 = MmuPlugin_ports_1_cache_2_valid;
        _zz_230 = MmuPlugin_ports_1_cache_2_exception;
        _zz_231 = MmuPlugin_ports_1_cache_2_superPage;
        _zz_232 = MmuPlugin_ports_1_cache_2_virtualAddress_0;
        _zz_233 = MmuPlugin_ports_1_cache_2_virtualAddress_1;
        _zz_234 = MmuPlugin_ports_1_cache_2_physicalAddress_0;
        _zz_235 = MmuPlugin_ports_1_cache_2_physicalAddress_1;
        _zz_236 = MmuPlugin_ports_1_cache_2_allowRead;
        _zz_237 = MmuPlugin_ports_1_cache_2_allowWrite;
        _zz_238 = MmuPlugin_ports_1_cache_2_allowExecute;
        _zz_239 = MmuPlugin_ports_1_cache_2_allowUser;
      end
      3'b011 : begin
        _zz_229 = MmuPlugin_ports_1_cache_3_valid;
        _zz_230 = MmuPlugin_ports_1_cache_3_exception;
        _zz_231 = MmuPlugin_ports_1_cache_3_superPage;
        _zz_232 = MmuPlugin_ports_1_cache_3_virtualAddress_0;
        _zz_233 = MmuPlugin_ports_1_cache_3_virtualAddress_1;
        _zz_234 = MmuPlugin_ports_1_cache_3_physicalAddress_0;
        _zz_235 = MmuPlugin_ports_1_cache_3_physicalAddress_1;
        _zz_236 = MmuPlugin_ports_1_cache_3_allowRead;
        _zz_237 = MmuPlugin_ports_1_cache_3_allowWrite;
        _zz_238 = MmuPlugin_ports_1_cache_3_allowExecute;
        _zz_239 = MmuPlugin_ports_1_cache_3_allowUser;
      end
      3'b100 : begin
        _zz_229 = MmuPlugin_ports_1_cache_4_valid;
        _zz_230 = MmuPlugin_ports_1_cache_4_exception;
        _zz_231 = MmuPlugin_ports_1_cache_4_superPage;
        _zz_232 = MmuPlugin_ports_1_cache_4_virtualAddress_0;
        _zz_233 = MmuPlugin_ports_1_cache_4_virtualAddress_1;
        _zz_234 = MmuPlugin_ports_1_cache_4_physicalAddress_0;
        _zz_235 = MmuPlugin_ports_1_cache_4_physicalAddress_1;
        _zz_236 = MmuPlugin_ports_1_cache_4_allowRead;
        _zz_237 = MmuPlugin_ports_1_cache_4_allowWrite;
        _zz_238 = MmuPlugin_ports_1_cache_4_allowExecute;
        _zz_239 = MmuPlugin_ports_1_cache_4_allowUser;
      end
      default : begin
        _zz_229 = MmuPlugin_ports_1_cache_5_valid;
        _zz_230 = MmuPlugin_ports_1_cache_5_exception;
        _zz_231 = MmuPlugin_ports_1_cache_5_superPage;
        _zz_232 = MmuPlugin_ports_1_cache_5_virtualAddress_0;
        _zz_233 = MmuPlugin_ports_1_cache_5_virtualAddress_1;
        _zz_234 = MmuPlugin_ports_1_cache_5_physicalAddress_0;
        _zz_235 = MmuPlugin_ports_1_cache_5_physicalAddress_1;
        _zz_236 = MmuPlugin_ports_1_cache_5_allowRead;
        _zz_237 = MmuPlugin_ports_1_cache_5_allowWrite;
        _zz_238 = MmuPlugin_ports_1_cache_5_allowExecute;
        _zz_239 = MmuPlugin_ports_1_cache_5_allowUser;
      end
    endcase
  end

  `ifndef SYNTHESIS
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
    case(_zz_4)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_4_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_4_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_4_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_4_string = "JALR";
      default : _zz_4_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_5)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_5_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_5_string = "XRET";
      default : _zz_5_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_6)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_6_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_6_string = "XRET";
      default : _zz_6_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_7)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_7_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_7_string = "XRET";
      default : _zz_7_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_8)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_8_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_8_string = "XRET";
      default : _zz_8_string = "????";
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
    case(_zz_9)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_9_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_9_string = "XRET";
      default : _zz_9_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_10)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_10_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_10_string = "XRET";
      default : _zz_10_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_11)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_11_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_11_string = "XRET";
      default : _zz_11_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_12)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_12_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_12_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_12_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_12_string = "SRA_1    ";
      default : _zz_12_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_13)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_13_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_13_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_13_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_13_string = "SRA_1    ";
      default : _zz_13_string = "?????????";
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
    case(_zz_14)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_14_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_14_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_14_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_14_string = "SRA_1    ";
      default : _zz_14_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_15)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_15_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_15_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_15_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_15_string = "SRA_1    ";
      default : _zz_15_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_16_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_16_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_16_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_16_string = "SRA_1    ";
      default : _zz_16_string = "?????????";
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
    case(_zz_17)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_17_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_17_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_17_string = "AND_1";
      default : _zz_17_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_18)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_18_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_18_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_18_string = "AND_1";
      default : _zz_18_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_19)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_19_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_19_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_19_string = "AND_1";
      default : _zz_19_string = "?????";
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
    case(_zz_20)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_20_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_20_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_20_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_20_string = "PC ";
      default : _zz_20_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_21)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_21_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_21_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_21_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_21_string = "PC ";
      default : _zz_21_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_22)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_22_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_22_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_22_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_22_string = "PC ";
      default : _zz_22_string = "???";
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
    case(_zz_23)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_23_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_23_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_23_string = "BITWISE ";
      default : _zz_23_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_24)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_24_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_24_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_24_string = "BITWISE ";
      default : _zz_24_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_25)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_25_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_25_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_25_string = "BITWISE ";
      default : _zz_25_string = "????????";
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
    case(_zz_27)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_27_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_27_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_27_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_27_string = "URS1        ";
      default : _zz_27_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_28)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_28_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_28_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_28_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_28_string = "URS1        ";
      default : _zz_28_string = "????????????";
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
    case(_zz_29)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_29_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_29_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_29_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_29_string = "JALR";
      default : _zz_29_string = "????";
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
    case(_zz_30)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_30_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_30_string = "XRET";
      default : _zz_30_string = "????";
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
    case(_zz_31)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_31_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_31_string = "XRET";
      default : _zz_31_string = "????";
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
    case(_zz_32)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_32_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_32_string = "XRET";
      default : _zz_32_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_35)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_35_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_35_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_35_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_35_string = "SRA_1    ";
      default : _zz_35_string = "?????????";
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
    case(_zz_36)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_36_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_36_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_36_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_36_string = "SRA_1    ";
      default : _zz_36_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : execute_SRC2_CTRL_string = "PC ";
      default : execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_38)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_38_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_38_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_38_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_38_string = "PC ";
      default : _zz_38_string = "???";
    endcase
  end
  always @(*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : execute_SRC1_CTRL_string = "URS1        ";
      default : execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_39)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_39_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_39_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_39_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_39_string = "URS1        ";
      default : _zz_39_string = "????????????";
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
    case(_zz_40)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_40_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_40_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_40_string = "BITWISE ";
      default : _zz_40_string = "????????";
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
    case(_zz_41)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_41_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_41_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_41_string = "AND_1";
      default : _zz_41_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_45)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_45_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_45_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_45_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_45_string = "JALR";
      default : _zz_45_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_46)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_46_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_46_string = "XRET";
      default : _zz_46_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_47)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_47_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_47_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_47_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_47_string = "SRA_1    ";
      default : _zz_47_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_48)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_48_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_48_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_48_string = "AND_1";
      default : _zz_48_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_49)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_49_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_49_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_49_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_49_string = "PC ";
      default : _zz_49_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_50)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_50_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_50_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_50_string = "BITWISE ";
      default : _zz_50_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_51)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_51_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_51_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_51_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_51_string = "URS1        ";
      default : _zz_51_string = "????????????";
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
    case(_zz_53)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_53_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_53_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_53_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_53_string = "JALR";
      default : _zz_53_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : memory_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : memory_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : memory_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : memory_BRANCH_CTRL_string = "JALR";
      default : memory_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_54)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_54_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_54_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_54_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_54_string = "JALR";
      default : _zz_54_string = "????";
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
    case(_zz_120)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_120_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_120_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_120_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_120_string = "URS1        ";
      default : _zz_120_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_121)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_121_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_121_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_121_string = "BITWISE ";
      default : _zz_121_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_122)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_122_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_122_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_122_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_122_string = "PC ";
      default : _zz_122_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_123)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_123_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_123_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_123_string = "AND_1";
      default : _zz_123_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_124)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_124_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_124_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_124_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_124_string = "SRA_1    ";
      default : _zz_124_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_125)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_125_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_125_string = "XRET";
      default : _zz_125_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_126)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_126_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_126_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_126_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_126_string = "JALR";
      default : _zz_126_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
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
    case(decode_to_execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
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
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
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
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_to_memory_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_to_memory_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_to_memory_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_to_memory_BRANCH_CTRL_string = "JALR";
      default : execute_to_memory_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign memory_MUL_LOW = ($signed(_zz_292) + $signed(_zz_300));
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign execute_SHIFT_RIGHT = _zz_302;
  assign execute_REGFILE_WRITE_DATA = _zz_128;
  assign execute_IS_DBUS_SHARING = (MmuPlugin_dBusAccess_cmd_valid && MmuPlugin_dBusAccess_cmd_ready);
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_194[1 : 0];
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0)) && DebugPlugin_allowEBreak);
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign _zz_1 = _zz_2;
  assign _zz_3 = _zz_4;
  assign _zz_5 = _zz_6;
  assign _zz_7 = _zz_8;
  assign decode_ENV_CTRL = _zz_9;
  assign _zz_10 = _zz_11;
  assign decode_IS_CSR = _zz_304[0];
  assign decode_IS_RS2_SIGNED = _zz_305[0];
  assign decode_IS_RS1_SIGNED = _zz_306[0];
  assign decode_IS_DIV = _zz_307[0];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_308[0];
  assign _zz_12 = _zz_13;
  assign decode_SHIFT_CTRL = _zz_14;
  assign _zz_15 = _zz_16;
  assign decode_ALU_BITWISE_CTRL = _zz_17;
  assign _zz_18 = _zz_19;
  assign decode_SRC_LESS_UNSIGNED = _zz_309[0];
  assign memory_IS_SFENCE_VMA = execute_to_memory_IS_SFENCE_VMA;
  assign execute_IS_SFENCE_VMA = decode_to_execute_IS_SFENCE_VMA;
  assign decode_IS_SFENCE_VMA = _zz_310[0];
  assign decode_MEMORY_MANAGMENT = _zz_311[0];
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign decode_MEMORY_WR = _zz_312[0];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_313[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_314[0];
  assign decode_SRC2_CTRL = _zz_20;
  assign _zz_21 = _zz_22;
  assign decode_ALU_CTRL = _zz_23;
  assign _zz_24 = _zz_25;
  assign decode_SRC1_CTRL = _zz_26;
  assign _zz_27 = _zz_28;
  assign decode_MEMORY_FORCE_CONSTISTENCY = 1'b0;
  assign execute_PREDICTION_CONTEXT_hazard = decode_to_execute_PREDICTION_CONTEXT_hazard;
  assign execute_PREDICTION_CONTEXT_line_history = decode_to_execute_PREDICTION_CONTEXT_line_history;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_BRANCH_COND_RESULT = _zz_161;
  assign execute_BRANCH_CTRL = _zz_29;
  assign execute_PC = decode_to_execute_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_315[0];
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_30;
  assign execute_ENV_CTRL = _zz_31;
  assign writeBack_ENV_CTRL = _zz_32;
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
  assign decode_RS2_USE = _zz_316[0];
  assign decode_RS1_USE = _zz_317[0];
  always @ (*) begin
    _zz_33 = execute_REGFILE_WRITE_DATA;
    if(_zz_240)begin
      _zz_33 = execute_CsrPlugin_readData;
    end
    if(DBusCachedPlugin_forceDatapath)begin
      _zz_33 = MmuPlugin_dBusAccess_cmd_payload_address;
    end
  end

  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(_zz_139)begin
      if((_zz_140 == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_141;
      end
    end
    if(_zz_241)begin
      if(_zz_242)begin
        if(_zz_143)begin
          decode_RS2 = _zz_52;
        end
      end
    end
    if(_zz_243)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_145)begin
          decode_RS2 = _zz_34;
        end
      end
    end
    if(_zz_244)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_147)begin
          decode_RS2 = _zz_33;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(_zz_139)begin
      if((_zz_140 == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_141;
      end
    end
    if(_zz_241)begin
      if(_zz_242)begin
        if(_zz_142)begin
          decode_RS1 = _zz_52;
        end
      end
    end
    if(_zz_243)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_144)begin
          decode_RS1 = _zz_34;
        end
      end
    end
    if(_zz_244)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_146)begin
          decode_RS1 = _zz_33;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @ (*) begin
    _zz_34 = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid)begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_34 = _zz_136;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_34 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(_zz_245)begin
      _zz_34 = memory_DivPlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_35;
  assign execute_SHIFT_CTRL = _zz_36;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_37 = execute_PC;
  assign execute_SRC2_CTRL = _zz_38;
  assign execute_SRC1_CTRL = _zz_39;
  assign decode_SRC_USE_SUB_LESS = _zz_318[0];
  assign decode_SRC_ADD_ZERO = _zz_319[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_40;
  assign execute_SRC2 = _zz_134;
  assign execute_SRC1 = _zz_129;
  assign execute_ALU_BITWISE_CTRL = _zz_41;
  assign _zz_42 = writeBack_INSTRUCTION;
  assign _zz_43 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_44 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_44 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_cache_io_cpu_fetch_data);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_320[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = ({((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & 32'h0000106f) == 32'h00000003),{((decode_INSTRUCTION & _zz_417) == 32'h00001073),{(_zz_418 == _zz_419),{_zz_420,{_zz_421,_zz_422}}}}}}} != 21'h0);
  assign writeBack_IS_SFENCE_VMA = memory_to_writeBack_IS_SFENCE_VMA;
  assign writeBack_IS_DBUS_SHARING = memory_to_writeBack_IS_DBUS_SHARING;
  assign memory_IS_DBUS_SHARING = execute_to_memory_IS_DBUS_SHARING;
  always @ (*) begin
    _zz_52 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_52 = writeBack_DBusCachedPlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_290)
        2'b00 : begin
          _zz_52 = _zz_371;
        end
        default : begin
          _zz_52 = _zz_372;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_WR = memory_to_writeBack_MEMORY_WR;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_MEMORY_FORCE_CONSTISTENCY = decode_to_execute_MEMORY_FORCE_CONSTISTENCY;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_MEMORY_ENABLE = _zz_321[0];
  assign decode_FLUSH_ALL = _zz_322[0];
  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_4 = IBusCachedPlugin_rsp_issueDetected_3;
    if(_zz_246)begin
      IBusCachedPlugin_rsp_issueDetected_4 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_3 = IBusCachedPlugin_rsp_issueDetected_2;
    if(_zz_247)begin
      IBusCachedPlugin_rsp_issueDetected_3 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_2 = IBusCachedPlugin_rsp_issueDetected_1;
    if(_zz_248)begin
      IBusCachedPlugin_rsp_issueDetected_2 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected_1 = IBusCachedPlugin_rsp_issueDetected;
    if(_zz_249)begin
      IBusCachedPlugin_rsp_issueDetected_1 = 1'b1;
    end
  end

  assign decode_BRANCH_CTRL = _zz_53;
  assign decode_INSTRUCTION = IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  assign memory_BRANCH_CTRL = _zz_54;
  assign memory_PC = execute_to_memory_PC;
  assign memory_PREDICTION_CONTEXT_hazard = execute_to_memory_PREDICTION_CONTEXT_hazard;
  assign memory_PREDICTION_CONTEXT_line_history = execute_to_memory_PREDICTION_CONTEXT_line_history;
  assign decode_PREDICTION_CONTEXT_hazard = _zz_80;
  assign decode_PREDICTION_CONTEXT_line_history = _zz_81;
  always @ (*) begin
    _zz_55 = 1'b0;
    if(_zz_74)begin
      _zz_55 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_56 = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_56 = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ (*) begin
    _zz_57 = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_predictionJumpInterface_valid)begin
      _zz_57 = IBusCachedPlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    if(((DBusCachedPlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE))begin
      decode_arbitration_haltItself = 1'b1;
    end
    case(_zz_175)
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if((decode_arbitration_isValid && (_zz_137 || _zz_138)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != 3'b000))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_250)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @ (*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusCachedPlugin_predictionJumpInterface_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
    if(_zz_250)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((_zz_213 && (! dataCache_1_io_cpu_flush_ready)) || dataCache_1_io_cpu_execute_haltIt))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_240)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    if((dataCache_1_io_cpu_execute_refilling && execute_arbitration_isValid))begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if(_zz_251)begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushIt = 1'b0;
    if(_zz_251)begin
      if(_zz_252)begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(_zz_251)begin
      if(_zz_252)begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if(_zz_245)begin
      if(((! memory_DivPlugin_frontendOk) || (! memory_DivPlugin_div_done)))begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid)begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
    if(BranchPlugin_jumpInterface_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if(dataCache_1_io_cpu_writeBack_haltIt)begin
      writeBack_arbitration_haltItself = 1'b1;
    end
  end

  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(DBusCachedPlugin_exceptionBus_valid)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_flushIt = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid)begin
      writeBack_arbitration_flushIt = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(DBusCachedPlugin_exceptionBus_valid)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_253)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_254)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != 4'b0000))begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_253)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_254)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_251)begin
      if(_zz_252)begin
        IBusCachedPlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_255)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if((IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_stages_2_input_valid))begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  always @ (*) begin
    _zz_58 = 1'b0;
    if(DebugPlugin_godmode)begin
      _zz_58 = 1'b1;
    end
  end

  assign CsrPlugin_inWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt)begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_253)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_254)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'h0;
    if(_zz_253)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(_zz_254)begin
      case(_zz_256)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode)begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode)begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  assign IBusCachedPlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusCachedPlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,{DBusCachedPlugin_redoBranch_valid,IBusCachedPlugin_predictionJumpInterface_valid}}} != 4'b0000);
  assign _zz_59 = {IBusCachedPlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}};
  assign _zz_60 = (_zz_59 & (~ _zz_323));
  assign _zz_61 = _zz_60[3];
  assign _zz_62 = (_zz_60[1] || _zz_61);
  assign _zz_63 = (_zz_60[2] || _zz_61);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_217;
  always @ (*) begin
    IBusCachedPlugin_fetchPc_correction = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_corrected = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_correctionReg);
  always @ (*) begin
    IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_325);
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_fetchPc_redo_payload;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
    IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_flushed = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_output_valid = ((! IBusCachedPlugin_fetcherHalt) && IBusCachedPlugin_fetchPc_booted);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_pc;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_redoFetch = 1'b0;
    if(IBusCachedPlugin_rsp_redoFetch)begin
      IBusCachedPlugin_iBusRsp_redoFetch = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_64 = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_64);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_64);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_mmuBus_busy)begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_65 = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_65);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_65);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if((IBusCachedPlugin_rsp_issueDetected_4 || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_66 = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_output_ready && _zz_66);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_66);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  assign IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_iBusRsp_flush = ((decode_arbitration_removeIt || (decode_arbitration_flushNext && (! decode_arbitration_isStuck))) || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_67;
  assign _zz_67 = ((1'b0 && (! _zz_68)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_68 = _zz_69;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_68;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_70)) || IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_70 = _zz_71;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = _zz_70;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = _zz_72;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if((! IBusCachedPlugin_pcValids_0))begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_4;
  assign IBusCachedPlugin_iBusRsp_output_ready = (! decode_arbitration_isStuck);
  always @ (*) begin
    decode_arbitration_isValid = IBusCachedPlugin_iBusRsp_output_valid;
    case(_zz_175)
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

  assign _zz_78 = (IBusCachedPlugin_fetchPc_output_payload >>> 2);
  assign _zz_79 = (IBusCachedPlugin_iBusRsp_stages_0_output_ready || IBusCachedPlugin_externalFlush);
  assign _zz_82 = (IBusCachedPlugin_decodePrediction_rsp_wasWrong ^ memory_PREDICTION_CONTEXT_line_history[1]);
  assign _zz_75 = (memory_PC[11 : 2] + 10'h0);
  assign _zz_74 = ((((! memory_PREDICTION_CONTEXT_hazard) && memory_arbitration_isFiring) && (memory_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B)) && (! ($signed(memory_PREDICTION_CONTEXT_line_history) == $signed(_zz_333))));
  always @ (*) begin
    IBusCachedPlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && decode_PREDICTION_CONTEXT_line_history[1]));
    if(_zz_87)begin
      IBusCachedPlugin_decodePrediction_cmd_hadBranch = 1'b0;
    end
  end

  assign _zz_83 = _zz_336[19];
  always @ (*) begin
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

  assign _zz_85 = _zz_337[11];
  always @ (*) begin
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
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_87 = _zz_338[1];
      end
      default : begin
        _zz_87 = _zz_339[1];
      end
    endcase
  end

  assign IBusCachedPlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusCachedPlugin_decodePrediction_cmd_hadBranch);
  assign _zz_88 = _zz_340[19];
  always @ (*) begin
    _zz_89[10] = _zz_88;
    _zz_89[9] = _zz_88;
    _zz_89[8] = _zz_88;
    _zz_89[7] = _zz_88;
    _zz_89[6] = _zz_88;
    _zz_89[5] = _zz_88;
    _zz_89[4] = _zz_88;
    _zz_89[3] = _zz_88;
    _zz_89[2] = _zz_88;
    _zz_89[1] = _zz_88;
    _zz_89[0] = _zz_88;
  end

  assign _zz_90 = _zz_341[11];
  always @ (*) begin
    _zz_91[18] = _zz_90;
    _zz_91[17] = _zz_90;
    _zz_91[16] = _zz_90;
    _zz_91[15] = _zz_90;
    _zz_91[14] = _zz_90;
    _zz_91[13] = _zz_90;
    _zz_91[12] = _zz_90;
    _zz_91[11] = _zz_90;
    _zz_91[10] = _zz_90;
    _zz_91[9] = _zz_90;
    _zz_91[8] = _zz_90;
    _zz_91[7] = _zz_90;
    _zz_91[6] = _zz_90;
    _zz_91[5] = _zz_90;
    _zz_91[4] = _zz_90;
    _zz_91[3] = _zz_90;
    _zz_91[2] = _zz_90;
    _zz_91[1] = _zz_90;
    _zz_91[0] = _zz_90;
  end

  assign IBusCachedPlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_89,{{{_zz_435,decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_91,{{{_zz_436,_zz_437},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_185 = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_186 = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_187 = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_isValid = _zz_186;
  assign IBusCachedPlugin_mmuBus_cmd_0_isStuck = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign IBusCachedPlugin_mmuBus_cmd_0_virtualAddress = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  assign IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
  assign IBusCachedPlugin_mmuBus_end = (IBusCachedPlugin_iBusRsp_stages_1_input_ready || IBusCachedPlugin_externalFlush);
  assign _zz_189 = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign _zz_190 = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_191 = (CsrPlugin_privilege == 2'b00);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(_zz_249)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_247)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @ (*) begin
    _zz_192 = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(_zz_247)begin
      _zz_192 = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(_zz_248)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(_zz_246)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(_zz_248)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b1100;
    end
    if(_zz_246)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = 4'b0001;
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_2_input_payload[31 : 2],2'b00};
  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  assign _zz_184 = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign dBus_cmd_valid = dataCache_1_io_mem_cmd_valid;
  assign dBus_cmd_payload_wr = dataCache_1_io_mem_cmd_payload_wr;
  assign dBus_cmd_payload_uncached = dataCache_1_io_mem_cmd_payload_uncached;
  assign dBus_cmd_payload_address = dataCache_1_io_mem_cmd_payload_address;
  assign dBus_cmd_payload_data = dataCache_1_io_mem_cmd_payload_data;
  assign dBus_cmd_payload_mask = dataCache_1_io_mem_cmd_payload_mask;
  assign dBus_cmd_payload_length = dataCache_1_io_mem_cmd_payload_length;
  assign dBus_cmd_payload_last = dataCache_1_io_mem_cmd_payload_last;
  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    _zz_193 = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_257)begin
        if(_zz_258)begin
          _zz_193 = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    _zz_194 = execute_SRC_ADD;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_257)begin
        _zz_194 = MmuPlugin_dBusAccess_cmd_payload_address;
      end
    end
  end

  always @ (*) begin
    _zz_195 = execute_MEMORY_WR;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_257)begin
        _zz_195 = MmuPlugin_dBusAccess_cmd_payload_write;
      end
    end
  end

  always @ (*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_94 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_94 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_94 = execute_RS2[31 : 0];
      end
    endcase
  end

  always @ (*) begin
    _zz_196 = _zz_94;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_257)begin
        _zz_196 = MmuPlugin_dBusAccess_cmd_payload_data;
      end
    end
  end

  always @ (*) begin
    _zz_197 = execute_DBusCachedPlugin_size;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_257)begin
        _zz_197 = MmuPlugin_dBusAccess_cmd_payload_size;
      end
    end
  end

  assign _zz_213 = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  always @ (*) begin
    _zz_198 = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
    if(memory_IS_DBUS_SHARING)begin
      _zz_198 = 1'b1;
    end
  end

  assign _zz_199 = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_mmuBus_cmd_0_isValid = _zz_198;
  assign DBusCachedPlugin_mmuBus_cmd_0_isStuck = memory_arbitration_isStuck;
  assign DBusCachedPlugin_mmuBus_cmd_0_virtualAddress = _zz_199;
  always @ (*) begin
    DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b0;
    if(memory_IS_DBUS_SHARING)begin
      DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation = 1'b1;
    end
  end

  assign DBusCachedPlugin_mmuBus_end = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  always @ (*) begin
    _zz_200 = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if((_zz_58 && (! dataCache_1_io_cpu_memory_isWrite)))begin
      _zz_200 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_201 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
    if(writeBack_IS_DBUS_SHARING)begin
      _zz_201 = 1'b1;
    end
  end

  assign _zz_202 = (CsrPlugin_privilege == 2'b00);
  assign _zz_203 = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if(_zz_259)begin
      if(dataCache_1_io_cpu_redo)begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
      end
    end
  end

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    if(_zz_259)begin
      if(dataCache_1_io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1_io_cpu_redo)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b0;
      end
    end
  end

  assign DBusCachedPlugin_exceptionBus_payload_badAddr = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_payload_code = 4'bxxxx;
    if(_zz_259)begin
      if(dataCache_1_io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_342};
      end
      if(dataCache_1_io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? 4'b1111 : 4'b1101);
      end
      if(dataCache_1_io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_343};
      end
    end
  end

  always @ (*) begin
    writeBack_DBusCachedPlugin_rspShifted = dataCache_1_io_cpu_writeBack_data;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1_io_cpu_writeBack_data[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusCachedPlugin_rspShifted[15 : 0] = dataCache_1_io_cpu_writeBack_data[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1_io_cpu_writeBack_data[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_95 = (writeBack_DBusCachedPlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_96[31] = _zz_95;
    _zz_96[30] = _zz_95;
    _zz_96[29] = _zz_95;
    _zz_96[28] = _zz_95;
    _zz_96[27] = _zz_95;
    _zz_96[26] = _zz_95;
    _zz_96[25] = _zz_95;
    _zz_96[24] = _zz_95;
    _zz_96[23] = _zz_95;
    _zz_96[22] = _zz_95;
    _zz_96[21] = _zz_95;
    _zz_96[20] = _zz_95;
    _zz_96[19] = _zz_95;
    _zz_96[18] = _zz_95;
    _zz_96[17] = _zz_95;
    _zz_96[16] = _zz_95;
    _zz_96[15] = _zz_95;
    _zz_96[14] = _zz_95;
    _zz_96[13] = _zz_95;
    _zz_96[12] = _zz_95;
    _zz_96[11] = _zz_95;
    _zz_96[10] = _zz_95;
    _zz_96[9] = _zz_95;
    _zz_96[8] = _zz_95;
    _zz_96[7 : 0] = writeBack_DBusCachedPlugin_rspShifted[7 : 0];
  end

  assign _zz_97 = (writeBack_DBusCachedPlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_98[31] = _zz_97;
    _zz_98[30] = _zz_97;
    _zz_98[29] = _zz_97;
    _zz_98[28] = _zz_97;
    _zz_98[27] = _zz_97;
    _zz_98[26] = _zz_97;
    _zz_98[25] = _zz_97;
    _zz_98[24] = _zz_97;
    _zz_98[23] = _zz_97;
    _zz_98[22] = _zz_97;
    _zz_98[21] = _zz_97;
    _zz_98[20] = _zz_97;
    _zz_98[19] = _zz_97;
    _zz_98[18] = _zz_97;
    _zz_98[17] = _zz_97;
    _zz_98[16] = _zz_97;
    _zz_98[15 : 0] = writeBack_DBusCachedPlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_289)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_96;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_98;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspShifted;
      end
    endcase
  end

  always @ (*) begin
    MmuPlugin_dBusAccess_cmd_ready = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_257)begin
        if(_zz_258)begin
          MmuPlugin_dBusAccess_cmd_ready = (! execute_arbitration_isStuck);
        end
      end
    end
  end

  always @ (*) begin
    DBusCachedPlugin_forceDatapath = 1'b0;
    if(MmuPlugin_dBusAccess_cmd_valid)begin
      if(_zz_257)begin
        DBusCachedPlugin_forceDatapath = 1'b1;
      end
    end
  end

  assign MmuPlugin_dBusAccess_rsp_valid = ((writeBack_IS_DBUS_SHARING && (! dataCache_1_io_cpu_writeBack_isWrite)) && (dataCache_1_io_cpu_redo || (! dataCache_1_io_cpu_writeBack_haltIt)));
  assign MmuPlugin_dBusAccess_rsp_payload_data = dataCache_1_io_cpu_writeBack_data;
  assign MmuPlugin_dBusAccess_rsp_payload_error = (dataCache_1_io_cpu_writeBack_unalignedAccess || dataCache_1_io_cpu_writeBack_accessError);
  assign MmuPlugin_dBusAccess_rsp_payload_redo = dataCache_1_io_cpu_redo;
  assign MmuPlugin_ports_0_dirty = 1'b0;
  always @ (*) begin
    MmuPlugin_ports_0_requireMmuLockupCalc = (((IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 28] == 4'b1100) && (! IBusCachedPlugin_mmuBus_cmd_0_bypassTranslation)) && MmuPlugin_satp_mode);
    if(((! MmuPlugin_status_mprv) && (CsrPlugin_privilege == 2'b11)))begin
      MmuPlugin_ports_0_requireMmuLockupCalc = 1'b0;
    end
    if((CsrPlugin_privilege == 2'b11))begin
      MmuPlugin_ports_0_requireMmuLockupCalc = 1'b0;
    end
  end

  always @ (*) begin
    MmuPlugin_ports_0_cacheHitsCalc[0] = ((MmuPlugin_ports_0_cache_0_valid && (MmuPlugin_ports_0_cache_0_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_0_superPage || (MmuPlugin_ports_0_cache_0_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_0_cacheHitsCalc[1] = ((MmuPlugin_ports_0_cache_1_valid && (MmuPlugin_ports_0_cache_1_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_1_superPage || (MmuPlugin_ports_0_cache_1_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_0_cacheHitsCalc[2] = ((MmuPlugin_ports_0_cache_2_valid && (MmuPlugin_ports_0_cache_2_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_2_superPage || (MmuPlugin_ports_0_cache_2_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_0_cacheHitsCalc[3] = ((MmuPlugin_ports_0_cache_3_valid && (MmuPlugin_ports_0_cache_3_virtualAddress_1 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_0_cache_3_superPage || (MmuPlugin_ports_0_cache_3_virtualAddress_0 == IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
  end

  assign MmuPlugin_ports_0_cacheHit = (MmuPlugin_ports_0_cacheHitsCalc != 4'b0000);
  assign _zz_99 = MmuPlugin_ports_0_cacheHitsCalc[3];
  assign _zz_100 = (MmuPlugin_ports_0_cacheHitsCalc[1] || _zz_99);
  assign _zz_101 = (MmuPlugin_ports_0_cacheHitsCalc[2] || _zz_99);
  assign _zz_102 = {_zz_101,_zz_100};
  assign MmuPlugin_ports_0_cacheLine_valid = _zz_218;
  assign MmuPlugin_ports_0_cacheLine_exception = _zz_219;
  assign MmuPlugin_ports_0_cacheLine_superPage = _zz_220;
  assign MmuPlugin_ports_0_cacheLine_virtualAddress_0 = _zz_221;
  assign MmuPlugin_ports_0_cacheLine_virtualAddress_1 = _zz_222;
  assign MmuPlugin_ports_0_cacheLine_physicalAddress_0 = _zz_223;
  assign MmuPlugin_ports_0_cacheLine_physicalAddress_1 = _zz_224;
  assign MmuPlugin_ports_0_cacheLine_allowRead = _zz_225;
  assign MmuPlugin_ports_0_cacheLine_allowWrite = _zz_226;
  assign MmuPlugin_ports_0_cacheLine_allowExecute = _zz_227;
  assign MmuPlugin_ports_0_cacheLine_allowUser = _zz_228;
  always @ (*) begin
    MmuPlugin_ports_0_entryToReplace_willIncrement = 1'b0;
    if(_zz_260)begin
      if(_zz_261)begin
        MmuPlugin_ports_0_entryToReplace_willIncrement = 1'b1;
      end
    end
  end

  assign MmuPlugin_ports_0_entryToReplace_willClear = 1'b0;
  assign MmuPlugin_ports_0_entryToReplace_willOverflowIfInc = (MmuPlugin_ports_0_entryToReplace_value == 2'b11);
  assign MmuPlugin_ports_0_entryToReplace_willOverflow = (MmuPlugin_ports_0_entryToReplace_willOverflowIfInc && MmuPlugin_ports_0_entryToReplace_willIncrement);
  always @ (*) begin
    MmuPlugin_ports_0_entryToReplace_valueNext = (MmuPlugin_ports_0_entryToReplace_value + _zz_345);
    if(MmuPlugin_ports_0_entryToReplace_willClear)begin
      MmuPlugin_ports_0_entryToReplace_valueNext = 2'b00;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_physicalAddress = {{MmuPlugin_ports_0_cacheLine_physicalAddress_1,(MmuPlugin_ports_0_cacheLine_superPage ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_0_cacheLine_physicalAddress_0)},IBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
    end else begin
      IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_allowRead = (MmuPlugin_ports_0_cacheLine_allowRead || (MmuPlugin_status_mxr && MmuPlugin_ports_0_cacheLine_allowExecute));
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_allowWrite = MmuPlugin_ports_0_cacheLine_allowWrite;
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_allowExecute = MmuPlugin_ports_0_cacheLine_allowExecute;
    end else begin
      IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_exception = (((! MmuPlugin_ports_0_dirty) && MmuPlugin_ports_0_cacheHit) && ((MmuPlugin_ports_0_cacheLine_exception || ((MmuPlugin_ports_0_cacheLine_allowUser && (CsrPlugin_privilege == 2'b01)) && (! MmuPlugin_status_sum))) || ((! MmuPlugin_ports_0_cacheLine_allowUser) && (CsrPlugin_privilege == 2'b00))));
    end else begin
      IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_refilling = (MmuPlugin_ports_0_dirty || (! MmuPlugin_ports_0_cacheHit));
    end else begin
      IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_0_requireMmuLockupCalc)begin
      IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b1;
    end else begin
      IBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
    end
  end

  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1111);
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
  always @ (*) begin
    MmuPlugin_ports_1_requireMmuLockupCalc = (((DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 28] == 4'b1100) && (! DBusCachedPlugin_mmuBus_cmd_0_bypassTranslation)) && MmuPlugin_satp_mode);
    if(((! MmuPlugin_status_mprv) && (CsrPlugin_privilege == 2'b11)))begin
      MmuPlugin_ports_1_requireMmuLockupCalc = 1'b0;
    end
    if((CsrPlugin_privilege == 2'b11))begin
      if(((! MmuPlugin_status_mprv) || (CsrPlugin_mstatus_MPP == 2'b11)))begin
        MmuPlugin_ports_1_requireMmuLockupCalc = 1'b0;
      end
    end
  end

  always @ (*) begin
    MmuPlugin_ports_1_cacheHitsCalc[0] = ((MmuPlugin_ports_1_cache_0_valid && (MmuPlugin_ports_1_cache_0_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_0_superPage || (MmuPlugin_ports_1_cache_0_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_1_cacheHitsCalc[1] = ((MmuPlugin_ports_1_cache_1_valid && (MmuPlugin_ports_1_cache_1_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_1_superPage || (MmuPlugin_ports_1_cache_1_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_1_cacheHitsCalc[2] = ((MmuPlugin_ports_1_cache_2_valid && (MmuPlugin_ports_1_cache_2_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_2_superPage || (MmuPlugin_ports_1_cache_2_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_1_cacheHitsCalc[3] = ((MmuPlugin_ports_1_cache_3_valid && (MmuPlugin_ports_1_cache_3_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_3_superPage || (MmuPlugin_ports_1_cache_3_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_1_cacheHitsCalc[4] = ((MmuPlugin_ports_1_cache_4_valid && (MmuPlugin_ports_1_cache_4_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_4_superPage || (MmuPlugin_ports_1_cache_4_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
    MmuPlugin_ports_1_cacheHitsCalc[5] = ((MmuPlugin_ports_1_cache_5_valid && (MmuPlugin_ports_1_cache_5_virtualAddress_1 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[31 : 22])) && (MmuPlugin_ports_1_cache_5_superPage || (MmuPlugin_ports_1_cache_5_virtualAddress_0 == DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12])));
  end

  assign MmuPlugin_ports_1_cacheHit = (MmuPlugin_ports_1_cacheHitsCalc != 6'h0);
  assign _zz_103 = MmuPlugin_ports_1_cacheHitsCalc[3];
  assign _zz_104 = MmuPlugin_ports_1_cacheHitsCalc[5];
  assign _zz_105 = ((MmuPlugin_ports_1_cacheHitsCalc[1] || _zz_103) || _zz_104);
  assign _zz_106 = (MmuPlugin_ports_1_cacheHitsCalc[2] || _zz_103);
  assign _zz_107 = (MmuPlugin_ports_1_cacheHitsCalc[4] || _zz_104);
  assign _zz_108 = {_zz_107,{_zz_106,_zz_105}};
  assign MmuPlugin_ports_1_cacheLine_valid = _zz_229;
  assign MmuPlugin_ports_1_cacheLine_exception = _zz_230;
  assign MmuPlugin_ports_1_cacheLine_superPage = _zz_231;
  assign MmuPlugin_ports_1_cacheLine_virtualAddress_0 = _zz_232;
  assign MmuPlugin_ports_1_cacheLine_virtualAddress_1 = _zz_233;
  assign MmuPlugin_ports_1_cacheLine_physicalAddress_0 = _zz_234;
  assign MmuPlugin_ports_1_cacheLine_physicalAddress_1 = _zz_235;
  assign MmuPlugin_ports_1_cacheLine_allowRead = _zz_236;
  assign MmuPlugin_ports_1_cacheLine_allowWrite = _zz_237;
  assign MmuPlugin_ports_1_cacheLine_allowExecute = _zz_238;
  assign MmuPlugin_ports_1_cacheLine_allowUser = _zz_239;
  always @ (*) begin
    MmuPlugin_ports_1_entryToReplace_willIncrement = 1'b0;
    if(_zz_260)begin
      if(_zz_262)begin
        MmuPlugin_ports_1_entryToReplace_willIncrement = 1'b1;
      end
    end
  end

  assign MmuPlugin_ports_1_entryToReplace_willClear = 1'b0;
  assign MmuPlugin_ports_1_entryToReplace_willOverflowIfInc = (MmuPlugin_ports_1_entryToReplace_value == 3'b101);
  assign MmuPlugin_ports_1_entryToReplace_willOverflow = (MmuPlugin_ports_1_entryToReplace_willOverflowIfInc && MmuPlugin_ports_1_entryToReplace_willIncrement);
  always @ (*) begin
    if(MmuPlugin_ports_1_entryToReplace_willOverflow)begin
      MmuPlugin_ports_1_entryToReplace_valueNext = 3'b000;
    end else begin
      MmuPlugin_ports_1_entryToReplace_valueNext = (MmuPlugin_ports_1_entryToReplace_value + _zz_347);
    end
    if(MmuPlugin_ports_1_entryToReplace_willClear)begin
      MmuPlugin_ports_1_entryToReplace_valueNext = 3'b000;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_physicalAddress = {{MmuPlugin_ports_1_cacheLine_physicalAddress_1,(MmuPlugin_ports_1_cacheLine_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cacheLine_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
    end else begin
      DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_0_virtualAddress;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_allowRead = (MmuPlugin_ports_1_cacheLine_allowRead || (MmuPlugin_status_mxr && MmuPlugin_ports_1_cacheLine_allowExecute));
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_allowWrite = MmuPlugin_ports_1_cacheLine_allowWrite;
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_allowExecute = MmuPlugin_ports_1_cacheLine_allowExecute;
    end else begin
      DBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_exception = (((! MmuPlugin_ports_1_dirty) && MmuPlugin_ports_1_cacheHit) && ((MmuPlugin_ports_1_cacheLine_exception || ((MmuPlugin_ports_1_cacheLine_allowUser && (CsrPlugin_privilege == 2'b01)) && (! MmuPlugin_status_sum))) || ((! MmuPlugin_ports_1_cacheLine_allowUser) && (CsrPlugin_privilege == 2'b00))));
    end else begin
      DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_refilling = (MmuPlugin_ports_1_dirty || (! MmuPlugin_ports_1_cacheHit));
    end else begin
      DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
    end
  end

  always @ (*) begin
    if(MmuPlugin_ports_1_requireMmuLockupCalc)begin
      DBusCachedPlugin_mmuBus_rsp_isPaging = 1'b1;
    end else begin
      DBusCachedPlugin_mmuBus_rsp_isPaging = 1'b0;
    end
  end

  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1111);
  assign DBusCachedPlugin_mmuBus_rsp_bypassTranslation = (! MmuPlugin_ports_1_requireMmuLockupCalc);
  assign DBusCachedPlugin_mmuBus_rsp_ways_0_sel = MmuPlugin_ports_1_cacheHitsCalc[0];
  assign DBusCachedPlugin_mmuBus_rsp_ways_0_physical = {{MmuPlugin_ports_1_cache_0_physicalAddress_1,(MmuPlugin_ports_1_cache_0_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_0_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_1_sel = MmuPlugin_ports_1_cacheHitsCalc[1];
  assign DBusCachedPlugin_mmuBus_rsp_ways_1_physical = {{MmuPlugin_ports_1_cache_1_physicalAddress_1,(MmuPlugin_ports_1_cache_1_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_1_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_2_sel = MmuPlugin_ports_1_cacheHitsCalc[2];
  assign DBusCachedPlugin_mmuBus_rsp_ways_2_physical = {{MmuPlugin_ports_1_cache_2_physicalAddress_1,(MmuPlugin_ports_1_cache_2_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_2_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_3_sel = MmuPlugin_ports_1_cacheHitsCalc[3];
  assign DBusCachedPlugin_mmuBus_rsp_ways_3_physical = {{MmuPlugin_ports_1_cache_3_physicalAddress_1,(MmuPlugin_ports_1_cache_3_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_3_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_4_sel = MmuPlugin_ports_1_cacheHitsCalc[4];
  assign DBusCachedPlugin_mmuBus_rsp_ways_4_physical = {{MmuPlugin_ports_1_cache_4_physicalAddress_1,(MmuPlugin_ports_1_cache_4_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_4_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign DBusCachedPlugin_mmuBus_rsp_ways_5_sel = MmuPlugin_ports_1_cacheHitsCalc[5];
  assign DBusCachedPlugin_mmuBus_rsp_ways_5_physical = {{MmuPlugin_ports_1_cache_5_physicalAddress_1,(MmuPlugin_ports_1_cache_5_superPage ? DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[21 : 12] : MmuPlugin_ports_1_cache_5_physicalAddress_0)},DBusCachedPlugin_mmuBus_cmd_0_virtualAddress[11 : 0]};
  assign MmuPlugin_shared_dBusRsp_pte_V = _zz_348[0];
  assign MmuPlugin_shared_dBusRsp_pte_R = _zz_349[0];
  assign MmuPlugin_shared_dBusRsp_pte_W = _zz_350[0];
  assign MmuPlugin_shared_dBusRsp_pte_X = _zz_351[0];
  assign MmuPlugin_shared_dBusRsp_pte_U = _zz_352[0];
  assign MmuPlugin_shared_dBusRsp_pte_G = _zz_353[0];
  assign MmuPlugin_shared_dBusRsp_pte_A = _zz_354[0];
  assign MmuPlugin_shared_dBusRsp_pte_D = _zz_355[0];
  assign MmuPlugin_shared_dBusRsp_pte_RSW = MmuPlugin_shared_dBusRspStaged_payload_data[9 : 8];
  assign MmuPlugin_shared_dBusRsp_pte_PPN0 = MmuPlugin_shared_dBusRspStaged_payload_data[19 : 10];
  assign MmuPlugin_shared_dBusRsp_pte_PPN1 = MmuPlugin_shared_dBusRspStaged_payload_data[31 : 20];
  assign MmuPlugin_shared_dBusRsp_exception = (((! MmuPlugin_shared_dBusRsp_pte_V) || ((! MmuPlugin_shared_dBusRsp_pte_R) && MmuPlugin_shared_dBusRsp_pte_W)) || MmuPlugin_shared_dBusRspStaged_payload_error);
  assign MmuPlugin_shared_dBusRsp_leaf = (MmuPlugin_shared_dBusRsp_pte_R || MmuPlugin_shared_dBusRsp_pte_X);
  always @ (*) begin
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
  always @ (*) begin
    MmuPlugin_dBusAccess_cmd_payload_address = 32'h0;
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

  assign MmuPlugin_dBusAccess_cmd_payload_data = 32'h0;
  assign MmuPlugin_dBusAccess_cmd_payload_writeMask = 4'bxxxx;
  always @ (*) begin
    _zz_109[0] = (((IBusCachedPlugin_mmuBus_cmd_0_isValid && MmuPlugin_ports_0_requireMmuLockupCalc) && (! MmuPlugin_ports_0_dirty)) && (! MmuPlugin_ports_0_cacheHit));
    _zz_109[1] = (((DBusCachedPlugin_mmuBus_cmd_0_isValid && MmuPlugin_ports_1_requireMmuLockupCalc) && (! MmuPlugin_ports_1_dirty)) && (! MmuPlugin_ports_1_cacheHit));
  end

  assign _zz_110 = _zz_109;
  always @ (*) begin
    _zz_111[0] = _zz_110[1];
    _zz_111[1] = _zz_110[0];
  end

  assign _zz_112 = (_zz_111 & (~ _zz_356));
  always @ (*) begin
    _zz_113[0] = _zz_112[1];
    _zz_113[1] = _zz_112[0];
  end

  assign MmuPlugin_shared_refills = _zz_113;
  assign _zz_114 = (MmuPlugin_shared_refills[0] ? IBusCachedPlugin_mmuBus_cmd_0_virtualAddress : DBusCachedPlugin_mmuBus_cmd_0_virtualAddress);
  assign IBusCachedPlugin_mmuBus_busy = ((MmuPlugin_shared_state_1 != `MmuPlugin_shared_State_defaultEncoding_IDLE) && MmuPlugin_shared_portSortedOh[0]);
  assign DBusCachedPlugin_mmuBus_busy = ((MmuPlugin_shared_state_1 != `MmuPlugin_shared_State_defaultEncoding_IDLE) && MmuPlugin_shared_portSortedOh[1]);
  assign _zz_116 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_117 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_118 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_119 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_115 = {({_zz_118,(_zz_438 == _zz_439)} != 2'b00),{((_zz_440 == _zz_441) != 1'b0),{(_zz_442 != 1'b0),{(_zz_443 != _zz_444),{_zz_445,{_zz_446,_zz_447}}}}}};
  assign _zz_120 = _zz_115[2 : 1];
  assign _zz_51 = _zz_120;
  assign _zz_121 = _zz_115[7 : 6];
  assign _zz_50 = _zz_121;
  assign _zz_122 = _zz_115[9 : 8];
  assign _zz_49 = _zz_122;
  assign _zz_123 = _zz_115[20 : 19];
  assign _zz_48 = _zz_123;
  assign _zz_124 = _zz_115[23 : 22];
  assign _zz_47 = _zz_124;
  assign _zz_125 = _zz_115[29 : 29];
  assign _zz_46 = _zz_125;
  assign _zz_126 = _zz_115[32 : 31];
  assign _zz_45 = _zz_126;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_215;
  assign decode_RegFilePlugin_rs2Data = _zz_216;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_43 && writeBack_arbitration_isFiring);
    if(_zz_127)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_address = _zz_42[11 : 7];
    if(_zz_127)begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_data = _zz_52;
    if(_zz_127)begin
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
        _zz_128 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_128 = {31'd0, _zz_357};
      end
      default : begin
        _zz_128 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_129 = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_129 = {29'd0, _zz_358};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_129 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_129 = {27'd0, _zz_359};
      end
    endcase
  end

  assign _zz_130 = _zz_360[11];
  always @ (*) begin
    _zz_131[19] = _zz_130;
    _zz_131[18] = _zz_130;
    _zz_131[17] = _zz_130;
    _zz_131[16] = _zz_130;
    _zz_131[15] = _zz_130;
    _zz_131[14] = _zz_130;
    _zz_131[13] = _zz_130;
    _zz_131[12] = _zz_130;
    _zz_131[11] = _zz_130;
    _zz_131[10] = _zz_130;
    _zz_131[9] = _zz_130;
    _zz_131[8] = _zz_130;
    _zz_131[7] = _zz_130;
    _zz_131[6] = _zz_130;
    _zz_131[5] = _zz_130;
    _zz_131[4] = _zz_130;
    _zz_131[3] = _zz_130;
    _zz_131[2] = _zz_130;
    _zz_131[1] = _zz_130;
    _zz_131[0] = _zz_130;
  end

  assign _zz_132 = _zz_361[11];
  always @ (*) begin
    _zz_133[19] = _zz_132;
    _zz_133[18] = _zz_132;
    _zz_133[17] = _zz_132;
    _zz_133[16] = _zz_132;
    _zz_133[15] = _zz_132;
    _zz_133[14] = _zz_132;
    _zz_133[13] = _zz_132;
    _zz_133[12] = _zz_132;
    _zz_133[11] = _zz_132;
    _zz_133[10] = _zz_132;
    _zz_133[9] = _zz_132;
    _zz_133[8] = _zz_132;
    _zz_133[7] = _zz_132;
    _zz_133[6] = _zz_132;
    _zz_133[5] = _zz_132;
    _zz_133[4] = _zz_132;
    _zz_133[3] = _zz_132;
    _zz_133[2] = _zz_132;
    _zz_133[1] = _zz_132;
    _zz_133[0] = _zz_132;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_134 = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_134 = {_zz_131,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_134 = {_zz_133,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_134 = _zz_37;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_362;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_135[0] = execute_SRC1[31];
    _zz_135[1] = execute_SRC1[30];
    _zz_135[2] = execute_SRC1[29];
    _zz_135[3] = execute_SRC1[28];
    _zz_135[4] = execute_SRC1[27];
    _zz_135[5] = execute_SRC1[26];
    _zz_135[6] = execute_SRC1[25];
    _zz_135[7] = execute_SRC1[24];
    _zz_135[8] = execute_SRC1[23];
    _zz_135[9] = execute_SRC1[22];
    _zz_135[10] = execute_SRC1[21];
    _zz_135[11] = execute_SRC1[20];
    _zz_135[12] = execute_SRC1[19];
    _zz_135[13] = execute_SRC1[18];
    _zz_135[14] = execute_SRC1[17];
    _zz_135[15] = execute_SRC1[16];
    _zz_135[16] = execute_SRC1[15];
    _zz_135[17] = execute_SRC1[14];
    _zz_135[18] = execute_SRC1[13];
    _zz_135[19] = execute_SRC1[12];
    _zz_135[20] = execute_SRC1[11];
    _zz_135[21] = execute_SRC1[10];
    _zz_135[22] = execute_SRC1[9];
    _zz_135[23] = execute_SRC1[8];
    _zz_135[24] = execute_SRC1[7];
    _zz_135[25] = execute_SRC1[6];
    _zz_135[26] = execute_SRC1[5];
    _zz_135[27] = execute_SRC1[4];
    _zz_135[28] = execute_SRC1[3];
    _zz_135[29] = execute_SRC1[2];
    _zz_135[30] = execute_SRC1[1];
    _zz_135[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_135 : execute_SRC1);
  always @ (*) begin
    _zz_136[0] = memory_SHIFT_RIGHT[31];
    _zz_136[1] = memory_SHIFT_RIGHT[30];
    _zz_136[2] = memory_SHIFT_RIGHT[29];
    _zz_136[3] = memory_SHIFT_RIGHT[28];
    _zz_136[4] = memory_SHIFT_RIGHT[27];
    _zz_136[5] = memory_SHIFT_RIGHT[26];
    _zz_136[6] = memory_SHIFT_RIGHT[25];
    _zz_136[7] = memory_SHIFT_RIGHT[24];
    _zz_136[8] = memory_SHIFT_RIGHT[23];
    _zz_136[9] = memory_SHIFT_RIGHT[22];
    _zz_136[10] = memory_SHIFT_RIGHT[21];
    _zz_136[11] = memory_SHIFT_RIGHT[20];
    _zz_136[12] = memory_SHIFT_RIGHT[19];
    _zz_136[13] = memory_SHIFT_RIGHT[18];
    _zz_136[14] = memory_SHIFT_RIGHT[17];
    _zz_136[15] = memory_SHIFT_RIGHT[16];
    _zz_136[16] = memory_SHIFT_RIGHT[15];
    _zz_136[17] = memory_SHIFT_RIGHT[14];
    _zz_136[18] = memory_SHIFT_RIGHT[13];
    _zz_136[19] = memory_SHIFT_RIGHT[12];
    _zz_136[20] = memory_SHIFT_RIGHT[11];
    _zz_136[21] = memory_SHIFT_RIGHT[10];
    _zz_136[22] = memory_SHIFT_RIGHT[9];
    _zz_136[23] = memory_SHIFT_RIGHT[8];
    _zz_136[24] = memory_SHIFT_RIGHT[7];
    _zz_136[25] = memory_SHIFT_RIGHT[6];
    _zz_136[26] = memory_SHIFT_RIGHT[5];
    _zz_136[27] = memory_SHIFT_RIGHT[4];
    _zz_136[28] = memory_SHIFT_RIGHT[3];
    _zz_136[29] = memory_SHIFT_RIGHT[2];
    _zz_136[30] = memory_SHIFT_RIGHT[1];
    _zz_136[31] = memory_SHIFT_RIGHT[0];
  end

  always @ (*) begin
    _zz_137 = 1'b0;
    if(_zz_263)begin
      if(_zz_264)begin
        if(_zz_142)begin
          _zz_137 = 1'b1;
        end
      end
    end
    if(_zz_265)begin
      if(_zz_266)begin
        if(_zz_144)begin
          _zz_137 = 1'b1;
        end
      end
    end
    if(_zz_267)begin
      if(_zz_268)begin
        if(_zz_146)begin
          _zz_137 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_137 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_138 = 1'b0;
    if(_zz_263)begin
      if(_zz_264)begin
        if(_zz_143)begin
          _zz_138 = 1'b1;
        end
      end
    end
    if(_zz_265)begin
      if(_zz_266)begin
        if(_zz_145)begin
          _zz_138 = 1'b1;
        end
      end
    end
    if(_zz_267)begin
      if(_zz_268)begin
        if(_zz_147)begin
          _zz_138 = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_138 = 1'b0;
    end
  end

  assign _zz_142 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_143 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_144 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_145 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_146 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_147 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  always @ (*) begin
    case(_zz_269)
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

  always @ (*) begin
    case(_zz_269)
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
  assign writeBack_MulPlugin_result = ($signed(_zz_369) + $signed(_zz_370));
  assign memory_DivPlugin_frontendOk = 1'b1;
  always @ (*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_245)begin
      if(_zz_270)begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_271)begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == 6'h21);
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_DivPlugin_div_counter_willOverflow)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_374);
    end
    if(memory_DivPlugin_div_counter_willClear)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign _zz_148 = memory_DivPlugin_rs1[31 : 0];
  assign memory_DivPlugin_div_stage_0_remainderShifted = {memory_DivPlugin_accumulator[31 : 0],_zz_148[31]};
  assign memory_DivPlugin_div_stage_0_remainderMinusDenominator = (memory_DivPlugin_div_stage_0_remainderShifted - _zz_375);
  assign memory_DivPlugin_div_stage_0_outRemainder = ((! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_376 : _zz_377);
  assign memory_DivPlugin_div_stage_0_outNumerator = _zz_378[31:0];
  assign _zz_149 = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign _zz_150 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_151 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_152[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_152[31 : 0] = execute_RS1;
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
  assign CsrPlugin_mtvec_base = 30'h20000008;
  assign _zz_153 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_154 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_155 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_156 = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_157 = _zz_388[0];
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_250)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(BranchPlugin_branchExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(DBusCachedPlugin_exceptionBus_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b1;
    end
    if(writeBack_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != 3'b000))begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @ (*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException)begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @ (*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException)begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

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
    if(execute_CsrPlugin_csr_256)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_384)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_833)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_835)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(_zz_272)begin
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
    if(_zz_272)begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(_zz_272)begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_291)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid)begin
      case(_zz_273)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr)begin
            debug_bus_cmd_ready = IBusCachedPlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if((! _zz_158))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_273)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr)begin
            IBusCachedPlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusCachedPlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign DebugPlugin_allowEBreak = (CsrPlugin_privilege == 2'b11);
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_159 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_159 == 3'b000)) begin
        _zz_160 = execute_BranchPlugin_eq;
    end else if((_zz_159 == 3'b001)) begin
        _zz_160 = (! execute_BranchPlugin_eq);
    end else if((((_zz_159 & 3'b101) == 3'b101))) begin
        _zz_160 = (! execute_SRC_LESS);
    end else begin
        _zz_160 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_161 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_161 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_161 = 1'b1;
      end
      default : begin
        _zz_161 = _zz_160;
      end
    endcase
  end

  assign _zz_162 = _zz_390[11];
  always @ (*) begin
    _zz_163[19] = _zz_162;
    _zz_163[18] = _zz_162;
    _zz_163[17] = _zz_162;
    _zz_163[16] = _zz_162;
    _zz_163[15] = _zz_162;
    _zz_163[14] = _zz_162;
    _zz_163[13] = _zz_162;
    _zz_163[12] = _zz_162;
    _zz_163[11] = _zz_162;
    _zz_163[10] = _zz_162;
    _zz_163[9] = _zz_162;
    _zz_163[8] = _zz_162;
    _zz_163[7] = _zz_162;
    _zz_163[6] = _zz_162;
    _zz_163[5] = _zz_162;
    _zz_163[4] = _zz_162;
    _zz_163[3] = _zz_162;
    _zz_163[2] = _zz_162;
    _zz_163[1] = _zz_162;
    _zz_163[0] = _zz_162;
  end

  assign _zz_164 = _zz_391[19];
  always @ (*) begin
    _zz_165[10] = _zz_164;
    _zz_165[9] = _zz_164;
    _zz_165[8] = _zz_164;
    _zz_165[7] = _zz_164;
    _zz_165[6] = _zz_164;
    _zz_165[5] = _zz_164;
    _zz_165[4] = _zz_164;
    _zz_165[3] = _zz_164;
    _zz_165[2] = _zz_164;
    _zz_165[1] = _zz_164;
    _zz_165[0] = _zz_164;
  end

  assign _zz_166 = _zz_392[11];
  always @ (*) begin
    _zz_167[18] = _zz_166;
    _zz_167[17] = _zz_166;
    _zz_167[16] = _zz_166;
    _zz_167[15] = _zz_166;
    _zz_167[14] = _zz_166;
    _zz_167[13] = _zz_166;
    _zz_167[12] = _zz_166;
    _zz_167[11] = _zz_166;
    _zz_167[10] = _zz_166;
    _zz_167[9] = _zz_166;
    _zz_167[8] = _zz_166;
    _zz_167[7] = _zz_166;
    _zz_167[6] = _zz_166;
    _zz_167[5] = _zz_166;
    _zz_167[4] = _zz_166;
    _zz_167[3] = _zz_166;
    _zz_167[2] = _zz_166;
    _zz_167[1] = _zz_166;
    _zz_167[0] = _zz_166;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_168 = (_zz_393[1] ^ execute_RS1[1]);
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_168 = _zz_394[1];
      end
      default : begin
        _zz_168 = _zz_395[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_168);
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_169 = _zz_396[11];
  always @ (*) begin
    _zz_170[19] = _zz_169;
    _zz_170[18] = _zz_169;
    _zz_170[17] = _zz_169;
    _zz_170[16] = _zz_169;
    _zz_170[15] = _zz_169;
    _zz_170[14] = _zz_169;
    _zz_170[13] = _zz_169;
    _zz_170[12] = _zz_169;
    _zz_170[11] = _zz_169;
    _zz_170[10] = _zz_169;
    _zz_170[9] = _zz_169;
    _zz_170[8] = _zz_169;
    _zz_170[7] = _zz_169;
    _zz_170[6] = _zz_169;
    _zz_170[5] = _zz_169;
    _zz_170[4] = _zz_169;
    _zz_170[3] = _zz_169;
    _zz_170[2] = _zz_169;
    _zz_170[1] = _zz_169;
    _zz_170[0] = _zz_169;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_170,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_172,{{{_zz_593,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_174,{{{_zz_594,_zz_595},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_399};
        end
      end
    endcase
  end

  assign _zz_171 = _zz_397[19];
  always @ (*) begin
    _zz_172[10] = _zz_171;
    _zz_172[9] = _zz_171;
    _zz_172[8] = _zz_171;
    _zz_172[7] = _zz_171;
    _zz_172[6] = _zz_171;
    _zz_172[5] = _zz_171;
    _zz_172[4] = _zz_171;
    _zz_172[3] = _zz_171;
    _zz_172[2] = _zz_171;
    _zz_172[1] = _zz_171;
    _zz_172[0] = _zz_171;
  end

  assign _zz_173 = _zz_398[11];
  always @ (*) begin
    _zz_174[18] = _zz_173;
    _zz_174[17] = _zz_173;
    _zz_174[16] = _zz_173;
    _zz_174[15] = _zz_173;
    _zz_174[14] = _zz_173;
    _zz_174[13] = _zz_173;
    _zz_174[12] = _zz_173;
    _zz_174[11] = _zz_173;
    _zz_174[10] = _zz_173;
    _zz_174[9] = _zz_173;
    _zz_174[8] = _zz_173;
    _zz_174[7] = _zz_173;
    _zz_174[6] = _zz_173;
    _zz_174[5] = _zz_173;
    _zz_174[4] = _zz_173;
    _zz_174[3] = _zz_173;
    _zz_174[2] = _zz_173;
    _zz_174[1] = _zz_173;
    _zz_174[0] = _zz_173;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign BranchPlugin_branchExceptionPort_valid = (memory_arbitration_isValid && (memory_BRANCH_DO && memory_BRANCH_CALC[1]));
  assign BranchPlugin_branchExceptionPort_payload_code = 4'b0000;
  assign BranchPlugin_branchExceptionPort_payload_badAddr = memory_BRANCH_CALC;
  assign IBusCachedPlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  assign _zz_28 = decode_SRC1_CTRL;
  assign _zz_26 = _zz_51;
  assign _zz_39 = decode_to_execute_SRC1_CTRL;
  assign _zz_25 = decode_ALU_CTRL;
  assign _zz_23 = _zz_50;
  assign _zz_40 = decode_to_execute_ALU_CTRL;
  assign _zz_22 = decode_SRC2_CTRL;
  assign _zz_20 = _zz_49;
  assign _zz_38 = decode_to_execute_SRC2_CTRL;
  assign _zz_19 = decode_ALU_BITWISE_CTRL;
  assign _zz_17 = _zz_48;
  assign _zz_41 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_16 = decode_SHIFT_CTRL;
  assign _zz_13 = execute_SHIFT_CTRL;
  assign _zz_14 = _zz_47;
  assign _zz_36 = decode_to_execute_SHIFT_CTRL;
  assign _zz_35 = execute_to_memory_SHIFT_CTRL;
  assign _zz_11 = decode_ENV_CTRL;
  assign _zz_8 = execute_ENV_CTRL;
  assign _zz_6 = memory_ENV_CTRL;
  assign _zz_9 = _zz_46;
  assign _zz_31 = decode_to_execute_ENV_CTRL;
  assign _zz_30 = execute_to_memory_ENV_CTRL;
  assign _zz_32 = memory_to_writeBack_ENV_CTRL;
  assign _zz_4 = decode_BRANCH_CTRL;
  assign _zz_2 = execute_BRANCH_CTRL;
  assign _zz_53 = _zz_45;
  assign _zz_29 = decode_to_execute_BRANCH_CTRL;
  assign _zz_54 = execute_to_memory_BRANCH_CTRL;
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
    IBusCachedPlugin_injectionPort_ready = 1'b0;
    case(_zz_175)
      3'b100 : begin
        IBusCachedPlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_176 = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_176[19 : 19] = MmuPlugin_status_mxr;
      _zz_176[18 : 18] = MmuPlugin_status_sum;
      _zz_176[17 : 17] = MmuPlugin_status_mprv;
      _zz_176[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_176[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_176[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_177 = 32'h0;
    if(execute_CsrPlugin_csr_256)begin
      _zz_177[19 : 19] = MmuPlugin_status_mxr;
      _zz_177[18 : 18] = MmuPlugin_status_sum;
      _zz_177[17 : 17] = MmuPlugin_status_mprv;
    end
  end

  always @ (*) begin
    _zz_178 = 32'h0;
    if(execute_CsrPlugin_csr_384)begin
      _zz_178[31 : 31] = MmuPlugin_satp_mode;
      _zz_178[30 : 22] = MmuPlugin_satp_asid;
      _zz_178[19 : 0] = MmuPlugin_satp_ppn;
    end
  end

  always @ (*) begin
    _zz_179 = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_179[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_179[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_179[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_180 = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_180[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_180[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_180[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_181 = 32'h0;
    if(execute_CsrPlugin_csr_833)begin
      _zz_181[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @ (*) begin
    _zz_182 = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_182[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_182[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_183 = 32'h0;
    if(execute_CsrPlugin_csr_835)begin
      _zz_183[31 : 0] = CsrPlugin_mtval;
    end
  end

  assign execute_CsrPlugin_readData = (((_zz_176 | _zz_177) | (_zz_178 | _zz_179)) | ((_zz_180 | _zz_181) | (_zz_182 | _zz_183)));
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      IBusCachedPlugin_fetchPc_pcReg <= 32'h80000000;
      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_69 <= 1'b0;
      _zz_71 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_92;
      IBusCachedPlugin_rspCounter <= 32'h0;
      DBusCachedPlugin_rspCounter <= _zz_93;
      DBusCachedPlugin_rspCounter <= 32'h0;
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
      MmuPlugin_ports_1_cache_4_valid <= 1'b0;
      MmuPlugin_ports_1_cache_5_valid <= 1'b0;
      MmuPlugin_ports_1_entryToReplace_value <= 3'b000;
      MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_IDLE;
      MmuPlugin_shared_dBusRspStaged_valid <= 1'b0;
      _zz_127 <= 1'b1;
      _zz_139 <= 1'b0;
      memory_DivPlugin_div_counter_value <= 6'h0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_175 <= 3'b000;
      execute_to_memory_IS_DBUS_SHARING <= 1'b0;
      memory_to_writeBack_IS_DBUS_SHARING <= 1'b0;
    end else begin
      if(IBusCachedPlugin_fetchPc_correction)begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusCachedPlugin_fetchPc_booted <= 1'b1;
      if((IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_pcRegPropagate))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusCachedPlugin_fetchPc_output_valid) && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_booted && ((IBusCachedPlugin_fetchPc_output_ready || IBusCachedPlugin_fetchPc_correction) || IBusCachedPlugin_fetchPc_pcRegPropagate)))begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_69 <= 1'b0;
      end
      if(_zz_67)begin
        _zz_69 <= (IBusCachedPlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_71 <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
        _zz_71 <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_stages_1_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_stages_2_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= IBusCachedPlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(iBus_rsp_valid)begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + 32'h00000001);
      end
      if(dBus_rsp_valid)begin
        DBusCachedPlugin_rspCounter <= (DBusCachedPlugin_rspCounter + 32'h00000001);
      end
      MmuPlugin_ports_0_entryToReplace_value <= MmuPlugin_ports_0_entryToReplace_valueNext;
      if(contextSwitching)begin
        if(MmuPlugin_ports_0_cache_0_exception)begin
          MmuPlugin_ports_0_cache_0_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_1_exception)begin
          MmuPlugin_ports_0_cache_1_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_2_exception)begin
          MmuPlugin_ports_0_cache_2_valid <= 1'b0;
        end
        if(MmuPlugin_ports_0_cache_3_exception)begin
          MmuPlugin_ports_0_cache_3_valid <= 1'b0;
        end
      end
      MmuPlugin_ports_1_entryToReplace_value <= MmuPlugin_ports_1_entryToReplace_valueNext;
      if(contextSwitching)begin
        if(MmuPlugin_ports_1_cache_0_exception)begin
          MmuPlugin_ports_1_cache_0_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_1_exception)begin
          MmuPlugin_ports_1_cache_1_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_2_exception)begin
          MmuPlugin_ports_1_cache_2_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_3_exception)begin
          MmuPlugin_ports_1_cache_3_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_4_exception)begin
          MmuPlugin_ports_1_cache_4_valid <= 1'b0;
        end
        if(MmuPlugin_ports_1_cache_5_exception)begin
          MmuPlugin_ports_1_cache_5_valid <= 1'b0;
        end
      end
      MmuPlugin_shared_dBusRspStaged_valid <= MmuPlugin_dBusAccess_rsp_valid;
      case(MmuPlugin_shared_state_1)
        `MmuPlugin_shared_State_defaultEncoding_IDLE : begin
          if(_zz_274)begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L1_CMD;
          end
        end
        `MmuPlugin_shared_State_defaultEncoding_L1_CMD : begin
          if(MmuPlugin_dBusAccess_cmd_ready)begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L1_RSP;
          end
        end
        `MmuPlugin_shared_State_defaultEncoding_L1_RSP : begin
          if(MmuPlugin_shared_dBusRspStaged_valid)begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L0_CMD;
            if((MmuPlugin_shared_dBusRsp_leaf || MmuPlugin_shared_dBusRsp_exception))begin
              MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_IDLE;
            end
            if(MmuPlugin_shared_dBusRspStaged_payload_redo)begin
              MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L1_CMD;
            end
          end
        end
        `MmuPlugin_shared_State_defaultEncoding_L0_CMD : begin
          if(MmuPlugin_dBusAccess_cmd_ready)begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L0_RSP;
          end
        end
        default : begin
          if(MmuPlugin_shared_dBusRspStaged_valid)begin
            MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_IDLE;
            if(MmuPlugin_shared_dBusRspStaged_payload_redo)begin
              MmuPlugin_shared_state_1 <= `MmuPlugin_shared_State_defaultEncoding_L0_CMD;
            end
          end
        end
      endcase
      if(_zz_260)begin
        if(_zz_261)begin
          if(_zz_275)begin
            MmuPlugin_ports_0_cache_0_valid <= 1'b1;
          end
          if(_zz_276)begin
            MmuPlugin_ports_0_cache_1_valid <= 1'b1;
          end
          if(_zz_277)begin
            MmuPlugin_ports_0_cache_2_valid <= 1'b1;
          end
          if(_zz_278)begin
            MmuPlugin_ports_0_cache_3_valid <= 1'b1;
          end
        end
        if(_zz_262)begin
          if(_zz_279)begin
            MmuPlugin_ports_1_cache_0_valid <= 1'b1;
          end
          if(_zz_280)begin
            MmuPlugin_ports_1_cache_1_valid <= 1'b1;
          end
          if(_zz_281)begin
            MmuPlugin_ports_1_cache_2_valid <= 1'b1;
          end
          if(_zz_282)begin
            MmuPlugin_ports_1_cache_3_valid <= 1'b1;
          end
          if(_zz_283)begin
            MmuPlugin_ports_1_cache_4_valid <= 1'b1;
          end
          if(_zz_284)begin
            MmuPlugin_ports_1_cache_5_valid <= 1'b1;
          end
        end
      end
      if((writeBack_arbitration_isValid && writeBack_IS_SFENCE_VMA))begin
        MmuPlugin_ports_0_cache_0_valid <= 1'b0;
        MmuPlugin_ports_0_cache_1_valid <= 1'b0;
        MmuPlugin_ports_0_cache_2_valid <= 1'b0;
        MmuPlugin_ports_0_cache_3_valid <= 1'b0;
        MmuPlugin_ports_1_cache_0_valid <= 1'b0;
        MmuPlugin_ports_1_cache_1_valid <= 1'b0;
        MmuPlugin_ports_1_cache_2_valid <= 1'b0;
        MmuPlugin_ports_1_cache_3_valid <= 1'b0;
        MmuPlugin_ports_1_cache_4_valid <= 1'b0;
        MmuPlugin_ports_1_cache_5_valid <= 1'b0;
      end
      _zz_127 <= 1'b0;
      _zz_139 <= (_zz_43 && writeBack_arbitration_isFiring);
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      if((! decode_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if((! memory_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if((! writeBack_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_285)begin
        if(_zz_286)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_287)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_288)begin
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
      if(_zz_253)begin
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
      if(_zz_254)begin
        case(_zz_256)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_155,{_zz_154,_zz_153}} != 3'b000) || CsrPlugin_thirdPartyWake);
      if((! memory_arbitration_isStuck))begin
        execute_to_memory_IS_DBUS_SHARING <= execute_IS_DBUS_SHARING;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_IS_DBUS_SHARING <= memory_IS_DBUS_SHARING;
      end
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
      case(_zz_175)
        3'b000 : begin
          if(IBusCachedPlugin_injectionPort_valid)begin
            _zz_175 <= 3'b001;
          end
        end
        3'b001 : begin
          _zz_175 <= 3'b010;
        end
        3'b010 : begin
          _zz_175 <= 3'b011;
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_175 <= 3'b100;
          end
        end
        3'b100 : begin
          _zz_175 <= 3'b000;
        end
        default : begin
        end
      endcase
      if(MmuPlugin_dBusAccess_rsp_valid)begin
        memory_to_writeBack_IS_DBUS_SHARING <= 1'b0;
      end
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          MmuPlugin_status_mxr <= _zz_400[0];
          MmuPlugin_status_sum <= _zz_401[0];
          MmuPlugin_status_mprv <= _zz_402[0];
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_403[0];
          CsrPlugin_mstatus_MIE <= _zz_404[0];
        end
      end
      if(execute_CsrPlugin_csr_256)begin
        if(execute_CsrPlugin_writeEnable)begin
          MmuPlugin_status_mxr <= _zz_405[0];
          MmuPlugin_status_sum <= _zz_406[0];
          MmuPlugin_status_mprv <= _zz_407[0];
        end
      end
      if(execute_CsrPlugin_csr_384)begin
        if(execute_CsrPlugin_writeInstruction)begin
          MmuPlugin_ports_0_cache_0_valid <= 1'b0;
          MmuPlugin_ports_0_cache_1_valid <= 1'b0;
          MmuPlugin_ports_0_cache_2_valid <= 1'b0;
          MmuPlugin_ports_0_cache_3_valid <= 1'b0;
          MmuPlugin_ports_1_cache_0_valid <= 1'b0;
          MmuPlugin_ports_1_cache_1_valid <= 1'b0;
          MmuPlugin_ports_1_cache_2_valid <= 1'b0;
          MmuPlugin_ports_1_cache_3_valid <= 1'b0;
          MmuPlugin_ports_1_cache_4_valid <= 1'b0;
          MmuPlugin_ports_1_cache_5_valid <= 1'b0;
        end
        if(execute_CsrPlugin_writeEnable)begin
          MmuPlugin_satp_mode <= _zz_408[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_410[0];
          CsrPlugin_mie_MTIE <= _zz_411[0];
          CsrPlugin_mie_MSIE <= _zz_412[0];
        end
      end
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      _zz_72 <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_0_output_ready)begin
      _zz_76 <= _zz_74;
      _zz_77 <= _zz_75;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      _zz_80 <= (_zz_76 && (_zz_77 == _zz_332));
      _zz_81 <= _zz_214[1 : 0];
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready)begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    MmuPlugin_shared_dBusRspStaged_payload_data <= MmuPlugin_dBusAccess_rsp_payload_data;
    MmuPlugin_shared_dBusRspStaged_payload_error <= MmuPlugin_dBusAccess_rsp_payload_error;
    MmuPlugin_shared_dBusRspStaged_payload_redo <= MmuPlugin_dBusAccess_rsp_payload_redo;
    if((MmuPlugin_shared_dBusRspStaged_valid && (! MmuPlugin_shared_dBusRspStaged_payload_redo)))begin
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
        if(_zz_274)begin
          MmuPlugin_shared_portSortedOh <= MmuPlugin_shared_refills;
          MmuPlugin_shared_vpn_1 <= _zz_114[31 : 22];
          MmuPlugin_shared_vpn_0 <= _zz_114[21 : 12];
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
    if(_zz_260)begin
      if(_zz_261)begin
        if(_zz_275)begin
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
        if(_zz_276)begin
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
        if(_zz_277)begin
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
        if(_zz_278)begin
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
      if(_zz_262)begin
        if(_zz_279)begin
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
        if(_zz_280)begin
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
        if(_zz_281)begin
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
        if(_zz_282)begin
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
        if(_zz_283)begin
          MmuPlugin_ports_1_cache_4_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_1_cache_4_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_4_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_4_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_4_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_4_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_4_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_4_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_4_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_4_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
        if(_zz_284)begin
          MmuPlugin_ports_1_cache_5_exception <= (MmuPlugin_shared_dBusRsp_exception || ((MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP) && (MmuPlugin_shared_dBusRsp_pte_PPN0 != 10'h0)));
          MmuPlugin_ports_1_cache_5_virtualAddress_0 <= MmuPlugin_shared_vpn_0;
          MmuPlugin_ports_1_cache_5_virtualAddress_1 <= MmuPlugin_shared_vpn_1;
          MmuPlugin_ports_1_cache_5_physicalAddress_0 <= MmuPlugin_shared_dBusRsp_pte_PPN0;
          MmuPlugin_ports_1_cache_5_physicalAddress_1 <= MmuPlugin_shared_dBusRsp_pte_PPN1[9 : 0];
          MmuPlugin_ports_1_cache_5_allowRead <= MmuPlugin_shared_dBusRsp_pte_R;
          MmuPlugin_ports_1_cache_5_allowWrite <= MmuPlugin_shared_dBusRsp_pte_W;
          MmuPlugin_ports_1_cache_5_allowExecute <= MmuPlugin_shared_dBusRsp_pte_X;
          MmuPlugin_ports_1_cache_5_allowUser <= MmuPlugin_shared_dBusRsp_pte_U;
          MmuPlugin_ports_1_cache_5_superPage <= (MmuPlugin_shared_state_1 == `MmuPlugin_shared_State_defaultEncoding_L1_RSP);
        end
      end
    end
    _zz_140 <= _zz_42[11 : 7];
    _zz_141 <= _zz_52;
    if((memory_DivPlugin_div_counter_value == 6'h20))begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(_zz_245)begin
      if(_zz_270)begin
        memory_DivPlugin_rs1[31 : 0] <= memory_DivPlugin_div_stage_0_outNumerator;
        memory_DivPlugin_accumulator[31 : 0] <= memory_DivPlugin_div_stage_0_outRemainder;
        if((memory_DivPlugin_div_counter_value == 6'h20))begin
          memory_DivPlugin_div_result <= _zz_379[31:0];
        end
      end
    end
    if(_zz_271)begin
      memory_DivPlugin_accumulator <= 65'h0;
      memory_DivPlugin_rs1 <= ((_zz_151 ? (~ _zz_152) : _zz_152) + _zz_385);
      memory_DivPlugin_rs2 <= ((_zz_150 ? (~ execute_RS2) : execute_RS2) + _zz_387);
      memory_DivPlugin_div_needRevert <= ((_zz_151 ^ (_zz_150 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(_zz_250)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_157 ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_157 ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(BranchPlugin_branchExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= BranchPlugin_branchExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= BranchPlugin_branchExceptionPort_payload_badAddr;
    end
    if(DBusCachedPlugin_exceptionBus_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusCachedPlugin_exceptionBus_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusCachedPlugin_exceptionBus_payload_badAddr;
    end
    if(_zz_285)begin
      if(_zz_286)begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_287)begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_288)begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(_zz_253)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= writeBack_PC;
          if(CsrPlugin_hadException)begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_37;
    end
    if(((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack)))begin
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
      decode_to_execute_FORMAL_PC_NEXT <= _zz_57;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_56;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_CONTEXT_hazard <= decode_PREDICTION_CONTEXT_hazard;
      decode_to_execute_PREDICTION_CONTEXT_line_history <= decode_PREDICTION_CONTEXT_line_history;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PREDICTION_CONTEXT_hazard <= execute_PREDICTION_CONTEXT_hazard;
      execute_to_memory_PREDICTION_CONTEXT_line_history <= execute_PREDICTION_CONTEXT_line_history;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_FORCE_CONSTISTENCY <= decode_MEMORY_FORCE_CONSTISTENCY;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_27;
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
      decode_to_execute_ALU_CTRL <= _zz_24;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_21;
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
      decode_to_execute_MEMORY_WR <= decode_MEMORY_WR;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_WR <= execute_MEMORY_WR;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_WR <= memory_MEMORY_WR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_SFENCE_VMA <= decode_IS_SFENCE_VMA;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_SFENCE_VMA <= execute_IS_SFENCE_VMA;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_SFENCE_VMA <= memory_IS_SFENCE_VMA;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_18;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_15;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_12;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_10;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_7;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_5;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_3;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CTRL <= _zz_1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_33;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_34;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_256 <= (decode_INSTRUCTION[31 : 20] == 12'h100);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_384 <= (decode_INSTRUCTION[31 : 20] == 12'h180);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if(execute_CsrPlugin_csr_384)begin
      if(execute_CsrPlugin_writeEnable)begin
        MmuPlugin_satp_asid <= execute_CsrPlugin_writeData[30 : 22];
        MmuPlugin_satp_ppn <= execute_CsrPlugin_writeData[19 : 0];
      end
    end
    if(execute_CsrPlugin_csr_836)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mip_MSIP <= _zz_409[0];
      end
    end
    if(execute_CsrPlugin_csr_833)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mepc <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  always @ (posedge clk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready)begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != 4'b0000) || IBusCachedPlugin_incomingInstruction);
    if(writeBack_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_52;
    end
    _zz_158 <= debug_bus_cmd_payload_address[2];
    if(_zz_251)begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @ (posedge clk or posedge debugReset) begin
    if (debugReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
    end else begin
      if((DebugPlugin_haltIt && (! DebugPlugin_isPipBusy)))begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        case(_zz_273)
          6'h0 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(debug_bus_cmd_payload_data[16])begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[24])begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[17])begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_godmode <= 1'b0;
              end
            end
          end
          default : begin
          end
        endcase
      end
      if(_zz_251)begin
        if(_zz_252)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_255)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
    end
  end


endmodule

module DataCache (
  input               io_cpu_execute_isValid,
  input      [31:0]   io_cpu_execute_address,
  output              io_cpu_execute_haltIt,
  input               io_cpu_execute_args_wr,
  input      [31:0]   io_cpu_execute_args_data,
  input      [1:0]    io_cpu_execute_args_size,
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
  input               io_cpu_memory_mmuRsp_ways_4_sel,
  input      [31:0]   io_cpu_memory_mmuRsp_ways_4_physical,
  input               io_cpu_memory_mmuRsp_ways_5_sel,
  input      [31:0]   io_cpu_memory_mmuRsp_ways_5_physical,
  input               io_cpu_writeBack_isValid,
  input               io_cpu_writeBack_isStuck,
  input               io_cpu_writeBack_isUser,
  output reg          io_cpu_writeBack_haltIt,
  output              io_cpu_writeBack_isWrite,
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
  output reg          io_cpu_redo,
  input               io_cpu_flush_valid,
  output reg          io_cpu_flush_ready,
  output reg          io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output reg          io_mem_cmd_payload_wr,
  output              io_mem_cmd_payload_uncached,
  output reg [31:0]   io_mem_cmd_payload_address,
  output     [31:0]   io_mem_cmd_payload_data,
  output     [3:0]    io_mem_cmd_payload_mask,
  output reg [2:0]    io_mem_cmd_payload_length,
  output              io_mem_cmd_payload_last,
  input               io_mem_rsp_valid,
  input               io_mem_rsp_payload_last,
  input      [31:0]   io_mem_rsp_payload_data,
  input               io_mem_rsp_payload_error,
  input               clk,
  input               reset
);
  reg        [21:0]   _zz_10;
  reg        [31:0]   _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire                _zz_14;
  wire                _zz_15;
  wire                _zz_16;
  wire                _zz_17;
  wire                _zz_18;
  wire       [0:0]    _zz_19;
  wire       [0:0]    _zz_20;
  wire       [9:0]    _zz_21;
  wire       [9:0]    _zz_22;
  wire       [0:0]    _zz_23;
  wire       [0:0]    _zz_24;
  wire       [2:0]    _zz_25;
  wire       [1:0]    _zz_26;
  wire       [21:0]   _zz_27;
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
  wire                _zz_3;
  wire                ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_error;
  wire       [19:0]   ways_0_tagsReadRsp_address;
  wire       [21:0]   _zz_4;
  wire                _zz_5;
  wire       [31:0]   ways_0_dataReadRspMem;
  wire       [31:0]   ways_0_dataReadRsp;
  wire                rspSync;
  wire                rspLast;
  reg                 memCmdSent;
  reg        [3:0]    _zz_6;
  wire       [3:0]    stage0_mask;
  wire       [0:0]    stage0_dataColisions;
  wire       [0:0]    stage0_wayInvalidate;
  wire                stage0_isAmo;
  reg                 stageA_request_wr;
  reg        [31:0]   stageA_request_data;
  reg        [1:0]    stageA_request_size;
  reg                 stageA_request_totalyConsistent;
  reg        [3:0]    stageA_mask;
  wire                stageA_isAmo;
  wire                stageA_isLrsc;
  wire       [0:0]    stageA_wayHits;
  wire       [0:0]    _zz_7;
  reg        [0:0]    stageA_wayInvalidate;
  reg        [0:0]    stage0_dataColisions_regNextWhen;
  wire       [0:0]    _zz_8;
  wire       [0:0]    stageA_dataColisions;
  reg                 stageB_request_wr;
  reg        [31:0]   stageB_request_data;
  reg        [1:0]    stageB_request_size;
  reg                 stageB_request_totalyConsistent;
  reg                 stageB_mmuRspFreeze;
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
  reg                 stageB_mmuRsp_ways_4_sel;
  reg        [31:0]   stageB_mmuRsp_ways_4_physical;
  reg                 stageB_mmuRsp_ways_5_sel;
  reg        [31:0]   stageB_mmuRsp_ways_5_physical;
  reg                 stageB_tagsReadRsp_0_valid;
  reg                 stageB_tagsReadRsp_0_error;
  reg        [19:0]   stageB_tagsReadRsp_0_address;
  reg        [31:0]   stageB_dataReadRsp_0;
  reg        [0:0]    stageB_wayInvalidate;
  wire                stageB_consistancyHazard;
  reg        [0:0]    stageB_dataColisions;
  reg                 stageB_unaligned;
  reg        [0:0]    stageB_waysHitsBeforeInvalidate;
  wire       [0:0]    stageB_waysHits;
  wire                stageB_waysHit;
  wire       [31:0]   stageB_dataMux;
  reg        [3:0]    stageB_mask;
  reg                 stageB_loaderValid;
  wire       [31:0]   stageB_ioMemRspMuxed;
  reg                 stageB_flusher_valid;
  wire                stageB_flusher_hold;
  reg                 stageB_flusher_start;
  wire                stageB_isAmo;
  wire                stageB_isAmoCached;
  wire                stageB_isExternalLsrc;
  wire                stageB_isExternalAmo;
  wire       [31:0]   stageB_requestDataBypass;
  reg                 stageB_cpuWriteToCache;
  wire                stageB_badPermissions;
  wire                stageB_loadStoreFault;
  wire                stageB_bypassCache;
  wire       [0:0]    _zz_9;
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
  wire                loader_done;
  reg                 loader_valid_regNext;
  reg [21:0] ways_0_tags [0:127];
  reg [7:0] ways_0_data_symbol0 [0:1023];
  reg [7:0] ways_0_data_symbol1 [0:1023];
  reg [7:0] ways_0_data_symbol2 [0:1023];
  reg [7:0] ways_0_data_symbol3 [0:1023];
  reg [7:0] _zz_28;
  reg [7:0] _zz_29;
  reg [7:0] _zz_30;
  reg [7:0] _zz_31;

  assign _zz_12 = (io_cpu_execute_isValid && (! io_cpu_memory_isStuck));
  assign _zz_13 = ((((stageB_consistancyHazard || stageB_mmuRsp_refilling) || io_cpu_writeBack_accessError) || io_cpu_writeBack_mmuException) || io_cpu_writeBack_unalignedAccess);
  assign _zz_14 = ((loader_valid && io_mem_rsp_valid) && rspLast);
  assign _zz_15 = (stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc);
  assign _zz_16 = (stageB_waysHit || (stageB_request_wr && (! stageB_isAmoCached)));
  assign _zz_17 = (! stageB_flusher_hold);
  assign _zz_18 = (stageB_mmuRsp_physicalAddress[11 : 5] != 7'h7f);
  assign _zz_19 = _zz_4[0 : 0];
  assign _zz_20 = _zz_4[1 : 1];
  assign _zz_21 = (io_cpu_execute_address[11 : 2] >>> 0);
  assign _zz_22 = (io_cpu_memory_address[11 : 2] >>> 0);
  assign _zz_23 = 1'b1;
  assign _zz_24 = loader_counter_willIncrement;
  assign _zz_25 = {2'd0, _zz_24};
  assign _zz_26 = {loader_waysAllocator,loader_waysAllocator[0]};
  assign _zz_27 = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_3) begin
      _zz_10 <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(_zz_2) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= _zz_27;
    end
  end

  always @ (*) begin
    _zz_11 = {_zz_31, _zz_30, _zz_29, _zz_28};
  end
  always @ (posedge clk) begin
    if(_zz_5) begin
      _zz_28 <= ways_0_data_symbol0[dataReadCmd_payload];
      _zz_29 <= ways_0_data_symbol1[dataReadCmd_payload];
      _zz_30 <= ways_0_data_symbol2[dataReadCmd_payload];
      _zz_31 <= ways_0_data_symbol3[dataReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
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

  always @ (*) begin
    _zz_1 = 1'b0;
    if((dataWriteCmd_valid && dataWriteCmd_payload_way[0]))begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2 = 1'b0;
    if((tagsWriteCmd_valid && tagsWriteCmd_payload_way[0]))begin
      _zz_2 = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  assign _zz_3 = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_4 = _zz_10;
  assign ways_0_tagsReadRsp_valid = _zz_19[0];
  assign ways_0_tagsReadRsp_error = _zz_20[0];
  assign ways_0_tagsReadRsp_address = _zz_4[21 : 2];
  assign _zz_5 = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_0_dataReadRspMem = _zz_11;
  assign ways_0_dataReadRsp = ways_0_dataReadRspMem[31 : 0];
  always @ (*) begin
    tagsReadCmd_valid = 1'b0;
    if(_zz_12)begin
      tagsReadCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsReadCmd_payload = 7'h0;
    if(_zz_12)begin
      tagsReadCmd_payload = io_cpu_execute_address[11 : 5];
    end
  end

  always @ (*) begin
    dataReadCmd_valid = 1'b0;
    if(_zz_12)begin
      dataReadCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    dataReadCmd_payload = 10'h0;
    if(_zz_12)begin
      dataReadCmd_payload = io_cpu_execute_address[11 : 2];
    end
  end

  always @ (*) begin
    tagsWriteCmd_valid = 1'b0;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_valid = stageB_flusher_valid;
    end
    if(_zz_13)begin
      tagsWriteCmd_valid = 1'b0;
    end
    if(loader_done)begin
      tagsWriteCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_way = 1'bx;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_way = 1'b1;
    end
    if(loader_done)begin
      tagsWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_address = 7'h0;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
    if(loader_done)begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_valid = 1'bx;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_data_valid = 1'b0;
    end
    if(loader_done)begin
      tagsWriteCmd_payload_data_valid = (! (loader_kill || loader_killReg));
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_error = 1'bx;
    if(loader_done)begin
      tagsWriteCmd_payload_data_error = (loader_error || (io_mem_rsp_valid && io_mem_rsp_payload_error));
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_address = 20'h0;
    if(loader_done)begin
      tagsWriteCmd_payload_data_address = stageB_mmuRsp_physicalAddress[31 : 12];
    end
  end

  always @ (*) begin
    dataWriteCmd_valid = 1'b0;
    if(stageB_cpuWriteToCache)begin
      if((stageB_request_wr && stageB_waysHit))begin
        dataWriteCmd_valid = 1'b1;
      end
    end
    if(_zz_13)begin
      dataWriteCmd_valid = 1'b0;
    end
    if(_zz_14)begin
      dataWriteCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_way = 1'bx;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_way = stageB_waysHits;
    end
    if(_zz_14)begin
      dataWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_address = 10'h0;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 2];
    end
    if(_zz_14)begin
      dataWriteCmd_payload_address = {stageB_mmuRsp_physicalAddress[11 : 5],loader_counter_value};
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_data = 32'h0;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_data[31 : 0] = stageB_requestDataBypass;
    end
    if(_zz_14)begin
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_mask = 4'bxxxx;
    if(stageB_cpuWriteToCache)begin
      dataWriteCmd_payload_mask = 4'b0000;
      if(_zz_23[0])begin
        dataWriteCmd_payload_mask[3 : 0] = stageB_mask;
      end
    end
    if(_zz_14)begin
      dataWriteCmd_payload_mask = 4'b1111;
    end
  end

  assign io_cpu_execute_haltIt = 1'b0;
  assign rspSync = 1'b1;
  assign rspLast = 1'b1;
  always @ (*) begin
    case(io_cpu_execute_args_size)
      2'b00 : begin
        _zz_6 = 4'b0001;
      end
      2'b01 : begin
        _zz_6 = 4'b0011;
      end
      default : begin
        _zz_6 = 4'b1111;
      end
    endcase
  end

  assign stage0_mask = (_zz_6 <<< io_cpu_execute_address[1 : 0]);
  assign stage0_dataColisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_21)) && ((stage0_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stage0_wayInvalidate = 1'b0;
  assign stage0_isAmo = 1'b0;
  assign io_cpu_memory_isWrite = stageA_request_wr;
  assign stageA_isAmo = 1'b0;
  assign stageA_isLrsc = 1'b0;
  assign _zz_7[0] = ((io_cpu_memory_mmuRsp_physicalAddress[31 : 12] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign stageA_wayHits = _zz_7;
  assign _zz_8[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_22)) && ((stageA_mask & dataWriteCmd_payload_mask[3 : 0]) != 4'b0000));
  assign stageA_dataColisions = (stage0_dataColisions_regNextWhen | _zz_8);
  always @ (*) begin
    stageB_mmuRspFreeze = 1'b0;
    if((stageB_loaderValid || loader_valid))begin
      stageB_mmuRspFreeze = 1'b1;
    end
  end

  assign stageB_consistancyHazard = 1'b0;
  assign stageB_waysHits = (stageB_waysHitsBeforeInvalidate & (~ stageB_wayInvalidate));
  assign stageB_waysHit = (stageB_waysHits != 1'b0);
  assign stageB_dataMux = stageB_dataReadRsp_0;
  always @ (*) begin
    stageB_loaderValid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_15) begin
          if(! _zz_16) begin
            if(io_mem_cmd_ready)begin
              stageB_loaderValid = 1'b1;
            end
          end
        end
      end
    end
    if(_zz_13)begin
      stageB_loaderValid = 1'b0;
    end
  end

  assign stageB_ioMemRspMuxed = io_mem_rsp_payload_data[31 : 0];
  always @ (*) begin
    io_cpu_writeBack_haltIt = io_cpu_writeBack_isValid;
    if(stageB_flusher_valid)begin
      io_cpu_writeBack_haltIt = 1'b1;
    end
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(_zz_15)begin
          if(((! stageB_request_wr) ? (io_mem_rsp_valid && rspSync) : io_mem_cmd_ready))begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
        end else begin
          if(_zz_16)begin
            if(((! stageB_request_wr) || io_mem_cmd_ready))begin
              io_cpu_writeBack_haltIt = 1'b0;
            end
          end
        end
      end
    end
    if(_zz_13)begin
      io_cpu_writeBack_haltIt = 1'b0;
    end
  end

  assign stageB_flusher_hold = 1'b0;
  always @ (*) begin
    io_cpu_flush_ready = 1'b0;
    if(stageB_flusher_start)begin
      io_cpu_flush_ready = 1'b1;
    end
  end

  assign stageB_isAmo = 1'b0;
  assign stageB_isAmoCached = 1'b0;
  assign stageB_isExternalLsrc = 1'b0;
  assign stageB_isExternalAmo = 1'b0;
  assign stageB_requestDataBypass = stageB_request_data;
  always @ (*) begin
    stageB_cpuWriteToCache = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_15) begin
          if(_zz_16)begin
            stageB_cpuWriteToCache = 1'b1;
          end
        end
      end
    end
  end

  assign stageB_badPermissions = (((! stageB_mmuRsp_allowWrite) && stageB_request_wr) || ((! stageB_mmuRsp_allowRead) && ((! stageB_request_wr) || stageB_isAmo)));
  assign stageB_loadStoreFault = (io_cpu_writeBack_isValid && (stageB_mmuRsp_exception || stageB_badPermissions));
  always @ (*) begin
    io_cpu_redo = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_15) begin
          if(_zz_16)begin
            if((((! stageB_request_wr) || stageB_isAmoCached) && ((stageB_dataColisions & stageB_waysHits) != 1'b0)))begin
              io_cpu_redo = 1'b1;
            end
          end
        end
      end
    end
    if((io_cpu_writeBack_isValid && (stageB_mmuRsp_refilling || stageB_consistancyHazard)))begin
      io_cpu_redo = 1'b1;
    end
    if((loader_valid && (! loader_valid_regNext)))begin
      io_cpu_redo = 1'b1;
    end
  end

  always @ (*) begin
    io_cpu_writeBack_accessError = 1'b0;
    if(stageB_bypassCache)begin
      io_cpu_writeBack_accessError = ((((! stageB_request_wr) && 1'b1) && io_mem_rsp_valid) && io_mem_rsp_payload_error);
    end else begin
      io_cpu_writeBack_accessError = (((stageB_waysHits & _zz_9) != 1'b0) || (stageB_loadStoreFault && (! stageB_mmuRsp_isPaging)));
    end
  end

  assign io_cpu_writeBack_mmuException = (stageB_loadStoreFault && stageB_mmuRsp_isPaging);
  assign io_cpu_writeBack_unalignedAccess = (io_cpu_writeBack_isValid && stageB_unaligned);
  assign io_cpu_writeBack_isWrite = stageB_request_wr;
  always @ (*) begin
    io_mem_cmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(_zz_15)begin
          io_mem_cmd_valid = (! memCmdSent);
        end else begin
          if(_zz_16)begin
            if(stageB_request_wr)begin
              io_mem_cmd_valid = 1'b1;
            end
          end else begin
            if((! memCmdSent))begin
              io_mem_cmd_valid = 1'b1;
            end
          end
        end
      end
    end
    if(_zz_13)begin
      io_mem_cmd_valid = 1'b0;
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],2'b00};
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_15) begin
          if(_zz_16)begin
            io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],2'b00};
          end else begin
            io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 5],5'h0};
          end
        end
      end
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_length = 3'b000;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_15) begin
          if(_zz_16)begin
            io_mem_cmd_payload_length = 3'b000;
          end else begin
            io_mem_cmd_payload_length = 3'b111;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_last = 1'b1;
  always @ (*) begin
    io_mem_cmd_payload_wr = stageB_request_wr;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_isExternalAmo) begin
        if(! _zz_15) begin
          if(! _zz_16) begin
            io_mem_cmd_payload_wr = 1'b0;
          end
        end
      end
    end
  end

  assign io_mem_cmd_payload_mask = stageB_mask;
  assign io_mem_cmd_payload_data = stageB_requestDataBypass;
  assign io_mem_cmd_payload_uncached = stageB_mmuRsp_isIoAccess;
  assign stageB_bypassCache = ((stageB_mmuRsp_isIoAccess || stageB_isExternalLsrc) || stageB_isExternalAmo);
  assign io_cpu_writeBack_keepMemRspData = 1'b0;
  always @ (*) begin
    if(stageB_bypassCache)begin
      io_cpu_writeBack_data = stageB_ioMemRspMuxed;
    end else begin
      io_cpu_writeBack_data = stageB_dataMux;
    end
  end

  assign _zz_9[0] = stageB_tagsReadRsp_0_error;
  always @ (*) begin
    loader_counter_willIncrement = 1'b0;
    if(_zz_14)begin
      loader_counter_willIncrement = 1'b1;
    end
  end

  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == 3'b111);
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @ (*) begin
    loader_counter_valueNext = (loader_counter_value + _zz_25);
    if(loader_counter_willClear)begin
      loader_counter_valueNext = 3'b000;
    end
  end

  assign loader_kill = 1'b0;
  assign loader_done = loader_counter_willOverflow;
  assign io_cpu_execute_refilling = loader_valid;
  always @ (posedge clk) begin
    tagsWriteLastCmd_valid <= tagsWriteCmd_valid;
    tagsWriteLastCmd_payload_way <= tagsWriteCmd_payload_way;
    tagsWriteLastCmd_payload_address <= tagsWriteCmd_payload_address;
    tagsWriteLastCmd_payload_data_valid <= tagsWriteCmd_payload_data_valid;
    tagsWriteLastCmd_payload_data_error <= tagsWriteCmd_payload_data_error;
    tagsWriteLastCmd_payload_data_address <= tagsWriteCmd_payload_data_address;
    if((! io_cpu_memory_isStuck))begin
      stageA_request_wr <= io_cpu_execute_args_wr;
      stageA_request_data <= io_cpu_execute_args_data;
      stageA_request_size <= io_cpu_execute_args_size;
      stageA_request_totalyConsistent <= io_cpu_execute_args_totalyConsistent;
    end
    if((! io_cpu_memory_isStuck))begin
      stageA_mask <= stage0_mask;
    end
    if((! io_cpu_memory_isStuck))begin
      stageA_wayInvalidate <= stage0_wayInvalidate;
    end
    if((! io_cpu_memory_isStuck))begin
      stage0_dataColisions_regNextWhen <= stage0_dataColisions;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_request_wr <= stageA_request_wr;
      stageB_request_data <= stageA_request_data;
      stageB_request_size <= stageA_request_size;
      stageB_request_totalyConsistent <= stageA_request_totalyConsistent;
    end
    if(((! io_cpu_writeBack_isStuck) && (! stageB_mmuRspFreeze)))begin
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
      stageB_mmuRsp_ways_4_sel <= io_cpu_memory_mmuRsp_ways_4_sel;
      stageB_mmuRsp_ways_4_physical <= io_cpu_memory_mmuRsp_ways_4_physical;
      stageB_mmuRsp_ways_5_sel <= io_cpu_memory_mmuRsp_ways_5_sel;
      stageB_mmuRsp_ways_5_physical <= io_cpu_memory_mmuRsp_ways_5_physical;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_tagsReadRsp_0_valid <= ways_0_tagsReadRsp_valid;
      stageB_tagsReadRsp_0_error <= ways_0_tagsReadRsp_error;
      stageB_tagsReadRsp_0_address <= ways_0_tagsReadRsp_address;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_dataReadRsp_0 <= ways_0_dataReadRsp;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_wayInvalidate <= stageA_wayInvalidate;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_dataColisions <= stageA_dataColisions;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_unaligned <= (((stageA_request_size == 2'b10) && (io_cpu_memory_address[1 : 0] != 2'b00)) || ((stageA_request_size == 2'b01) && (io_cpu_memory_address[0 : 0] != 1'b0)));
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_waysHitsBeforeInvalidate <= stageA_wayHits;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_mask <= stageA_mask;
    end
    if(stageB_flusher_valid)begin
      if(_zz_17)begin
        if(_zz_18)begin
          stageB_mmuRsp_physicalAddress[11 : 5] <= (stageB_mmuRsp_physicalAddress[11 : 5] + 7'h01);
        end
      end
    end
    if(stageB_flusher_start)begin
      stageB_mmuRsp_physicalAddress[11 : 5] <= 7'h0;
    end
    loader_valid_regNext <= loader_valid;
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      memCmdSent <= 1'b0;
      stageB_flusher_valid <= 1'b0;
      stageB_flusher_start <= 1'b1;
      loader_valid <= 1'b0;
      loader_counter_value <= 3'b000;
      loader_waysAllocator <= 1'b1;
      loader_error <= 1'b0;
      loader_killReg <= 1'b0;
    end else begin
      if(io_mem_cmd_ready)begin
        memCmdSent <= 1'b1;
      end
      if((! io_cpu_writeBack_isStuck))begin
        memCmdSent <= 1'b0;
      end
      if(stageB_flusher_valid)begin
        if(_zz_17)begin
          if(! _zz_18) begin
            stageB_flusher_valid <= 1'b0;
          end
        end
      end
      stageB_flusher_start <= ((((((! stageB_flusher_start) && io_cpu_flush_valid) && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
      if(stageB_flusher_start)begin
        stageB_flusher_valid <= 1'b1;
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck)));
        `else
          if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))) begin
            $display("FAILURE writeBack stuck by another plugin is not allowed");
            $finish;
          end
        `endif
      `endif
      if(stageB_loaderValid)begin
        loader_valid <= 1'b1;
      end
      loader_counter_value <= loader_counter_valueNext;
      if(loader_kill)begin
        loader_killReg <= 1'b1;
      end
      if(_zz_14)begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_done)begin
        loader_valid <= 1'b0;
        loader_error <= 1'b0;
        loader_killReg <= 1'b0;
      end
      if((! loader_valid))begin
        loader_waysAllocator <= _zz_26[0:0];
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
  input      [2:0]    _zz_10,
  input      [31:0]   _zz_11,
  input               clk,
  input               reset
);
  reg        [31:0]   _zz_12;
  reg        [21:0]   _zz_13;
  wire                _zz_14;
  wire                _zz_15;
  wire       [0:0]    _zz_16;
  wire       [0:0]    _zz_17;
  wire       [21:0]   _zz_18;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 lineLoader_fire;
  reg                 lineLoader_valid;
  (* keep , syn_keep *) reg        [31:0]   lineLoader_address /* synthesis syn_keep = 1 */ ;
  reg                 lineLoader_hadError;
  reg                 lineLoader_flushPending;
  reg        [7:0]    lineLoader_flushCounter;
  reg                 _zz_3;
  reg                 lineLoader_cmdSent;
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
  wire       [9:0]    _zz_4;
  wire                _zz_5;
  wire       [31:0]   fetchStage_read_banksValue_0_dataMem;
  wire       [31:0]   fetchStage_read_banksValue_0_data;
  wire       [6:0]    _zz_6;
  wire                _zz_7;
  wire                fetchStage_read_waysValues_0_tag_valid;
  wire                fetchStage_read_waysValues_0_tag_error;
  wire       [19:0]   fetchStage_read_waysValues_0_tag_address;
  wire       [21:0]   _zz_8;
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
  reg                 decodeStage_hit_tags_0_valid;
  reg                 decodeStage_hit_tags_0_error;
  reg        [19:0]   decodeStage_hit_tags_0_address;
  wire                decodeStage_hit_hits_0;
  wire                decodeStage_hit_valid;
  reg        [31:0]   _zz_9;
  wire       [31:0]   decodeStage_hit_data;
  reg [31:0] banks_0 [0:1023];
  reg [21:0] ways_0_tags [0:127];

  assign _zz_14 = (! lineLoader_flushCounter[7]);
  assign _zz_15 = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign _zz_16 = _zz_8[0 : 0];
  assign _zz_17 = _zz_8[1 : 1];
  assign _zz_18 = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_1) begin
      banks_0[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_5) begin
      _zz_12 <= banks_0[_zz_4];
    end
  end

  always @ (posedge clk) begin
    if(_zz_2) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_18;
    end
  end

  always @ (posedge clk) begin
    if(_zz_7) begin
      _zz_13 <= ways_0_tags[_zz_6];
    end
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if(lineLoader_write_data_0_valid)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2 = 1'b0;
    if(lineLoader_write_tag_0_valid)begin
      _zz_2 = 1'b1;
    end
  end

  always @ (*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid)begin
      if((lineLoader_wordIndex == 3'b111))begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @ (*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(_zz_14)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if((! _zz_3))begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 5],5'h0};
  assign io_mem_cmd_payload_size = 3'b101;
  always @ (*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if((! lineLoader_valid))begin
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
  assign _zz_4 = io_cpu_prefetch_pc[11 : 2];
  assign _zz_5 = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_banksValue_0_dataMem = _zz_12;
  assign fetchStage_read_banksValue_0_data = fetchStage_read_banksValue_0_dataMem[31 : 0];
  assign _zz_6 = io_cpu_prefetch_pc[11 : 5];
  assign _zz_7 = (! io_cpu_fetch_isStuck);
  assign _zz_8 = _zz_13;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_16[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_17[0];
  assign fetchStage_read_waysValues_0_tag_address = _zz_8[21 : 2];
  assign io_cpu_fetch_data = fetchStage_read_banksValue_0_data;
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuRsp_physicalAddress;
  assign decodeStage_hit_hits_0 = (decodeStage_hit_tags_0_valid && (decodeStage_hit_tags_0_address == decodeStage_mmuRsp_physicalAddress[31 : 12]));
  assign decodeStage_hit_valid = (decodeStage_hit_hits_0 != 1'b0);
  assign decodeStage_hit_data = _zz_9;
  assign io_cpu_decode_data = decodeStage_hit_data;
  assign io_cpu_decode_cacheMiss = (! decodeStage_hit_valid);
  assign io_cpu_decode_error = (decodeStage_hit_tags_0_error || ((! decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute))));
  assign io_cpu_decode_mmuRefilling = decodeStage_mmuRsp_refilling;
  assign io_cpu_decode_mmuException = (((! decodeStage_mmuRsp_refilling) && decodeStage_mmuRsp_isPaging) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute)));
  assign io_cpu_decode_physicalAddress = decodeStage_mmuRsp_physicalAddress;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
      lineLoader_wordIndex <= 3'b000;
    end else begin
      if(lineLoader_fire)begin
        lineLoader_valid <= 1'b0;
      end
      if(lineLoader_fire)begin
        lineLoader_hadError <= 1'b0;
      end
      if(io_cpu_fill_valid)begin
        lineLoader_valid <= 1'b1;
      end
      if(io_flush)begin
        lineLoader_flushPending <= 1'b1;
      end
      if(_zz_15)begin
        lineLoader_flushPending <= 1'b0;
      end
      if((io_mem_cmd_valid && io_mem_cmd_ready))begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire)begin
        lineLoader_cmdSent <= 1'b0;
      end
      if(io_mem_rsp_valid)begin
        lineLoader_wordIndex <= (lineLoader_wordIndex + 3'b001);
        if(io_mem_rsp_payload_error)begin
          lineLoader_hadError <= 1'b1;
        end
      end
    end
  end

  always @ (posedge clk) begin
    if(io_cpu_fill_valid)begin
      lineLoader_address <= io_cpu_fill_payload;
    end
    if(_zz_14)begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + 8'h01);
    end
    _zz_3 <= lineLoader_flushCounter[7];
    if(_zz_15)begin
      lineLoader_flushCounter <= 8'h0;
    end
    if((! io_cpu_decode_isStuck))begin
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
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_tags_0_valid <= fetchStage_read_waysValues_0_tag_valid;
      decodeStage_hit_tags_0_error <= fetchStage_read_waysValues_0_tag_error;
      decodeStage_hit_tags_0_address <= fetchStage_read_waysValues_0_tag_address;
    end
    if((! io_cpu_decode_isStuck))begin
      _zz_9 <= fetchStage_read_banksValue_0_data;
    end
    if((_zz_10 != 3'b000))begin
      _zz_9 <= _zz_11;
    end
  end


endmodule
