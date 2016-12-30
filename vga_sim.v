`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:20:43 12/30/2016
// Design Name:   Vga
// Module Name:   C:/Users/CST/Desktop/dinosaur/vga_sim.v
// Project Name:  dinosaur
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Vga
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vga_sim;

	// Inputs
	reg vga_clk;
	reg clrn;
	reg [319:0] px_ground;

	// Outputs
	wire [8:0] row_addr;
	wire [9:0] col_addr;
	wire rdn;
	wire [3:0] r;
	wire [3:0] g;
	wire [3:0] b;
	wire hs;
	wire vs;
    wire px;


	// Instantiate the Unit Under Test (UUT)
	Vga uut (
		.vga_clk(vga_clk), 
		.clrn(clrn), 
		.row_addr(row_addr), 
		.col_addr(col_addr), 
		.rdn(rdn), 
		.r(r), 
		.g(g), 
		.b(b), 
		.hs(hs), 
		.vs(vs), 
		.px_ground(px_ground),
        .px(px)
	);

	initial begin
		// Initialize Inputs
		vga_clk = 0;
		clrn = 0;
		px_ground = 0;

		// Wait 100 ns for global reset to finish
		#30;
        clrn = 1;
		// Add stimulus here

	end
    always begin
		vga_clk = 0; #10;
		vga_clk = 1; #10;
	end
      
endmodule

