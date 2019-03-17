`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:35:10 12/05/2017 
// Design Name: 
// Module Name:    ALU_Control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU_Control(
	input [31:0] instruction, 
	input [1:0] ALU_Op,
	output reg[3:0] ALU_Control
    );
	 
	 always @(*) begin
		case(ALU_Op)
			2'b00:	ALU_Control = 4'b0010;//lw, sw
			2'b01:	ALU_Control = 4'b0110;//beq
			2'b10:	begin //r-type
							case(instruction[5:0])
								6'b100000:	ALU_Control = 4'b0010;	//add
								6'b100010:	ALU_Control = 4'b0110;	//sub
								6'b100100:	ALU_Control = 4'b0000;	//and
								6'b100101:	ALU_Control = 4'b0001;	//or
								6'b101010:	ALU_Control = 4'b0111;	//slt
							endcase
						end
			2'b11:	ALU_Control = 4'b0010;//addi
		endcase
	 end

endmodule
