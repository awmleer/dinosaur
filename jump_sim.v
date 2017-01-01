`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:13:31 01/01/2017
// Design Name:   Jump
// Module Name:   C:/Users/CST/Desktop/dinosaur/jump_sim.v
// Project Name:  dinosaur
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Jump
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module jump_sim;

	// Inputs
	reg fresh;
	reg CLK;
	reg button_jump;
	reg RESET;
	reg [8:0] row_addr;
	reg [9:0] col_addr;

	// Outputs
	wire px;
	wire game_status;

	// Instantiate the Unit Under Test (UUT)
	Jump uut (
		.fresh(fresh), 
		.CLK(CLK), 
		.button_jump(button_jump), 
		.RESET(RESET), 
		.row_addr(row_addr), 
		.col_addr(col_addr), 
		.px(px), 
		.game_status(game_status)
	);

	initial begin
		// Initialize Inputs
		fresh = 0;
		CLK = 0;
		button_jump = 0;
		RESET = 0;
		row_addr = 0;
		col_addr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        RESET=1;
        #100;
        RESET=0;
        
		// Add stimulus here

	end
    
    always begin
		CLK = CLK+1'b1;fresh=~fresh; #10;
		//CLK = 1; #10;
	end
      
endmodule

