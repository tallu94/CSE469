module instruction_decoder (instruction_set, rm, shift, rn, rd, rotate, immediateValue,
		 br_address, dt_address, ALUCtl_code, enable, cpsr_enable, execute_flag, cpsr, cond_field, immediate_enable);

	input wire [31:0] instruction_set;
	input wire enable;
	input wire [31:0] cpsr;

	output wire [3:0] rm;
	output wire [7:0] shift;
	output wire [3:0] rn;
	output wire [3:0] rd;
	output wire [3:0]	rotate;					// temp_shift applied to an immediate value
	output wire [7:0] immediateValue;
	output wire [3:0] cond_field;				// flags for alu
	output wire [23:0] br_address;				// address to branch to
	output wire [11:0] dt_address;  			// used in LDR and STR as an immediate offset
	output wire [10:0] ALUCtl_code;
	output wire cpsr_enable;
	output wire execute_flag;
	output wire immediate_enable;

	reg [3:0]  temp_rm;
	reg [7:0]  temp_shift;
	reg [3:0]  temp_rn;
	reg [3:0]  temp_rd;
	reg [3:0]	temp_rotate;					// temp_shift applied to an immediate value
	reg [7:0]  temp_immediateValue;
	reg [3:0]  temp_cond_field;				// flags for alu
	reg [23:0] temp_br_address;				// address to branch to
	reg [11:0] temp_dt_address;  			// used in LDR and STR as an immediate offset
	reg [10:0] temp_ALUCtl_code;
	reg temp_cpsr_enable;
	reg temp_execute_flag;
	reg temp_immediate_enable;

	assign rm = temp_rm;
	assign shift = temp_shift;
	assign rn = temp_rn;
	assign rd = temp_rd;
	assign	rotate = temp_rotate;
	assign immediateValue = temp_immediateValue;
	assign cond_field = temp_cond_field;
	assign br_address = temp_br_address;
	assign dt_address = temp_dt_address;
	assign ALUCtl_code = temp_ALUCtl_code;
	assign cpsr_enable = temp_cpsr_enable;
	assign execute_flag = temp_execute_flag;
	assign immediate_enable = temp_immediate_enable;



