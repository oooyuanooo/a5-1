`timescale 1ns / 1ps

module LFSR_X(
    input shift_bit,
    input trigger,
    input clk,
    input reset_n,
    output [0:18] X
    );
    
reg [0:18] X_reg,X_next;
wire taps;
    
    assign taps = X_reg[13]^X_reg[16]^X_reg[17]^X_reg[18];
    always @(posedge clk,negedge reset_n,posedge trigger)
    begin
        if(~reset_n)
            X_reg <= 'b0;
        else if (trigger)
            X_reg <= {taps^shift_bit,X_reg[0:17]};
    end
    
assign X = X_reg;  
     
endmodule
