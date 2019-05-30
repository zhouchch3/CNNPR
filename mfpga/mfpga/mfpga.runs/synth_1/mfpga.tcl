# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir F:/Programdata/CNNPR/mfpga/mfpga/mfpga.cache/wt [current_project]
set_property parent.project_path F:/Programdata/CNNPR/mfpga/mfpga/mfpga.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
read_verilog -library xil_defaultlib {
  F:/Programdata/CNNPR/mfpga/fifo.v
  F:/Programdata/CNNPR/mfpga/mfpga.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc F:/Programdata/CNNPR/mfpga/fpga.xdc
set_property used_in_implementation false [get_files F:/Programdata/CNNPR/mfpga/fpga.xdc]


synth_design -top mfpga -part xc7z020clg484-1


write_checkpoint -force -noxdef mfpga.dcp

catch { report_utilization -file mfpga_utilization_synth.rpt -pb mfpga_utilization_synth.pb }
