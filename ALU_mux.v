`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:43:12 12/04/2017 
// Design Name: 
// Module Name:    ALU_mux 
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
module ALU_mux(
	ReadData2, SignExtend, ALU2, ALUSrc
    );

	input [31:0] ReadData2, SignExtend;
	output reg[31:0] ALU2;
	input ALUSrc;
	
	always@(*) begin
		case(ALUSrc)
			1'b0: ALU2 = ReadData2;
			1'b1: ALU2 = SignExtend;
		endcase
	end

endmodule
