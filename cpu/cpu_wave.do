onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group CPU.V -radix unsigned /cpu_testbench/dut/clk
add wave -noupdate -expand -group CPU.V -radix unsigned /cpu_testbench/dut/nreset
add wave -noupdate -expand -group CPU.V -radix unsigned /cpu_testbench/dut/led
add wave -noupdate -expand -group CPU.V -group {Debug Ports} /cpu_testbench/dut/debug_port1
add wave -noupdate -expand -group CPU.V -group {Debug Ports} /cpu_testbench/dut/debug_port2
add wave -noupdate -expand -group CPU.V -group {Debug Ports} /cpu_testbench/dut/debug_port3
add wave -noupdate -expand -group CPU.V -group {Debug Ports} /cpu_testbench/dut/debug_port4
add wave -noupdate -expand -group CPU.V -group {Debug Ports} /cpu_testbench/dut/debug_port5
add wave -noupdate -expand -group CPU.V -group {Debug Ports} /cpu_testbench/dut/debug_port6
add wave -noupdate -expand -group CPU.V -group {Debug Ports} /cpu_testbench/dut/debug_port7
add wave -noupdate -expand -group CPU.V -expand -group PC -radix unsigned /cpu_testbench/dut/temp_pc
add wave -noupdate -expand -group CPU.V -expand -group PC -radix unsigned /cpu_testbench/dut/pc
add wave -noupdate -expand -group CPU.V -expand -group PC -radix unsigned /cpu_testbench/dut/pc_n
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/instruction_en
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/instruction_set
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/shift
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/rm
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/rn
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/rd
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/rotate
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/immediateValue
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/cond_field
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/dt_address
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/br_address
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/ALUCtl_code
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/ALUOut
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/cpsr
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/cpsr_n
add wave -noupdate -expand -group CPU.V -expand -group Instructions -radix unsigned /cpu_testbench/dut/cpsr_enable
add wave -noupdate -expand -group CPU.V -expand -group {Register Rd/Wr} -radix unsigned /cpu_testbench/dut/r1_data
add wave -noupdate -expand -group CPU.V -expand -group {Register Rd/Wr} -radix unsigned /cpu_testbench/dut/r2_data
add wave -noupdate -expand -group CPU.V -expand -group {Register Rd/Wr} -radix unsigned /cpu_testbench/dut/next_r14
add wave -noupdate -expand -group CPU.V -expand -group {Register Rd/Wr} -radix unsigned /cpu_testbench/dut/memOut
add wave -noupdate -expand -group CPU.V -expand -group {Register Rd/Wr} -radix unsigned /cpu_testbench/dut/write_en
add wave -noupdate -expand -group CPU.V -expand -group {Register Rd/Wr} -radix unsigned /cpu_testbench/dut/read_en
add wave -noupdate -expand -group CPU.V -group {Memory File} /cpu_testbench/dut/memOut
add wave -noupdate -expand -group CPU.V -group {Memory File} /cpu_testbench/dut/rm
add wave -noupdate -expand -group CPU.V -group {Memory File} /cpu_testbench/dut/rn
add wave -noupdate -expand -group CPU.V -group {Memory File} /cpu_testbench/dut/rd
add wave -noupdate -expand -group CPU.V -group {Memory File} /cpu_testbench/dut/ldr_str_en
add wave -noupdate -expand -group CPU.V -radix unsigned /cpu_testbench/dut/temp_write_en
add wave -noupdate -expand -group CPU.V -radix unsigned /cpu_testbench/dut/temp_read_en
add wave -noupdate -expand -group CPU.V -radix unsigned /cpu_testbench/dut/temp_instruction_en
add wave -noupdate -expand -group CPU.V -radix unsigned /cpu_testbench/dut/temp_ldr_str_en
add wave -noupdate -expand -group CPU.V -radix unsigned /cpu_testbench/dut/cycle_counter
add wave -noupdate -expand -group CPU.V -radix unsigned /cpu_testbench/dut/execute_flag
add wave -noupdate -group find_next_pc.v /cpu_testbench/dut/fnp/clk
add wave -noupdate -group find_next_pc.v /cpu_testbench/dut/fnp/ALUCtl_code
add wave -noupdate -group find_next_pc.v /cpu_testbench/dut/fnp/br_address
add wave -noupdate -group find_next_pc.v /cpu_testbench/dut/fnp/program_counter
add wave -noupdate -group find_next_pc.v /cpu_testbench/dut/fnp/program_counter_next
add wave -noupdate -group find_next_pc.v /cpu_testbench/dut/fnp/next_r14
add wave -noupdate -group find_next_pc.v /cpu_testbench/dut/fnp/temp_program_counter_next
add wave -noupdate -group find_next_pc.v /cpu_testbench/dut/fnp/temp_next_r14
add wave -noupdate -group find_next_pc.v /cpu_testbench/dut/fnp/Branch
add wave -noupdate -group find_next_pc.v /cpu_testbench/dut/fnp/BranchLink
add wave -noupdate -expand -group instruction_memory -radix unsigned /cpu_testbench/dut/im/clk
add wave -noupdate -expand -group instruction_memory -radix unsigned /cpu_testbench/dut/im/rst
add wave -noupdate -expand -group instruction_memory -radix unsigned /cpu_testbench/dut/im/pc_address
add wave -noupdate -expand -group instruction_memory -radix unsigned /cpu_testbench/dut/im/instruction_set
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/instruction_set
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/enable
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/cpsr
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/rm
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/shift
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/rn
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/rd
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/rotate
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/immediateValue
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/cond_field
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/br_address
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/dt_address
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/ALUCtl_code
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/cpsr_enable
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/execute_flag
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/temp_rm
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/temp_shift
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/temp_rn
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/temp_rd
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/temp_rotate
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/temp_immediateValue
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/temp_cond_field
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/temp_br_address
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/temp_dt_address
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/temp_ALUCtl_code
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/temp_cpsr_enable
add wave -noupdate -expand -group Instruction_Decoder -radix unsigned /cpu_testbench/dut/id/temp_execute_flag
add wave -noupdate -expand -group Register_file -radix unsigned /cpu_testbench/dut/rg/clk
add wave -noupdate -expand -group Register_file -radix unsigned /cpu_testbench/dut/rg/read_addr1
add wave -noupdate -expand -group Register_file -radix unsigned /cpu_testbench/dut/rg/read_addr2
add wave -noupdate -expand -group Register_file -radix unsigned /cpu_testbench/dut/rg/write_addr
add wave -noupdate -expand -group Register_file -radix unsigned /cpu_testbench/dut/rg/write_data
add wave -noupdate -expand -group Register_file -radix unsigned /cpu_testbench/dut/rg/read_enable1
add wave -noupdate -expand -group Register_file -radix unsigned /cpu_testbench/dut/rg/write_enable1
add wave -noupdate -expand -group Register_file -radix unsigned /cpu_testbench/dut/rg/read_data1
add wave -noupdate -expand -group Register_file -radix unsigned /cpu_testbench/dut/rg/read_data2
add wave -noupdate -radix unsigned -childformat {{{/cpu_testbench/dut/rg/regfile[15]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[14]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[13]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[12]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[11]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[10]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[9]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[8]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[7]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[6]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[5]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[4]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[3]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[2]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[1]} -radix unsigned} {{/cpu_testbench/dut/rg/regfile[0]} -radix unsigned}} -expand -subitemconfig {{/cpu_testbench/dut/rg/regfile[15]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[14]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[13]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[12]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[11]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[10]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[9]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[8]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[7]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[6]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[5]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[4]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[3]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[2]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[1]} {-height 15 -radix unsigned} {/cpu_testbench/dut/rg/regfile[0]} {-height 15 -radix unsigned}} /cpu_testbench/dut/rg/regfile
add wave -noupdate -expand -group Memory_file -radix unsigned /cpu_testbench/dut/mem/clk
add wave -noupdate -expand -group Memory_file -radix unsigned /cpu_testbench/dut/mem/ldr_str_en
add wave -noupdate -expand -group Memory_file -radix unsigned /cpu_testbench/dut/mem/load_en
add wave -noupdate -expand -group Memory_file -radix unsigned /cpu_testbench/dut/mem/store_en
add wave -noupdate -expand -group Memory_file -radix unsigned /cpu_testbench/dut/mem/read_addr
add wave -noupdate -expand -group Memory_file -radix unsigned /cpu_testbench/dut/mem/write_addr
add wave -noupdate -expand -group Memory_file -radix unsigned /cpu_testbench/dut/mem/write_data
add wave -noupdate -expand -group Memory_file -radix unsigned /cpu_testbench/dut/mem/read_data
add wave -noupdate -expand -group Memory_file -radix unsigned /cpu_testbench/dut/mem/temp_read_data
add wave -noupdate -expand -group Memory_file -radix unsigned -childformat {{{/cpu_testbench/dut/mem/memfile[15]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[14]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[13]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[12]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[11]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[10]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[9]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[8]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[7]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[6]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[5]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[4]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[3]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[2]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[1]} -radix unsigned} {{/cpu_testbench/dut/mem/memfile[0]} -radix unsigned}} -expand -subitemconfig {{/cpu_testbench/dut/mem/memfile[15]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[14]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[13]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[12]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[11]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[10]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[9]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[8]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[7]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[6]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[5]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[4]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[3]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[2]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[1]} {-height 15 -radix unsigned} {/cpu_testbench/dut/mem/memfile[0]} {-height 15 -radix unsigned}} /cpu_testbench/dut/mem/memfile
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/ALUCtl
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/A
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/B
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/I
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/ALUOut
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/cpsr
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/cpsr_enable
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/temp_ALUOut
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/temp_cpsr
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/Z
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/sub_result
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/add_result
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/and_result
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/orr_result
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/eor_result
add wave -noupdate -group ALU /cpu_testbench/dut/my_alu/bic_result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {842 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 175
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {5460 ps}
