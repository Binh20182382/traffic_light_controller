`timescale 1ns/1ns
module tb_traffic_light;
/*AUTOREGINPUT*/
// Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
reg         clk;            // To dut of traffic_light_controller.v
reg         rst_n;          // To dut of traffic_light_controller.v
// End of automatics
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [2:0]      street_a;       // From dut of traffic_light_controller.v
wire [2:0]      street_b;       // From dut of traffic_light_controller.v
wire [6:0]        hex0;
wire [6:0]        hex1;
wire [6:0]        hex2;
wire [6:0]        hex3;
// End of automatics

traffic_light_controller DUT (/*AUTOINST*/
                  // Outputs
                  .street_a (street_a[2:0]),
                  .street_b (street_b[2:0]),
                  // Inputs
                  .clk  (clk),
                  .rst_n    (rst_n),
                  .hex0 (hex0),
                  .hex1  (hex1),
                  .hex2  (hex2),
                  .hex3  (hex3)
                  );

initial begin
  clk = 0;
    forever #10 clk = !clk;
end

initial begin
  rst_n = 0;
    #20
    rst_n = 1;
end

endmodule
