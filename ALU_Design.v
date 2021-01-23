module ALU_Design(
	LEDR,
	//Datain,
	reset,
	clk
);


output wire[7:0] LEDR;
//input wire [11:0] Datain;
input wire reset;
input wire clk;


reg [11:0] Datain = 12'b010001010010;
wire ldA;
wire ldB;
wire aCmp;
wire aAdd;
wire aSub;
wire aDiv;
wire aMul;

ALU_Control ALU_C( 
	ldA,
	ldB,
	aCmp,
	aAdd,
	aSub,
	aDiv,
	aMul,
	Datain,
	reset,
	clk
);

ALU_DataPath ALU_D(
	LEDR, 
	Datain,
	ldA,
	ldB,
	aCmp,
	aAdd,
	aSub,
	aDiv,
	aMul,
	clk
);



endmodule
