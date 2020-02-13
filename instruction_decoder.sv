// EE469 LAB 1
// Erika Burk, Jeff Josephsen, Ameer Talal Mahmood

module instruction_decoder (instruction_set, rm, shift, rn, rd, immediateValue, cond_field,
		 br_address, dt_address, ALUCtl_code );

	input logic  [31:0] instruction_set;


	output logic [3:0]  rm;
	output logic [7:0]  shift;
	output logic [3:0]  rn;
	output logic [3:0]  rd;
	//output logic [3:0]	rotate;				// shift applied to an immediate value
	output logic [7:0] immediateValue;
	output logic [3:0]  cond_field;				// flags for alu
	output logic [23:0] br_address;				// address to branch to
	output logic [11:0] dt_address;  			// used in LDR and STR as an immediate offset
	output logic [10:0] ALUCtl_code;



	initial begin
		rm = 4'b0;
		shift = 11'b0;
		rn = 4'b0;
		rd = 4'b0;
		immediateValue = 8'b0;
		dt_address = 12'b0;
		br_address = 24'bx;
		cond_field = 4'b0;
		ALUCtl_code = 11'd42;
	end

	// case statememt to decode instruction set
	always @(*) begin
		casex(instruction_set[27:20])

			// ------------- DATA PROCESSING OPERATIONS (0-30) --------------
			8'b0000100X: begin 						// ADD
				rm = instruction_set[3:0];
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = 8'bx;
				dt_address = 12'bx;
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd0;
			end

			8'b0010100x: begin 						// ADDI
				rm = 4'bx;
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = instruction_set[7:0];
				dt_address = 12'bx;
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd1;
			end

			8'b0000010x: begin 						// SUB
				rm = instruction_set[3:0];
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = 8'bx;
				dt_address = 12'bx;
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd2;
			end

			8'b0000000x: begin 						// AND
				rm = instruction_set[3:0];
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = 8'bx;
				dt_address = 12'bx;
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd3;
			end

			8'b0001100x: begin 						// ORR
				rm = instruction_set[3:0];
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = 8'bx;
				dt_address = 12'bx;
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd4;
			end

			8'b0000001x: begin 						// EOR
				rm = instruction_set[3:0];
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = 8'bx;
				dt_address = 12'bx;
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd5;
			end

			8'b0001101x: begin 						// MOV
				rm = instruction_set[3:0];
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = 8'bx;
				dt_address = 12'bx;
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd6;
			end

			8'b0001111x: begin 						// MNV
				rm = instruction_set[3:0];
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = 8'bx;
				dt_address = 12'bx;
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd7;
			end

			8'b0001010x: begin 						// CMP
				rm = instruction_set[3:0];
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = 8'bx;
				dt_address = 12'bx;
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd8;
			end

			8'b0001000x: begin 						// TST
				rm = instruction_set[3:0];
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = 8'bx;
				dt_address = 12'bx;
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd9;
			end

			8'b0001001x: begin 						// TEQ
				rm = instruction_set[3:0];
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = 8'bx;
				dt_address = 12'bx;
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd10;
			end

			8'b0001110x: begin 						// BIC
				rm = instruction_set[3:0];
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = 8'bx;
				dt_address = 12'bx;
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd11;
			end

			//------------- BRANCH/BRANCH-LINK (31-40) -----------------------
			8'b1010xxxx: begin 						// Branch
				rm = 4'bx;
				shift = 8'bx;
				rn = 4'bx;
				rd = 4'bx;
				immediateValue = 8'bx;
				dt_address = 12'bx;
				br_address = instruction_set[23:0];
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd31;
			end

			8'b1011xxxx: begin 						// Branch and Link
				rm = 4'bx;
				shift = 8'bx;
				rn = 4'bx;
				rd = 4'bx;
				immediateValue = 8'bx;
				dt_address = 12'bx;
				br_address = instruction_set[23:0];
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd32;				// use this later to determine when to BL in cpu.v to set R14
			end

			//------------- SINGLE DATA TRANSFER (41-50)----------------------
			8'b01xxxxx0: begin 						// LDR
				rm = instruction_set[3:0];
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = 8'bx;
				dt_address = instruction_set[23:0];
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd41;
			end

			8'b01xxxxx1: begin 						// STR
				rm = instruction_set[3:0];
				shift = instruction_set[11:4];
				rn = instruction_set[19:16];
				rd = instruction_set[15:12];
				immediateValue = 8'bx;
				dt_address = instruction_set[23:0];
				br_address = 24'bx;
				cond_field = instruction_set[31:28];
				ALUCtl_code = 11'd42;
			end
			default: begin
				rm = rm;
				shift = shift;
				rn = rn;
				rd = rd;
				dt_address = dt_address;
				br_address = br_address;
				cond_field = cond_field;
				ALUCtl_code = ALUCtl_code;
			end
		endcase
	end
endmodule


module instruction_decoder_testbench();

	logic [31:0] instruction_set;
	logic [3:0]  rm;
	logic [7:0]  shift;
	logic [3:0]  rn;
	logic [3:0]  rd;
	logic [7:0] immediateValue;
	//output logic [3:0]	rotate;				// shift applied to an immediate value
	logic [3:0]  cond_field;				// flags for alu
	logic [23:0] br_address;				// address to branch to
	logic [11:0] dt_address;  			// used in LDR and STR as an immediate offset
	logic [10:0] ALUCtl_code;


  instruction_decoder dut(.instruction_set, .rm, .shift, .rn, .rd, .immediateValue, .cond_field,
			 .br_address, .dt_address, .ALUCtl_code);

  initial begin

  instruction_set =32'b11100000100001110101000000000110; #50	//ADD

	instruction_set =32'b11100001101000000000000000000011; #50 //MOV

	instruction_set =32'b11101010000000000000000000000000; #50 //b

	instruction_set =32'b11100010100001000100000000000001; #50	//ADDI

    $stop;

  end
endmodule
