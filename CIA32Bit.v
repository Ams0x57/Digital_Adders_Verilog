`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:55:46 04/22/2018 
// Design Name: 
// Module Name:    CIA32Bit 
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
module CIA32Bit(
		input [31:0] A,
		input [31:0] B,
		input Cin,
		output [31:0] S,
		output Cout
    );
	
wire [4:0] carry_prop;
assign carry_prop[0] = Cin;

CIA8Bit CIA8Bit0 (A[7:0],B[7:0],carry_prop[0],S[7:0],carry_prop[1]);
CIA8Bit CIA8Bit1 (A[15:8],B[15:8],carry_prop[1],S[15:8],carry_prop[2]);
CIA8Bit CIA8Bit2 (A[23:16],B[23:16],carry_prop[2],S[23:16],carry_prop[3]);
CIA8Bit CIA8Bit3 (A[31:24],B[31:24],carry_prop[3],S[31:24],carry_prop[4]);

assign Cout = carry_prop[4];

endmodule
