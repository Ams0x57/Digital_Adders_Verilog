`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:18 04/25/2018 
// Design Name: 
// Module Name:    Sklansky32Bit 
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
module Sklansky32Bit(
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

wire [31:0] carry;

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
		if(i%2 == 0) begin
			BUFFER Buff(level1P[i],level1G[i],level2P[i],level2G[i]);
		end
	end
endgenerate
GrayCell GrayCellLVL20(level1G[1],level1P[1],level1G[0],level2G[1]);
generate
	for(i=3;i<32;i=i+2) begin
		BlackCell BC(level1G[i],level1P[i],level1G[i-1],level1P[i-1],level2G[i],level2P[i]);
	end
endgenerate
// level 2 end

// level 3 start
generate
	for(i=1;i<32;i=i+4) begin
		BUFFER Buff(level2P[i],level2G[i],level3P[i],level3G[i]);
	end
endgenerate
GrayCell GrayCellLVL30(level2G[2],level2P[2],level2G[1],level3G[2]);
GrayCell GrayCellLVL31(level2G[3],level2P[3],level2G[1],level3G[3]);
generate
	for(i=6;i<32;i=i+4) begin
		BlackCell BC0(level2G[i],level2P[i],level2G[i-1],level2P[i-1],level3G[i],level3P[i]);
		if ((i+1)<=31) begin
			BlackCell BC1(level2G[i+1],level2P[i+1],level2G[i-1],level2P[i-1],level3G[i+1],level3P[i+1]);
		end
	end
endgenerate
for(i=0;i<32;i=i+4) begin
	assign level3P[i] = level2P[i];
	assign level3G[i] = level2G[i];
end
// level 3 end

// level 4 start
generate
	for(i=2;i<32;i=i+8) begin
		BUFFER Buff0(level3P[i],level3G[i],level4P[i],level4G[i]);
		if ((i+1)<=31) begin
			BUFFER Buff1(level3P[i+1],level3G[i+1],level4P[i+1],level4G[i+1]);
		end
	end
endgenerate
GrayCell GrayCel40(level3G[4],level3P[4],level3G[3],level4G[4]);
GrayCell GrayCel41(level3G[5],level3P[5],level3G[3],level4G[5]);
GrayCell GrayCel42(level3G[6],level3P[6],level3G[3],level4G[6]);
GrayCell GrayCel43(level3G[7],level3P[7],level3G[3],level4G[7]);
generate
	for(i=12;i<32;i=i+8) begin
		BlackCell BC0(level3G[i],level3P[i],level3G[i-1],level3P[i-1],level4G[i],level4P[i]);
		if((i+1)<=31) begin
			BlackCell BC1(level3G[i+1],level3P[i+1],level3G[i-1],level3P[i-1],level4G[i+1],level4P[i+1]);
		end
		if((i+2)<=31) begin
			BlackCell BC2(level3G[i+2],level3P[i+2],level3G[i-1],level3P[i-1],level4G[i+2],level4P[i+2]);
		end
		if((i+3)<=31) begin
			BlackCell BC3(level3G[i+3],level3P[i+3],level3G[i-1],level3P[i-1],level4G[i+3],level4P[i+3]);
		end
	end
endgenerate
for(i=0;i<32;i=i+8) begin
	assign level4P[i] = level3P[i];
	assign level4G[i] = level3G[i];
	if((i+1)<=31) begin
		assign level4P[i+1] = level3P[i+1];
		assign level4G[i+1] = level3G[i+1];
	end
end
// level 4 end

// level 5 start
generate
	for(i=0;i<4;i=i+1) begin
		assign level5P[i] = level4P[i];
		assign level5G[i] = level4G[i];
	end
	for(i=4;i<8;i=i+1) begin
		BUFFER Buff0(level4P[i],level4G[i],level5P[i],level5G[i]);
	end
	for(i=8;i<16;i=i+1) begin
		GrayCell GrayCell0(level4G[i],level4P[i],level4G[7],level5G[i]);
	end
	for(i=16;i<18;i=i+1) begin
		assign level5P[i] = level4P[i];
		assign level5G[i] = level4G[i];
	end
	for(i=18;i<24;i=i+1) begin
		BUFFER Buff50(level4P[i],level4G[i],level5P[i],level5G[i]);
	end
	for(i=24;i<32;i=i+1) begin
		BlackCell BC50(level4G[i],level4P[i],level4G[23],level4P[23],level5G[i],level5P[i]);
	end
endgenerate
// level 5 end

// level 6 start
generate
	for(i=0;i<8;i=i+1) begin
		assign level6P[i] = level5P[i];
		assign level6G[i] = level5G[i];
	end
	for(i=8;i<16;i=i+1) begin
		BUFFER Buff60(level5P[i],level5G[i],level6P[i],level6G[i]);
	end
	for(i=16;i<32;i=i+1) begin
		GrayCell GrayCell0(level5G[i],level5P[i],level5G[15],level6G[i]);
	end
endgenerate
// level 6 end

// sum start
generate
	xor #1 XPS1(S[0],level1P[1],level1G[0]);
	for(i=1;i<32;i=i+1) begin
		SumGen SG(level1P[i],level6G[i-1],S[i]);
	end
endgenerate
assign Cout=level6G[31];
// sum end

endmodule
