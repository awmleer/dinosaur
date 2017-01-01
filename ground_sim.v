`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:41:44 01/01/2017
// Design Name:   Ground
// Module Name:   C:/Users/CST/Desktop/dinosaur/ground_sim.v
// Project Name:  dinosaur
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ground
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ground_sim;

	// Inputs
	reg [31:0] clkdiv;
	reg N_rst;
	reg [8:0] row_addr;
	reg [9:0] col_addr;
	reg game_status;

	// Outputs
	wire [5:0] ground_position;
	wire [3:0] speed;
	wire px;

	// Instantiate the Unit Under Test (UUT)
	Ground uut (
		.clkdiv(clkdiv), 
		.N_rst(N_rst), 
		.row_addr(row_addr), 
		.col_addr(col_addr), 
		.ground_position(ground_position), 
		.game_status(game_status), 
		.speed(speed), 
		.px(px)
	);

	initial begin
		// Initialize Inputs
		clkdiv = 0;
		N_rst = 0;
		row_addr = 0;
		col_addr = 0;
		game_status = 1;

		// Wait 100 ns for global reset to finish
		#100;
        game_status =1;
        
		// Add stimulus here

	end
    
    
    always begin
		clkdiv = clkdiv+1'b1; #10;
		//CLK = 1; #10;
	end
      
endmodule

