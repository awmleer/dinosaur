`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:59:43 01/05/2017
// Design Name:   Random
// Module Name:   C:/Users/CST/Desktop/dinosaur/random_sim.v
// Project Name:  dinosaur
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Random
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module random_sim;

	// Inputs
	reg clk;
	reg RESET;

	// Outputs
	wire [4:0] data;

	// Instantiate the Unit Under Test (UUT)
	Random uut (
		.clk(clk), 
		.RESET(RESET), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		RESET = 0;

		// Wait 100 ns for global reset to finish
		#30;
        RESET=1;
        
        #30;
        RESET=0;
        
		// Add stimulus here

	end
    
    always begin
		clk = 0; #10;
		clk = 1; #10;
	end
      
endmodule

