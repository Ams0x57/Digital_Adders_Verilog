`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:29 04/26/2018 
// Design Name: 
// Module Name:    SumGen 
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
module SumGen(
		input ci_1,
		input Pii,
		output Sum
    );

xor #0.1 (Sum,ci_1,Pii);

endmodule
