`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:37:15 04/22/2018
// Design Name:   HalfAdder
// Module Name:   /home/ise/EE638HW3_2017701177/HalfAdder_tb.v
// Project Name:  EE638HW3_2017701177
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HalfAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module HalfAdder_tb;

	// Inputs
	reg A;
	reg B;

	// Outputs
	wire S;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	HalfAdder uut (
		.A(A), 
		.B(B), 
		.S(S), 
		.Cout(Cout)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 0;
		B = 0;
		
		
		#100;
		A = 0;
		B = 1;
		
		
		#100;
		A = 1;
		B = 0;
		
		
		#100;
		A = 1;
		B = 1;
		
		
		

	end
      
endmodule

