//This module will reset at pc=0, and will increment according to the program instructions.
//If the instructions are Branch, then this program will figure out what PC to branch to.
//if the instructions are not branch then this program will increment the PC by 4.

//input includes the instruction
//output is the next program counter value/target
module find_next_pc(
  input clk,
  input rst,
  input [31:0] instruction,
  input [31:0] program_counter,
  output wire [31:0] program_counter_next
  );


  parameter branch = 11'b00000000101;
  parameter branchLink = 11'b00000100101;

  reg [1:0] instructionType = 2'b00;
  reg [8:0] branchAddress;

  always @(*) begin
    if (instruction[31:21] == branch) begin
      instructionType = 2'b01;
      branchAddress = instruction[20:13];
    end else if (instruction[31:21] == branchLink) begin
      instructionType = 2'b10;
      branchAddress = instruction[20:13];
    end else begin
      instructionType = 2'b11;
      branchAddress = 4;
    end
  end

  //if (instructionType == 2'b10)
    //R[14] = programCounter[10:0]

  assign program_counter_next = program_counter + branchAddress;
endmodule

module find_next_pc_testbench();
  input logic clk;
  input logic rst;
  input logic [31:0] instruction;
  input logic [31:0] program_counter;
  output logic [31:0] program_counter_next;


  parameter CLOCK_PERIOD = 100;
  initial clk = 1;
  always begin
    #(CLOCK_PERIOD/2);
    clk = ~clk;
  end

  find_next_pc dut (.clk, .rst, .instruction, .program_counter, .program_counter_next);

  initial begin
  rst = 1;   @(posedge clk);
  rst = 0;
  instruction =32'b00000100101000110000000000000000;
  program_counter = 5;
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);

    $stop;

  end
endmodule
