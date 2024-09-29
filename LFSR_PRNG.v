///////////////
`timescale 1ns/1ns
// Code your design here
module LFSR_PRNG (
input clock,
input reset,
output reg [31:0] rnd
);

wire feedback;
wire [31:0] lfsr_next;

//An LFSR cannot have an all 0 state, thus reset to non-zero value
reg [31:0] reset_value = 13;
reg [31:0] lfsr;
reg [4:0] count;



always @ (posedge clock or posedge reset)
begin
if (reset) begin
lfsr <= reset_value;
count <= 5'h1F;
rnd <= 0;
end
else begin
lfsr <= lfsr_next;
count <= count + 1;
// a new random value is ready
if (count == 5'd31) begin
count <= 0;
rnd <= lfsr; //assign the lfsr number to output after 32 shifts

end
end
end

// X12+x22+x2+x1
assign feedback = lfsr[31] ^ lfsr[21] ^lfsr[1] ^lfsr[0];
  assign lfsr_next = {feedback,lfsr[31:1]};

endmodule
