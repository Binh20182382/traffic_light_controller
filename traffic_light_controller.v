module traffic_light_controller (/*AUTOARG*/
   // Outputs
   street_a, street_b, 
   // Inputs
   rst_n, clk_20, hex0,hex1,hex2,hex3
   );
//
//Interface
//
/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input           clk_20;            // To cnt of time_counter.v, ...
input           rst_n;          // To cnt of time_counter.v, ...
// End of automatics
/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output [2:0]        street_a;       // From fsm of fsm.v
output [2:0]        street_b;       // From fsm of fsm.v
output [6:0]        hex0;
output [6:0]        hex1;
output [6:0]        hex2;
output [6:0]        hex3;
// End of automatics
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire            fsm_g;          // From fsm of fsm.v
wire            fsm_r;          // From fsm of fsm.v
wire            fsm_y;          // From fsm of fsm.v
wire            g_end;          // From cnt of time_counter.v
wire            r_end;          // From cnt of time_counter.v
wire            y_end;          // From cnt of time_counter.v
wire            clk;
wire            rst_n;
// End of automatics
div_clock dclk (
                .clk_20 (clk_20),
                .rst_n  (rst_n),
                .clk_1Hz  (clk)
                );

time_counter cnt (/*AUTOINST*/
          // Outputs
          .g_end        (g_end),
          .y_end        (y_end),
          .r_end        (r_end),
          // Inputs
          .clk          (clk),
          .rst_n        (rst_n),
          .fsm_g        (fsm_g),
          .fsm_r        (fsm_r),
          .fsm_y        (fsm_y));

fsm fsm (/*AUTOINST*/
     // Outputs
     .street_a          (street_a[2:0]),
     .street_b          (street_b[2:0]),
     .fsm_g             (fsm_g),
     .fsm_y             (fsm_y),
     .fsm_r             (fsm_r),
     // Inputs
     .clk               (clk),
     .rst_n             (rst_n),
     .g_end             (g_end),
     .y_end             (y_end),
     .r_end             (r_end));
count_led7seg led7_seg
        ( 
        .street_a (street_a),
         .street_b (street_b),
        .rst_n   (rst_n),
         .clk  (clk),
        .hex0 (hex0[6:0]),
        .hex1 (hex1[6:0]),
        .hex2 (hex2[6:0]),
        .hex3 (hex3[6:0])
        
        );
endmodule