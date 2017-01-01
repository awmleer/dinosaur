`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:17:33 01/01/2017
// Design Name:   Top
// Module Name:   C:/Users/CST/Desktop/dinosaur/top_sim.v
// Project Name:  dinosaur
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_sim;

	// Inputs
	reg CLK;
	reg START;
	reg RESET;
	reg [15:0] SW;

	// Outputs
	wire hs;
	wire vs;
	wire [3:0] r;
	wire [3:0] g;
	wire [3:0] b;
    wire px;
    wire px_dinosaur;
    wire px_ground;

	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.CLK(CLK), 
		.START(START), 
		.RESET(RESET), 
		.SW(SW), 
		.hs(hs), 
		.vs(vs), 
		.r(r), 
		.g(g), 
        .px(px),
        .px_dinosaur(px_dinosaur),
        .px_ground(px_ground),
		.b(b)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		SW = 0;
        RESET=0;
        START=0;

		// Wait 100 ns for global reset to finish
		#30;
        SW[0]=1;
        
        #50;
        SW[2]=1;
        #50;
        SW[2]=0;

		// Add stimulus here
        
        
	end
    
    
    always begin
		CLK = 0; #10;
		CLK = 1; #10;
	end
      
endmodule

