
#
# Libraries
#

set TSV_PATH "/home/lib/TSV_lib"
set search_path [concat  $search_path $TSV_PATH]
set target_library "/home/lib/typical.db"
set synthetic_library "dw_foundation.sldb"
set link_library [concat "*" $target_library $synthetic_library "TSV.db"]
set symbol_library "generic.sdb"

#
# Your design
#
set base_name "detector110"
set clock_name "clk"
set clock_period 2
set src_folder "../rtl"
           
set InDelay_ns 0.1             
set OutDelay_ns 0.1            
set clkUncertainty 0.004
set runname net                  


define_design_lib WORK -path ./WORK

#*********************************************************
#*   below here shouldn't need to be changed...          *
#*********************************************************

# Analyze and Elaborate the HDL files
# set_attribute hdl_language vhdl
analyze -format verilog $src_folder/detector110.v

elaborate ${base_name}
current_design ${base_name}
link
uniquify


# Apply Constraints and generate clocks


#
# Timing
#
create_clock -name $clock_name -period $clock_period [find port $clock_name]
set_clock_uncertainty $clkUncertainty [get_clocks $clock_name]
set_input_delay $InDelay_ns -clock clk [remove_from_collection [all_inputs] {clk rst_n}]
set_output_delay $OutDelay_ns -clock clk [all_outputs]

#
# Clock gating
#
# set_clock_gating_style -sequential latch
# insert_clock_gating


#
# Set wire load model
#
set_wire_load_model -name 5K_hvratio_1_1 -library NangateOpenCellLibrary



#
# Design synthesis
#

## If you want to ungroup >>
#ungroup -all -flatten

compile -map_effort high
compile -incremental_mapping -map_effort high

#
# Design report
#
check_design > ./report/check_design_${base_name}_${runname}.txt 
report_qor > ./report/summary_report_${base_name}_${runname}.txt
report_area -hierarchy > ./report/report_area_${base_name}_${runname}.txt
report_timing > ./report/report_timing_${base_name}_${runname}.txt
report_power -verbose > ./report/report_power_${base_name}_${runname}.txt

#
# Output
#
write -format verilog -hierarchy -output ./output_files/${base_name}_${runname}.v
write_sdc ./output_files/${base_name}_${runname}.sdc
write_sdf ./output_files/${base_name}_${runname}.sdf
write_parasitics  -output ./output_files/${base_name}_${runname}.spef
write_file -format ddc -hierarchy -output ./output_files/${base_name}_${runname}.ddc
exit  

