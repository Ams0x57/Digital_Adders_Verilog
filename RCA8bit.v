`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:24:50 04/22/2018 
// Design Name: 
// Module Name:    RCA8bit 
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
module RCA8bit(
		input [7:0] A,
		input [7:0] B,
		input Cin,
		output [7:0] S,
		output Cout
    );
	 
wire [8:0] carry_prop;
assign carry_prop[0] = Cin;
	 
FullAdder FullAdder0 (A[0],B[0],carry_prop[0],S[0],carry_prop[1]);
FullAdder FullAdder1 (A[1],B[1],carry_prop[1],S[1],carry_prop[2]);
FullAdder FullAdder2 (A[2],B[2],carry_prop[2],S[2],carry_prop[3]);
FullAdder FullAdder3 (A[3],B[3],carry_prop[3],S[3],carry_prop[4]);
FullAdder FullAdder4 (A[4],B[4],carry_prop[4],S[4],carry_prop[5]);
FullAdder FullAdder5 (A[5],B[5],carry_prop[5],S[5],carry_prop[6]);
FullAdder FullAdder6 (A[6],B[6],carry_prop[6],S[6],carry_prop[7]);
FullAdder FullAdder7 (A[7],B[7],carry_prop[7],S[7],carry_prop[8]);

assign Cout = carry_prop[8];


endmodule
