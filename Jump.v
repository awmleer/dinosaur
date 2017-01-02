`timescale 1ns / 1ps

module Jump (
    input wire fresh,
    input wire [31:0] clkdiv,
    input wire button_jump,
    input wire RESET,
    input wire START,
    input wire [8:0] row_addr,
    input wire [9:0] col_addr,
    output reg px,
    input wire game_status
    );
    
    reg [11:0] jump_time;
    wire [11:0] height;
    reg [7215:0] pattern;
    reg jumping;

    //initial begin
        // game_status<=1'b0;
        //game_status<=1'b0;//for DEBUG
        //jump_time<=8'b0;
        //jumping<=1'b0;
    //end

    assign height = (jump_time*12'd60 - jump_time*jump_time) / 3'd6;

    //for every frame
    always @(negedge fresh) begin
        //jump operation
        if (game_status) begin
            if (button_jump && jumping==1'b0) begin
               jumping<=1'b1;
            end
            if (jumping) begin
                if (jump_time>=12'd60) begin
                    jump_time<=12'b0;
                    jumping<=1'b0;
                end else begin
                    jump_time<=jump_time+1'b1;
                end
            end
        end else begin //if pausing
            if (RESET || START) begin
                jump_time<=12'b0;
                jumping<=1'b0;
            end
        end
        
    end

    always @(posedge clkdiv[0]) begin
        //TEST
        // if (game_status) begin
            if (row_addr >= 10'd402 - height - 10'd88 && row_addr < 10'd402 - height) begin
                if (col_addr>=10'd80 && col_addr<10'd162) begin
                    //px <= 1'b1;
                    px <= pattern[16'd81-(col_addr-10'd80)+(row_addr+height-10'd314)*16'd82];
                end else begin
                    px <= 1'b0;
                end
            end else begin
                px <= 1'b0;
            end
        // end
    end

    always @(posedge RESET) begin
        pattern[81:0]<=82'b0000000000_0000000000_0000000000_0000000000_0000000011_1111111111_1111111111_1111111100_00;
        pattern[163:82]<=82'b0000000000_0000000000_0000000000_0000000000_0000000011_1111111111_1111111111_1111111100_00;
        pattern[245:164]<=82'b0000000000_0000000000_0000000000_0000000000_0000000011_1111111111_1111111111_1111111100_00;
        pattern[327:246]<=82'b0000000000_0000000000_0000000000_0000000000_0000000011_1111111111_1111111111_1111111100_00;
        pattern[409:328]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[491:410]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[573:492]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_0000001111_1111111111_1111111111_11;
        pattern[655:574]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_0000001111_1111111111_1111111111_11;
        pattern[737:656]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_0011001111_1111111111_1111111111_11;
        pattern[819:738]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_0011001111_1111111111_1111111111_11;
        pattern[901:820]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_0000001111_1111111111_1111111111_11;
        pattern[983:902]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_0000001111_1111111111_1111111111_11;
        pattern[1065:984]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[1147:1066]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[1229:1148]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[1311:1230]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[1393:1312]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[1475:1394]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[1557:1476]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[1639:1558]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[1721:1640]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[1803:1722]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[1885:1804]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[1967:1886]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111111_11;
        pattern[2049:1968]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111100_00;
        pattern[2131:2050]<=82'b0000000000_0000000000_0000000000_0000000000_0000111111_1111111111_1111111111_1111111100_00;
        pattern[2213:2132]<=82'b1111000000_0000000000_0000000000_0000000000_1111111111_1111111111_1111111111_1111111100_00;
        pattern[2295:2214]<=82'b1111000000_0000000000_0000000000_0000000000_1111111111_1111111111_1111111111_1111111100_00;
        pattern[2377:2296]<=82'b1111000000_0000000000_0000000000_0000001111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[2459:2378]<=82'b1111000000_0000000000_0000000000_0000001111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[2541:2460]<=82'b1111000000_0000000000_0000000000_0000111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[2623:2542]<=82'b1111000000_0000000000_0000000000_0000111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[2705:2624]<=82'b1111110000_0000000000_0000000000_0011111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[2787:2706]<=82'b1111110000_0000000000_0000000000_0011111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[2869:2788]<=82'b1111111100_0000000000_0000000000_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[2951:2870]<=82'b1111111100_0000000000_0000000000_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[3033:2952]<=82'b1111111111_0000000000_0000001111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[3115:3034]<=82'b1111111111_0000000000_0000001111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[3197:3116]<=82'b1111111111_1100000000_0000111111_1111111111_1111111111_1111111111_1111000000_0000000000_00;
        pattern[3279:3198]<=82'b1111111111_1100000000_0000111111_1111111111_1111111111_1111111111_1111000000_0000000000_00;
        pattern[3361:3280]<=82'b1111111111_1111000000_1111111111_1111111111_1111111111_1111111111_1111000000_0000000000_00;
        pattern[3443:3362]<=82'b1111111111_1111000000_1111111111_1111111111_1111111111_1111111111_1111000000_0000000000_00;
        pattern[3525:3444]<=82'b1111111111_1111111111_1111111111_1111111111_1111111111_1111110000_1111000000_0000000000_00;
        pattern[3607:3526]<=82'b1111111111_1111111111_1111111111_1111111111_1111111111_1111110000_1111000000_0000000000_00;
        pattern[3689:3608]<=82'b1111111111_1111111111_1111111111_1111111111_1111111111_1111110000_1111000000_0000000000_00;
        pattern[3771:3690]<=82'b1111111111_1111111111_1111111111_1111111111_1111111111_1111110000_1111000000_0000000000_00;
        pattern[3853:3772]<=82'b1111111111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[3935:3854]<=82'b1111111111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[4017:3936]<=82'b1111111111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[4099:4018]<=82'b1111111111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[4181:4100]<=82'b1111111111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[4263:4182]<=82'b1111111111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[4345:4264]<=82'b1111111111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[4427:4346]<=82'b1111111111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[4509:4428]<=82'b0011111111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[4591:4510]<=82'b0011111111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[4673:4592]<=82'b0000111111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[4755:4674]<=82'b0000111111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[4837:4756]<=82'b0000001111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[4919:4838]<=82'b0000001111_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[5001:4920]<=82'b0000000011_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[5083:5002]<=82'b0000000011_1111111111_1111111111_1111111111_1111111111_1111110000_0000000000_0000000000_00;
        pattern[5165:5084]<=82'b0000000000_1111111111_1111111111_1111111111_1111111111_1111000000_0000000000_0000000000_00;
        pattern[5247:5166]<=82'b0000000000_1111111111_1111111111_1111111111_1111111111_1111000000_0000000000_0000000000_00;
        pattern[5329:5248]<=82'b0000000000_0011111111_1111111111_1111111111_1111111111_1100000000_0000000000_0000000000_00;
        pattern[5411:5330]<=82'b0000000000_0011111111_1111111111_1111111111_1111111111_1100000000_0000000000_0000000000_00;
        pattern[5493:5412]<=82'b0000000000_0000111111_1111111111_1111111111_1111111111_0000000000_0000000000_0000000000_00;
        pattern[5575:5494]<=82'b0000000000_0000111111_1111111111_1111111111_1111111111_0000000000_0000000000_0000000000_00;
        pattern[5657:5576]<=82'b0000000000_0000001111_1111111111_1111111111_1111111100_0000000000_0000000000_0000000000_00;
        pattern[5739:5658]<=82'b0000000000_0000001111_1111111111_1111111111_1111111100_0000000000_0000000000_0000000000_00;
        pattern[5821:5740]<=82'b0000000000_0000000011_1111111111_1111111111_1111110000_0000000000_0000000000_0000000000_00;
        pattern[5903:5822]<=82'b0000000000_0000000011_1111111111_1111111111_1111110000_0000000000_0000000000_0000000000_00;
        pattern[5985:5904]<=82'b0000000000_0000000000_1111111111_1111111111_1111000000_0000000000_0000000000_0000000000_00;
        pattern[6067:5986]<=82'b0000000000_0000000000_1111111111_1111111111_1111000000_0000000000_0000000000_0000000000_00;
        pattern[6149:6068]<=82'b0000000000_0000000000_1111111111_1100001111_1111000000_0000000000_0000000000_0000000000_00;
        pattern[6231:6150]<=82'b0000000000_0000000000_1111111111_1100001111_1111000000_0000000000_0000000000_0000000000_00;
        pattern[6313:6232]<=82'b0000000000_0000000000_1111111100_0000000000_1111000000_0000000000_0000000000_0000000000_00;
        pattern[6395:6314]<=82'b0000000000_0000000000_1111111100_0000000000_1111000000_0000000000_0000000000_0000000000_00;
        pattern[6477:6396]<=82'b0000000000_0000000000_1111111100_0000000000_1111000000_0000000000_0000000000_0000000000_00;
        pattern[6559:6478]<=82'b0000000000_0000000000_1111110000_0000000000_1111000000_0000000000_0000000000_0000000000_00;
        pattern[6641:6560]<=82'b0000000000_0000000000_1111000000_0000000000_1111000000_0000000000_0000000000_0000000000_00;
        pattern[6723:6642]<=82'b0000000000_0000000000_1111000000_0000000000_1111000000_0000000000_0000000000_0000000000_00;
        pattern[6805:6724]<=82'b0000000000_0000000000_1111000000_0000000000_1111000000_0000000000_0000000000_0000000000_00;
        pattern[6887:6806]<=82'b0000000000_0000000000_1111000000_0000000000_1111000000_0000000000_0000000000_0000000000_00;
        pattern[6969:6888]<=82'b0000000000_0000000000_1111111100_0000000000_1111111100_0000000000_0000000000_0000000000_00;
        pattern[7051:6970]<=82'b0000000000_0000000000_1111111100_0000000000_1111111100_0000000000_0000000000_0000000000_00;
        pattern[7133:7052]<=82'b0000000000_0000000000_1111111100_0000000000_1111111100_0000000000_0000000000_0000000000_00;
        pattern[7215:7134]<=82'b0000000000_0000000000_1111111100_0000000000_1111111100_0000000000_0000000000_0000000000_00;
    end
    
 
    
endmodule
