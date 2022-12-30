`timescale 1ns / 1ps



module LFSR_Y(
    input shift_bit,
    input trigger,
    input clk,
    input reset_n,
    output [0:21] Y
    );
    
reg [0:21] Y_reg,Y_next;
wire taps;

    assign taps = Y_reg[20]^Y_reg[21];
    always @(posedge clk,negedge reset_n,posedge trigger)
    begin
        if(~reset_n)
            Y_reg <= 'b0;
        else if (trigger)
            Y_reg <= {taps^shift_bit,Y_reg[0:20]};
    end
        
assign Y = Y_reg;
     
endmodule
