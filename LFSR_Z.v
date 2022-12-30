`timescale 1ns / 1ps


module LFSR_Z(
    input shift_bit,
    input trigger,
    input clk,
    input reset_n,
    output [0:22] Z
    );
    
reg [0:22] Z_reg,Z_next;
wire taps;

    assign taps = Z_reg[7]^Z_reg[20]^Z_reg[21]^Z_reg[22];
    always @(posedge clk,negedge reset_n,posedge trigger)
    begin
        if(~reset_n)
            Z_reg <= 'b0;
        else if (trigger)
            Z_reg <= {taps^shift_bit,Z_reg[0:21]};
    end
        
assign Z = Z_reg; 
     
endmodule
