vlib work
vlog -f src_files.list
vsim -voptargs=+acc work.ALU_tb 
add wave *
run -all