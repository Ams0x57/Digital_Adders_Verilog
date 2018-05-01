`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:18:34 04/26/2018 
// Design Name: 
// Module Name:    Valency4BlackDot 
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
module Valency4BlackDot(
		input Gik,
		input Pik,
		input Gk_1l,
		input Pk_1l,
		input Gl_1m,
		input Pl_1m,
		input Gm_1j,
		input Pm_1j,
		output Gij,
		output Pij
    );
	 
wire net0;
wire net1;
wire net2;
wire net3;
wire net4;

and #2 (Pij,Pik,Pk_1l,Pl_1m,Pm_1j);

and #1 (net0,Pl_1m,Gm_1j);
or #1 (net1,net0,Gl_1m);
and #1 (net2,net1,Pk_1l);
or #1 (net3,net2,Gk_1l);
and #1 (net4,net3,Pik);
or #1 (Gij,net4,Gik);

endmodule
