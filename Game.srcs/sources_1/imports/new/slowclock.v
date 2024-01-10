`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Module Name: slowclock
// Name: Komal Joshi
//Roll No.: 21PHC1R16
//////////////////////////////////////////////////////////////////////////////////


module slowclock (
    input clk_in,
    output reg clk_out);
    
    reg [20:0] period_count = 0;


always @ (posedge clk_in)
    if (period_count!= 500000 - 1)
        begin
        period_count<= period_count + 1;
        clk_out <= 0; //clk_out gets 0.
        end
    else
        begin
        period_count <= 0;
        clk_out <= 1;
    end
endmodule

