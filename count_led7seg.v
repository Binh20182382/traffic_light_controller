module count_led7seg( 
        street_a, street_b,
        rst_n, clk,
        
        hex0,hex1,
        hex2,hex3
        );
 input wire [2:0] street_a;
 input wire [2:0] street_b;
 input rst_n, clk;
 reg [5:0] count1;
  reg [5:0] count1_tmp;
 reg [5:0] count2;
  reg [5:0] count2_tmp;
 output [6:0] hex0;
 output [6:0] hex1;
 output [6:0] hex2;
 output [6:0] hex3;


always @(*) begin
case (street_a[2:0])
     3'b100:
     count1_tmp[5:0]=6'd29;
     

     3'b010: 
     count1_tmp[5:0]=6'd4;

 

     3'b001: 
     count1_tmp[5:0]=6'd44;
     default: count1_tmp[5:0]=6'd0;
 
endcase
end

always @(*) begin
case (street_b[2:0])
     3'b100: 
     count2_tmp[5:0]=6'd29;

     3'b010: 
     count2_tmp[5:0]=6'd4;


     3'b001: 
     count2_tmp[5:0]=6'd44;
     default :  count2_tmp[5:0]=6'd0;
endcase
end
initial
begin
count1[5:0]=count1_tmp[5:0];
count2[5:0]=count2_tmp[5:0];
end
always @(posedge clk ) begin
 if(~rst_n) begin count1[5:0]<=5'd0; count2[5:0]<=5'd0; end
 else begin count1[5:0]<= count1[5:0]-1'b1; count2[5:0]<= count2[5:0]-1'b1; end
 end

display_7seg led01(count1[5:0],clk ,rst_n ,hex0[6:0],hex1[6:0]);
display_7seg led23(count2[5:0],clk ,rst_n ,hex2[6:0],hex3[6:0]);
endmodule 