`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:43:33 04/22/2018
// Design Name:   CIA8Bit
// Module Name:   /home/ise/EE638HW3_2017701177/CIA8Bit_tb.v
// Project Name:  EE638HW3_2017701177
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CIA8Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CIA8Bit_tb;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg Cin;

	// Outputs
	wire [7:0] S;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	CIA8Bit uut (
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
		A = 8'hFF;
		B = 8'd0;
		Cin = 1;

	end
      
endmodule

