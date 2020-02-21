module alu (
	input [10:0] ALUCtl,
	input [31:0] A,
	input [31:0] B,
	input [7:0] I,
	output wire [31:0] ALUOut,
	output wire [31:0] cpsr,
	input cpsr_enable);

	//in/out
	/*
	input  wire [10:0] ALUCtl;		// dictates which instruction set to run
	input  wire [31:0] A, B, I;	// values coming from reg file
	input wire temp_cpsr_enable;
	output reg [31:0] temp_ALUOut;	// new data to be added to reg or memory
	output reg [31:0] temp_cpsr;
	*/

	reg [31:0] temp_ALUOut;
	reg [31:0] temp_cpsr;

	assign cpsr = temp_cpsr;
	assign ALUOut = temp_ALUOut;

	//variables

	wire Z;
	wire [31:0] sub_result;
	wire [31:0] add_result;
	wire [31:0] and_result;
	wire [31:0] orr_result;
	wire [31:0] eor_result;
	wire [31:0] bic_result;
	assign sub_result = A - B;
	assign add_result = A + B;
	assign and_result = A & B;
	assign orr_result = A | B;
	assign eor_result = A ^ B;
	assign bic_result = A & (~B);

	always @(ALUCtl, A, B, I) begin
		casex(ALUCtl)
			0: begin
			 temp_ALUOut = A + B;			//ADD
				if (cpsr_enable) begin
					if ((A+B) == 0) temp_cpsr[30] = 1'b1;
					else temp_cpsr[30] = 1'b0;			// set zero bit
					temp_cpsr[31] = add_result[31]; //set negative bit if solution MSB is 1
					if ((~A[31]) && (~B[31]) && ((add_result[31])) //pos + pos = neg
					|| ((A[31]) && (B[31]) && ((~add_result[31])))) temp_cpsr[28] = 1'b1; //neg + neg = pos
					else temp_cpsr[28] = 1'b0; //set V bit
				end
			end

			1: temp_ALUOut = A + I;				// ADDI
			2: begin
				temp_ALUOut = A - B;
				if (cpsr_enable) begin		//SUB
					if ((A - B) == 0) temp_cpsr[30] = 1'b1;
					else temp_cpsr[30] = 1'b0;		//set zero bit
					if (B > A) temp_cpsr[29] = 1'b1;
					else temp_cpsr[29] = 1'b1; 			// set Carry bit
					if ((A[31]) && (~B[31]) && ((~sub_result[31])) //neg - pos = pos
					|| ((~A[31]) && (B[31]) && ((sub_result[31])))) temp_cpsr[28] = 1'b1; //pos - neg = neg
					else temp_cpsr[28] = 1'b0; //set V bit
					temp_cpsr[31] = sub_result[31];		//set negative bit
				end
			end

			3: begin 						// AND
				temp_ALUOut = A & B;
				if (cpsr_enable) begin
					temp_cpsr[31] = and_result[31]; 	//set negative bit
					if ((A & B) == 0) temp_cpsr[30] = 1'b1;
					else temp_cpsr[30] = 1'b0; 		//set zero bit
				end
			end 		//TODO: set c for shifter output

			4: begin						//ORR
				temp_ALUOut = A | B;
				if (cpsr_enable) begin
					temp_cpsr[31] = orr_result[31]; 	//set negative bit
					if ((A & B) == 0) temp_cpsr[30] = 1'b1;
					else temp_cpsr[30] = 1'b0; 		//set zero bit
				end
			end
			5: begin						// EOR
				temp_ALUOut = A ^ B;
				if (cpsr_enable) begin
					temp_cpsr[31] = eor_result[31]; 	//set negative bit
					if ((A & B) == 0) temp_cpsr[30] = 1'b1;
					else temp_cpsr[30] = 1'b0; 		//set zero bit
				end
			end

			6: temp_ALUOut = 32'bx;				// MOV
			7: temp_ALUOut = 32'bx;				// MVN
			8: begin
				temp_ALUOut = A < B;				// CMP
				if ((A - B) == 0)  temp_cpsr[30] = 1'b1;
					else temp_cpsr[30] = 1'b0;		//set zero bit
				if (B > A) temp_cpsr[29] = 1'b1;
					else temp_cpsr[29] = 1'b1; 			// set Carry bit
				if ((A[31]) && (~B[31]) && ((~sub_result[31])) //neg - pos = pos
					|| ((~A[31]) && (B[31]) && ((sub_result[31])))) temp_cpsr[28] = 1'b1; //pos - neg = neg
					else temp_cpsr[28] = 1'b0; //set V bit
				temp_cpsr[31] = sub_result[31];		//set negative bit
			end
			9: begin 						// TST (performs a bitwise AND
					temp_ALUOut = 32'bx;
					temp_cpsr[31] = and_result[31]; 	//set negative bit
					if ((A & B) == 0) temp_cpsr[30] = 1'b1;
					else temp_cpsr[30] = 1'b0; 		//set zero bit
				end
			10: begin
					temp_ALUOut = 32'bx;				// TEQ (test XOR
					temp_cpsr[31] = eor_result[31]; 	//set negative bit
					if ((A & B) == 0) temp_cpsr[30] = 1'b1;
					else temp_cpsr[30] = 1'b0; 		//set zero bit
				end
			11: begin
				temp_ALUOut = A & (~B);			// BIC (bitwise complement)
				if (cpsr_enable) begin
					temp_cpsr[31] = bic_result[31]; 	//set negative bit
					if ((A & B) == 0) temp_cpsr[30] = 1'b1;
					else temp_cpsr[30] = 1'b0; 		//set zero bit
				end
		end

			31: temp_ALUOut = 32'bx;			// B
			32: temp_ALUOut = 32'bx;			// BL
			41: temp_ALUOut = 32'bx;			// LDR
			42: temp_ALUOut = 32'bx;			// STR
			default: temp_ALUOut = 32'bx;
		endcase
		end
