`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:47 04/17/2018 
// Design Name: 
// Module Name:    CSKA4Bit 
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
module CSKA4Bit(
		input [3:0] A,
		input [3:0] B,
		input Cin,
		output Cout,
		output [3:0] S
    );

wire [4:0] carry_prop;
wire [3:0] P;
assign carry_prop[0] = Cin;

FullAdder_P FullAdder_P0 (A[0],B[0],carry_prop[0],S[0],P[0],carry_prop[1]);
FullAdder_P FullAdder_P1 (A[1],B[1],carry_prop[1],S[1],P[1],carry_prop[2]);
FullAdder_P FullAdder_P2 (A[2],B[2],carry_prop[2],S[2],P[2],carry_prop[3]);
FullAdder_P FullAdder_P3 (A[3],B[3],carry_prop[3],S[3],P[3],carry_prop[4]);

wire MUX_SEL;

assign #0.1 MUX_SEL = P[0]&P[1]&P[2]&P[3];
MUX2x1 MUX2x1_0(carry_prop[4],Cin,MUX_SEL,Cout);


endmodule
