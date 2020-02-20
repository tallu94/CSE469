module BarrelShifter
(
  input wire [31:0] in, //original
  input wire [4:0] shift, //amount to rotate by
  output reg [31:0] out, //output
  output reg carry
);

always @* begin
	case (shift)
	5'b00000: out = in; //0
	5'b00001: out = {in[0], in[31:1]};
	5'b00010: out = {in[1:0], in[31:2]};
	5'b00011: out = {in[2:0], in[31:3]};
	5'b00100: out = {in[3:0], in[31:4]};
	5'b00101: out = {in[4:0], in[31:5]}; //5
	5'b00110: out = {in[5:0], in[31:6]};
	5'b00111: out = {in[6:0], in[31:7]};
	5'b01000: out = {in[7:0], in[31:8]};
	5'b01001: out = {in[8:0], in[31:9]};
	5'b01010: out = {in[9:0], in[31:10]}; //10
	5'b01011: out = {in[10:0], in[31:11]};
	5'b01100: out = {in[11:0], in[31:12]};
	5'b01101: out = {in[12:0], in[31:13]};
	5'b01110: out = {in[13:0], in[31:14]};
	5'b01111: out = {in[14:0], in[31:15]}; //15
	5'b10000: out = {in[15:0], in[31:16]};
	5'b10001: out = {in[16:0], in[31:17]};
	5'b10010: out = {in[17:0], in[31:18]};
	5'b10011: out = {in[18:0], in[31:19]};
	5'b10100: out = {in[19:0], in[31:20]}; //20
	5'b10101: out = {in[20:0], in[31:21]};
	5'b10110: out = {in[21:0], in[31:22]};
	5'b10111: out = {in[22:0], in[31:23]};
	5'b11000: out = {in[23:0], in[31:24]};
	5'b11001: out = {in[24:0], in[31:25]}; //25
	5'b11010: out = {in[25:0], in[31:26]};
	5'b11011: out = {in[26:0], in[31:27]};
	5'b11100: out = {in[27:0], in[31:28]};
	5'b11101: out = {in[28:0], in[31:29]};
	5'b11110: out = {in[29:0], in[31:30]}; //30
	5'b11111: out = {in[30:0], in[31]};	

	default: out = in;
	endcase
	assign carry = out[31];
end
endmodule

module BarrelShifter_tb;
// Inputs
reg [31:0] in;
reg [4:0] shift;

// Outputs
wire [31:0] out;
wire carry;

// Instantiate the Unit Under Test (UUT)
BarrelShifter dut (
  .in(in),
  .shift(shift),
  .out(out),
  .carry(carry)
);

initial begin
//test1
in = 8'h00000008; //random number
shift = 5'b00011; //rotate by 3 bits
#200;

//test2
in = 8'h00000008; //random number
shift = 5'b11111; //rotate by 2 bits
#200;

//test3
in = 8'h00000008; //random number
shift = 5'b00001; //rotate by 1 bit1
#200;
end
initial
$monitor($time,, in,, shift,,,);

endmodule