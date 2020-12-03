# ####################################################################

#  Created by Genus(TM) Synthesis Solution 18.13-s027_1 on Thu Dec 03 15:54:30 JST 2020

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1.0fF
set_units -time 1000.0ps

# Set the current design
current_design detector110

create_clock -name "clk" -period 2.4 -waveform {0.0 1.2} [get_ports clk]
set_clock_transition 0.4 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.0001 [get_ports reset]
set_input_delay -clock [get_clocks clk] -add_delay 0.0001 [get_ports clk]
set_input_delay -clock [get_clocks clk] -add_delay 0.0001 [get_ports a]
set_output_delay -clock [get_clocks clk] -add_delay 0.0001 [get_ports w]
set_wire_load_mode "enclosed"
set_dont_use [get_lib_cells NangateOpenCellLibrary/ANTENNA_X1]
set_dont_use [get_lib_cells NangateOpenCellLibrary/FILLCELL_X1]
set_dont_use [get_lib_cells NangateOpenCellLibrary/FILLCELL_X2]
set_dont_use [get_lib_cells NangateOpenCellLibrary/FILLCELL_X4]
set_dont_use [get_lib_cells NangateOpenCellLibrary/FILLCELL_X8]
set_dont_use [get_lib_cells NangateOpenCellLibrary/FILLCELL_X16]
set_dont_use [get_lib_cells NangateOpenCellLibrary/FILLCELL_X32]
set_dont_use [get_lib_cells NangateOpenCellLibrary/LOGIC0_X1]
set_dont_use [get_lib_cells NangateOpenCellLibrary/LOGIC1_X1]
