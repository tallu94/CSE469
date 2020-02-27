module reg_file(
	input wire clk,
	input wire [3:0] read_addr1,
	input wire [3:0] read_addr2,
	input wire [3:0] write_addr,
	input wire [31:0] write_data,
	input wire read_enable1,
	input wire write_enable1,
	output wire [31:0] read_data1,
	output wire [31:0] read_data2);

	reg [31:0] regfile [15:0]; 	// 16 32-bit registers

	reg [31:0] temp_d1;
	reg [31:0] temp_d2;

	initial begin
		regfile[0] = 32'd1;
		regfile[1] = 32'd2;
		regfile[2] = 32'd3;
		regfile[3] = 32'd4;
		regfile[4] = 32'd5;
		regfile[5] = 32'd6;
		regfile[6] = 32'd7;
		regfile[7] = 32'd8;
		regfile[8] = 32'd9;
		regfile[9] = 32'd10;
		regfile[10] = 32'd11;
		regfile[11] = 32'd12;
		regfile[12] = 32'd13;
		regfile[13] = 32'd14;
		regfile[14] = 32'd15;
		regfile[15] = 32'd16;
	end

	assign read_data1 = temp_d1;
	assign read_data2 = temp_d2;


	always @(*) begin

			if (read_enable1) begin
				temp_d1 = regfile[read_addr1];
				temp_d2 = regfile[read_addr2];
			end

			if (write_enable1)
				regfile[write_addr] <= write_data;
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
