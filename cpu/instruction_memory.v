module instruction_memory (clk, rst, pc_address, instruction_set);
	input wire clk, rst;
	input wire [31:0] pc_address;
	output wire [31:0] instruction_set;


	reg 	[31:0] machineCode_container [0:31];						// 32 32-bit words
	initial $readmemb("Machine_code_02.mem", machineCode_container);		// reads in machine code and stores in memory

	assign instruction_set =  machineCode_container[pc_address];

endmodule


/*// Testbench
module instruction_memory_testbench();

	logic clk, rst;
	logic [31:0] pc_address;
	logic instruction_set;

	// Clock setup
	parameter CLOCK_PERIOD = 100;
	initial clk = 1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end	//initial

	instruction_memory dut (.clk, .rst, .pc_address, .instruction_set);

		initial begin

			rst = 1; 			@(posedge clk);
			rst = 0;
			pc_address = 32'd0; @(posedge clk);
			pc_address = 32'd0; @(posedge clk);
			pc_address = 32'd1; @(posedge clk);
			pc_address = 32'd13; @(posedge clk);
			pc_address = 32'd0; @(posedge clk);
			pc_address = 32'd7; @(posedge clk);
			pc_address = 32'd7; @(posedge clk);
			pc_address = 32'd7; @(posedge clk);
			pc_address = 32'd7; @(posedge clk);
			pc_address = 32'd7; @(posedge clk);

							    @(posedge clk);
			$stop;	// End simulation
		end	// initial

endmodule */
