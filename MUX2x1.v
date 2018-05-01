`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:49 04/17/2018 
// Design Name: 
// Module Name:    MUX2x1 
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
module MUX2x1(
    input din_0,
	 input din_1,
    input sel,
    output mux_out      
  );
  
  
  assign #0.1 mux_out = (sel) ? din_1 : din_0;


endmodule
