/*
  a: [input 32-bit] input data for ALU valA
  b: [input 32-bit] input data for ALU valB
  aluop: [input 3-bit] ALU operation bits
  result:[output 32-bit] ALU result
*/
module alu(a, b, aluop, result);
  
  input [31:0] a;
  input [31:0] b;
  input [2:0] aluop;
  output reg [31:0] result;
  
  always @(aluop, a, b) begin
    case (aluop)
      3'd0 : result <= a + b;			// add
      3'd1 : result <= a & b; 			// and
      3'd2 : result <= ~(a & b);		// nand
      3'd3 : result <= a | b;			// or
      3'd4 : result <= a ^ b;			// xor
      3'd5 : result <= a < b ? 1 : 0;		// a < b   
      default: result <= 0;
    endcase
  end

endmodule
