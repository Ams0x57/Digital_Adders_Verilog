`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:17 04/25/2018 
// Design Name: 
// Module Name:    BUFFER 
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
module BUFFER(
	input Pi,
	input Gi,
	output Po,
	output Go
    );
	 
assign #0.1 Po = Pi;
assign #0.1 Go = Gi;

endmodule
