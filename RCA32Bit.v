`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:17 04/16/2018 
// Design Name: 
// Module Name:    RCA32Bit 
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

module RCA32Bit(
		input [31:0] A,
		input [31:0] B,
		input Cin,
		output [31:0] S,
		output Cout
    );
	 
wire [32:0] carry_prop;
assign carry_prop[0] = Cin;

FullAdder FullAdder0 (A[0],B[0],carry_prop[0],S[0],carry_prop[1]);
FullAdder FullAdder1 (A[1],B[1],carry_prop[1],S[1],carry_prop[2]);
FullAdder FullAdder2 (A[2],B[2],carry_prop[2],S[2],carry_prop[3]);
FullAdder FullAdder3 (A[3],B[3],carry_prop[3],S[3],carry_prop[4]);
FullAdder FullAdder4 (A[4],B[4],carry_prop[4],S[4],carry_prop[5]);
FullAdder FullAdder5 (A[5],B[5],carry_prop[5],S[5],carry_prop[6]);
FullAdder FullAdder6 (A[6],B[6],carry_prop[6],S[6],carry_prop[7]);
FullAdder FullAdder7 (A[7],B[7],carry_prop[7],S[7],carry_prop[8]);
FullAdder FullAdder8 (A[8],B[8],carry_prop[8],S[8],carry_prop[9]);
FullAdder FullAdder9 (A[9],B[9],carry_prop[9],S[9],carry_prop[10]);
FullAdder FullAdder10 (A[10],B[10],carry_prop[10],S[10],carry_prop[11]);
FullAdder FullAdder11 (A[11],B[11],carry_prop[11],S[11],carry_prop[12]);
FullAdder FullAdder12 (A[12],B[12],carry_prop[12],S[12],carry_prop[13]);
FullAdder FullAdder13 (A[13],B[13],carry_prop[13],S[13],carry_prop[14]);
FullAdder FullAdder14 (A[14],B[14],carry_prop[14],S[14],carry_prop[15]);
FullAdder FullAdder15 (A[15],B[15],carry_prop[15],S[15],carry_prop[16]);
FullAdder FullAdder16 (A[16],B[16],carry_prop[16],S[16],carry_prop[17]);
FullAdder FullAdder17 (A[17],B[17],carry_prop[17],S[17],carry_prop[18]);
FullAdder FullAdder18 (A[18],B[18],carry_prop[18],S[18],carry_prop[19]);
FullAdder FullAdder19 (A[19],B[19],carry_prop[19],S[19],carry_prop[20]);
FullAdder FullAdder20 (A[20],B[20],carry_prop[20],S[20],carry_prop[21]);
FullAdder FullAdder21 (A[21],B[21],carry_prop[21],S[21],carry_prop[22]);
FullAdder FullAdder22 (A[22],B[22],carry_prop[22],S[22],carry_prop[23]);
FullAdder FullAdder23 (A[23],B[23],carry_prop[23],S[23],carry_prop[24]);
FullAdder FullAdder24 (A[24],B[24],carry_prop[24],S[24],carry_prop[25]);
FullAdder FullAdder25 (A[25],B[25],carry_prop[25],S[25],carry_prop[26]);
FullAdder FullAdder26 (A[26],B[26],carry_prop[26],S[26],carry_prop[27]);
FullAdder FullAdder27 (A[27],B[27],carry_prop[27],S[27],carry_prop[28]);
FullAdder FullAdder28 (A[28],B[28],carry_prop[28],S[28],carry_prop[29]);
FullAdder FullAdder29 (A[29],B[29],carry_prop[29],S[29],carry_prop[30]);
FullAdder FullAdder30 (A[30],B[30],carry_prop[30],S[30],carry_prop[31]);
FullAdder FullAdder31 (A[31],B[31],carry_prop[31],S[31],carry_prop[32]);
assign Cout = carry_prop[32];

endmodule
