# Simple Processor RISC-V

To compile:
```sh
iverilog -o <exe_file> "processor_tb.v"
```

To execute:
```sh
vvp <exe_file>
```

To check the simulation using GtkWave:
```sh
gtkwave outpute_wave.vcd
```
