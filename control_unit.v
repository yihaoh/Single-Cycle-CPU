`timescale 1ns / 1ns
module Control_Unit(
	 //input clock,
    input [31:0] instruction,
    output reg[1:0] ALU_Op,
    output [4:0] read_sel_a,
    output [4:0] read_sel_b,
    output [4:0] write_sel,
	 output reg[31:0] SignExtend,
    output reg Branch,
	 output reg MemRead,
	 output reg MemtoReg,
	 output reg MemWrite,
	 output reg ALUSrc,
	 output reg RegWrite,
	 output reg RegDst
	 
);

    // TODO This is an unfinished control unit. It serves just to get you going with phase I, so you will need to change it
    // as you go along.
	
	
    assign read_sel_a  = instruction[25:21];	//[20:16];
    assign read_sel_b  = instruction[20:16];	///[15:11];
    assign write_sel   = instruction[15:11];	//[25:21];
	 //assign SignExtend  = instruction[15:0];
	 
	 
	 
	 always@(*) begin
		case(instruction[15])
			1'b0: SignExtend <= {16'b0000000000000000, instruction[15:0]};
			1'b1: SignExtend <= {16'b1111111111111111, instruction[15:0]};
		endcase
		
		case(instruction[31:26])
			6'b101011: begin //sw
							RegDst <= 0;
							ALUSrc <= 1;
							MemtoReg <= 0;
							RegWrite <= 0;
							MemRead <= 0;
							MemWrite <= 1;
							Branch <= 0;
							ALU_Op <= 0;
						  end
							
			6'b100011: begin //lw
							RegDst <= 0;
							ALUSrc <= 1;
							MemtoReg <= 1;
							RegWrite <= 1;
							MemRead <= 1;
							MemWrite <= 0;
							Branch <= 0;
							ALU_Op <= 0;
						  end
						  
			6'b000000: begin //r-type
							RegDst <= 1;
							ALUSrc <= 0;
							MemtoReg <= 0;
							RegWrite <= 1;
							MemRead <= 0;
							MemWrite <= 0;
							Branch <= 0;
							ALU_Op <= 2'b10;
						  end
						  
			6'b001000: begin //addi
							RegDst <= 0;
							ALUSrc <= 1;
							MemtoReg <= 0;
							RegWrite <= 1;
							MemRead <= 0;
							MemWrite <= 0;
							Branch <= 0;
							ALU_Op <= 2'b11;
						  end
						  
			6'b000100: begin //beq
							RegDst <= 0;
							ALUSrc <= 0;
							MemtoReg <= 0;
							RegWrite <= 0;
							MemRead <= 0;
							MemWrite <= 0;
							Branch <= 1;
							ALU_Op <= 2'b01;
						  end
		endcase
	 
	 end
	 
endmodule

