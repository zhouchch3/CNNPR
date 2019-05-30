set_property SRC_FILE_INFO {cfile:F:/Programdata/CNNPR/mfpga/fpga.xdc rfile:../../../../fpga.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:6 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y9 [get_ports clk]
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F22 [get_ports {reset}];  # "SW0"
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN G22 [get_ports {m_rd_req_sw}];  # "SW1"
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y11 [get_ports m_clk]
set_property src_info {type:XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA8 [get_ports m_wr_req]
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA11 [get_ports m_rd_req]
set_property src_info {type:XDC file:1 line:19 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y10 [get_ports s_ready]
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA9 [get_ports data_ov]
set_property src_info {type:XDC file:1 line:29 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W12 [get_ports {data_out[0]}]
set_property src_info {type:XDC file:1 line:30 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W11 [get_ports {data_out[1]}]
set_property src_info {type:XDC file:1 line:31 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V10 [get_ports {data_out[2]}]
set_property src_info {type:XDC file:1 line:32 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W8 [get_ports {data_out[3]}]
set_property src_info {type:XDC file:1 line:33 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V12 [get_ports {data_out[4]}]
set_property src_info {type:XDC file:1 line:34 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W10 [get_ports {data_out[5]}]
set_property src_info {type:XDC file:1 line:35 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V9 [get_ports {data_out[6]}]
set_property src_info {type:XDC file:1 line:36 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V8 [get_ports {data_out[7]}]
set_property src_info {type:XDC file:1 line:41 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB6 [get_ports {data_out[8]}]
set_property src_info {type:XDC file:1 line:42 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB7 [get_ports {data_out[9]}]
set_property src_info {type:XDC file:1 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA4 [get_ports {data_out[10]}]
set_property src_info {type:XDC file:1 line:44 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y4 [get_ports {data_out[11]}]
set_property src_info {type:XDC file:1 line:45 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T6 [get_ports {data_out[12]}]
set_property src_info {type:XDC file:1 line:46 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R6 [get_ports {data_out[13]}]
set_property src_info {type:XDC file:1 line:47 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U4 [get_ports {data_out[14]}]
set_property src_info {type:XDC file:1 line:48 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T4 [get_ports {data_out[15]}]
set_property src_info {type:XDC file:1 line:53 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W7 [get_ports {data_out[16]}]
set_property src_info {type:XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V7 [get_ports {data_out[17]}]
set_property src_info {type:XDC file:1 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V4 [get_ports {data_out[18]}]
set_property src_info {type:XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V5 [get_ports {data_out[19]}]
set_property src_info {type:XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W5 [get_ports {data_out[20]}]
set_property src_info {type:XDC file:1 line:58 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W6 [get_ports {data_out[21]}]
set_property src_info {type:XDC file:1 line:59 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U5 [get_ports {data_out[22]}]
set_property src_info {type:XDC file:1 line:60 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U6 [get_ports {data_out[23]}]
set_property src_info {type:XDC file:1 line:62 export:INPUT save:INPUT read:READ} [current_design]
create_debug_core u_ila_0 ila
set_property src_info {type:XDC file:1 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:64 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:65 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:67 export:INPUT save:INPUT read:READ} [current_design]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:68 export:INPUT save:INPUT read:READ} [current_design]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:69 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:70 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:71 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
set_property src_info {type:XDC file:1 line:72 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/clk [get_nets [list clk_IBUF_BUFG]]
set_property src_info {type:XDC file:1 line:73 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property src_info {type:XDC file:1 line:74 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
set_property src_info {type:XDC file:1 line:75 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe0 [get_nets [list {data_out_IBUF[0]} {data_out_IBUF[1]} {data_out_IBUF[2]} {data_out_IBUF[3]} {data_out_IBUF[4]} {data_out_IBUF[5]} {data_out_IBUF[6]} {data_out_IBUF[7]} {data_out_IBUF[8]} {data_out_IBUF[9]} {data_out_IBUF[10]} {data_out_IBUF[11]} {data_out_IBUF[12]} {data_out_IBUF[13]} {data_out_IBUF[14]} {data_out_IBUF[15]} {data_out_IBUF[16]} {data_out_IBUF[17]} {data_out_IBUF[18]} {data_out_IBUF[19]} {data_out_IBUF[20]} {data_out_IBUF[21]} {data_out_IBUF[22]} {data_out_IBUF[23]} {data_out_IBUF[24]} {data_out_IBUF[25]} {data_out_IBUF[26]} {data_out_IBUF[27]} {data_out_IBUF[28]} {data_out_IBUF[29]} {data_out_IBUF[30]} {data_out_IBUF[31]}]]
set_property src_info {type:XDC file:1 line:76 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:77 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property src_info {type:XDC file:1 line:78 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
set_property src_info {type:XDC file:1 line:79 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe1 [get_nets [list clk_IBUF_BUFG]]
set_property src_info {type:XDC file:1 line:80 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:81 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property src_info {type:XDC file:1 line:82 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
set_property src_info {type:XDC file:1 line:83 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe2 [get_nets [list data_ov_IBUF]]
set_property src_info {type:XDC file:1 line:84 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:85 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property src_info {type:XDC file:1 line:86 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
set_property src_info {type:XDC file:1 line:87 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe3 [get_nets [list m_clk_OBUF]]
set_property src_info {type:XDC file:1 line:88 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:89 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property src_info {type:XDC file:1 line:90 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
set_property src_info {type:XDC file:1 line:91 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe4 [get_nets [list m_rd_req_OBUF]]
set_property src_info {type:XDC file:1 line:92 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:93 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property src_info {type:XDC file:1 line:94 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
set_property src_info {type:XDC file:1 line:95 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe5 [get_nets [list m_wr_req_OBUF]]
set_property src_info {type:XDC file:1 line:96 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:97 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property src_info {type:XDC file:1 line:98 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
set_property src_info {type:XDC file:1 line:99 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe6 [get_nets [list p_0_in]]
set_property src_info {type:XDC file:1 line:100 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:101 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property src_info {type:XDC file:1 line:102 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
set_property src_info {type:XDC file:1 line:103 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe7 [get_nets [list reset_IBUF]]
set_property src_info {type:XDC file:1 line:104 export:INPUT save:INPUT read:READ} [current_design]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:105 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:106 export:INPUT save:INPUT read:READ} [current_design]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:107 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
