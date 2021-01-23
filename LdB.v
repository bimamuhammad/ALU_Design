module LdB(
	B,
	Datain,
	ldB,
	clk
);

output reg [3:0] B;
input wire [11:0] Datain;
input wire ldB;
input wire clk;

always @(posedge clk) begin
	if(ldB)
		B <= Datain[7:4];
end

endmodule