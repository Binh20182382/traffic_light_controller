module time_counter (/*AUTOARG*/
   // Outputs
   g_end, y_end, r_end,
   // Inputs
   clk, rst_n, fsm_g, fsm_r, fsm_y
   );
parameter GREEN_TIME  = 29;
parameter YELLOW_TIME = 4;
parameter RED_TIME    = 9;
//
//interface
//
input clk;
input rst_n;
input fsm_g;
input fsm_r;
input fsm_y;
output wire g_end;
output wire y_end;
output wire r_end;
//
//Internal signals
//
reg [7:0] clk_counter;
wire clr_counter;
//
//
//
always @ (posedge clk) begin
  if (~rst_n) clk_counter[7:0] <= 8'd0;
  else if (clr_counter) clk_counter[7:0] <= 8'd0;
  else clk_counter[7:0] <= clk_counter[7:0] + 1'b1;
end
// luon dem va trong thoi gian dem neu dieu kien duoi xay ra
//Compare the end time
assign g_end = fsm_g & (clk_counter[7:0] == GREEN_TIME);
// dang den xanh va dem het => gend =1
assign y_end = fsm_y & (clk_counter[7:0] == YELLOW_TIME);
assign r_end = fsm_r & (clk_counter[7:0] == RED_TIME);
//
assign clr_counter = g_end | y_end | r_end;

endmodule