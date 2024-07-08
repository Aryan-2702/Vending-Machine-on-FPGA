`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2024 18:05:22
// Design Name: 
// Module Name: Decoder_7_segment
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


module Decoder_7_segment(
    input [3:0] in,         //4 bits going in the segment
    output reg [6:0] seg        //display the bcd no in 7 segment
    );
    
    always@(in)
    begin
    case(in)
    0:seg=7'b0000001;
    1:seg=7'b1001111;
    2:seg=7'b0010010;
    3:seg=7'b0000110;
    4:seg=7'b1001100;
    5:seg=7'b0100100;
    6:seg=7'b0100000;
    7:seg=7'b0001111;
    8:seg=7'b0000000;
    9:seg=7'b0000100;
    endcase
    end
    
    
    
endmodule
