#!/bin/bash
iverilog -o sim.out traffic_light_controller.v traffic_light_tb.v
vvp sim.out
gtkwave dump.vcd
