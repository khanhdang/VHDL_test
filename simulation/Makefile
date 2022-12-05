RTL_DIR := ../rtl
PS_RTL_DIR := ../synthesis/output_files
PS_RTL := detector110_net.v
TB_DIR := ../simulation
STD_CELL_LIB = /home/doanh/Work/NASH-main/Tutorial/SNPC/LIB/NangateOpenCellLibrary.v

init:
	vlib work
	vmap work work
	vlog $(RTL_DIR)/detector110.v     ### Command for compiling .v file
	#vcom $(RTL_DIR)/detector110.vhd  ### Command for compiling .vhd files
	#vcom $(TB_DIR)/detector110_tester.vhd
	vlog $(TB_DIR)/detector110_tester.v
	vsim -voptargs="+acc" -wlf detector110.wlf TB_detector110 \
		-c -do "log -r *; run 200ns; add wave *; exit"

all: init

post-syn:
	vlib work
	vlog $(STD_CELL_LIB)
	vlog $(PS_RTL_DIR)/$(PS_RTL)
	vlog $(TB_DIR)/detector110_tester.v
	vsim -voptargs="+acc" -wlf detector110.wlf TB_detector110 \
		-c -do "log -r *; run 200ns; add wave *; exit"

clean:
	rm -rf ./modelsim.ini $(RTL_DIR)/modelsim.ini $(TB_DIR)/modelsim.ini \
		./transcript ./work/ ./vsim* ./*\~ ./*.wlf
