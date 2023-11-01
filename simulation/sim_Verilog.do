vlib work
vmap work work

# compile
vlog ../rtl/detector110.v
vlog ../testbench/detector110_tester.v

# simulate

vsim -voptargs="+acc" work.detector110_tester

# add wave to the view
add wave /*

# run the simulation
run 200 ns
