vlib work
vmap work work

# compile
vcom ../rtl/detector110.vhd
vcom detector110_tester.vhd

# simulate

vsim -novopt work.detector110_tester

# xem song 
add wave /*

# chay 100 ns
run 200 ns
