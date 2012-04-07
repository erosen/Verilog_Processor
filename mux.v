/*
 a: [input 32-bit] MUX input A
 b: [input 32-bit] MUX input B
 sel: [input 1-bit] MUX selection bit
 y: [output 32-bit] MUX output
*/
module mux(a, b, sel, y);
 
  input [31:0] a;	// input A
  input [31:0] b;	// input B
  input sel;		// Select line
  output reg [31:0] y;	// output
  
  always @(a, b, sel) begin 
    y <= sel ? b : a;
  end

endmodule
