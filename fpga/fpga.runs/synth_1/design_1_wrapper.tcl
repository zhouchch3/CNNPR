# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir F:/Programdata/CNNPR/fpga/fpga.cache/wt [current_project]
set_property parent.project_path F:/Programdata/CNNPR/fpga/fpga.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
read_verilog F:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/hdl/common.vh
add_files F:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/design_1.bd
set_property used_in_implementation false [get_files -all f:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all f:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0_board.xdc]
set_property used_in_implementation false [get_files -all f:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0.xdc]
set_property used_in_implementation false [get_files -all f:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all f:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all f:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all f:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all F:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/design_1_ooc.xdc]
set_property is_locked true [get_files F:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/design_1.bd]

read_verilog -library xil_defaultlib {
  F:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/hdl/fifo.v
  F:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/hdl/wburst_counter.v
  F:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/hdl/fifo_fwft.v
  F:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/hdl/counter.v
  F:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/hdl/axi_master.v
  F:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/hdl/axi_master_wrapper.v
  F:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/hdl/pl_mem_controller.v
  F:/Programdata/CNNPR/fpga/fpga.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc F:/Programdata/CNNPR/fpga/fpga.srcs/constrs_1/new/design_1_wrapper.xdc
set_property used_in_implementation false [get_files F:/Programdata/CNNPR/fpga/fpga.srcs/constrs_1/new/design_1_wrapper.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top design_1_wrapper -part xc7z020clg484-1


write_checkpoint -force -noxdef design_1_wrapper.dcp

catch { report_utilization -file design_1_wrapper_utilization_synth.rpt -pb design_1_wrapper_utilization_synth.pb }
