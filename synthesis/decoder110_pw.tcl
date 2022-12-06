######################################################
# Script for Cadence RTL Compiler synthesis      
# Erik Brunvand, 2008
# Use with syn-rtl -f rtl-script
# Replace items inside <> with your own information
######################################################

# Set the search paths to the libraries and the HDL files
# Remember that "." means your current directory. Add more directories
# after the . if you like.  
set_attribute hdl_search_path {../rtl/} 
set_attribute lib_search_path {/home/lib/}
set_attribute library [list typical.lib]
set_attribute information_level 6 

set myFiles [list ./output_files/detector110_net.v]         ;# All HDL files
set basename detector110	         ;# name of top level module
set myClk clk                    ;# clock name
set myPeriod_ps 2400             ;# Clock period in ps
set myInDelay_ns 0.1             ;# delay from clock to inputs valid
set myOutDelay_ns 0.1            ;# delay from clock to output valid
set runname net                  ;# name appended to output files

set_attribute lp_insert_clock_gating true

######################################################
# Enable RTL Power Analysis
######################################################
set_attr hdl_track_filename_row_col true
set_attribute lp_power_unit nW

#*********************************************************
#*   below here shouldn't need to be changed...          *
#*********************************************************

# Analyze and Elaborate the HDL files
# set_attribute hdl_language vhdl
read_hdl ${myFiles}
elaborate ${basename}

# Apply Constraints and generate clocks
define_clock -period ${myPeriod_ps} -name ${myClk} [clock_port]
external_delay -input $myInDelay_ns -clock ${myClk} [find / -port ports_in/*]
external_delay -output $myOutDelay_ns -clock ${myClk} [find / -port ports_out/*]

# Sets transition to default values for Synopsys SDC format, 
# fall/rise 400ps
dc::set_clock_transition .4 $myClk

# read_vcd -static ../simulation/detector110_normal_activities.vcd
read_vcd -static ../simulation/detector110_0_activity.vcd

# Specify Leakage Power Constraint
set_attribute max_leakage_power 3.3 ${basename}
# Specify Leakage Power Constraint
set_attribute max_dynamic_power 3.3 ${basename}
# Specify Leakage Power Optimization Directive
set_attribute leakage_power_effort medium
# Specify Effort to use for Propagation of Switching Activtives
set_attribute lp_power_analysis_effort medium
set_attribute lp_power_optimization_weight 0.5 ${basename}

# check that the design is OK so far
check_design -unresolved
report timing -lint

# Synthesize the design to the target library
synthesize -to_mapped

syn_opt -incr
# Write out the reports
report timing > ./reports_pw/${basename}_${runname}_timing.rep
report gates  > ./reports_pw/${basename}_${runname}_cell.rep
report power -detail > ./reports_pw/${basename}_${runname}_power.rep

# Write out the structural Verilog and sdc files
write_hdl -mapped >  ./output_files_pw/${basename}_${runname}.v
write_sdc >  ./output_files_pw/${basename}_${runname}.sdc
