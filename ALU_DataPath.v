module ALU_DataPath(
	Y, 
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

output wire [7:0]	Y;
input wire [11:0] Datain;
input wire	ldA;
input wire	ldB;
input wire	aCmp;
input wire	aAdd;
input wire	aSub;
input wire	aDiv;
input wire	aMul;
input wire	clk;

wire [3:0] A;
wire [3:0] B;

wire [7:0] M, N , O, P, Q;

LdA lda(A, Datain, ldA, clk);
LdB ldb(B, Datain, ldB, clk);
CMP cmp(M, A, B, aCmp);
ADD add(N, A, B, aAdd);
SUB sub(O, A, B, aSub);
DIV div(P, A, B, aDiv);
MUL mul(Q, A, B, aMul);
RST rst(Y, M, N, O , P, Q, aCmp,aAdd,aSub,aDiv,aMul,clk);


endmodule
