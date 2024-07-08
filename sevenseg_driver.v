`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2024 18:15:30
// Design Name: 
// Module Name: sevenseg_driver
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


module sevenseg_driver(
    input clk,
    input clr,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [3:0] in4,
    output reg [3:0] an,
    output reg [6:0] seg
    
    );
    
    wire [6:0] seg1,seg2,seg3,seg4;
    reg [12:0] segclk; // to turn these seg on and off at freq not catchable to human eye
                      // so reaches max value of 8192 and then resets itself
    localparam LEFT=2'b00, MIDLEFT = 2'b01, MIDRIGHT = 2'b10, RIGHT =2'b11;
    reg [1:0] state=LEFT; //FOR THE 4 SEGMENTS
    
    always@(posedge clk)
    segclk<=segclk+1'b1; //counter goes up by 1
    
    always@(posedge segclk[12] or posedge clr)
    begin 
    if(clr==1)
    begin
    seg<=7'b0000000; //on reset displays 8888
    an<=4'b0000;
    state<=LEFT;
    end
    
    else
    begin                       //state machine stats from left state first
    case(state)                 //decoded pattern is loaded into the segment
    LEFT: begin                 //first digit from left is selected by using 0111
        seg<=seg1;
        an<=4'b0111;                
        state<=MIDLEFT;
        end
    MIDLEFT: begin              //next stae changes to midleft and then so on for other digits
         seg<=seg2;
        an<=4'b1011;
        state<=MIDRIGHT;
        end
    MIDRIGHT: begin
         seg<=seg3;
        an<=4'b1101;
        state<=RIGHT;
        end
    RIGHT: begin
        seg<=seg4;
        an<=4'b1110;
        state<=LEFT;
        end
    endcase 
    end
    end
    
    Decoder_7_segment disp1(in1,seg1);
    Decoder_7_segment disp2(in2,seg2);
    Decoder_7_segment disp3(in3,seg3);
    Decoder_7_segment disp4(in4,seg4) ;
    
  
    
endmodule
