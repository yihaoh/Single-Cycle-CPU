`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:47:22 12/04/2017 
// Design Name: 
// Module Name:    WB_mux 
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
module WB_mux(
	ReadData, ALU_out, WriteData, MemtoReg
    );
	 
	 //input clock;
	 input [31:0] ReadData, ALU_out;
	 output reg[31:0] WriteData;
	 input MemtoReg;
	 /*reg MemtoReg_d;
	 wire MemtoReg_w;
	 
	 always@(posedge clock) begin
		MemtoReg_d <= MemtoReg;
	 end
	 
	 assign MemtoReg_w = MemtoReg ? MemtoReg_d : MemtoReg;
	 */
	 always@(*) begin
		case(MemtoReg) 
			1'b0: WriteData = ALU_out;
			1'b1: WriteData = ReadData;
		endcase
	end


endmodule