endmodule

/*module alu_testbench();
	reg [10:0] ALUCtl;
	reg [31:0] A, B, I;
	reg temp_cpsr_enable;
	wire [31:0] temp_ALUOutput;
	wire [31:0] temp_cpsr;

	alu dut (ALUCtl, A, B, I, temp_ALUOutput, temp_cpsr, temp_cpsr_enable);

	initial begin
	//test ADD
	temp_cpsr_enable = 1;
	A = 32'h00000010; B = 32'h00000001; ALUCtl = 0; #10;
	A = 32'h7FFFFFFF; B = 32'h00000FF1; #10; // V = 1 p + p = n
	A = 32'h80000000; B = 32'hF000FFFF; #10; // V = 1 n + n = p
	A = 32'h00000000; B = 32'h00000000; #10; // Z = 1
	A = 32'h10000000; B = 32'h00000001; #10; // N = 1

	//test SUB
	A = 32'h00001001; B = 32'h00000001; ALUCtl = 8; #10;
	A = 32'h80000000; B = 32'h00000FFF; #10; // V = 1 n - p = p
	A = 32'h7FFFFFFF; B = 32'hFFFFFFF0; #10; // V = 1 p - n = n
	A = 32'h00000000; B = 32'h00000000; #10; // Z = 1
	A = 32'h00000000; B = 32'h00000111; #10; // N = 1

	//ORR
	A = 32'h00100100; B = 32'h01000111; #10; ALUCtl = 4; #10;
	//AND
	ALUCtl = 8; #10;
	//EOR
	ALUCtl = 5; #10;
	//BIC
	ALUCtl = 11; #10;
	ALUCtl = 9; #10;
	ALUCtl = 10; #10;
	ALUCtl = 6; #10;
	ALUCtl = 7; #10;
	ALUCtl = 31; #10;
	ALUCtl = 32; #10;
	ALUCtl = 41; #10;
	ALUCtl = 42; #10;

	end
endmodule*/
