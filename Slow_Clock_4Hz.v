`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2024 18:08:51
// Design Name: 
// Module Name: Slow_Clock_4Hz
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


module Slow_Clock_4Hz(
    input clk_in,
    output reg clk_out
    );
    reg [25:0] count=0;    // 110-->4mhz   100/4=25,000,000 cycles 
           //so half cycle of 12,500,000
           // so after 12,500,000 cycles logic sets to zero and inverts the clock
           //2^25 equals a number which is greater than 25Million
           
    always@(posedge clk_in)
    begin
    count<=count+1;
    if(count==12_500_000)
    begin
    count<=0;
    clk_out=~clk_out; //reset and invert
    end
    end

endmodule
