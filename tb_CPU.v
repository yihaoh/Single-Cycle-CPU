`timescale 1ns / 1ns
/** @module : CPU
 *  @author : Albert Bitdiddle
 *  CPU Module Testbed 
 *  Adaptive and Secure Computing Systems (ASCS) Laboratory
 */


module tb_CPU (); 
reg clock, reset, start; 
reg [31:0] program_counter;  


CPU cpu (
    .clock(clock), 
    .reset(reset), 
    .start(start), 
    .program_counter(program_counter)
);     

    
    // Clock generator
    always #1 clock = ~clock;

    initial begin
        clock = 0;
        reset = 1;
        start = 0;
			#10 program_counter = 32'b0;
        // Right now the regfile is empty. You can manually set the values in the regfile with something like:
        // cpu.registerFile.memory[10] = 100;
        // This will allow you to test your ALU and register file before the processor is complete. 

        
				
				cpu.registers.registers[1] = 5;
				cpu.registers.registers[2] = 6;

			//Instruction for testbench
			// 0: see wheter register 1 and 2 hold equal value, if yes, jump to instruction 4 
			// 1: add value in register 1 and 2, store it in register 3
			// 2: add value in r
        
			#10 cpu.ins_Memory.ram[0] = 32'b000100_00001_00010_0000_0000_0000_0100; //beq
		  #10 cpu.ins_Memory.ram[1] = 32'b000000_00001_00010_00011_00000_100000;  //add
		  #10 cpu.ins_Memory.ram[2] = 32'b000000_00010_00011_00100_00000_100000;	//r-type || src reg 1 || src reg 2 || dest reg || 00000 || funct field 
		  #10 cpu.ins_Memory.ram[3] = 32'b0010_0000_1000_0101_0000_0000_0000_0001;	//addi code || source reg || dest reg || immediate
		  #10 cpu.ins_Memory.ram[4] = 32'b101011_00000_00010_0000_0000_0000_0001;	//sw code || first address operand alu || register that carries the value to be store || immediate add to operand to calculate dataMem addr
		  
		  
		  #10 cpu.ins_Memory.ram[5] = 32'b0000_0000_0000_0000_0000_0000_0000_0000; //nop
		  
		  #10 cpu.ins_Memory.ram[6] = 32'b1000_1100_0000_0111_0000_0000_0000_0001;	//lw code || first addr opd alu || register to store value || immediate add to opd to cal dataMem addr
		  
		  #10 cpu.ins_Memory.ram[7] = 32'b000000_00001_00010_01000_00000_101010;	//slt
		  
		  #10 cpu.ins_Memory.ram[8] = 32'b000000_00010_00001_01001_00000_100010;	//sub
		  
			#10 reset = 0;
            start = 1;
				//#100 program_counter = 32'd1;
        // If you set the values of those  registers 1 and 2 to something other than 0, you should see some result in
        // register 3.

     end
     
endmodule
