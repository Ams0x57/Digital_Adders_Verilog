`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:32:33 04/19/2018 
// Design Name: 
// Module Name:    CSLA32Bit 
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
module CSLA32Bit(
		input [31:0] A,
		input [31:0] B,
		input Cin,
		output [31:0] S,
		output Cout
    );

wire [8:0] carry_prop;
assign carry_prop[0] = Cin;

wire [3:0] ABUS0 = A[3:0];
wire [3:0] ABUS1 = A[7:4];
wire [3:0] ABUS2 = A[11:8];
wire [3:0] ABUS3 = A[15:12];
wire [3:0] ABUS4 = A[19:16];
wire [3:0] ABUS5 = A[23:20];
wire [3:0] ABUS6 = A[27:24];
wire [3:0] ABUS7 = A[31:28];

wire [3:0] BBUS0 = B[3:0];
wire [3:0] BBUS1 = B[7:4];
wire [3:0] BBUS2 = B[11:8];
wire [3:0] BBUS3 = B[15:12];
wire [3:0] BBUS4 = B[19:16];
wire [3:0] BBUS5 = B[23:20];
wire [3:0] BBUS6 = B[27:24];
wire [3:0] BBUS7 = B[31:28];


CSLA4Bit CSLA4Bit0 (ABUS0,BBUS0,carry_prop[0],carry_prop[1],S[3:0]);
CSLA4Bit CSLA4Bit1 (ABUS1,BBUS1,carry_prop[1],carry_prop[2],S[7:4]);
CSLA4Bit CSLA4Bit2 (ABUS2,BBUS2,carry_prop[2],carry_prop[3],S[11:8]);
CSLA4Bit CSLA4Bit3 (ABUS3,BBUS3,carry_prop[3],carry_prop[4],S[15:12]);
CSLA4Bit CSLA4Bit4 (ABUS4,BBUS4,carry_prop[4],carry_prop[5],S[19:16]);
CSLA4Bit CSLA4Bit5 (ABUS5,BBUS5,carry_prop[5],carry_prop[6],S[23:20]);
CSLA4Bit CSLA4Bit6 (ABUS6,BBUS6,carry_prop[6],carry_prop[7],S[27:24]);
CSLA4Bit CSLA4Bit7 (ABUS7,BBUS7,carry_prop[7],carry_prop[8],S[31:28]);

assign Cout = carry_prop[8];

endmodule
