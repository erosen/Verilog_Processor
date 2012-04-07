module testbench;

reg  clock;
reg[17:0] instruct;
reg[17:0] instructt[8:0];
wire[31:0] muxout;
integer i;

wiring w(instruct, clock, muxout);

initial
begin
   $dumpfile("cpu.dump"); //save waveforms in this file
   $dumpvars(0,testbench); //save all waveforms
   clock = 0;
   //NAND R3, R1, R2
   instructt[0] = 18'b010_00011_00001_00010;
   //SRL R4, R3, 28
   instructt[1] = 18'b111_00100_00011_11100;
   //SRL R5, R4, 1
   instructt[2] = 18'b111_00101_00100_00001;
   //XOR R1, R4, R5
   instructt[3] = 18'b100_00001_00100_00101;
   //SLL R2, R5, 1
   instructt[4] = 18'b110_00010_00101_00001;
   //OR  R6, R1, R2
   instructt[5] = 18'b011_00110_00001_00010;
   //ADD R7, R4, R6
   instructt[6] = 18'b000_00111_00100_00110;
   //SGT R8, R4, R6
   instructt[7] = 18'b101_01000_00100_00110;
   //AND R9, R6, R8
   instructt[8] = 18'b011_01001_00110_01000;
   
   for( i = 0; i < 9; i = i + 1)
   begin
      instruct=instructt[i];
	  clock = 0;
      #10
      clock = 1;
      #10
      $display("instruct = %b", instruct," muxout = %b", muxout);
   end
end

endmodule
