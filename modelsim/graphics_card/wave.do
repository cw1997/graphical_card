onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /uart_tb/uart_inst/clk
add wave -noupdate /uart_tb/uart_inst/rst_n
add wave -noupdate -radix unsigned /uart_tb/uart_inst/div_count
add wave -noupdate -radix unsigned /uart_tb/uart_inst/clk_uart_enable
add wave -noupdate /uart_tb/uart_inst/clk_uart
add wave -noupdate /uart_tb/uart_inst/rxd
add wave -noupdate -radix unsigned /uart_tb/uart_inst/gram_write_data
add wave -noupdate -radix unsigned /uart_tb/uart_inst/gram_write_address
add wave -noupdate -radix unsigned /uart_tb/uart_inst/gram_write_enable
add wave -noupdate -radix unsigned /uart_tb/uart_inst/rxd_edge
add wave -noupdate -radix unsigned /uart_tb/uart_inst/clk_uart_edge
add wave -noupdate -radix unsigned /uart_tb/uart_inst/state
add wave -noupdate -radix unsigned /uart_tb/uart_inst/recv_index
add wave -noupdate -radix unsigned -childformat {{{/uart_tb/uart_inst/value[6]} -radix unsigned} {{/uart_tb/uart_inst/value[5]} -radix unsigned} {{/uart_tb/uart_inst/value[4]} -radix unsigned} {{/uart_tb/uart_inst/value[3]} -radix unsigned} {{/uart_tb/uart_inst/value[2]} -radix unsigned} {{/uart_tb/uart_inst/value[1]} -radix unsigned} {{/uart_tb/uart_inst/value[0]} -radix unsigned}} -subitemconfig {{/uart_tb/uart_inst/value[6]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/value[5]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/value[4]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/value[3]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/value[2]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/value[1]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/value[0]} {-height 15 -radix unsigned}} /uart_tb/uart_inst/value
add wave -noupdate -radix unsigned -childformat {{{/uart_tb/uart_inst/char_index_low[7]} -radix unsigned} {{/uart_tb/uart_inst/char_index_low[6]} -radix unsigned} {{/uart_tb/uart_inst/char_index_low[5]} -radix unsigned} {{/uart_tb/uart_inst/char_index_low[4]} -radix unsigned} {{/uart_tb/uart_inst/char_index_low[3]} -radix unsigned} {{/uart_tb/uart_inst/char_index_low[2]} -radix unsigned} {{/uart_tb/uart_inst/char_index_low[1]} -radix unsigned} {{/uart_tb/uart_inst/char_index_low[0]} -radix unsigned}} -subitemconfig {{/uart_tb/uart_inst/char_index_low[7]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_low[6]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_low[5]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_low[4]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_low[3]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_low[2]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_low[1]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_low[0]} {-height 15 -radix unsigned}} /uart_tb/uart_inst/char_index_low
add wave -noupdate -radix unsigned -childformat {{{/uart_tb/uart_inst/char_index_high[7]} -radix unsigned} {{/uart_tb/uart_inst/char_index_high[6]} -radix unsigned} {{/uart_tb/uart_inst/char_index_high[5]} -radix unsigned} {{/uart_tb/uart_inst/char_index_high[4]} -radix unsigned} {{/uart_tb/uart_inst/char_index_high[3]} -radix unsigned} {{/uart_tb/uart_inst/char_index_high[2]} -radix unsigned} {{/uart_tb/uart_inst/char_index_high[1]} -radix unsigned} {{/uart_tb/uart_inst/char_index_high[0]} -radix unsigned}} -subitemconfig {{/uart_tb/uart_inst/char_index_high[7]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_high[6]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_high[5]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_high[4]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_high[3]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_high[2]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_high[1]} {-height 15 -radix unsigned} {/uart_tb/uart_inst/char_index_high[0]} {-height 15 -radix unsigned}} /uart_tb/uart_inst/char_index_high
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {129744 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {525 us}
