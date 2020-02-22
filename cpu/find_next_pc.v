//This module will reset at pc=0, and will increment according to the program instructions.
//If the instructions are Branch, then this program will figure out what PC to branch to.
//if the instructions are not branch then this program will increment the PC by 1 instruction set.

//input includes the instruction
//output is the next program counter value/target
module find_next_pc(
	input wire clk,
	input wire [10:0] ALUCtl_code,
	input wire [23:0] br_address,
	input wire [31:0] program_counter,
	output wire [31:0] program_counter_next,
	output wire [31:0] next_r14);

	/*
	input wire clk;
	input wire [10:0] ALUCtl_code;		// this tells us what instruction set it is.
	input wire [23:0] br_address;			// tells us where to branch to
	input wire [31:0] program_counter;
	output reg [31:0] program_counter_next;
	output reg [31:0] next_r14;

	*/

	reg [31:0] temp_program_counter_next;
	reg [31:0] temp_next_r14;

	assign program_counter_next = temp_program_counter_next;
	assign next_r14 = temp_next_r14;

	reg [10:0] Branch = 11'd31;
	reg [10:0] BranchLink = 11'd32;


	always @(*) begin
		case(ALUCtl_code)
			Branch: begin
				temp_next_r14 <= 32'dx;
				temp_program_counter_next <= program_counter + br_address;
			end

			BranchLink: begin
				temp_next_r14 <= program_counter + 32'd1;
				temp_program_counter_next <= program_counter + br_address;
			end

			default: begin
				temp_next_r14 <= 32'dx;
				temp_program_counter_next <= program_counter + 32'd1; //we will increment by just one
			end
		endcase
	end

endmodule

/*
module find_next_pc_testbench();
	logic clk;
	logic [10:0] ALUCtl_code;
	logic [23:0] br_address;
	logic [31:0] program_counter;
	logic [31:0] program_counter_next;
	logic [31:0] next_r14;



  parameter CLOCK_PERIOD = 100;
  initial clk = 1;
  always begin
    #(CLOCK_PERIOD/2);
    clk = ~clk;
  end

  find_next_pc dut (.clk, .ALUCtl_code, .br_address, .program_counter, .program_counter_next, .next_r14);

	initial begin
		// No branching, pc = pc + 1
		br_address = 23'd0; ALUCtl_code = 11'd0; program_counter = 32'd0; @(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);

		// branch but no link
		br_address = 23'd500; ALUCtl_code = 11'd31; program_counter = 32'd234; @(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);

		// branching and linking R[14] = pc, pc = pc + br_address
		br_address = 23'd600; ALUCtl_code = 11'd32; program_counter = 32'd675; @(posedge clk);
		@(posedge clk);
		$stop;

	end
endmodule
*/
