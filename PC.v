`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:30:50 12/04/2017 
// Design Name: 
// Module Name:    PC 
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
module PC(
	input clk,
	input reset,
	input Branch,
	input zero,
	input [31:0] SignExtend,
	//input [31:0] PC_in,
	output [31:0] IM_Address
    );
	 
	 //reg [31:0] next1, next2;
	 wire PCSrc;
	 assign PCSrc = Branch && zero;
	 
	 
	 reg [31:0] PC;
	always @ (posedge clk) begin
		if (reset) begin
			PC = 0;
		end
		else begin
			PC = PCSrc ? PC + 1 + SignExtend : PC + 1; 
		end
	end
	 
	 assign IM_Address = PC;


endmodule
