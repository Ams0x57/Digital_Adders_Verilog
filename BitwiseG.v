`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:34 04/25/2018 
// Design Name: 
// Module Name:    BitwiseG 
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
module BitwiseG(
	input Ai,
	input Bi,
	output Gi
    );

and #0.1 (Gi,Ai,Bi);

endmodule
