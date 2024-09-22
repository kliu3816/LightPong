`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2024 06:29:28 PM
// Design Name: 
// Module Name: light_tb
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


module light_tb(

    );
    
    reg clk, reset; 
    reg [15:0] player; 
    wire [15:0] ball; 
    wire [7:0] an; 
    wire [6:0] a_g; 
      
    
   light l1(ball, an, a_g, clk, reset, player);
    
    initial 
    begin
    reset = 1; 
    clk = 0; 
    
    #50 reset = 0; player = 0; 
    #85 player = 256;
    #50 player = 0; 
    end 
    
    always #2 clk = ~clk; 
    
endmodule
