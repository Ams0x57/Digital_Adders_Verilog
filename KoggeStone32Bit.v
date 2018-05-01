`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:16:16 04/26/2018 
// Design Name: 
// Module Name:    KoggeStone32Bit 
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
module KoggeStone32Bit(
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
BUFFER Buff20(level1P[0],level1G[0],level2P[0],level2G[0]);
GrayCell GrayCell20(level1G[1],level1P[1],level1G[0],level2G[1]);
generate
	for(i=2;i<32;i=i+1) begin
		BlackCell BC20(level1G[i],level1P[i],level1G[i-1],level1P[i-1],level2G[i],level2P[i]);
	end
endgenerate
// level 2 end

// level 3 start
assign level3P[0] = level2P[0];
assign level3G[0] = level2G[0];
BUFFER Buff30(level2P[1],level2G[1],level3P[1],level3G[1]);
GrayCell GrayCell30(level2G[2],level2P[2],level2G[0],level3G[2]);
GrayCell GrayCell31(level2G[3],level2P[3],level2G[1],level3G[3]);
generate
	for(i=4;i<32;i=i+1) begin
		BlackCell BC30(level2G[i],level2P[i],level2G[i-2],level2P[i-2],level3G[i],level3P[i]);
	end
endgenerate
// level 3 end

// level 4 start
assign level4P[0] = level3P[0];
assign level4G[0] = level3G[0];
assign level4P[1] = level3P[1];
assign level4G[1] = level3G[1];
BUFFER Buff40(level3P[2],level3G[2],level4P[2],level4G[2]);
BUFFER Buff41(level3P[3],level3G[3],level4P[3],level4G[3]);
GrayCell GrayCell40(level3G[4],level3P[4],level3G[0],level4G[4]);
GrayCell GrayCell41(level3G[5],level3P[5],level3G[1],level4G[5]);
GrayCell GrayCell42(level3G[6],level3P[6],level3G[2],level4G[6]);
GrayCell GrayCell43(level3G[7],level3P[7],level3G[3],level4G[7]);
generate
	for(i=8;i<32;i=i+1) begin
		BlackCell BC40(level3G[i],level3P[i],level3G[i-4],level3P[i-4],level4G[i],level4P[i]);
	end
endgenerate
// level 4 end

// level 5 start
generate
	for(i=0;i<4;i=i+1) begin
		assign level5P[i] = level4P[i];
		assign level5G[i] = level4G[i];
	end
endgenerate
generate
	for(i=4;i<8;i=i+1) begin
		BUFFER Buff50(level4P[i],level4G[i],level5P[i],level5G[i]);
	end
endgenerate
generate
	for(i=8;i<16;i=i+1) begin
		GrayCell GrayCell50(level4G[i],level4P[i],level4G[i-8],level5G[i]);
	end
endgenerate
generate
	for(i=16;i<32;i=i+1) begin
		BlackCell BC50(level4G[i],level4P[i],level4G[i-8],level4P[i-8],level5G[i],level5P[i]);
	end
endgenerate
// level 5 end


// level 6 start
generate
	for(i=0;i<8;i=i+1) begin
		assign level6P[i] = level5P[i];
		assign level6G[i] = level5G[i];
	end
endgenerate
generate
	for(i=8;i<16;i=i+1) begin
		BUFFER Buff60(level5P[i],level5G[i],level6P[i],level6G[i]);
	end
endgenerate
generate
	for(i=16;i<32;i=i+1) begin
		GrayCell GrayCell60(level5G[i],level5P[i],level6G[i-16],level6G[i]);
	end
endgenerate
// level 6 end

// sum start
generate
	xor #0.1 XPS1(S[0],level1P[1],level1G[0]);
	for(i=1;i<32;i=i+1) begin
		SumGen SG(level1P[i],level6G[i-1],S[i]);
	end
endgenerate
assign Cout=level6G[31];
// sum end

endmodule
