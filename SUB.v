module SUB(
	Y,
	A,
	B,
	aSub
);

output wire [7:0] Y;
input wire [3:0] A;
input wire [3:0] B;
input wire aSub;

assign Y = (aSub)? A-B : 1'bz;

endmodule
