`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2024 17:53:57
// Design Name: 
// Module Name: Top_Module
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


module Top_Module(
    input clk,
    input btnU, //reset
    input btnC, //buy
    input btnR, //25cents
    input btnL, //100cents($1)
    input [7:0] sw, //first four to slect the product and rest to load the product
    output [7:0] led,   //[3:0]=Prodcut Purchased, [7:4]=Out of stock
    output [6:0] seg,
    output [3:0] an
    );
    
    wire [11:0] money;
    wire deb_btnC, deb_btnR, deb_btnL;
    
    debounce dbnC(clk, btnC, deb_btnC); //for buy
    debounce dbnR(clk, btnR, deb_btnR); //Quarter
    debounce dbnL(clk, btnL, deb_btnL); //dollar
       
    wire [3:0] thos, huns, tens, ones;
    
    binarytoBCD BCD(money,thos,huns,tens,ones);
    sevenseg_driver SSD(clk,deb_btnC, thos, huns, tens, ones, an, seg);
    
    Vending_Machine VM( clk, 
                        btnU, 
                        deb_btnR, 
                        deb_btnL, 
                        sw[3:0], 
                        deb_btnC, 
                        sw[7:4],
                        money, 
                        led[3:0], 
                        led[7:4]);
    
    endmodule   
    

