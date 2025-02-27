syn:
	mkdir -p output_files reports
	dc_shell -f decoder110.tcl 2>&1 | \
	tee run_syn.decoder110.`date +%Y-%m-%d-%H%M%S`.log


clean:
	rm -rf WORK reports results *.log genus.* output_files *~ fv output_files_pw reports_pw
.PHONY: clean
