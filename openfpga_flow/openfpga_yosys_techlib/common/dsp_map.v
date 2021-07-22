//-----------------------------
// 9-bit multiplier
//-----------------------------
module mult_9x9 (
  input [0:8] A,
  input [0:8] B,
  output [0:17] Y
);
  parameter A_SIGNED = 0;
  parameter B_SIGNED = 0;
  parameter A_WIDTH = 0;
  parameter B_WIDTH = 0;
  parameter Y_WIDTH = 0;

  mult_9 #() _TECHMAP_REPLACE_ (
    .A    (A),
    .B    (B),
    .Y    (Y) );

endmodule

//-----------------------------
// 18-bit multiplier
//-----------------------------
module mult_18x18 (
  input [0:17] A,
  input [0:17] B,
  output [0:35] Y
);
  parameter A_SIGNED = 0;
  parameter B_SIGNED = 0;
  parameter A_WIDTH = 0;
  parameter B_WIDTH = 0;
  parameter Y_WIDTH = 0;

  mult_18 #() _TECHMAP_REPLACE_ (
    .A    (A),
    .B    (B),
    .Y    (Y) );

endmodule
