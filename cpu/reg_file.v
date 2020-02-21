// EE469 LAB 1
// Erika Burk, Jeff Josephsen, Ameer Talal Mahmood

module reg_file(
	input clk,
	input [3:0] read_addr1,
	input [3:0] read_addr2,
	input [3:0] write_addr,
	input [31:0] write_data,
	input read_enable1,
	input write_enable1,
	output wire [31:0] read_data1,
	output wire [31:0] read_data2);

	reg [31:0] regfile [15:0]; 	// 16 32-bit registers

	assign read_data1 = regfile[read_addr1];
	assign read_data2 = regfile[read_addr2];


	always @(*) begin

			if (write_enable1)
				regfile[write_addr] = write_data;
	end

endmodule


// Testbench
/*module reg_file_testbench();

	logic clk, rst;
	logic [3:0] read_addr1;
	logic [3:0] read_addr2;
	logic [3:0] write_addr;
	logic [31:0] write_data;
	logic read_enable1;
	logic write_enable1;

	logic [31:0] read_data1;
	logic [31:0] read_data2;

	// Clock setup
	parameter CLOCK_PERIOD = 100;
	initial clk = 1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end	//initial

	reg_file dut (.clk, .read_addr1, .read_addr2, .write_addr, .write_data, .read_enable1,
		.write_enable1, .read_data1, .read_data2);

		initial begin

			// trying to write when write is NOT enabled
			write_enable1 = 0; read_enable1 = 0; read_addr1 = 4'b0;
				read_addr2 = 4'b0; write_addr = 4'b0; write_data = 32'b0; @(posedge clk);
			write_data = 32'd1; write_addr = 4'd0; @(posedge clk);
			write_data = 32'd5; write_addr = 4'd5; @(posedge clk);

			// enabling write, should see new data values in memory
			write_enable1 = 1; read_enable1 = 0; @(posedge clk);
			write_data = 32'd1; write_addr = 4'd1; @(posedge clk);
			write_data = 32'd2; write_addr = 4'd2; @(posedge clk);
			write_data = 32'd3; write_addr = 4'd3; @(posedge clk);
			write_data = 32'd4; write_addr = 4'd4; @(posedge clk);

			// trying to read when read is NOT enabled
			read_enable1 = 0; 	@(posedge clk);
			read_addr1 = 4'd0; read_addr2 = 4'd1;  @(posedge clk);

			// enable read 1, should see values in read_data1 and NOT in read_data2
			read_enable1 = 1; 	@(posedge clk);
			read_addr1 = 4'd0; read_addr2 = 4'd1;  @(posedge clk);

			// enable read, should see values in BOTH read_data1 and read_data2
			read_enable1 = 1; 	@(posedge clk);
			read_addr1 = 4'd0; read_addr2 = 4'd1;  @(posedge clk);
			read_addr1 = 4'd2; read_addr2 = 4'd3;  @(posedge clk);
			read_addr1 = 4'd4; read_addr2 = 4'd5;  @(posedge clk);
							    @(posedge clk);
			$stop;	// End simulation
		end	// initial

endmodule */
