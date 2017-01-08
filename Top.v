`timescale 1ns / 1ps

module Top(
    input wire CLK,
    input wire START_N,//the big RED button in the arduino board
    input wire JUMP_N,//the big BLUE button in the arduino board
    input [15:0]SW
    );
    
    reg game_status;
    reg trigger_start;
    
    wire [8:0] row_addr;
    wire [9:0] col_addr;


    //frequency divider
    reg [31:0]clkdiv;
    always@(posedge CLK) begin
        clkdiv <= clkdiv + 1'b1;
    end
    
    wire [15:0] SW_OK;
    //AntiJitter #(4) a0[15:0](.clk(clkdiv[15]), .I(SW), .O(SW_OK));
    AntiJitter #(4) a0[15:0](.clk(clkdiv[0]), .I(SW), .O(SW_OK));
    wire RESET;
    assign RESET = SW_OK[2];//use SW2 as RESET
    //the logic of those two big buttons are reversed (0 when pressed and 1 when not pressed), so we need a NOT gate
    wire START;
    assign START = ~START_N;
    wire JUMP;
    assign JUMP = ~JUMP_N;


    //Jump module
    wire px_dinosaur;
    Jump jump (
        .fresh(vs),
        .row_addr(row_addr),
        .col_addr(col_addr),
        .clkdiv(clkdiv),
        .button_jump(JUMP),
        .RESET(RESET),
        .START(START),
        .game_status(game_status),
        .px(px_dinosaur)
    );


    //Ground module
    wire px_ground;
    wire [3:0] speed;
    Ground ground (
        .clkdiv(clkdiv),
        .fresh(vs),
        .row_addr(row_addr),
        .col_addr(col_addr),
        .game_status(game_status),
        .speed(speed),
        .px(px_ground)
    );
    

    //Cactus module
    wire px_cactus;
    Cactus cactus (
        .clkdiv(clkdiv),
        .RESET(RESET),
        .START(START),
        .fresh(vs),
        .row_addr(row_addr),
        .col_addr(col_addr),
        .game_status(game_status),  
        .speed(speed),
        .px(px_cactus)
    );

    wire px_score;
    Score score(
        .clkdiv(clkdiv),
        .RESET(RESET),
        .row_addr(row_addr),
        .col_addr(col_addr),
        .START(START),
        .game_status(game_status),
        .px(px_score)
    );

    //Vga module
    wire px;
    Vga vga (
        .vga_clk(clkdiv[1]),
        .clrn(SW_OK[0]),
        .r(r),
        .g(g),
        .b(b),
        .hs(hs),
        .vs(vs),
        .row_addr(row_addr),
        .col_addr(col_addr),
        .px_dinosaur(px_dinosaur),
        .px_ground(px_ground),
        .px_cactus(px_cactus),
        .px_score(px_score),
        .px(px)
    );


    //when the dinosaur and the cactus pattern has intersection parts, stop the game
    wire trigger_stop;
    assign trigger_stop = px_dinosaur && px_cactus;


    always @(posedge CLK) begin
        if (START) begin //if button START is pressed
            if(game_status==1'b0)begin
                trigger_start<=1'b1;
            end
        end

        if (trigger_stop) begin
            game_status<=1'b0;
        end

        //only start the game in the blanking period
        if (vs==1'b0) begin
            if (trigger_start==1'b1) begin
                if (game_status==1'b0) begin
                    game_status<=1'b1;//begin the game
                end else begin
                    trigger_start<=1'b0;
                end
            end
        end

        //reset the game
        if (RESET) begin//if button RESET is pressed
            game_status<=1'b0;
            trigger_start<=1'b0;
        end
    end


    //assign BUZZER=1'b1;
    // initial begin
    //     clkdiv<=32'b0;
    // end

endmodule
