`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:50:32 04/16/2018 
// Design Name: 
// Module Name:    FullAdder 
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
module FullAdder(
    input A,B,
    input Cin,
    output S,
    output Cout
    );
assign #0.4 S=A^B^Cin;
assign #0.2 Cout=(A&B)|(B&Cin)|(A&Cin);

endmodule
