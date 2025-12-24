vlib work
vlog ALU_GM.v ALU_tb.v
vsim -voptargs=+acc work.ALU_tb 
add wave *
run -all
#quit -sim