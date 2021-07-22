module dpram (
	input clk,
	input wen,
	input ren,
	input[9:0] waddr,
	input[9:0] raddr,
	input[31:0] d_in,
	output[31:0] d_out );

		dual_port_sram memory_0 (
			.wclk		(clk),
			.wen		(wen),
			.waddr		(waddr),
			.data_in	(d_in),
			.rclk		(clk),
			.ren		(ren),
			.raddr		(raddr),
			.d_out		(d_out) );

endmodule

module dual_port_sram (
	input wclk,
	input wen,
	input[9:0] waddr,
	input[31:0] data_in,
	input rclk,
	input ren,
	input[9:0] raddr,
	output[31:0] d_out );

	reg[31:0] ram[1023:0];
	reg[31:0] internal;

	assign d_out = internal;

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


