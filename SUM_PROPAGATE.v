`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:45:53 04/17/2018 
// Design Name: 
// Module Name:    SUM_PROPAGATE 
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
module SUM_PROPAGATE(
    input A,B,
    input Cin,
    output S,
    output P,
	 output Cout
    );
assign #1 S=A^B^Cin;
assign #3 Cout=(A&B)|(B&Cin)|(A&Cin);
xor #2 (P,A,B);

endmodule
