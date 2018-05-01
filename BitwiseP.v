`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:00 04/25/2018 
// Design Name: 
// Module Name:    BitwiseP 
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
module BitwiseP(
		input Ai,
		input Bi,
		output Pi
    );

xor #0.1 (Pi,Ai,Bi);

endmodule
