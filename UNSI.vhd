vsim mde_b 
add wave *


force clk 0 0ns, 1 1ns -repeat 2ns
force r 0 0ns, 1 1ns, 0 10ns
force w 0 0ns, 1 1ns, 0 9ns, 1 12ns

run 20
-------------------------
vsim BITCOMPARADOR 
add wave *
force A 0 0, 1 20
force B 0 0, 1 40
force AM 0 0, 1 110,
force BM 0 0, 1 100
force ABIG 1 0, 0 50 
run 120
------------------------------
vsim COMPARADOR8BITS
add wave *
force AI "00001000" 0, "00000010" 40
force BI "00000010" 0, "00001000" 20
force AM 0 0
force BM 0 0
force ABIG 0 0, 1 10 
run 120
------------------------------
vsim CONTADOR_8
add wave *
force CLK_CONTADOR_8 0 0, 1 2 -REPEAT 4
force ENB_CONTADOR_8 1 0, 0 100
force CLR_CONTADOR_8 0 1, 1 2, 0 110
run 120
------------------------------
vsim TEMPO_LIMITE
add wave *
force CLK_TEMPO_LIMITE 0 0, 1 1 -REPEAT 2
force EN_TEMPO_LIMITE 1 0, 0 100
force CLR_TEMPO_LIMITE 0 1, 1 1, 0 110
force SEL_TEMPO_LIMITE "11" 0, "00" 22 
run 120
-----------------------------

-----------------------------
rce EN_TEMPO_LIMITE 1 0, 0 100
force CLR_TEMPO_LIMITE 0 1, 1 1, 0 110
force SEL_TEMPO_LIMITE "00" 0, "01" 52 
run 120
-----------------------------

-----------------------------
vsim DTPTH
add wave *
force CLR 1 0, 0 25
force LD 1 0, 0 5  -repeat 10
force CLK 1 0, 0 1  -repeat 2
force Acomp "00000010" 0 
force Scomp "00001000" 20
run 40
-----------------------------
vsim REG
add wave *
force CLreg  1 0
force LDreg 1 0, 0 5  -repeat 10
force CLKreg 1 0, 0 1  -repeat 2
force TOT1 "00001000" 0 ,  "00001100" 15 , "00001100" 22, "00001110" 26
run 40
------------------------------
vsim MUXC
add wave *
force SELE 1 0, 0 5  -repeat 10
force EP "00000001" 0 
force ES "00001100" 0
run 40
------------------------------
vsim TOPO
add wave *
force S "00001000"
force A "00000010"
force C 1 10, 0 20 -REPEAT 40
force CLOCK 1 0, 0 2  -repeat 4
run 120

	     