vlib work
vmap work work

# compile
vcom ../rtl/detector110.vhd
vcom detector110_tester.vhd

# simulate

vsim -voptargs="+acc" work.detector110_tester

# add wave to the view
add wave /*

# run the simulation
run 200 ns
