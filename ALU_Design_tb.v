module ALU_Design_tb();

reg [11:0] Datain;
reg reset;
reg clk;

wire [7:0] Y;

ALU_Design ALU(
	Y,
	Datain,
	reset,
	clk
);

initial begin
	Datain = 12'b010001010010;
	
	clk = 1;
	reset = 0;
end

always #2 clk=~clk;

initial begin

	#50 Datain = 12'b010001010011;
	
	#50 Datain = 12'b010001010001;
end

endmodule
