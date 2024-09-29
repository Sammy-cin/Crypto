# Crypto
 An LFSR is simply a shift register with some of its bits (known as taps) XOR'd with themselves to create a feedback term.

When implementing an LFSR it's width and it's repeatability must be kept under consideration .An N-bit LFSR will be able to generate (2**N) - 1 random bits before it starts repeating. 
Here I have used a 32 bit LFSR to generate random numbers. So possible random   states would be 4 billion. The tap bits are taken based on the chart from Xilinx
 
The number generated itself is not random but the feedback bits are. 
 In my code below I have an output of 32 bits and a 32 bit random number is accomplished by shifting the feedback bit enough times to equal the desired output size. In my case when it has shifted 32 times it will be assigned to the output
  
Do note that this is not pure random, this number can be predicted if the algorithm is known. 
The generated “random” numbers are not cyptographically secure , but this little project gives us an idea of how hardware implementation of cryptographically secure pseudorandom number generator is possible with improved algorithms. 

Reference:https://simplefpga.blogspot.com/2013/02/random-number-generator-in-verilog-fpga.html#google_vignette
