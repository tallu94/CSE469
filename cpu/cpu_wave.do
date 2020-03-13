onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /cpu_testbench/dut/clk
add wave -noupdate -radix unsigned /cpu_testbench/dut/nreset
add wave -noupdate -radix unsigned /cpu_testbench/dut/led
add wave -noupdate -radix unsigned /cpu_testbench/dut/debug_port1
add wave -noupdate -radix unsigned /cpu_testbench/dut/debug_port2
add wave -noupdate -radix unsigned /cpu_testbench/dut/debug_port3
add wave -noupdate -radix unsigned /cpu_testbench/dut/debug_port4
add wave -noupdate -radix unsigned /cpu_testbench/dut/debug_port5
add wave -noupdate -radix unsigned /cpu_testbench/dut/debug_port6
add wave -noupdate -radix unsigned /cpu_testbench/dut/debug_port7
add wave -noupdate -radix unsigned /cpu_testbench/dut/instruction_set
add wave -noupdate -radix unsigned /cpu_testbench/dut/temp_pc
add wave -noupdate -radix unsigned /cpu_testbench/dut/pc
add wave -noupdate -radix unsigned /cpu_testbench/dut/pc_n
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_instruction
add wave -noupdate -radix unsigned /cpu_testbench/dut/shift
add wave -noupdate -radix unsigned /cpu_testbench/dut/rm
add wave -noupdate -radix unsigned /cpu_testbench/dut/rn
add wave -noupdate -radix unsigned /cpu_testbench/dut/rd
add wave -noupdate -radix unsigned /cpu_testbench/dut/rotate
add wave -noupdate -radix unsigned /cpu_testbench/dut/immediateValue
add wave -noupdate -radix unsigned /cpu_testbench/dut/cond_field
add wave -noupdate -radix unsigned /cpu_testbench/dut/dt_address
add wave -noupdate -radix unsigned /cpu_testbench/dut/br_address
add wave -noupdate -radix unsigned /cpu_testbench/dut/ALUCtl_code
add wave -noupdate -radix unsigned /cpu_testbench/dut/cpsr
add wave -noupdate -radix unsigned /cpu_testbench/dut/immediate_enable
add wave -noupdate -radix unsigned /cpu_testbench/dut/cpsr_enable
add wave -noupdate -radix unsigned /cpu_testbench/dut/execute_flag
add wave -noupdate -radix unsigned /cpu_testbench/dut/ALUOut
add wave -noupdate -radix unsigned /cpu_testbench/dut/cpsr_n
add wave -noupdate -radix unsigned /cpu_testbench/dut/carry_bit
add wave -noupdate -radix unsigned /cpu_testbench/dut/r1_data
add wave -noupdate -radix unsigned /cpu_testbench/dut/r2_data
add wave -noupdate -radix unsigned /cpu_testbench/dut/next_r14
add wave -noupdate -radix unsigned /cpu_testbench/dut/memOut
add wave -noupdate -radix unsigned /cpu_testbench/dut/write_en
add wave -noupdate -radix unsigned /cpu_testbench/dut/read_en
add wave -noupdate -radix unsigned /cpu_testbench/dut/instruction_en
add wave -noupdate -radix unsigned /cpu_testbench/dut/ldr_str_en
add wave -noupdate -radix unsigned /cpu_testbench/dut/temp_write_en
add wave -noupdate -radix unsigned /cpu_testbench/dut/temp_read_en
add wave -noupdate -radix unsigned /cpu_testbench/dut/temp_instruction_en
add wave -noupdate -radix unsigned /cpu_testbench/dut/temp_ldr_str_en
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_shift
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_rm
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_rn
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_rd
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_rotate
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_immediateValue
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_cond_field
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_dt_address
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_br_address
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_ALUCtl_code
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_cpsr
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_immediate_enable
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_cpsr_enable
add wave -noupdate -radix unsigned /cpu_testbench/dut/decoder_execute_flag
add wave -noupdate -radix unsigned /cpu_testbench/dut/alu_ALUCtl_Code
add wave -noupdate -radix unsigned /cpu_testbench/dut/alu_data1
add wave -noupdate -radix unsigned /cpu_testbench/dut/alu_data2
add wave -noupdate -radix unsigned /cpu_testbench/dut/alu_immediateValue
add wave -noupdate -radix unsigned /cpu_testbench/dut/alu_ALUOut
add wave -noupdate -radix unsigned /cpu_testbench/dut/alu_cpsr
add wave -noupdate -radix unsigned /cpu_testbench/dut/alu_cpsr_enable
add wave -noupdate -radix unsigned /cpu_testbench/dut/alu_rm
add wave -noupdate -radix unsigned /cpu_testbench/dut/alu_rn
add wave -noupdate -radix unsigned /cpu_testbench/dut/alu_rd
add wave -noupdate -radix unsigned /cpu_testbench/dut/mem_addr
add wave -noupdate -radix unsigned /cpu_testbench/dut/mem_read_data
add wave -noupdate -radix unsigned /cpu_testbench/dut/mem_write_data
add wave -noupdate -radix unsigned /cpu_testbench/dut/mem_immediateValue
add wave -noupdate -radix unsigned /cpu_testbench/dut/mem_rm
add wave -noupdate -radix unsigned /cpu_testbench/dut/mem_rn
add wave -noupdate -radix unsigned /cpu_testbench/dut/mem_rd
add wave -noupdate -radix unsigned /cpu_testbench/dut/mem_en
add wave -noupdate -radix unsigned /cpu_testbench/dut/load_en
add wave -noupdate -radix unsigned /cpu_testbench/dut/store_en
add wave -noupdate -radix unsigned /cpu_testbench/dut/reg_write_addr
add wave -noupdate -radix unsigned /cpu_testbench/dut/reg_write_data
add wave -noupdate -radix unsigned /cpu_testbench/dut/reg_write_en
add wave -noupdate -radix unsigned /cpu_testbench/dut/reg_rd
add wave -noupdate -radix unsigned /cpu_testbench/dut/cycle_counter
add wave -noupdate -radix unsigned /cpu_testbench/dut/r1_data_final
add wave -noupdate -radix unsigned /cpu_testbench/dut/shift_output
add wave -noupdate -radix unsigned /cpu_testbench/dut/mem_str_enable
add wave -noupdate -radix unsigned /cpu_testbench/dut/mem_load
add wave -noupdate -radix unsigned /cpu_testbench/dut/mem_store
add wave -noupdate -radix unsigned /cpu_testbench/dut/alu_ALUCtl_code
add wave -noupdate -radix unsigned /cpu_testbench/dut/alu_immediate_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2098 ps} 0}
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
