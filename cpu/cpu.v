module cpu(
	input  clk,
	input  nreset,
	output wire  led,
	output wire  [7:0] debug_port1,	// outputs the Instruction Type (ADD, SUB, etc.)
	output wire  [7:0] debug_port2,	// display Rm
	output wire  [7:0] debug_port3,	// display Rn
	output wire  [7:0] debug_port4,
	output wire  [7:0] debug_port5,
	output wire  [7:0] debug_port6,
	output wire  [7:0] debug_port7
	);

	// declaring local variables
	reg [31:0] temp_pc;
	wire [31:0] pc;
	wire [31:0] pc_n;
	wire [31:0] instruction_set;
	wire [7:0]  shift;
	wire [3:0]  rm;
	wire [3:0]  rn;
	wire [3:0]  rd;
	wire [3:0]  rotate;
	wire [7:0]  immediateValue;
	wire [3:0]  cond_field;
	wire [11:0] dt_address;
	wire [23:0] br_address;
	wire [10:0] ALUCtl_code;
	wire [31:0] ALUOut;
	wire [31:0]  cpsr;
	wire [3:0]  cpsr_n;
	wire [31:0] r1_data;
	wire [31:0] r2_data;
	wire [31:0] next_r14;			// R[14] value to be written into reg file
	wire [31:0] memOut;
	wire write_en;					// gets assigned as an output from alu
	wire read_en;
	wire instruction_en;
	wire ldr_str_en;
	reg temp_write_en;					// gets assigned as an output from alu
	reg temp_read_en;
	reg temp_instruction_en;
	reg temp_ldr_str_en;
	reg [1:0] cycle_counter;
	wire cpsr_enable;
	wire execute_flag;
	// Controls the LED on the board.
	assign led = 1'b1;
	assign pc = temp_pc;
	assign read_en = temp_read_en;
	assign write_en = temp_write_en;
	assign ldr_str_en = temp_ldr_str_en;
	assign instruction_en = temp_instruction_en;

	// These are how you communicate back to the serial port debugger.
	assign debug_port1 = ALUCtl_code[7:0];	// INSTRUCTION  8'h01;
	assign debug_port2 = r1_data[7:0];			// A VALUE (Rm) 8'h02;
	assign debug_port3 = r2_data[7:0];			// B VALUE (Rn) 8'h03;
	assign debug_port4 = cycle_counter;	// IMMEDIATE VALUE 8'h04;
	assign debug_port5 = rm;
	assign debug_port6 = rn;
	assign debug_port7 = rd;


	// initialize and update next
	always @(posedge clk) begin
		if (~nreset) begin //might need to be a "~"
			temp_pc <= 32'b0;
			cycle_counter <= 0;
			temp_write_en <= 0;
			temp_read_en <= 0;
			temp_instruction_en <= 1;
			temp_ldr_str_en <= 0;
		end

		case (cycle_counter)
			0: begin
				temp_pc <= pc_n;
				temp_instruction_en <= 1;
				temp_read_en <= 0;
				temp_ldr_str_en <= 0;
				temp_write_en <= 0;
				cycle_counter <= cycle_counter + 1;
			end

			1: begin
				if (execute_flag) begin
				temp_pc <= pc_n;

				temp_instruction_en <= 0;
				temp_read_en <= 1;
				temp_ldr_str_en <= 0;
				temp_write_en <= 0;
				cycle_counter <= cycle_counter + 1;
				end
			end

			2: begin
			if (execute_flag) begin
			temp_pc <= pc_n;

				temp_instruction_en <= 0;
				temp_read_en <= 0;
				temp_ldr_str_en <= 1;
				temp_write_en <= 0;
				cycle_counter <= cycle_counter + 1;
				end
			end

			3: begin
			if (execute_flag) begin
			temp_pc <= pc_n;
				temp_instruction_en <= 0;
				temp_read_en <= 0;
				temp_ldr_str_en <= 0;
				temp_write_en <= 1;
				cycle_counter <= 0;
			end
			end
		endcase
	end

	// figure out next-pc
	find_next_pc fnp (.clk(clk), .ALUCtl_code(ALUCtl_code), .br_address(br_address),
		.program_counter(temp_pc), .program_counter_next(pc_n), .next_r14(next_r14));

	// fetch instruction
	instruction_memory im (.clk(clk), .rst(nreset), .pc_address(temp_pc), .instruction_set(instruction_set));

	// updates format flags and address/values
	instruction_decoder id (.instruction_set(instruction_set), .rm(rm), .shift(shift), .rn(rn), .rd(rd), .rotate(rotate),
		.immediateValue(immediateValue), .br_address(br_address), .dt_address(dt_address), .ALUCtl_code(ALUCtl_code), .enable(instruction_en), .cpsr_enable(cpsr_enable), .execute_flag(execute_flag), .cpsr(cpsr), .cond_field(cond_field));

	// Register File get and write values
	reg_file rg (.clk(clk), .read_addr1(rn), .read_addr2(rd), .write_addr(rm), .write_data(memOut), .read_enable1(read_en),
		.write_enable1(write_en), .read_data1(r1_data), .read_data2(r2_data));

	// Mmeory File -- The input and output values need to be changed
	memory_file mem (.clk(clk), .addr(r2_data[3:0]), .write_data(r1_data), .ldr_str_en(ldr_str_en), .read_data(memOut), .load_en(instruction_set[20]), .store_en(~instruction_set[20]));

	// ALU File Compute instructions (m	ake sure to deal with cpsr values)
	alu my_alu (.ALUCtl(ALUCtl_code), .A(r1_data), .B(r2_data), .I(immediateValue), .ALUOut(ALUOut), .cpsr(cpsr), .cpsr_enable(cpsr_enable));
	// if instruction is branch and link then write the new pc to R14
endmodule



module cpu_testbench();
	reg clk;
	reg nreset;
	wire led;
	wire  [7:0] debug_port1;	// outputs the Instruction Type (ADD, SUB, etc.)
	wire  [7:0] debug_port2;	// display Rm
	wire  [7:0] debug_port3;	// display Rn
	wire  [7:0] debug_port4;
	wire  [7:0] debug_port5;
	wire  [7:0] debug_port6;
	wire  [7:0] debug_port7;

  parameter CLOCK_PERIOD = 100;
  initial clk = 1;
  always begin
    #(CLOCK_PERIOD/2);
    clk = ~clk;
  end

  cpu dut (.clk(clk), .nreset(nreset), .led(led), .debug_port1(debug_port1),
		.debug_port2(debug_port2), .debug_port3(debug_port3), .debug_port4(debug_port4),
		.debug_port5(debug_port5), .debug_port6(debug_port6), .debug_port7(debug_port7));

	initial begin
		nreset = 1'b0;
		@(posedge clk);
		nreset = 1'b1;
		@(posedge clk);
		nreset = 1'b0;
		repeat (50)
		@(posedge clk);
		$stop;

	end
endmodule
