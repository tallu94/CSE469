module shifter
(shift_type, //bits 654 of instruction (specifies address, not actual register)
a, //Rm: bits 3210
shift, //amount to shift by: bits 11
b, //shifted Rm
carry
);
input wire [1:0] shift_type; //bits 654 of instruction (specifies address, not actual register)
input wire signed [31:0] a;//Rm: bits 3210
input wire [4:0] shift; //amount to shift by: bits 11
output reg signed [31:0] b; //shifted Rm
output reg carry;

always @* begin
	case (shift_type)
	2'b00: begin //logical shift left by immediate
		if (shift == 0) begin
			b = a;
			carry = 1'b0;
		end else begin
			b = a << shift;
			carry = a[32 - shift];
		end
	end
	2'b01: begin //logical shift right by immediate
		if (shift == 0) begin //shift by 32: output is 0
			b = 0;
			carry = a[31];
		end else begin
			b = a >> shift;
			carry = a[shift - 1];
		end
	end
	2'b10: begin //arithmetic shift right by immediate
		if (shift == 0) begin
			if (a[31] == 0) begin
				b = 0;
				carry = a[31];
			end else begin
				b = 32'hFFFFFFFF;
				carry = a[31];
			end
		end else begin
			b = a >>> shift;
			carry = a[shift - 1];
		end
	end
	2'b11: begin //rotate right by immediate
		if (shift == 0) begin
			b = a >> 1'b1;
			carry = a[0];
		end else begin
		case (shift)
			5'b00001: b = {a[0], a[31:1]};
			5'b00010: b = {a[1:0], a[31:2]};
			5'b00011: b = {a[2:0], a[31:3]};
			5'b00100: b = {a[3:0], a[31:4]};
			5'b00101: b = {a[4:0], a[31:5]}; //5
			5'b00110: b = {a[5:0], a[31:6]};
			5'b00111: b = {a[6:0], a[31:7]};
			5'b01000: b = {a[7:0], a[31:8]};
			5'b01001: b = {a[8:0], a[31:9]};
			5'b01010: b = {a[9:0], a[31:10]}; //10
			5'b01011: b = {a[10:0], a[31:11]};
			5'b01100: b = {a[11:0], a[31:12]};
			5'b01101: b = {a[12:0], a[31:13]};
			5'b01110: b = {a[13:0], a[31:14]};
			5'b01111: b = {a[14:0], a[31:15]}; //15
			5'b10000: b = {a[15:0], a[31:16]};
			5'b10001: b = {a[16:0], a[31:17]};
			5'b10010: b = {a[17:0], a[31:18]};
			5'b10011: b = {a[18:0], a[31:19]};
			5'b10100: b = {a[19:0], a[31:20]}; //20
			5'b10101: b = {a[20:0], a[31:21]};
			5'b10110: b = {a[21:0], a[31:22]};
			5'b10111: b = {a[22:0], a[31:23]};
			5'b11000: b = {a[23:0], a[31:24]};
			5'b11001: b = {a[24:0], a[31:25]}; //25
			5'b11010: b = {a[25:0], a[31:26]};
			5'b11011: b = {a[26:0], a[31:27]};
			5'b11100: b = {a[27:0], a[31:28]};
			5'b11101: b = {a[28:0], a[31:29]};
			5'b11110: b = {a[29:0], a[31:30]}; //30
			5'b11111: b = {a[30:0], a[31]};
			endcase
			carry <= a[shift - 1];
		end
	end
	default: b <= a;
	endcase
end
endmodule

module shifter_testbench();
// Inputs
reg [1:0] shift_type;
reg [31:0] a;
reg [4:0] shift;
reg C;

// Outputs
wire [31:0] b;
wire carry;

shifter dut (
  .shift_type(shift_type),
  .a(a),
  .shift(shift),
  .C(C),
  .b(b),
  .carry(carry)
);

initial begin
	//shift left by immediate
	shift_type <= 2'b00; a <= 32'hFFFFFFFF; shift <= 5'b00001; C <= 0; #10;
	shift <= 5'b11111; #10;
	shift <= 5'b00000; #10;
	//shift right by immediate
	shift_type <= 2'b01; a <= 32'hFFFFFFFF; shift <= 5'b00001; C <= 0; #10;
	shift <= 5'b11111; a <= 32'h80000FFF; #10;
	shift <= 5'b00000; #10;
	//arithmetic shift right by immediate
	shift_type <= 2'b10; a <= 32'hFF0000FF; shift <= 5'b10000; C <= 0; #10;
	shift <= 5'b11111; a <= 32'h80000FFF; #10;
	shift <= 5'b00000; #10;
	//rotate right by immediate
	shift_type <= 2'b11; a <= 32'hFFF000FF; shift <= 5'b10000; C <= 0; #10;
	shift <= 5'b11111; a <= 32'h00000FFF; #10;
	shift <= 5'b00000; #10;

end
endmodule
