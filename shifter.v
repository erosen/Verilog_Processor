/*
 data: [input 32-bit] input data of the Shifter
 shitftamt: [input 5-bit] shift amount
 op: [input 3-bit] operation bit of the Shifter
      when op is 3'd0, shift logical left
	  when op is 3'd1, shift logical right
 y: [output 32-bit] output data of the Shifter 
*/
module shifter(data, shiftamt, op, y);

  input [31:0] data;
  input [4:0] shiftamt;
  input [2:0] op;
  output reg [31:0] y;

  always @(data, shiftamt, op) begin
    case (op)
      3'd0 : y <= data << shiftamt;	// Shift Logical Left
      3'd1 : y <= data >> shiftamt;	// Shift Logical Right
      default: y <= 0;
    endcase
  end

endmodule
