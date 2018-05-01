`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:15:01 04/26/2018 
// Design Name: 
// Module Name:    CLA32Bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CLA32Bit(
		input [31:0] A,
		input [31:0] B,
		input Cin,
		output [31:0] S,
		output Cout
    );

wire [31:0] level1G;
wire [31:0] level1P;
wire [31:0] level2G;
wire [31:0] level2P;
wire [31:0] level3G;
wire [31:0] level3P;
wire [31:0] level4G;
wire [31:0] level4P;
wire [31:0] level5G;
wire [31:0] level5P;
wire [31:0] level6G;
wire [31:0] level6P;
wire [31:0] level7G;
wire [31:0] level7P;
wire [31:0] level8G;
wire [31:0] level8P;
wire [31:0] level9G;
wire [31:0] level9P;
wire [31:0] level10G;
wire [31:0] level10P;
wire [31:0] level11G;
wire [31:0] level11P;
wire [31:0] level12G;
wire [31:0] level12P;

// level 1 start
genvar i;
assign level1G[0] = Cin;	// by definition to include carry in
assign level1P[0] = 0;		// by definition to include carry in
generate
	for(i=1;i<32;i=i+1) begin
		BitwiseG G(A[i], B[i], level1G[i]);
		BitwiseP P(A[i], B[i], level1P[i]);
	end
endgenerate
// level 1 end

// level 2 start
generate
	for(i=0;i<32;i=i+1) begin
		if ((i%4 == 0)&&(i!=0)) begin
			Valency4BlackDot v4bd(level1G[i],level1P[i],level1G[i-1],level1P[i-1],level1G[i-2],level1P[i-2],level1G[i-3],level1P[i-3],level2G[i],level2P[i]);
		end
		else begin
			assign level2G[i] = level1G[i];
			assign level2P[i] = level1P[i];
		end
	end
endgenerate
// level 2 end

// level 3 start
for(i=0;i<32;i=i+1) begin
	if((i!=1)&&(i!=4)) begin
		assign level3G[i] = level2G[i];
		assign level3P[i] = level2P[i];
	end
end
GrayCell GrayCell30(level2G[1],level2P[1],level2G[0],level3G[1]);
GrayCell GrayCell31(level2G[4],level2P[4],level2G[0],level3G[4]);
// level 3 end

// level 4 start
for(i=0;i<32;i=i+1) begin
	if((i!=2)&&(i!=5)&&(i!=8)) begin
		assign level4G[i] = level3G[i];
		assign level4P[i] = level3P[i];
	end
end
GrayCell GrayCell40(level3G[2],level3P[2],level3G[1],level4G[2]);
GrayCell GrayCell41(level3G[5],level3P[5],level3G[4],level4G[5]);
GrayCell GrayCell42(level3G[8],level3P[8],level3G[4],level4G[8]);
// level 4 end

// level 5 start
for(i=0;i<32;i=i+1) begin
	if((i!=3)&&(i!=6)&&(i!=9)&&(i!=12)) begin
		assign level5G[i] = level4G[i];
		assign level5P[i] = level4P[i];
	end
end
GrayCell GrayCell50(level4G[3],level4P[3],level4G[2],level5G[3]);
GrayCell GrayCell51(level4G[6],level4P[6],level4G[5],level5G[6]);
GrayCell GrayCell52(level4G[9],level4P[9],level4G[8],level5G[9]);
GrayCell GrayCell53(level4G[12],level4P[12],level4G[8],level5G[12]);
// level 5 end

// level 6 start
for(i=0;i<32;i=i+1) begin
	if((i!=7)&&(i!=10)&&(i!=13)&&(i!=16)) begin
		assign level6G[i] = level5G[i];
		assign level6P[i] = level5P[i];
	end
end
GrayCell GrayCell60(level5G[7],level5P[7],level5G[6],level6G[7]);
GrayCell GrayCell61(level5G[10],level5P[10],level5G[9],level6G[10]);
GrayCell GrayCell62(level5G[13],level5P[13],level5G[12],level6G[13]);
GrayCell GrayCell63(level5G[16],level5P[16],level5G[12],level6G[16]);
// level 6 end

// level 7 start
for(i=0;i<32;i=i+1) begin
	if((i!=11)&&(i!=14)&&(i!=17)&&(i!=20)) begin
		assign level7G[i] = level6G[i];
		assign level7P[i] = level6P[i];
	end
end
GrayCell GrayCell70(level6G[11],level6P[11],level6G[10],level7G[11]);
GrayCell GrayCell71(level6G[14],level6P[14],level6G[13],level7G[14]);
GrayCell GrayCell72(level6G[17],level6P[17],level6G[16],level7G[17]);
GrayCell GrayCell73(level6G[20],level6P[20],level6G[16],level7G[20]);
// level 7 end

// level 8 start
for(i=0;i<32;i=i+1) begin
	if((i!=15)&&(i!=18)&&(i!=21)&&(i!=24)) begin
		assign level8G[i] = level7G[i];
		assign level8P[i] = level7P[i];
	end
end
GrayCell GrayCell80(level7G[15],level7P[15],level7G[14],level8G[15]);
GrayCell GrayCell81(level7G[18],level7P[18],level7G[17],level8G[18]);
GrayCell GrayCell82(level7G[21],level7P[21],level7G[20],level8G[21]);
GrayCell GrayCell83(level7G[24],level7P[24],level7G[20],level8G[24]);
// level 8 end

// level 9 start
for(i=0;i<32;i=i+1) begin
	if((i!=19)&&(i!=22)&&(i!=25)&&(i!=28)) begin
		assign level9G[i] = level8G[i];
		assign level9P[i] = level8P[i];
	end
end
GrayCell GrayCell90(level8G[19],level8P[19],level8G[18],level9G[19]);
GrayCell GrayCell91(level8G[22],level8P[22],level8G[21],level9G[22]);
GrayCell GrayCell92(level8G[25],level8P[25],level8G[24],level9G[25]);
GrayCell GrayCell93(level8G[28],level8P[28],level8G[24],level9G[28]);
// level 9 end

// level 10 start
for(i=0;i<32;i=i+1) begin
	if((i!=23)&&(i!=26)&&(i!=29)) begin
		assign level10G[i] = level9G[i];
		assign level10P[i] = level9P[i];
	end
end
GrayCell GrayCell100(level9G[23],level9P[23],level9G[22],level10G[23]);
GrayCell GrayCell101(level9G[26],level9P[26],level9G[25],level10G[26]);
GrayCell GrayCell102(level9G[29],level9P[29],level9G[28],level10G[29]);
// level 10 end

// level 11 start
for(i=0;i<32;i=i+1) begin
	if((i!=27)&&(i!=30)) begin
		assign level11G[i] = level10G[i];
		assign level11P[i] = level10P[i];
	end
end
GrayCell GrayCell110(level10G[27],level10P[27],level10G[26],level11G[27]);
GrayCell GrayCell111(level10G[30],level10P[30],level10G[29],level11G[30]);
// level 11 end

// level 12 start
for(i=0;i<32;i=i+1) begin
	if((i!=31)) begin
		assign level12G[i] = level11G[i];
		assign level12P[i] = level11P[i];
	end
end
GrayCell GrayCell120(level11G[31],level11P[31],level11G[30],level12G[31]);
// level 12 end

// sum start
generate
	xor #0.1 XPS1(S[0],level1P[1],level1G[0]);
	for(i=1;i<32;i=i+1) begin
		SumGen SG(level1P[i],level12G[i-1],S[i]);
	end
endgenerate
assign Cout=level12G[31];
// sum end

endmodule
