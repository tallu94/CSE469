// EE469 LAB 1
// Erika Burk, Jeff Josephsen, Ameer Talal Mahmood

module alu (ALUCtl, A, B, I, ALUOut, Zero, cpsr);
	input  wire [10:0] ALUCtl;		// dictates which instruction set to run
	input  wire [31:0] A, B, I;			// values coming from reg file
	output wire [31:0] ALUOut;	// new data to be added to reg or memory
	output wire Zero;
	output wire [31:0] cpsr;


	// assign Zero = (ALUOut == Zero); 	// Zero is true if ALUOut is 0
	always @(ALUCtl, A, B, I) begin
		casex(ALUCtl)
			0: ALUOut <= A + B;				// ADD
			1: ALUOut <= A + I;				// ADDI
			2: ALUOut <= A - B;				// SUB
			3: ALUOut <= A & B;				// AND
			4: ALUOut <= A | B;				// ORR
			5: ALUOut <= A ^ B;				// EOR
			6: ALUOut <= 31'bx;				// MOV
			7: ALUOut <= 31'bx;				// MVN
			8: ALUOut <= A < B;				// CMP
			9: begin 						// TST (performs a bitwise AND
					ALUOut <= 32'bx;
					cpsr[31] <= (A & B);	//update zero bit flag
					cpsr[31] <= 1'b0        //update the negative bit flag
				end;
			10: begin 						// TEQ (test for equivalence)
					ALUOut <= 32'bx;
					cpsr[31]<=(A[31]^b[31]);//update the negative bit flag
				end;
			11: ALUOut <= A & (~B);			// BIC
			31: ALUOut <= 31'bx;			// B
			32: ALUOut <= 31'bx;			// BL
			41: ALUOut <= 31'bx;			// LDR
			42: ALUOut <= 31'bx;			// STR
			default: ALUOut <= 32'bx;
		endcase
	end
end module
