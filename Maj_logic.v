`timescale 1ns / 1ps



module Maj_logic(
    input X,
    input Y,
    input Z,
    output reg [0:2]triggers
    );
    
wire maj_logic;
assign maj_logic = (X&Y) | (X&Z) | (Y&Z);
    always @(X,Y,Z)
    begin
        if(maj_logic == X)
            triggers[0] <= 1'b1;
        else 
            triggers[0] <= 1'b0;
        if(maj_logic == Y)
            triggers[1] <= 1'b1;
        else
            triggers[1] <= 1'b0;
        if(maj_logic == Z)
            triggers[2] <= 1'b1;
        else
            triggers[2] <= 1'b0;
    end
endmodule
