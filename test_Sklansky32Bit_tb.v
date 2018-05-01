`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:14:31 04/25/2018
// Design Name:   Sklansky32Bit
// Module Name:   /home/ise/EE638HW4_2017701177/test_Sklansky32Bit_tb.v
// Project Name:  EE638HW4_2017701177
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sklansky32Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_Sklansky32Bit_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg Cin;

	// Outputs
	wire [32:0] S;
	wire [31:0] testP;
	wire [31:0] testG;

	// Instantiate the Unit Under Test (UUT)
	Sklansky32Bit uut (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.S(S), 
		.testP(testP), 
		.testG(testG)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 32'b10010110110001101011100111101110;
		B = 32'b10010100111101101011100101101010;

	end
      
endmodule

