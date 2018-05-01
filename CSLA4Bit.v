`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:37 04/19/2018 
// Design Name: 
// Module Name:    CSLA4Bit 
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
module CSLA4Bit(
		input [3:0] A,
		input [3:0] B,
		input Cin,
		output Cout,
		output [3:0] S
    );
	 
wire [4:0] C_prop_0;
wire [4:0] C_prop_1;
wire [3:0] S0;
wire [3:0] S1;
assign C_prop_1[0] = 1;
assign C_prop_0[0] = 0;
	 
FullAdder FullAdder10 (A[0],B[0],C_prop_1[0],S1[0],C_prop_1[1]);
FullAdder FullAdder11 (A[1],B[1],C_prop_1[1],S1[1],C_prop_1[2]);
FullAdder FullAdder12 (A[2],B[2],C_prop_1[2],S1[2],C_prop_1[3]);
FullAdder FullAdder13 (A[3],B[3],C_prop_1[3],S1[3],C_prop_1[4]);

FullAdder FullAdder00 (A[0],B[0],C_prop_0[0],S0[0],C_prop_0[1]);
FullAdder FullAdder01 (A[1],B[1],C_prop_0[1],S0[1],C_prop_0[2]);
FullAdder FullAdder02 (A[2],B[2],C_prop_0[2],S0[2],C_prop_0[3]);
FullAdder FullAdder03 (A[3],B[3],C_prop_0[3],S0[3],C_prop_0[4]);

MUX2x1 MUX2x1_0(S0[0],S1[0],Cin,S[0]);
MUX2x1 MUX2x1_1(S0[1],S1[1],Cin,S[1]);
MUX2x1 MUX2x1_2(S0[2],S1[2],Cin,S[2]);
MUX2x1 MUX2x1_3(S0[3],S1[3],Cin,S[3]);

MUX2x1 MUX2x1_4(C_prop_0[4],C_prop_1[4],Cin,Cout);


endmodule
