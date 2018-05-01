`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:16 04/17/2018 
// Design Name: 
// Module Name:    FullAdder_P 
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
module FullAdder_P(
	 input A,B,
    input Cin,
    output S,
    output P,
	 output Cout
    );
	 
assign #0.4 S=A^B^Cin;
assign #0.2 Cout=(A&B)|(B&Cin)|(A&Cin);
assign #0.1 P=A^B;


endmodule
