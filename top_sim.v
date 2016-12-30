`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:32:02 12/30/2016
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
	reg BTN_JUMP;
	reg [15:0] SW;

	// Outputs
	wire hs;
	wire vs;
	wire [3:0] r;
	wire [3:0] g;
	wire [3:0] b;
	wire BUZZER;
    wire [31:0]clkdiv;
    wire rdn;
    wire [15:0] SW_OK;
    
	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.CLK(CLK), 
		.BTN_JUMP(BTN_JUMP), 
		.SW(SW), 
		.hs(hs), 
		.vs(vs), 
		.r(r), 
		.g(g), 
		.b(b),
        .clkdiv(clkdiv),
        .rdn(rdn),
        .SW_OK(SW_OK),
		.BUZZER(BUZZER)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		BTN_JUMP = 0;
		SW = 0;

		// Wait 100 ns for global reset to finish
		#30;
        SW[0]=1;
        #30;
        SW[0]=0;

		// Add stimulus here
        
        
	end
    
    
    always begin
		CLK = 0; #10;
		CLK = 1; #10;
	end
      
endmodule

