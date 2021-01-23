module ALU_Control(
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

output reg ldA;
output reg ldB;
output reg aCmp;
output reg aAdd;
output reg aSub;
output reg aDiv;
output reg aMul;
input wire [11:0] Datain;
input wire reset;
input wire clk;

parameter LOAD=3'b000, CMP1=3'b001, CMP=3'b010, ADD=3'b011, SUB=3'b100, DIV=3'b101, MUL=3'b110;


reg [2:0] state;
reg [2:0] nextstate= LOAD;
reg [3:0] opcode;


always @(posedge clk or negedge reset) begin

	opcode <= Datain[3:0];

	if(!reset)
			state <= LOAD;
	else
		state <= nextstate;

end

always @(state) begin
	case(state)
	
		LOAD: begin ldA =1'b1; ldB=1'b1; aCmp=1'b0; aAdd=1'b0; aSub=1'b0; aDiv=1'b0; aMul=1'b0; nextstate=CMP1; end
		
		CMP1: begin 
			ldA =1'b0; ldB=1'b0; aCmp=1'b0; aAdd=1'b0; aSub=1'b0; aDiv=1'b0; aMul=1'b0;
			case(opcode)
				4'b0001: nextstate=CMP;
				4'b0010: nextstate=ADD;
				4'b0011: nextstate=SUB;
				4'b0100: nextstate=DIV;
				4'b0101: nextstate=MUL;
				default: nextstate=LOAD;
			endcase		
		end
		
		CMP: begin ldA =1'b0; ldB=1'b0; aCmp=1'b1; aAdd=1'b0; aSub=1'b0; aDiv=1'b0; aMul=1'b0; nextstate=LOAD; end
		
		ADD: begin ldA =1'b0; ldB=1'b0; aCmp=1'b0; aAdd=1'b1; aSub=1'b0; aDiv=1'b0; aMul=1'b0; nextstate=LOAD;end
		
		SUB: begin ldA =1'b0; ldB=1'b0; aCmp=1'b0; aAdd=1'b0; aSub=1'b1; aDiv=1'b0; aMul=1'b0; nextstate=LOAD;end
		
		DIV: begin ldA =1'b0; ldB=1'b0; aCmp=1'b0; aAdd=1'b0; aSub=1'b0; aDiv=1'b1; aMul=1'b0; nextstate=LOAD;end
		
		MUL: begin ldA =1'b0; ldB=1'b0; aCmp=1'b0; aAdd=1'b0; aSub=1'b0; aDiv=1'b0; aMul=1'b1; nextstate=LOAD; end
		
		default: begin ldA =1'b0; ldB=1'b0; aCmp=1'b0; aAdd=1'b0; aSub=1'b0; aDiv=1'b0; aMul=1'b0; nextstate=LOAD;end
	
	endcase

end


endmodule
