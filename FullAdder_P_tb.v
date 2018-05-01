`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:06:38 04/17/2018
// Design Name:   FullAdder_P
// Module Name:   /home/ise/EE638HW3_2017701177/FullAdder_P_tb.v
// Project Name:  EE638HW3_2017701177
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FullAdder_P
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FullAdder_P_tb;

	// Inputs
	reg A;
	reg B;
	reg Cin;

	// Outputs
	wire S;
	wire P;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	FullAdder_P uut (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.S(S), 
		.P(P), 
		.Cout(Cout)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
		A=1'b0;
		B=1'b1;
		Cin=1'b1;
		
		// Add stimulus here

	end
      
endmodule

