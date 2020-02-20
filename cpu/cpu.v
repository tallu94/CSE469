module cpu(
	input  wire clk,
	input  wire nreset,
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
	reg [31:0] pc;
	reg [31:0] pc_n;
	reg [31:0] instruction_set;
	reg [7:0]  shift;
	reg [3:0]  rm;
	reg [3:0]  rn;
	reg [3:0]  rd;
	reg [3:0]  rotate;
	reg [7:0]  immediateValue;
	reg [3:0]  cond_field;
	reg [11:0] dt_address;
	reg [23:0] br_address;
	reg [10:0] ALUCtl_code;
	reg [3:0]  cpsr;
	reg [3:0]  cpsr_n;
	reg [31:0] rm_data;
	reg [31:0] rn_data;
	reg [31:0] next_r14;			// R[14] value to be written into reg file
	reg [31:0] A;					// ouput from reg file --> input in alu
	reg [31:0] B;					// ouput from reg file --> input in alu
	reg write_en;					// gets assigned as an output from alu
	reg read_en;
	reg instruction_en;
	reg ldr_str_en;
	reg [1:0] cycle_counter;

	// Controls the LED on the board.
	assign led = 1'b1;

	// These are how you communicate back to the serial port debugger.
	assign debug_port1 = ALUCtl_code[7:0];	// INSTRUCTION  8'h01;
	assign debug_port2 = A[7:0];			// A VALUE (Rm) 8'h02;
	assign debug_port3 = B[7:0];			// B VALUE (Rn) 8'h03;
	assign debug_port4 = immediateValue;	// IMMEDIATE VALUE 8'h04;
	assign debug_port5 = rd;
	assign debug_port6 = rm;
	assign debug_port7 = rn;


	// initialize and update next
	always @(posedge clk) begin
		if (~nreset) begin //might need to be a "~"
			pc <= 32'b0;
			cycle_counter = 0;
			write_en = 0;
			read_en = 0;
			instruction_en = 1;
			ldr_str_en = 0;
		end

		case (cycle_counter)
			0: begin
				pc <= pc_n;
				instruction_en = 1;
				read_en = 0;
				ldr_str_en = 0;
				write_en = 0;
				cycle_counter = cycle_counter + 1;
			end

			1: begin
				instruction_en = 0;
				read_en = 1;
				ldr_str_en = 0;
				write_en = 0;
				cycle_counter = cycle_counter + 1;
			end

			2: begin
				instruction_en = 0;
				read_en = 0;
				ldr_str_en = 1;
				write_en = 0;
				cycle_counter = cycle_counter + 1;
			end

			3: begin
				instruction_en = 0;
				read_en = 0;
				ldr_str_en = 0;
				write_en = 1;
				cycle_counter = 0;
			end
		endcase
	end

	// figure out next-pc
	find_next_pc fnp (.clk(clk), .ALUCtl_code(ALUCtl_code), .br_address(br_address),
		.program_counter(pc), .program_counter_next(pc_n), .next_r14(next_r14));

	// fetch instruction
	instruction_memory im (.clk(clk), .rst(nreset), .pc_address(pc), .instruction_set(instruction_set));

	// updates format flags and address/values
	instruction_decoder id (.instruction_set(instruction_set), .rm(rm), .shift(shift), .rn(rn), .rd(rd), .rotate(rotate),
		.immediateValue(immediateValue), .cond_field(cond_field),	.br_address(br_address), .dt_address(dt_address), .ALUCtl_code(ALUCtl_code), .enable(instruction_en));

	// Register File get and write values
	reg_file rg (.clk(clk), .read_addr1(rm), .read_addr2(rn), .write_addr(rd), .write_data(32'b0/*comes from alu*/), .read_enable1(read_en),
		.write_enable1(write_en), .read_data1(A), .read_data2(B));

	// Mmeory File -- The input and output values need to be changed
	memory_file mem (.clk(clk), .addr(rd), .write_data(A), .ldr_str_en(ldr_str_en), .read_data(A), .load_en(dt_address[20]), .store_en(~dt_address[20]));

	// ALU File Compute instructions (make sure to deal with cpsr values)

	// if instruction is branch and link then write the new pc to R14
endmodule


/*module cpu_testbench();
	reg clk;
	reg nreset;
	wire  led;
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
		nreset = 1'b1;
		@(posedge clk);
		nreset = 1'b0;
		repeat (50)
		@(posedge clk);
		$stop;

	end
endmodule */
