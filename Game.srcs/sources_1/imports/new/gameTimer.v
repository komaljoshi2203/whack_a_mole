`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2021 03:35:45 PM
// Design Name: 
// Module Name: gameTimer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module timerClock(
    input clk_in,
    output  reg clk_out);
    
    reg [27:0] period_count = 0;


always @ (posedge clk_in) //1 hZ clock, 1 sec
    if (period_count != 100_000_000 - 1) //100 Mhz
        begin
        period_count<=  period_count + 1;
         clk_out <= 0; 
         end
                 
    else
        
        begin
        period_count <= 0;
        clk_out <= 1;
end
 
endmodule
