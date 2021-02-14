onerror {quit -f}
vlib work
vlog -work work graphics_card.vo
vlog -work work graphics_card.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.graphics_card_vlg_vec_tst
vcd file -direction graphics_card.msim.vcd
vcd add -internal graphics_card_vlg_vec_tst/*
vcd add -internal graphics_card_vlg_vec_tst/i1/*
add wave /*
run -all
