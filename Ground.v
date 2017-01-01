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
    input wire [8:0] row_addr,
    input wire [9:0] col_addr,
    output reg [5:0] ground_position,
    input wire game_status,
    output reg [3:0] speed,
	 //reg [319:0] pattern,
    //output reg [319:0] px
    output reg px
    );
    reg [319:0] pattern;
	 /*
	 initial begin
		  pattern[39:0]=320'b0000000000000000000111100000000000000000;
		  pattern[79:40]=320'b0000000000000000011000011100000000000000;
		  pattern[119:80]=320'b1111111111111111100000000011111111111111;
		  pattern[159:120]=320'b0000000000000000000000110000000000000000;
		  pattern[199:160]=320'b0000000111000000000000000000000000000000;
		  pattern[239:200]=320'b1000000000000000000000000000000000111111;
		  pattern[279:240]=320'b0000000000000000000000011110000000000000;
		  pattern[319:280]=320'b0000000000000000000000000000000000000000;
	 end
     */
    //ground ??16??ظ?ͼ????ɵģ?ÿ?????????40pattern
    always @(posedge CLK) //begin
    begin
        // if (!N_rst) begin
            // pattern[39:0]=40'b0000000000000000000111100000000000000000;
        //     pattern[79:40]=40'b0000000000000000011000011100000000000000;
        //     pattern[119:80]=40'b1111111111111111100000000011111111111111;
        //     pattern[159:120]=40'b0000000000000000000000110000000000000000;
        //     pattern[199:160]=40'b0000000111000000000000000000000000000000;
        //     pattern[239:200]=40'b1000000000000000000000000000000000111111;
        //     pattern[279:240]=40'b0000000000000000000000011110000000000000;
        //     pattern[319:280]=40'b0000000000000000000000000000000000000000;
        // end
        if (game_status) begin
            if (row_addr>=10'd400 && row_addr<10'd408) begin
                px<=pattern[(col_addr%10'd40+ground_position+(row_addr-10'd400)*40)%10'd320];
                //px <= 1'b1;
            end else begin
                px <= 1'b0;
            end
            ground_position<=(ground_position+speed)%3'd40;
            //NO NEED:
            // if(ground_position+speed<3'd40)begin
            //     ground_position<=ground_position+speed;
            //     // px[319:1]=pattern[318:0];
            //     // px[0]=pattern[319];
            // end else begin
            //     ground_position<=(ground_position+speed)%3'd40;
            // end
            // pattern[319:0]=px[319:0];
        end else begin
            ground_position<=6'b0;
            speed<=1'd4;
            // px[316:4]=pattern[315:0];
            // px[3:0]=pattern[319:316];
            pattern[39:0]<=40'b0000000000000000000111100000000000000000;
            pattern[79:40]<=40'b0000000000000000011000011100000000000000;
            pattern[119:80]<=40'b1111111111111111100000000011111111111111;
            pattern[159:120]<=40'b0000000000000000000000110000000000000000;
            pattern[199:160]<=40'b0000000111000000000000000000000000000000;
            pattern[239:200]<=40'b1000000000000000000000000000000000111111;
            pattern[279:240]<=40'b0000000000000000000000011110000000000000;
            pattern[319:280]<=40'b0000000000000000000000000000000000000000;
        end
    end
    
    //Maybe we don't need this:
    initial begin
        speed<=1'd4;
        ground_position<=6'b0;
    end

endmodule

