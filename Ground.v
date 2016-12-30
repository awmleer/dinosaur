`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:44:55 12/30/2016 
// Design Name: 
// Module Name:    Ground 
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
module Ground (
    input wire CLK,
    input reg [5:0] ground_position,
    input reg game_status,
    input reg [3:0] speed
    );
    
    //ground 是由16块重复图案组成的，每块图案宽度为40px
    always @(posedge CLK) begin
        if (game_status) begin
            if(game_status<2'd40)begin
                ground_position<=ground_position+speed;
            end
            else begin
                ground_position<=6'b0;
            end
        end
    end

    

endmodule

