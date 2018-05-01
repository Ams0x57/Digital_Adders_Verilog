`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:23:59 04/25/2018 
// Design Name: 
// Module Name:    BrentKung32Bit 
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
module BrentKung32Bit(
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
	for(i=0;i<32;i=i+2) begin
		BUFFER Buff20(level1P[i],level1G[i],level2P[i],level2G[i]);
	end
endgenerate
GrayCell GrayCell20(level1G[1],level1P[1],level1G[0],level2G[1]);
generate
	for(i=3;i<32;i=i+2) begin
		BlackCell BC20(level1G[i],level1P[i],level1G[i-1],level1P[i-1],level2G[i],level2P[i]);
	end
endgenerate
// level 2 end

// level 3 start
for(i=0;i<32;i=i+2) begin
		assign level3P[i] = level2P[i];
		assign level3G[i] = level2G[i];
end
generate
	for(i=1;i<32;i=i+4) begin
		BUFFER Buff30(level2P[i],level2G[i],level3P[i],level3G[i]);
	end
endgenerate
GrayCell GrayCell30(level2G[3],level2P[3],level2G[1],level3G[3]);
generate
	for(i=7;i<32;i=i+4) begin
		BlackCell BC30(level2G[i],level2P[i],level2G[i-2],level2P[i-2],level3G[i],level3P[i]);
	end
endgenerate
// level 3 end

// level 4 start
for(i=0;i<32;i=i+1) begin
	if(((i+1)%4) != 0) begin
		assign level4P[i] = level3P[i];
		assign level4G[i] = level3G[i];
	end
end
generate
	for(i=3;i<32;i=i+8) begin
		BUFFER Buff40(level3P[i],level3G[i],level4P[i],level4G[i]);
	end
endgenerate
GrayCell GrayCell40(level3G[7],level3P[7],level3G[3],level4G[7]);
generate
	for(i=15;i<32;i=i+8) begin
		BlackCell BC40(level3G[i],level3P[i],level3G[i-4],level3P[i-4],level4G[i],level4P[i]);
	end
endgenerate
// level 4 end

// level 5 start
for(i=0;i<32;i=i+1) begin
	if((i+1)%8 != 0) begin
		assign level5P[i] = level4P[i];
		assign level5G[i] = level4G[i];
	end
end
generate
	for(i=7;i<32;i=i+16) begin
		BUFFER Buff(level4P[i],level4G[i],level5P[i],level5G[i]);
	end
endgenerate
GrayCell GrayCell50(level4G[15],level4P[15],level4G[7],level5G[15]);
BlackCell BC50(level4G[31],level4P[31],level4G[23],level4P[23],level5G[31],level5P[31]);
// level 5 end

// level 6 start
for(i=0;i<32;i=i+1) begin
	if((i+1)%16 != 0) begin
		assign level6P[i] = level5P[i];
		assign level6G[i] = level5G[i];
	end
end
BUFFER Buff60(level5P[15],level5G[15],level6P[15],level6G[15]);
GrayCell GrayCell60(level5G[31],level5P[31],level5G[15],level6G[31]);
// level 6 end

// level 7 start
for(i=0;i<32;i=i+1) begin
	if((i != 23)&&(i != 31)) begin
		assign level7P[i] = level6P[i];
		assign level7G[i] = level6G[i];
	end
end
GrayCell GrayCell70(level6G[23],level6P[23],level6G[15],level7G[23]);
BUFFER Buff70(level6P[31],level6G[31],level7P[31],level7G[31]);
// level 7 end

// level 8 start
for(i=0;i<32;i=i+1) begin
	if((i != 11)&&(i != 19)&&(i != 23)&&(i != 27)) begin
		assign level8P[i] = level7P[i];
		assign level8G[i] = level7G[i];
	end
end
GrayCell GrayCell80(level7G[11],level7P[11],level7G[7],level8G[11]);
GrayCell GrayCell81(level7G[19],level7P[19],level7G[15],level8G[19]);
GrayCell GrayCell82(level7G[27],level7P[27],level7G[23],level8G[27]);
BUFFER Buff80(level7P[23],level7G[23],level8P[23],level8G[23]);
// level 8 end

// level 9 start
assign level9P[0] = level8P[0];
assign level9G[0] = level8G[0];
assign level9P[1] = level8P[1];
assign level9G[1] = level8G[1];
assign level9P[2] = level8P[2];
assign level9G[2] = level8G[2];
assign level9P[3] = level8P[3];
assign level9G[3] = level8G[3];
assign level9P[4] = level8P[4];
assign level9G[4] = level8G[4];
assign level9P[6] = level8P[6];
assign level9G[6] = level8G[6];
assign level9P[7] = level8P[7];
assign level9G[7] = level8G[7];
assign level9P[8] = level8P[8];
assign level9G[8] = level8G[8];
assign level9P[10] = level8P[10];
assign level9G[10] = level8G[10];
assign level9P[12] = level8P[12];
assign level9G[12] = level8G[12];
assign level9P[14] = level8P[14];
assign level9G[14] = level8G[14];
assign level9P[15] = level8P[15];
assign level9G[15] = level8G[15];
assign level9P[16] = level8P[16];
assign level9G[16] = level8G[16];
assign level9P[18] = level8P[18];
assign level9G[18] = level8G[18];
assign level9P[20] = level8P[20];
assign level9G[20] = level8G[20];
assign level9P[22] = level8P[22];
assign level9G[22] = level8G[22];
assign level9P[23] = level8P[23];
assign level9G[23] = level8G[23];
assign level9P[24] = level8P[24];
assign level9G[24] = level8G[24];
assign level9P[26] = level8P[26];
assign level9G[26] = level8G[26];
assign level9P[28] = level8P[28];
assign level9G[28] = level8G[28];
assign level9P[30] = level8P[30];
assign level9G[30] = level8G[30];
assign level9P[31] = level8P[31];
assign level9G[31] = level8G[31];
generate
	for(i=5;i<32;i=i+4) begin
		GrayCell GrayCell90(level8G[i],level8P[i],level8G[i-2],level9G[i]);
	end
endgenerate
BUFFER Buff90(level8P[11],level8G[11],level9P[11],level9G[11]);
BUFFER Buff91(level8P[19],level8G[19],level9P[19],level9G[19]);
BUFFER Buff92(level8P[27],level8G[27],level9P[27],level9G[27]);
// level 9 end

// level 10 start
assign level10P[0] = level9P[0];
assign level10G[0] = level9G[0];
assign level10P[1] = level9P[1];
assign level10G[1] = level9G[1];
for(i=3;i<32;i=i+4) begin
	assign level10P[i] = level9P[i];
	assign level10G[i] = level9G[i];
end
generate
	for(i=2;i<32;i=i+2) begin
		GrayCell GrayCell100(level9G[i],level9P[i],level9G[i-1],level10G[i]);
	end
endgenerate
generate
	for(i=5;i<32;i=i+4) begin
		BUFFER Buff10(level9P[i],level9G[i],level10P[i],level10G[i]);
	end
endgenerate
// level 10 end

// sum start
generate
	xor #1 XPS1(S[0],level1P[1],level1G[0]);
	for(i=1;i<32;i=i+1) begin
		SumGen SG(level1P[i],level10G[i-1],S[i]);
	end
endgenerate
assign Cout=level10G[31];
// sum end

endmodule
