set projDir "C:/Users/Carey/Desktop/alu2020/work/vivado"
set projName "alu2020"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Carey/Desktop/alu2020/work/verilog/au_top_0.v" "C:/Users/Carey/Desktop/alu2020/work/verilog/fsmLogic_1.v" "C:/Users/Carey/Desktop/alu2020/work/verilog/reset_conditioner_2.v" "C:/Users/Carey/Desktop/alu2020/work/verilog/alu_3.v" "C:/Users/Carey/Desktop/alu2020/work/verilog/stateCounter_4.v" "C:/Users/Carey/Desktop/alu2020/work/verilog/multi_seven_seg_5.v" "C:/Users/Carey/Desktop/alu2020/work/verilog/adder_6.v" "C:/Users/Carey/Desktop/alu2020/work/verilog/compare_7.v" "C:/Users/Carey/Desktop/alu2020/work/verilog/boolean_8.v" "C:/Users/Carey/Desktop/alu2020/work/verilog/shifter_9.v" "C:/Users/Carey/Desktop/alu2020/work/verilog/counter_10.v" "C:/Users/Carey/Desktop/alu2020/work/verilog/seven_seg_11.v" "C:/Users/Carey/Desktop/alu2020/work/verilog/decoder_12.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Carey/Desktop/alu2020/work/constraint/alchitry.xdc" "C:/Users/Carey/Desktop/alu2020/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
