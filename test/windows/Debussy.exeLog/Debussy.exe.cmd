srcSourceCodeView
debImport "-2001" "-f" "vf"
debLoadSimResult F:\1-DL_hardware\CNNPR\test\windows\mem_controller_tb.fsdb
wvCreateWindow
wvResizeWindow -win $_nWave2 54 237 960 332
wvOpenFile -win $_nWave2 \
           {F:\1-DL_hardware\CNNPR\test\windows\mem_controller_tb.fsdb}
wvRestoreSignal -win $_nWave2 "mem_controller_tb.rc"
srcResizeWindow 0 0 804 500
wvResizeWindow -win $_nWave2 54 237 960 332
wvCloseWindow -win $_nWave2
wvGetSignalClose -win $_nWave2
debExit
Wave2 54 206 960 363
srcHBSelect "mem_controller_tb.mem_controller" -win $_nTrace1
srcSetScope -win $_nTrace1 "mem_controller_tb.mem_controller" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "parallel_out" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G1" 0)}
wvAddSignal -win $_nWave2 \
           "/mem_controller_tb/mem_controller/parallel_out\[71:0\]"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetCursor -win $_nWave2 93.141486 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 1322.628337 -snap {("G2" 0)}
wvResizeWindow -win $_nWave2 685 267 960 362
wvCloseWindow -win $_nWave2
wvResizeWindow -win $_nWave2 600 317 960 332
wvGetSignalClose -win $_nWave2
wvResizeWindow -win $_nWave2 600 317 960 332
debExit
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        wvCloseWindow -win $_nWave2
wvResizeWindow -win $_nWave2 54 237 960 332
wvGetSignalClose -win $_nWave2
wvResizeWindow -win $_nWave2 54 237 960 332
debExit
