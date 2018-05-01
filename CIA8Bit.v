`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:33:15 04/22/2018 
// Design Name: 
// Module Name:    CIA8Bit 
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
module CIA8Bit(
		input [7:0] A,
		input [7:0] B,
		input Cin,
		output [7:0] S,
		output Cout
    );

wire RCA4Bit_COUT_1;
wire RCA4Bit_COUT_2;
wire [3:0] RCA4Bit_SOUT_1;
wire [3:0] RCA4Bit_SOUT_2;
wire net0;
wire net1;
wire net2;
wire net3;

RCA4Bit RCA4Bit0 (A[3:0],B[3:0],Cin,RCA4Bit_SOUT_1,RCA4Bit_COUT_1);
RCA4Bit RCA4Bit1 (A[7:4],B[7:4],0,RCA4Bit_SOUT_2,RCA4Bit_COUT_2);
assign S[3:0] = RCA4Bit_SOUT_1;
HalfAdder HalfAdder0 (RCA4Bit_COUT_1,RCA4Bit_SOUT_2[0],S[4],net0);
HalfAdder HalfAdder1 (net0,RCA4Bit_SOUT_2[1],S[5],net1);
HalfAdder HalfAdder2 (net1,RCA4Bit_SOUT_2[2],S[6],net2);
HalfAdder HalfAdder3 (net2,RCA4Bit_SOUT_2[3],S[7],net3);
or #0.1 (Cout,net3,RCA4Bit_COUT_2);

endmodule
