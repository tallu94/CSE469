// EE469 LAB 1
// Erika Burk, Jeff Josephsen, Ameer Talal Mahmood

module alu (ALUCtl, A, B, I, ALUOut, cpsr, cpsr_enable);
	input  wire [10:0] ALUCtl;		// dictates which instruction set to run
	input  wire [31:0] A, B, I;			// values coming from reg file
	output wire [31:0] ALUOut;	// new data to be added to reg or memory

	output wire [31:0] cpsr;
	wire Z;
	wire [31:0] sub_result;
	wire [31:0] add_result;
	wire [31:0] and_result;
	wire [31:0] orr_result;
	wire [31:0] eor_result;
	wire [31:0] bic_result;
	input wire cpsr_enable;
	assign sub_result = A - B;
	assign add_result = A + B;
	assign and_result = A & B;
	assign orr_result = A | B;
	assign eor_result = A ^ B;
	assign bic_result = A & (~B);


	// assign Zero = (ALUOut == Zero); 	// Zero is true if ALUOut is 0
	always @(ALUCtl, A, B, I) begin

		casex(ALUCtl)
			0: begin
				ALUOut <= A + B;			//ADD
				if (cpsr_enable) begin
					if ((A+B) == 0) cpsr[30] <= 1'b1;
					else cpsr[30] <= 1'b0;			// set zero bit
					cpsr[31] <= add_result[31]; //set negative bit if solution MSB is 1
					if (((A > 0) && (B > 0) && ((A+B) < 0)) || ((A < 0) && (B < 0) && ((A+B) < 0))) cpsr[28] <= 1'b1;
					else cpsr[28] <= 1'b0; //set V bit
				end
			end

			1: ALUOut <= A + I;				// ADDI
			2: begin
				ALUOut <= A - B;
				if (cpsr_enable) begin		//SUB
					if ((A - B) == 0) cpsr[30] <= 1'b1;
					else cpsr[30] <= 1'b0;		//set zero bit
					if (B > A) cpsr[29] <= 1'b1;
					else cpsr[29] <= 1'b1; 			// set Carry bit
					if (((A < 0) && (B > 0) && ((A-B) > 0)) || ((A > 0) && (B < 0) && ((A-B) < 0))) cpsr[28] <= 1'b1;
					else cpsr[28] <= 1'b0; //set V bit
					cpsr[31] <= sub_result[31];		//set negative bit
				end
			end

			3: begin 						// AND
				ALUOut <= A & B;
				if (cpsr_enable) begin
					cpsr[31] <= and_result[31]; 	//set negative bit
					if ((A & B) == 0) cpsr[30] <= 1'b1;
					else cpsr[30] <= 1'b0; 		//set zero bit
				end
			end 		//TODO: set c for shifter output

			4: begin						//ORR
				ALUOut <= A | B;
				if (cpsr_enable) begin
					cpsr[31] <= orr_result[31]; 	//set negative bit
					if ((A & B) == 0) cpsr[30] <= 1'b1;
					else cpsr[30] <= 1'b0; 		//set zero bit
				end
			end
			5: begin						// EOR
				ALUOut <= A ^ B;
				if (cpsr_enable) begin
					cpsr[31] <= eor_result[31]; 	//set negative bit
					if ((A & B) == 0) cpsr[30] <= 1'b1;
					else cpsr[30] <= 1'b0; 		//set zero bit
				end
			end

			6: ALUOut <= 32'bx;				// MOV
			7: ALUOut <= 32'bx;				// MVN
			8: begin
				ALUOut <= A < B;				// CMP
				if ((A - B) == 0)  cpsr[30] <= 1'b1;
				else cpsr[30] <= 1'b0;		//set zero bit
				if (B > A) cpsr[29] <= 1'b1;
				else cpsr[29] <= 1'b1; 			// set Carry bit
				if (((A < 0) && (B > 0) && ((A-B) > 0)) || ((A > 0) && (B < 0) && ((A-B) < 0))) cpsr[28] <= 1'b1;
				else cpsr[28] <= 1'b0; //set V bit
				cpsr[31] <= sub_result[31];		//set negative bit
			end
			9: begin 						// TST (performs a bitwise AND
					ALUOut <= 32'bx;
					cpsr[31] <= and_result[31]; 	//set negative bit
					if ((A & B) == 0) cpsr[30] <= 1'b1;
					else cpsr[30] <= 1'b0; 		//set zero bit
				end
			10: begin
					ALUOut <= 32'bx;				// TEQ (test XOR
					cpsr[31] <= eor_result[31]; 	//set negative bit
					if ((A & B) == 0) cpsr[30] <= 1'b1;
					else cpsr[30] <= 1'b0; 		//set zero bit
				end
			11: begin
				ALUOut <= A & (~B);			// BIC (bitwise complement)
				if (cpsr_enable) begin
					cpsr[31] <= bic_result[31]; 	//set negative bit
					if ((A & B) == 0) cpsr[30] <= 1'b1;
					else cpsr[30] <= 1'b0; 		//set zero bit
				end
		end

			31: ALUOut <= 32'bx;			// B
			32: ALUOut <= 32'bx;			// BL
			41: ALUOut <= 32'bx;			// LDR
			42: ALUOut <= 32'bx;			// STR
			default: ALUOut <= 32'bx;
		endcase
		end
endmodule
