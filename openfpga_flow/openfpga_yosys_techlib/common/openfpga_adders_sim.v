//---------------------------------------
// 1-bit adder 
//---------------------------------------
module adder(
	input cin,
	input a,
	input b,
	output cout,
	output sumout );


	assign sumout = a ^ b ^ cin;
	assign cout = (a & b) | ((a | b) & cin);

endmodule
