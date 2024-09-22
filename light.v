`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2024 06:16:02 PM
// Design Name: 
// Module Name: light
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


module light(

output reg [15:0] ball,
output wire [7:0]an,
output wire [6:0]a_g, 
input clk, reset,
input [15:0] player
    );
 reg [4:0] state; 
 reg caught;
 reg [15:0] prev_player;
 reg forward;
 reg [5:0] pause; 
 reg [3:0] score1; 
 reg [3:0] score2; 
 
 parameter max = 14;
 
 //assign an = 8'b11101110;
   assign an = 8'b11111110; 
 assign dp = 1; 
 
 hex7seg D1(.x(score1), .a_g(a_g));
 //hex7seg D2(.x(score2), .a_g(a_g));  
 
 always @(posedge clk, posedge reset)
 begin 
 
 //reseting 
    if(reset || (state == 1 && ~forward))
    begin
        state = 0; 
        ball <= 1;
        caught =0;
        forward <= 1;       
         score1 <= 0;
         if(reset)
          prev_player =-1; 
        
    end 
    
    else 
    begin 
        if( ~caught && player != prev_player && prev_player != -1)
            begin
              if(player == ball)         
                 begin 
                    caught = 1; 
                    pause <= 0;
                    forward = ~forward;
                    score1 <= score1 + 1; 
                 end
                 prev_player = player;     
            end 
          
         //if player has "caught" light   
        if(caught) 
        begin
        ball <= ball; 
         if(pause == max) 
           begin 
             caught = 0; 
             pause = 0;
             if(score1 == 9) 
                begin 
                    score1 <= 0;  
                end   
           end
        else 
             pause <= pause + 1; 
        
        end 
         
         
    //light moving forward from right to left 
        if(~caught && forward)
        begin
            state <= state + 1; 
            ball <= ball << 1; 
        end  
      
      //checking if we've reached last led  
        if(state == 15)
        begin 
           forward = 0; 
           score1 = 0; 
        end
     
        
      //light moving backwards  
        if(~caught && ~forward)
        
        begin 
            state<= state -1; 
            ball <= ball >>1;
        end  
     
        prev_player = player;
        
     end
 end   
 
endmodule

module hex7seg(
    input wire [3:0]x,
    output reg [6:0]a_g
    );
always@(*)
begin 
    case(x)
    0: a_g = 7'b0000001;
    1: a_g = 7'b1001111;
    2: a_g = 7'b0010010;
    3: a_g = 7'b0000110;
    4: a_g = 7'b1001100;
    5: a_g = 7'b0100100;
    6: a_g = 7'b0100000;
    7: a_g = 7'b0001111;
    8: a_g = 7'b0000000;
    9: a_g = 7'b0000100;
    
    default: a_g = 7'b0000001;
   endcase 
   end
  endmodule




