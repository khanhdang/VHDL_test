syn:
	mkdir -p output_files
	mkdir -p report
	genus -legacy_ui -no_gui -execute "source decoder110.tcl; exit" 2>&1 | \
	tee run_syn.decoder110.`date +%Y-%m-%d-%H%M%S`.log

power:
	mkdir -p output_files
	mkdir -p report
	genus -legacy_ui -no_gui -execute "source decoder110_pw.tcl; exit" 2>&1 | \
	tee run_pw.decoder110.`date +%Y-%m-%d-%H%M%S`.log

clean:
	rm -rf WORK report results *.log genus.* output_files *~ fv output_files_pw reports_pw
.PHONY: clean
