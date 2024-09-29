// Code your testbench here
// or browse Examples
`timescale 1ns/1ns
module PRNG_LFSR_tb;
wire clock;
wire reset;
wire [31:0] rnd;

reg clk;
reg rst;

LFSR_PRNG rando(
.clock (clock),
.reset (reset),
.rnd (rnd)
);

assign clock = clk;
assign reset = rst;

// generate the clock
initial begin
clk <= 0;
forever begin
#10 ;
clk <= ~clk;
end
end

initial begin
rst <= 1;
#50;
rst <= 0;
end

initial begin
  $monitor("rand:%h",rnd);
end
initial #1000 $finish();
endmodule

