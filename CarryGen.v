`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:51:43 04/26/2018 
// Design Name: 
// Module Name:    CarryGen 
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
module CarryGen(
		input G_i_to_0,
		input P_i_to_0,
		input Cin,
		output carry
    );

wire net0;
and #1 (net0,P_i_to_0,Cin);
or #1 (carry,net0,G_i_to_0);

endmodule
