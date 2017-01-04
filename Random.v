`timescale 1ns / 1ps
module Random(
    input clk,
    input RESET,
    output reg [4:0] data
    );

    reg [4:0] data_next;

    always @(posedge clk) begin
        data_next[4] = data[4]^data[1];
        data_next[3] = data[3]^data[0];
        data_next[2] = data[2]^data_next[4];
        data_next[1] = data[1]^data_next[3];
        data_next[0] = data[0]^data_next[2];
    end

    always @(posedge clk)
        if(RESET)
            data <= 5'h1f;
        else
            data <= data_next;

    endmodule

endmodule
