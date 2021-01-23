module CMP(
	Y,
	A,
	B,
	aCmp
);

output reg [7:0] Y;
input wire [3:0] A;
input wire [3:0] B;
input wire aCmp;
	
always @(aCmp) begin
	if(aCmp) begin
		if(A<B)
			Y = 8'b00000001;
		else if(A>B)
			Y = 8'b00000010;
		else
			Y = 8'b00000000;
	end
	else
		Y = 8'bzzzzzzzz;
		
end	

endmodule 