onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /instruction_decoder_testbench/instruction_set
add wave -noupdate /instruction_decoder_testbench/rm
add wave -noupdate /instruction_decoder_testbench/shift
add wave -noupdate /instruction_decoder_testbench/rn
add wave -noupdate /instruction_decoder_testbench/rd
add wave -noupdate /instruction_decoder_testbench/immediateValue
add wave -noupdate /instruction_decoder_testbench/cond_field
add wave -noupdate /instruction_decoder_testbench/br_address
add wave -noupdate /instruction_decoder_testbench/dt_address
add wave -noupdate /instruction_decoder_testbench/ALUCtl_code
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {27 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 267
configure wave -valuecolwidth 214
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
WaveRestoreZoom {0 ps} {214 ps}
