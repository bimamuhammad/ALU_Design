module LdA(
	A,
	Datain,
	ldA,
	clk
);

output reg [3:0] A;
input wire [11:0] Datain;
input wire ldA;
input wire clk;

always @(posedge clk) begin
	if(ldA)
		A <= Datain[11:8];
end

endmodule
