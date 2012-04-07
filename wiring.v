/*
instruct: [input 18-bit] instruction encoding bits
clock: [input 1-bit] clock signal
muxout: [output 32-bit] output data of the MUX
*/
module wiring(instruct, clock, muxout);

  input [17:0] instruct;
  input clock;
  output [31:0] muxout;

  /* CONTROL WIRES */
  wire [2:0] opcode = instruct[2:0];
  wire clk = clock;
  wire mSel, writeEnable;

  /* ALU WIRES */
  wire [31:0] aluOut, aluAin, aluBin;
  wire [2:0] aluOp;
 
  /* SHIFT WIRES */
  wire [31:0] shiftOut;
  wire [4:0] shiftAmount = instruct[17:13];
  wire [2:0] shiftOp;

  /* MUX WIRES OUT */
  wire [31:0] muxout; 
  
  /* REGISTER WIRES */
  wire [4:0] regD = instruct[7:3];
  wire [4:0] regS1 = instruct[12:8];
  wire [31:0] writeData;


  mux my_mux(aluOut, shiftOut, mSel, muxout);

  alu my_alu(aluAin,aluBin, aluOp, aluOut);

  reg_file my_regfile(clk, regS1, shiftAmount, aluAin, aluBin, writeEnable, regD, muxout);

  control my_control(opcode, shiftOp, aluOp, mSel, writeEnable);

  shifter my_shifter(aluBin, shiftAmount, shiftOp, shiftOut);
	
endmodule
