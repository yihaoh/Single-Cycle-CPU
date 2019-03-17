`timescale 1ns / 1ns
/** @module : ALU
 *  @author : Albert Bitdiddle
 *  ALU Module Template 
 *  Adaptive and Secure Computing Systems (ASCS) Laboratory
 */
 
module ALU (
		ALU_Control, 
		operand_A, operand_B, 
		ALU_result, zero
); 
input [3:0]   ALU_Control; 
input [31:0]  operand_A ;
input [31:0]  operand_B ;
output reg zero; 
output reg[31:0] ALU_result;

//--------------Add your code here ------------------ 

// TODO: right now, ALU only ANDs the two operands. You have to implement the rest of the instructions.
always@(*) begin
case(ALU_Control)
4'b0000: ALU_result = operand_A & operand_B;	//and
4'b0001: ALU_result = operand_A | operand_B;	//or
4'b0010: ALU_result = operand_A + operand_B;	//add
4'b0110: ALU_result = operand_A - operand_B;	//sub
4'b0111: ALU_result = (operand_A < operand_B) ? 1:0;	//slt
4'b1100: ALU_result = ~(operand_A | operand_B);	//nor

endcase
//zero = ALU_result == (ALU_result == 0) ? 1 : 0;
end

always@(*) begin
if (ALU_result==0)
	zero = 1;
else
	zero = 0;
end
//assign zero = ALU_result == (ALU_result == 0) ? 1 : 0;


//----------------------------------------------------

endmodule
