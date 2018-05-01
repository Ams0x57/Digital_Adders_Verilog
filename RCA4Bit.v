`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:43:04 04/22/2018 
// Design Name: 
// Module Name:    RCA4Bit 
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
module RCA4Bit(
		input [3:0] A,
		input [3:0] B,
		input Cin,
		output [3:0] S,
		output Cout
    );

wire [4:0] carry_prop;
assign carry_prop[0] = Cin;
	 
FullAdder FullAdder0 (A[0],B[0],carry_prop[0],S[0],carry_prop[1]);
FullAdder FullAdder1 (A[1],B[1],carry_prop[1],S[1],carry_prop[2]);
FullAdder FullAdder2 (A[2],B[2],carry_prop[2],S[2],carry_prop[3]);
FullAdder FullAdder3 (A[3],B[3],carry_prop[3],S[3],carry_prop[4]);

assign Cout = carry_prop[4];

endmodule