/* 	initial begin
		temp_rm = 4'b0;
		temp_shift = 11'b0;
		temp_rn = 4'b0;
		temp_rd = 4'b0;
		temp_immediateValue = 8'b0;
		temp_dt_address = 12'b0;
		temp_br_address = 24'bx;
		temp_cond_field = 4'b0;
		temp_ALUCtl_code = 11'dx;		// initial ALU state (does nothing)
	end */

	// case statememt to decode instruction set
	always @(*) begin

	temp_cond_field = instruction_set[31:28];
	temp_cpsr_enable = instruction_set[20];

		case (temp_cond_field)
			4'b0000: temp_execute_flag = cpsr[30];
			4'b0001: temp_execute_flag = ~cpsr[30];
			4'b0010: temp_execute_flag = cpsr[29];
			4'b0011: temp_execute_flag = ~cpsr[29];
			4'b0100: temp_execute_flag = cpsr[31];
			4'b0101: temp_execute_flag = ~cpsr[31];
			4'b0110: temp_execute_flag = cpsr[28];
			4'b0111: temp_execute_flag = ~cpsr[28];
			4'b1000: temp_execute_flag = cpsr[29] & ~cpsr[30];
			4'b1001: temp_execute_flag = ~cpsr[29] & cpsr[30];
			4'b1010: temp_execute_flag = (cpsr[31] & cpsr[28]) | (~cpsr[31] & ~cpsr[28]);
			4'b1011: temp_execute_flag = (cpsr[31] & ~cpsr[28]) | (~cpsr[31] & cpsr[28]);
			4'b1100: temp_execute_flag = ~cpsr[30] & ((cpsr[31] & cpsr[28]) | (~cpsr[31] & ~cpsr[28]));
			4'b1101: temp_execute_flag = cpsr[30] | (cpsr[31] & ~cpsr[28]) | (~cpsr[31] & cpsr[28]);
			4'b1110: temp_execute_flag = 1'b1;
			default: temp_execute_flag = 1'b1;
		endcase

			casex(instruction_set[27:20])

				// ------------- DATA PROCESSING OPERATIONS (0-30) --------------
				8'b00x0100x: begin 						// ADD
					temp_rm = instruction_set[3:0];
					temp_shift = instruction_set[11:4];
					temp_rn = instruction_set[19:16];
					temp_rd = instruction_set[15:12];
					temp_rotate = 4'bx;
					if (instruction_set[25]) begin
						temp_immediateValue = instruction_set[7:0];
						temp_immediate_enable = 1'b1;
					end else begin
						temp_immediateValue = 32'bx;
						temp_immediate_enable = 1'b0;
					end
					temp_dt_address = 12'bx;
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd0;
				end

				8'b00x0010x: begin 						// SUB
					temp_rm = instruction_set[3:0];
					temp_shift = instruction_set[11:4];
					temp_rn = instruction_set[19:16];
					temp_rd = instruction_set[15:12];
					temp_rotate = 4'bx;
					if (instruction_set[25]) begin
						temp_immediateValue = instruction_set[7:0];
						temp_immediate_enable = 1'b1;
					end else begin
						temp_immediateValue = 32'bx;
						temp_immediate_enable = 1'b0;
					end
					temp_dt_address = 12'bx;
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd2;
				end

				8'b00x0000x: begin 						// AND
					temp_rm = instruction_set[3:0];
					temp_shift = instruction_set[11:4];
					temp_rn = instruction_set[19:16];
					temp_rd = instruction_set[15:12];
					temp_rotate = 4'bx;
					if (instruction_set[25]) begin
						temp_immediateValue = instruction_set[7:0];
						temp_immediate_enable = 1'b1;
					end else begin
						temp_immediateValue = 32'bx;
						temp_immediate_enable = 1'b0;
					end
					temp_dt_address = 12'bx;
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd3;
				end

				8'b00x1100x: begin 						// ORR
					temp_rm = instruction_set[3:0];
					temp_shift = instruction_set[11:4];
					temp_rn = instruction_set[19:16];
					temp_rd = instruction_set[15:12];
					temp_rotate = 4'bx;
					if (instruction_set[25]) begin
						temp_immediateValue = instruction_set[7:0];
						temp_immediate_enable = 1'b1;
					end else begin
						temp_immediateValue = 32'bx;
						temp_immediate_enable = 1'b0;
					end
					temp_dt_address = 12'bx;
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd4;
				end

				8'b00x0001x: begin 						// EOR
					temp_rm = instruction_set[3:0];
					temp_shift = instruction_set[11:4];
					temp_rn = instruction_set[19:16];
					temp_rd = instruction_set[15:12];
					temp_rotate = 4'bx;
					if (instruction_set[25]) begin
						temp_immediateValue = instruction_set[7:0];
						temp_immediate_enable = 1'b1;
					end else begin
						temp_immediateValue = 32'bx;
						temp_immediate_enable = 1'b0;
					end
					temp_dt_address = 12'bx;
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd5;
				end

				8'b00x1101x: begin 						// MOV
					temp_rm = instruction_set[3:0];
					temp_shift = instruction_set[11:4];
					temp_rn = instruction_set[19:16];
					temp_rd = instruction_set[15:12];
					temp_rotate = 4'bx;
					if (instruction_set[25]) begin
						temp_immediateValue = instruction_set[7:0];
						temp_immediate_enable = 1'b1;
					end else begin
						temp_immediateValue = 32'bx;
						temp_immediate_enable = 1'b0;
					end
					temp_dt_address = 12'bx;
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd6;
				end

				8'b0001111x: begin 						// MNV
					temp_rm = instruction_set[3:0];
					temp_shift = instruction_set[11:4];
					temp_rn = instruction_set[19:16];
					temp_rd = instruction_set[15:12];
					temp_rotate = 4'bx;
					temp_immediateValue = 8'bx;
					temp_dt_address = 12'bx;
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd7;
				end

				8'b00x1010x: begin 						// CMP
					temp_rm = instruction_set[3:0];
					temp_shift = instruction_set[11:4];
					temp_rn = instruction_set[19:16];
					temp_rd = instruction_set[15:12];
					temp_rotate = 4'bx;
					if (instruction_set[25]) begin
						temp_immediateValue = instruction_set[7:0];
						temp_immediate_enable = 1'b1;
					end else begin
						temp_immediateValue = 32'bx;
						temp_immediate_enable = 1'b0;
					end
					temp_dt_address = 12'bx;
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd8;
				end

				8'b0001000x: begin 						// TST
					temp_rm = instruction_set[3:0];
					temp_shift = instruction_set[11:4];
					temp_rn = instruction_set[19:16];
					temp_rd = instruction_set[15:12];
					temp_rotate = 4'bx;
					temp_immediateValue = 8'bx;
					temp_dt_address = 12'bx;
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd9;
				end

				8'b0001001x: begin 						// TEQ
					temp_rm = instruction_set[3:0];
					temp_shift = instruction_set[11:4];
					temp_rn = instruction_set[19:16];
					temp_rd = instruction_set[15:12];
					temp_rotate = 4'bx;
					temp_immediateValue = 8'bx;
					temp_dt_address = 12'bx;
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd10;
				end

				8'b0001110x: begin 						// BIC
					temp_rm = instruction_set[3:0];
					temp_shift = instruction_set[11:4];
					temp_rn = instruction_set[19:16];
					temp_rd = instruction_set[15:12];
					temp_rotate = 4'bx;
					temp_immediateValue = 8'bx;
					temp_dt_address = 12'bx;
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd11;
				end

				8'b0011010x: begin 						// CMPI
					temp_rm = 4'bx;
					temp_shift = 8'bx;
					temp_rn = instruction_set[19:16];
					temp_rd = instruction_set[15:12];
					temp_rotate = instruction_set[11:8];
					temp_immediateValue = instruction_set[7:0];
					temp_dt_address = 12'bx;
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd13;
				end

				//------------- BRANCH/BRANCH-LINK (31-40) -----------------------
				8'b1010xxxx: begin 						// Branch
					temp_rm = 4'bx;
					temp_shift = 8'bx;
					temp_rn = 4'bx;
					temp_rd = 4'bx;
					temp_rotate = 4'bx;
					temp_immediateValue = 8'bx;
					temp_dt_address = 12'bx;
					temp_br_address = instruction_set[23:0];
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd31;
				end

				8'b1011xxxx: begin 						// Branch and Link
					temp_rm = 4'bx;
					temp_shift = 8'bx;
					temp_rn = 4'bx;
					temp_rd = 4'bx;
					temp_rotate = 4'bx;
					temp_immediateValue = 8'bx;
					temp_dt_address = 12'bx;
					temp_br_address = instruction_set[23:0];
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd32;				// use this later to detetemp_rmine when to BL in cpu.v to set R14
				end

				//------------- SINGLE DATA TRANSFER (41-50)----------------------
				8'b01xxxxx1: begin 						// LDR
					temp_rm = 	4'bx;
					temp_shift = instruction_set[11:4];
					temp_rn = instruction_set[19:16]; // r11 - mem address to read data
					temp_rd = instruction_set[15:12]; // reg address to store mem Out
					temp_rotate = 4'bx;
					temp_immediateValue = instruction_set[11:0];
					temp_dt_address = instruction_set[11:0];
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd41;
				end

				8'b01xxxxx0: begin 						// STR
					temp_rm = instruction_set[15:12]; //data addr in reg
					temp_shift = instruction_set[11:4];
					temp_rn = instruction_set[19:16]; //r11 - data address in mem
					temp_rd = 4'bx;
					temp_rotate = 4'bx;
					temp_immediateValue = instruction_set[11:0];
					temp_dt_address = instruction_set[11:0];
					temp_br_address = 24'bx;
					temp_cond_field = instruction_set[31:28];
					temp_ALUCtl_code = 11'd42;
				end
				default: begin
					temp_rm = 4'b0;
					temp_shift = 11'b0;
					temp_rn = 4'b0;
					temp_rd = 4'b0;
					temp_rotate = 4'bx;
					temp_immediateValue = 8'b0;
					temp_dt_address = 12'b0;
					temp_br_address = 24'bx;
					temp_cond_field = 4'b0;
					temp_ALUCtl_code = 11'dx;
				end
			endcase
	end
endmodule


/*module instruction_decoder_testbench();

	logic [31:0] instruction_set;
	logic [3:0]  temp_rm;
	logic [7:0]  temp_shift;
	logic [3:0]  temp_rn;
	logic [3:0]  temp_rd;
	logic [7:0] temp_immediateValue;
	//output logic [3:0]	temp_rotate;				// temp_shift applied to an immediate value
	logic [3:0]  temp_cond_field;				// flags for alu
	logic [23:0] temp_br_address;				// address to branch to
	logic [11:0] temp_dt_address;  			// used in LDR and STR as an immediate offset
	logic [10:0] temp_ALUCtl_code;


  instruction_decoder dut(.instruction_set, .temp_rm, .temp_shift, .temp_rn, .temp_rd, .temp_immediateValue, .temp_cond_field,
			 .temp_br_address, .temp_dt_address, .temp_ALUCtl_code);

  initial begin

  instruction_set =32'b11100000100001110101000000000110; #50	//ADD

	instruction_set =32'b11100001101000000000000000000011; #50 //MOV

	instruction_set =32'b11101010000000000000000000000000; #50 //b

	instruction_set =32'b11100010100001000100000000000001; #50	//ADDI

    $stop;

  end
endmodule*/
