`timescale 1ns / 1ns
/** @module : CPU
 *  @author : Albert Bitdiddle
 *  CPU Module Template 
 *  Adaptive and Secure Computing Systems (ASCS) Laboratory
 */

module CPU (
  clock, 
  reset, 
  start,
  program_counter
); 

    input clock, reset, start; 
    input [31:0]  program_counter; 
     
    wire [31:0] ReadData1, ReadData2, SignExtend,  RegWrite_RF, MemReadData, ALU_operand_B, ALU_result;
    wire ALU_zero, MemWrite, MemRead, MemtoReg, RegWrite, RegDst, Branch, ALUSrc;

    // TODO: the instruction is currently a register, so we can control it from the testbench.
    // Later, we will want to turn it into a wire and drive it from instruction memory.
    wire [31:0] instruction;
	 wire [31:0] IM_Address;
	 //reg [31:0] PC_1;//PC_1 = 0;
	 wire [1:0] ALU_Op;

    // Control signals from the control unit.
    wire [3:0] ALU_Control;
    wire [4:0] regfile_read_sel1, regfile_read_sel2, regfile_write_sel, reg_write_addr;
    
	 
	 PC pc(
		.clk(clock),
		.reset(reset),
		.Branch(Branch),
		.zero(ALU_zero),
		.SignExtend(SignExtend),
		//.PC_in(PC_1),
		.IM_Address(IM_Address)
	 );
	 //end
	 
	 
	 Memory ins_Memory(
		.clock(clock),
    	.Address(IM_Address),//PC_1),
   	.MemRead(1'b1),
		.ReadData(instruction),
    	.MemWrite(1'b0),
		.writeData(0)
	 
	 );
	 
	 
	 


    Control_Unit control (
		//.clock(clock),
		.instruction(instruction),
		.ALU_Op(ALU_Op),
		.read_sel_a(regfile_read_sel1),
		.read_sel_b(regfile_read_sel2),
		.write_sel(regfile_write_sel),
		.SignExtend(SignExtend),
		.Branch(Branch),
		.MemRead(MemRead),
		.MemtoReg(MemtoReg),
		.MemWrite(MemWrite),
		.ALUSrc(ALUSrc),
		.RegWrite(RegWrite),
		.RegDst(RegDst)
    );
	 
	 
	 RF_mux rf_mux(
		.in_1(regfile_read_sel2), 
		.in_2(regfile_write_sel), 
		.out(reg_write_addr), 
		.RegDst(RegDst)
	 );
	

    registerFile registers (
        .clock     (clock            ),
        .reset     (reset            ),
        .read_sel1 (regfile_read_sel1),
        .read_sel2 (regfile_read_sel2),
        .write     (RegWrite    ),
        .write_data(RegWrite_RF       ),
        .write_sel (reg_write_addr),
        .read_data1(ReadData1    ),
        .read_data2(ReadData2    )
    ); 
	 
	 ALU_mux alu_mux(
		.ReadData2(ReadData2),
		.SignExtend(SignExtend),
		.ALU2(ALU_operand_B),
		.ALUSrc(ALUSrc)
	 );

	 
	 ALU_Control alu_control(
		.instruction(instruction),
		.ALU_Op(ALU_Op),
		.ALU_Control(ALU_Control)
	 );


    ALU ALU_unit(
        .ALU_Control(ALU_Control  ),
        .operand_A  (ReadData1),
        .operand_B  (ALU_operand_B),
        .zero       (ALU_zero     ),
        .ALU_result (ALU_result   )
    ); 
	 
	 
	 
	 

    Memory data_Memory (
		.clock(clock),
    	.Address(ALU_result),
   	.MemRead(MemRead),
		.ReadData(MemReadData),
    	.MemWrite(MemWrite),
		.writeData(ReadData2)
    );
	 
	 WB_mux wb_mux(
		//.clock(clock),
		.ReadData(MemReadData), 
		.ALU_out(ALU_result), 
		.WriteData(RegWrite_RF), 
		.MemtoReg(MemtoReg)
	 );

		
endmodule
