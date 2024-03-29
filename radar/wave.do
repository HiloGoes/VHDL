onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /radar/Sensor_A_Caju
add wave -noupdate /radar/Sensor_B_Caju
add wave -noupdate /radar/clk1
add wave -noupdate /radar/Alert_A
add wave -noupdate /radar/A
add wave -noupdate /radar/B
add wave -noupdate /radar/auxA
add wave -noupdate /radar/auxB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {21 ns}
