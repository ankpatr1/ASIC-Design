`timescale 1ns/1ps
module traffic_light_tb;
  reg clk = 0;
  reg rst;
  wire [1:0] ns_light, ew_light, sn_light, we_light;

  traffic_light_controller dut (
    .clk(clk),
    .rst(rst),
    .ns_light(ns_light),
    .ew_light(ew_light),
    .sn_light(sn_light),
    .we_light(we_light)
  );

  always #5 clk = ~clk; // 10ns clock period (100MHz)

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, traffic_light_tb);

    rst = 1; #20;
    rst = 0;

    #1000;
    $finish;
  end
endmodule
