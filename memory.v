`timescale 1ns / 1ns
/** @module : Memory Module
 *  @author : Albert Bitdiddle
 *  Simple Memory Design Template
 *  Adaptive and Secure Computing Systems (ASCS) Laboratory
 */
 
module Memory (
		clock,
    	Address,
   		MemRead, ReadData,
    	MemWrite,writeData
); 

input clock; 
input [31:0]   Address;
input MemRead;
output reg[31:0]  ReadData;
input MemWrite;
input [31:0]   writeData;
 
localparam MEM_DEPTH = 1 << 7;
reg [31:0]     ram [0:MEM_DEPTH-1];
 
//--------------Add your code here ------------------ 

always @ (*) begin
if (MemRead) 
	ReadData = ram[Address];// : 8'd0;//[7:0]
end


always @ (posedge clock) begin
if (MemWrite==1) begin
	ram[Address] = writeData;//[7:0]
end
	
end
//----------------------------------------------------
endmodule
