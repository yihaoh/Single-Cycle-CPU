`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:51 12/04/2017 
// Design Name: 
// Module Name:    RF_mux 
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
module RF_mux(
	in_1, in_2, out, RegDst
    );
	input [4:0] in_1;
	input [4:0] in_2;
	output reg[4:0] out;
	input RegDst;
	
	always@(*) begin
		case(RegDst)
			1'b0: out = in_1;
			1'b1: out = in_2;
		endcase
	end

endmodule
