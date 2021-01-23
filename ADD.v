module ADD(
	Y,
	A,
	B,
	aAdd
);

output wire [7:0] Y;
input wire [3:0] A;
input wire [3:0] B;
input wire aAdd;

assign Y = (aAdd)? A+B : 1'bz;

endmodule
