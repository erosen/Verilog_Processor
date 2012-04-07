/*
 clk: [input 1-bit] clock signal
 RdAddr1: [input 5-bit] read destination 1 of the register file
 RdAddr2: [input 5-bit] read destination 2 of the register file
 RdData1: [output 32-bit] read data 1 from destination 1
 RdData2: [output 32-bit] read data 2 from destination 2
 WriteEnable: [input 1-bit] write enable signal
 WriteAddr: [input 5-bit] write destination
 WriteData: [input 32-bit] write data
*/
module reg_file(clk, RdAddr1, RdAddr2, RdData1, RdData2, WriteEnable, WriteAddr, WriteData);

  input clk;			// Clock signal
  input [4:0] RdAddr1;		// address for read port 1 (Reg[RA])
  input [4:0] RdAddr2;		// address for read port 2 (Reg[RB], Reg[RC] for ST)  
  output [31:0] RdData1;	// read data for port 1
  output [31:0] RdData2;	// read data for port 2
  input WriteEnable;		// write enable, active high
  input [4:0] WriteAddr;	// address for write port (Reg[RC])
  input [31:0] WriteData;	// write data
  integer i;

  reg [31:0] registers[31:0];   // the register file itself
   
  initial begin
    for (i = 0; i <= 31; i = i+1) begin
      registers[i] = 0;
    end
  end

  assign RdData1 = registers[RdAddr1];
  assign RdData2 = registers[RdAddr2];

  always @(clk)
    if (WriteEnable) registers[WriteAddr] <= WriteData;

endmodule
