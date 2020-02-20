// EE469 LAB 1
// Erika Burk, Jeff Josephsen, Ameer Talal Mahmood

module memory_file(clk, addr, write_data, ldr_str_en, read_data, load_en, store_en);

	input wire clk;
	input wire [3:0] addr;
	input wire ldr_str_en;
	input wire load_en;
	input wire store_en;
	input wire [31:0] write_data;

	output wire [31:0] read_data;

	reg [31:0] memfile [15:0]; 	// 16 32-bit registers
	initial begin
		memfile[0] = 32'd0;
		memfile[1] = 32'd0;
		memfile[2] = 32'd0;
		memfile[3] = 32'd0;
		memfile[4] = 32'd0;
		memfile[5] = 32'd0;
		memfile[6] = 32'd0;
		memfile[7] = 32'd0;
		memfile[8] = 32'd0;
		memfile[9] = 32'd0;
		memfile[10] = 32'd0;
		memfile[11] = 32'd0;
		memfile[12] = 32'd0;
		memfile[13] = 32'd0;
		memfile[14] = 32'd0;
		memfile[15] = 32'd0;
	end

	always @(*) begin
			if (ldr_str_en) begin
				if (store_en)
					memfile[addr] <= write_data;
				if (load_en)
					read_data <= memfile[addr];
			end
	end

endmodule


// Testbench
/*module memory_file_testbench();

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

	reg_file dut (.clk, .addr, .write_data, .ldr_str_en, .read_data, .load_en, .store_en);

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
