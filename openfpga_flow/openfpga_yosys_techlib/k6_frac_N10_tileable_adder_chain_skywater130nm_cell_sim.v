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
