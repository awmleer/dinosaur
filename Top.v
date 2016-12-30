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
    input wire BTN_JUMP
    );
    
    reg [5:0] dinosaur_height;
    reg game_status;
    reg [3:0] speed;
    reg [5:0] ground_position;

    Jump jump (.CLK(CLK),.button_jump(BTN_JUMP),.dinosaur_height(dinosaur_height),.game_status(game_status));

    Ground ground (.CLK(CLK),.ground_position(ground_position),.game_status(game_status),.speed(speed));

    //todo VGA

    initial begin
        game_status<=1'b0;
        speed<=1'd4;
        ground_position<=6'b0;
    end

endmodule
