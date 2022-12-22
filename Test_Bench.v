`timescale 10ps / 1ps

module test;
reg[7:0] in_str[11:0];
reg[7:0] out_str[11:0];
reg[0:63] secret_key;
reg[0:21] public_key;

reg shift_bit;
reg [0:2] triggers;
reg clk;
reg [0:2] resets;
reg x_maj,y_maj,z_maj;
wire [0:18]X;
wire [0:21]Y;
wire [0:22]Z;
wire maj_logic;
wire [0:2] maj_triggers;

LFSR_X l_X(shift_bit,triggers[0],clk,resets[0],X);
LFSR_Y l_Y(shift_bit,triggers[1],clk,resets[1],Y);
LFSR_Z l_Z(shift_bit,triggers[2],clk,resets[2],Z);
Maj_logic maj(x_maj,y_maj,z_maj,maj_triggers);

initial 
begin
    clk = 1'b1;
    forever
        #5 clk = ~clk;
end

initial
begin
    secret_key = 64'b0101000101010111010001010101001001000001010100110100010001000110;
    public_key = 22'b1101001110000110010001;
    $readmemb("/home/jpyuan/A5-1/str.txt",in_str);
end

integer i,j;
initial 
begin
    #5
    resets = 3'b000;
    triggers = 3'b111;
    #10
    resets = 3'b111;
    for(i=0;i<64;i=i+1)
    begin
    shift_bit = secret_key[i];
    #10;
    end
    for(i=0;i<22;i=i+1)
    begin
    #10 shift_bit = public_key[i];
    end
    shift_bit = 1'b0;
    triggers = 3'b000;
    for(i=0;i<100;i=i+1)
    begin
        #10
        x_maj = X[8];
        y_maj = Y[10];
        z_maj = Z[10];
        triggers = maj_triggers;
    end
    #1000
    for(i=0;i<12;i=i+1)
    begin
        for(j=0;j<8;j=j+1)
        begin
        #10 
        x_maj = X[8];
        y_maj = Y[10];
        z_maj = Z[10];
        triggers = maj_triggers;
        out_str[i][j] = X[18]^Y[21]^Z[22]^in_str[i][j];
        end
        $display("line: %d  input: %b  output : %b",i+1,in_str[i],out_str[i]);
    end
    $writememb("/home/jpyuan/A5-1/output.txt",out_str);
    #10 $finish;
end

endmodule
