`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2024 07:20:50 PM
// Design Name: 
// Module Name: test_game
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


module test_game(
input [15:0] player, 
input clk, reset, 
output [15: 0] ball,
output wire [7:0]AN,
output wire [6:0]a_g
    );
    wire sl_clk; 
    wire [3:0] score1, score2; 
    
    
    clk_div c1(clk, reset, sl_clk); 
    //light L1(ball, AN, a_g, score1, score2, sl_clk, reset, player);
    light l1(ball, AN, a_g, sl_clk, reset, player); 
    //counter s1(clk, score1, score2, a_g, AN); 
endmodule
