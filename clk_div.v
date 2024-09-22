`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2024 07:07:25 PM
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input in_clk, rst, 
    output reg div_clk
    );
    
    reg [32: 0] count;
    parameter max = 7499999;
    
    always @(posedge in_clk, posedge rst)
    begin 
        if(rst) 
            begin 
                count <= 0; 
                div_clk <= 0; 
            end
        else if(count == max)
            begin 
                count <= 0; 
                div_clk <= ~div_clk;
            end
        else 
            begin 
                count <= count + 1;
                div_clk <= div_clk;
            end
    end 
endmodule
