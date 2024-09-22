`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2024 07:11:44 PM
// Design Name: 
// Module Name: clk_div_tb
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


module clk_div_tb(

    );
    reg clk, rst; 
    wire div_clk;
    
    clk_div c1(clk, rst, div_clk); 
    
    initial 
    begin 
    clk = 0; 
    rst = 1; 
    
    #10 rst = 0;
    end 
    
    always #2 clk = ~clk; 
endmodule
