module $__MY_DPRAM (
	output[31:0] B1DATA,
	input CLK1,
	input[9:0] B1ADDR,
	input[9:0] A1ADDR,
	input[31:0] A1DATA,
	input A1EN,
	input B1EN );

	generate
		dpram #() _TECHMAP_REPLACE_ (
			.clk		(CLK1),
			.wen		(A1EN),
			.waddr		(A1ADDR),
			.d_in		(A1DATA),
			.ren		(B1EN),
			.raddr		(B1ADDR),
			.d_out		(B1DATA) );
	endgenerate

endmodule



module $__MY_SPRAM (
	output[31:0] B1DATA,
	input CLK1,
	input[9:0] B1ADDR,
	input[9:0] A1ADDR,
	input[31:0] A1DATA,
	input A1EN );

	generate
		dpram #() _TECHMAP_REPLACE_ (
			.clk		(CLK1),
			.wen		(A1EN),
			.waddr		(A1ADDR),
			.d_in		(A1DATA),
			.ren		(1'b1),
			.raddr		(A1ADDR),
			.d_out		(B1DATA) );
	endgenerate

endmodule
