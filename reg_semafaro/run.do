vsim mde_b 
add wave *


force clk 0 0ns, 1 1ns -repeat 2ns
force r 0 1ns, 1 1ns, 0 10ns
force w 0 0ns, 1 1ns, 0 9ns, 1 12ns

run 20
