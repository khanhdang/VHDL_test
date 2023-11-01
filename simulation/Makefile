RTL_DIR := ../rtl
TB_DIR := ../testbench
PS_RTL_DIR := ../synthesis/output_files
PS_RTL := detector110_net.v
SIM_DIR := ../simulation
STD_CELL_LIB = /home/doanh/Work/NASH-main/Tutorial/SNPC/LIB/NangateOpenCellLibrary.v

init:
	vlib work
	vlog $(RTL_DIR)/detector110.v   
	vlog $(TB_DIR)/detector110_tester.v
	vsim -voptargs="+acc" -wlf detector110.wlf TB_detector110 \
		-c -do "log -r *; run -a; add wave *; exit"

all: init

post-syn:
	vlib work
	vlog $(STD_CELL_LIB)
	vlog $(PS_RTL_DIR)/$(PS_RTL)
	vlog $(TB_DIR)/detector110_tester.v
	vsim -voptargs="+acc" -wlf detector110.wlf TB_detector110 \
		-c -do "log -r *; run -a; add wave *; exit"

clean:
	rm -rf ./modelsim.ini $(RTL_DIR)/modelsim.ini $(SIM_DIR)/modelsim.ini \
		./transcript ./work/ ./vsim* ./*\~ ./*.wlf
