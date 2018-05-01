`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:43:54 04/19/2018
// Design Name:   CSLA32Bit
// Module Name:   /home/ise/EE638HW3_2017701177/CSLA32Bit_tb.v
// Project Name:  EE638HW3_2017701177
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CSLA32Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CSLA32Bit_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg Cin;

	// Outputs
	wire [31:0] S;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	CSLA32Bit uut (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.S(S),
		.Cout(Cout)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 32'hFFFF0000;
		B = 32'h0000FFFF;
		Cin = 1;
		
		#300;
		A = 32'd2017701177;
		B = 32'd1701853;
		Cin = 0;
		
		#300;
		A = 32'hFFABCEDC;
		B = 32'hEF821EDA;
		Cin = 1;
		

	end
      
endmodule

