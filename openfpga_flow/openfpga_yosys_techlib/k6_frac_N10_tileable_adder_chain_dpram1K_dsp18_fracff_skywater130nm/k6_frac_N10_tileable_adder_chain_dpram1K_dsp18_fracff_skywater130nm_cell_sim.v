//-----------------------------
// Dual-port RAM 128x8 bit (1Kbit)
// Core logic
//-----------------------------
module dpram_128x8_core (
  input wclk,
  input wen,
  input [0:6] waddr,
  input [0:7] data_in,
  input rclk,
  input ren,
  input [0:6] raddr,
  output [0:7] data_out );

  reg [0:7] ram[0:127];
  reg [0:7] internal;

  assign data_out = internal;

  always @(posedge wclk) begin
    if(wen) begin
      ram[waddr] <= data_in;
    end
  end

  always @(posedge rclk) begin
    if(ren) begin
      internal <= ram[raddr];
    end
  end

endmodule

//-----------------------------
// Dual-port RAM 128x8 bit (1Kbit) wrapper
// where the read clock and write clock
// are combined to a unified clock
//-----------------------------
module dpram_128x8 (
  input clk,
  input wen,
  input ren,
  input [0:6] waddr,
  input [0:6] raddr,
  input [0:7] data_in,
  output [0:7] data_out );

    dpram_128x8_core memory_0 (
      .wclk    (clk),
      .wen    (wen),
      .waddr    (waddr),
      .data_in  (data_in),
      .rclk    (clk),
      .ren    (ren),
      .raddr    (raddr),
      .data_out    (data_out) );

endmodule

//-----------------------------
// 18-bit multiplier
//-----------------------------
module mult_18(
  input [0:17] A,
  input [0:17] B,
  output [0:35] Y
);

assign Y = A * B;

endmodule

//-----------------------------
// Native D-type flip-flop
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dff(
    output reg Q,
    input D,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                Q <= D;
          1'b1:
            always @(negedge C)
                Q <= D;
    endcase
endmodule

//-----------------------------
// D-type flip-flop with active-high asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffr(
    output reg Q,
    input D,
    input R,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// D-type flip-flop with active-high asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffs(
    output reg Q,
    input D,
    input S,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// D-type flip-flop with active-low asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffrn(
    output reg Q,
    input D,
    input RN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// D-type flip-flop with active-low asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffsn(
    output reg Q,
    input D,
    input SN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else
                        Q <= D;
    endcase
endmodule

