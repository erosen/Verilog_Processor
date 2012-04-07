/*
opcode: [input 3-bit] op code from the fetched instruction
shiftop: [output 3-bit] operation bits for the Shifter
aluop: [output 3-bit] operation bits for the ALU
muxselect: [output 1-bit] selection bit for the MUX
writeenable: [output 1-bit] write enable signal for the RegFile
*/
module control(opcode, shiftop, aluop, muxselect, writeenable);

  input [2:0] opcode; 	// op code
  output reg [2:0] shiftop;	// Shift operation
  output reg [2:0] aluop;	// ALU Operation
  output reg muxselect; 	// Multiplexer Select
  output reg writeenable;	// Write Enable on/of


  always @(opcode) begin
   case(opcode)
    3'b000 : begin aluop = 0; shiftop = 2; muxselect = 0; writeenable = 1; end
    3'b001 : begin aluop = 1; shiftop = 2; muxselect = 0; writeenable = 1; end
    3'b010 : begin aluop = 2; shiftop = 2; muxselect = 0; writeenable = 1; end   
    3'b011 : begin aluop = 3; shiftop = 2; muxselect = 0; writeenable = 1; end
    3'b100 : begin aluop = 4; shiftop = 2; muxselect = 0; writeenable = 1; end
    3'b101 : begin aluop = 5; shiftop = 2; muxselect = 0; writeenable = 1; end
    3'b110 : begin aluop = 6; shiftop = 0; muxselect = 1; writeenable = 1; end
    3'b111 : begin aluop = 6; shiftop = 1; muxselect = 1; writeenable = 1; end
    default: begin aluop = 0; shiftop = 2; muxselect = 0; writeenable = 0; end
    endcase
  end
 
endmodule

 

