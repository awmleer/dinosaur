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
	 input wire N_rst,
    output reg [5:0] ground_position,
    input wire game_status,
    output reg [3:0] speed,
	 reg [319:0] px2,
	 output reg [319:0] px
    );
	 /*
	 initial begin
		  px2[39:0]=320'b0000000000000000000111100000000000000000;
		  px2[79:40]=320'b0000000000000000011000011100000000000000;
		  px2[119:80]=320'b1111111111111111100000000011111111111111;
		  px2[159:120]=320'b0000000000000000000000110000000000000000;
		  px2[199:160]=320'b0000000111000000000000000000000000000000;
		  px2[239:200]=320'b1000000000000000000000000000000000111111;
		  px2[279:240]=320'b0000000000000000000000011110000000000000;
		  px2[319:280]=320'b0000000000000000000000000000000000000000;
	 end
    */
    //ground 是由16块重复图案组成的，每块图案宽度为40px2
    always @(posedge CLK) //begin
	 begin
		  if (!N_rst) begin
			  px2[39:0]=40'b0000000000000000000111100000000000000000;
			  px2[79:40]=40'b0000000000000000011000011100000000000000;
			  px2[119:80]=40'b1111111111111111100000000011111111111111;
			  px2[159:120]=40'b0000000000000000000000110000000000000000;
			  px2[199:160]=40'b0000000111000000000000000000000000000000;
			  px2[239:200]=40'b1000000000000000000000000000000000111111;
			  px2[279:240]=40'b0000000000000000000000011110000000000000;
			  px2[319:280]=40'b0000000000000000000000000000000000000000;
		  end
		  
        if (game_status) begin
            if(ground_position<3'd40)begin
                ground_position<=ground_position+speed;
					 px[319:1]=px2[318:0];
					 px[0]=px2[319];
            end
            else begin
                ground_position<=6'b0;
					 px[316:4]=px2[315:0];
					 px[3:0]=px2[319:316];
            end
				px2[319:0]=px[319:0];
        end
    end
    

    initial begin
        speed<=1'd4;
        ground_position<=6'b0;
    end

    

endmodule

