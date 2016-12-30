`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:23 12/30/2016 
// Design Name: 
// Module Name:    Jump 
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
module Jump (
    input wire CLK,
    input wire button_jump,
    input reg [5:0] dinosaur_height,
    input reg game_status
    );
    
    always @(posedge CLK) begin
        if (game_status) begin
            if (button_jump && (&dinosaur_height[5:0])) begin
                dinosaur_height<=6'b000101;
            end
            if( !(&dinosaur_height[5:0]) ) begin
                dinosaur_height<=dinosaur_height+1'b1;//todo 需要加速度
            end
        end
    end
    
endmodule
