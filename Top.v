`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:41 12/30/2016 
// Design Name: 
// Module Name:    Top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Top(
    input wire CLK,
    input wire START,
    input wire RESET,
    input [15:0]SW,
    output hs,
    output vs,
    //output wire px,
    //output wire px_dinosaur,
    //output wire px_ground,
    output [3:0] r,
    output [3:0] g,
    output [3:0] b
    //output wire BUZZER
    //output reg [31:0]clkdiv,
    //output wire [15:0] SW_OK,
    //output wire rdn
    );
    
    wire game_status;
    wire [3:0] speed;
    //wire [5:0] ground_position;
    wire [8:0] row_addr;
    wire [9:0] col_addr;

    reg [31:0]clkdiv;
	always@(posedge CLK) begin
		clkdiv <= clkdiv + 1'b1;
	end
    
    wire [15:0] SW_OK;
    //AntiJitter #(4) a0[15:0](.clk(clkdiv[15]), .I(SW), .O(SW_OK));
    AntiJitter #(4) a0[15:0](.clk(clkdiv[0]), .I(SW), .O(SW_OK));//for DEBUG

    wire px_dinosaur;
    Jump jump (.fresh(vs),.row_addr(row_addr),.col_addr(col_addr),.CLK(CLK),.button_jump(SW_OK[1]),.RESET(SW_OK[2]),.game_status(game_status),.px(px_dinosaur));

    wire px_ground;
    Ground ground (.clkdiv(clkdiv),.fresh(vs),.row_addr(row_addr),.col_addr(col_addr),.ground_position(ground_position),.game_status(game_status),.speed(speed),.px(px_ground));



    //wire [11:0] vga_data;
    //assign vga_data[11:0]=12'b101100000011;//for DEBUG
    wire px;
    Vga vga (
    .vga_clk(clkdiv[1]),
    .clrn(SW_OK[0]),
    .r(r),
    .g(g),
    .b(b),
    .hs(hs),
    .rdn(rdn),
    .vs(vs),
    .row_addr(row_addr),
    .col_addr(col_addr),
    .px_dinosaur(px_dinosaur),
    .px_ground(px_ground),
    .px(px)
    );


    //assign BUZZER=1'b1;
    initial begin
        clkdiv<=32'b0;
    end

endmodule
