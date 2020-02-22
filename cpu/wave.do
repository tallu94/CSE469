onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_testbench/dut/clk
add wave -noupdate /cpu_testbench/dut/nreset
add wave -noupdate /cpu_testbench/dut/led
add wave -noupdate -expand -group {Debug Ports} -radix decimal /cpu_testbench/dut/debug_port1
add wave -noupdate -expand -group {Debug Ports} -radix decimal /cpu_testbench/dut/debug_port2
add wave -noupdate -expand -group {Debug Ports} -radix decimal /cpu_testbench/dut/debug_port3
add wave -noupdate -expand -group {Debug Ports} -radix decimal /cpu_testbench/dut/debug_port4
add wave -noupdate -expand -group {Debug Ports} -radix decimal /cpu_testbench/dut/debug_port5
add wave -noupdate -expand -group {Debug Ports} -radix decimal /cpu_testbench/dut/debug_port6
add wave -noupdate -expand -group {Debug Ports} -radix decimal /cpu_testbench/dut/debug_port7
add wave -noupdate -expand -group PC -radix decimal /cpu_testbench/dut/pc
add wave -noupdate -expand -group PC -radix decimal /cpu_testbench/dut/pc_n
add wave -noupdate -expand -group PC /cpu_testbench/dut/mem/clk
add wave -noupdate -expand -group PC /cpu_testbench/dut/mem/addr
add wave -noupdate -expand -group PC /cpu_testbench/dut/mem/ldr_str_en
add wave -noupdate -expand -group PC /cpu_testbench/dut/mem/load_en
add wave -noupdate -expand -group PC /cpu_testbench/dut/mem/store_en
add wave -noupdate -expand -group PC /cpu_testbench/dut/mem/write_data
add wave -noupdate -expand -group PC /cpu_testbench/dut/mem/read_data
add wave -noupdate -expand -group {Instruction Decoder} /cpu_testbench/dut/instruction_set
add wave -noupdate -expand -group {Instruction Decoder} /cpu_testbench/dut/shift
add wave -noupdate -expand -group {Instruction Decoder} /cpu_testbench/dut/rm
add wave -noupdate -expand -group {Instruction Decoder} /cpu_testbench/dut/rn
add wave -noupdate -expand -group {Instruction Decoder} /cpu_testbench/dut/rd
add wave -noupdate -expand -group {Instruction Decoder} /cpu_testbench/dut/rotate
add wave -noupdate -expand -group {Instruction Decoder} /cpu_testbench/dut/immediateValue
add wave -noupdate -expand -group {Instruction Decoder} /cpu_testbench/dut/cond_field
add wave -noupdate -expand -group {Instruction Decoder} /cpu_testbench/dut/dt_address
add wave -noupdate -expand -group {Instruction Decoder} /cpu_testbench/dut/br_address
add wave -noupdate -expand -group {Instruction Decoder} /cpu_testbench/dut/ALUCtl_code
add wave -noupdate -expand -group {Instruction Decoder} /cpu_testbench/dut/ALUOut
add wave -noupdate -expand -group CPSR /cpu_testbench/dut/cpsr
add wave -noupdate -expand -group CPSR /cpu_testbench/dut/cpsr_n
add wave -noupdate -expand -group {Reg & Mem Files} /cpu_testbench/dut/r1_data
add wave -noupdate -expand -group {Reg & Mem Files} /cpu_testbench/dut/r2_data
add wave -noupdate -expand -group {Reg & Mem Files} -radix binary /cpu_testbench/dut/next_r14
add wave -noupdate -expand -group {Reg & Mem Files} -radix binary /cpu_testbench/dut/memOut
add wave -noupdate -expand -group {4 Clk Cycle} /cpu_testbench/dut/write_en
add wave -noupdate -expand -group {4 Clk Cycle} /cpu_testbench/dut/read_en
add wave -noupdate -expand -group {4 Clk Cycle} /cpu_testbench/dut/instruction_en
add wave -noupdate -expand -group {4 Clk Cycle} /cpu_testbench/dut/ldr_str_en
add wave -noupdate -expand -group {4 Clk Cycle} /cpu_testbench/dut/cycle_counter
add wave -noupdate -expand -group {4 Clk Cycle} /cpu_testbench/dut/cpsr_enable
add wave -noupdate -expand -group {4 Clk Cycle} /cpu_testbench/dut/execute_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4446 ps} 0}
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
WaveRestoreZoom {4412 ps} {5242 ps}
