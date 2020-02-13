module stuff (
input CLK,// 16MHz clock
input my_reset,
output pcTemp
);

wire reset;
wire [31:0] instruction;
reg [31:0] pc; //32 bits
instruction_mem code_memory (pc, instruction); //only need one read port
assign pcTemp = pc;
wire reg_write;
reg [4:0] reg_wrAd;
reg [31:0] reg_wrDat;
reg [4:0] reg_rdAd1;
wire [31:0] r1;
reg [4:0] reg_rdAd2;
wire [31:0] r2;

wire reg_rdAd1Temp;
assign reg_rdAd1Temp = reg_rdAd1;
wire reg_rdAd2Temp;

assign reg_rdAd = instruction[19:16];
myRegister reg_file (CLK, reg_write, reg_wrAd, reg_wrDat, reg_rdAd1, r1, reg_rdAd2, r2); //include condition codes for branches

always @(posedge CLK) begin
      if (my_reset) begin
        pc <= 0;
      end else begin
        pc <= pc + 4;
        if (instruction [28:25] == 4'b1010) begin //branch opcode
          $display("B");
          pc <= pc + ($signed(instruction[23:0] << 2)); //place holder
          $display("%h", pc);
        end
        case (instruction [24:21])
          4'b1101: $display("MOV"); // mov
          4'b1111: $display("MVN");//MVN
          4'b0100: begin
            $display("ADD");//add
            reg_rdAd1 <= instruction [19:16];
            reg_rdAd2 <= instruction [15:12];
            $display("Rn: %h", instruction [19:16]);
            $display("Rd: %h", instruction [15:12]);
          end
          4'b0010: begin
            $display("SUB"); //SUB
            reg_rdAd1 <= instruction [19:16];
            reg_rdAd2 <= instruction [15:12];
            $display("Rn: %h", instruction [19:16]);
            $display("Rd: %h", instruction [15:12]);
          end
          4'b1010: begin
            $display("CMP"); //CMP
            reg_rdAd1 <= instruction [19:16];
            reg_rdAd2 <= instruction [15:12];
            $display("Rn: %h", instruction [19:16]);
            $display("Rd: %h", instruction [15:12]);
          end
          4'b1000: begin
            $display("TST"); //TST
            reg_rdAd1 <= instruction [19:16];
            reg_rdAd2 <= instruction [15:12];
            $display("Rn: %h", instruction [19:16]);
            $display("Rd: %h", instruction [15:12]);
          end
          4'b1001: begin
            $display("TEQ");
            reg_rdAd1 <= instruction [19:16];
            reg_rdAd2 <= instruction [15:12];
            $display("Rn: %h", instruction [19:16]);
            $display("Rd: %h", instruction [15:12]);
          end //TEQ
          4'b0001: begin
            $display("EOR");
            reg_rdAd1 <= instruction [19:16];
            reg_rdAd2 <= instruction [15:12];
            $display("Rn: %h", instruction [19:16]);
            $display("Rd: %h", instruction [15:12]);
          end//EOR
          4'b1110: begin
            $display("BIC");
            reg_rdAd1 <= instruction [19:16];
            reg_rdAd2 <= instruction [15:12];
            $display("Rn: %h", instruction [19:16]);
            $display("Rd: %h", instruction [15:12]);
          end//BIC


          4'b1100: $display("ORR"); //ORR
          default: $display(" ");
        endcase
				$display("Reg 1: %h", r1);
            $display("Reg 2: %h", r2);
        case (instruction [31:28])
          4'b0000: $display("condition: EQ");
          4'b0001: $display("condition: NE");
          4'b0010: $display("condition: CS");
          4'b0011: $display("condition: CC");
          4'b0100: $display("condition: MI");
          4'b0101: $display("condition: PL");
          4'b0110: $display("condition: VS");
          4'b0111: $display("condition: VC");
          4'b1000: $display("condition: HI");
          4'b1001: $display("condition: LS");
          4'b1010: $display("condition: GE");
          4'b1011: $display("condition: LT");
          4'b1100: $display("condition: GT");
          4'b1101: $display("condition: LE");
          4'b1110: $display("condition: AL");
          default: $display("condition: unpredictable");
        endcase
      end
  end

endmodule
module myRegister
  (input clk,
   input write,
   input [4:0] wrAddr,
   input [31:0] wrData,
   input [4:0] rdAddrA,
   output [31:0] rdDataA,
   input [4:0] rdAddrB,
   output [31:0] rdDataB
   );

   reg [31:0] regfile [0:31];

   assign rdDataA = regfile[rdAddrA];
   assign rdDataB = regfile[rdAddrB];
	initial begin
		$readmemh("random.mem", regfile);
	end
   always @(posedge clk) begin
      if (write) regfile[wrAddr] <= wrData;
   end
endmodule


module instruction_mem
 (input [31:0] rdAddr,
  output [31:0] rdData
  );
  reg [7:0] regfile [0:127];
  assign rdData = {regfile[rdAddr], regfile[rdAddr + 1], regfile[rdAddr + 2], regfile[rdAddr + 3]};
  initial begin
    $readmemh("code_mem.mem", regfile);
  end

endmodule
