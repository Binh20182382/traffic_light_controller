module display_7seg(
   count,
   clk,
    rst_n,
    sseg_temp1,
    sseg_temp2
    );
input  [5:0] count;
input rst_n;
input clk;
output  reg [6:0] sseg_temp1;
output  reg [6:0] sseg_temp2;
reg [3:0]first; //register for the first digit
reg [3:0]second; //register for the second digit
always @ (posedge rst_n)
begin
  if (rst_n) begin
   first <= 0;
   second <= 0;
  end
   else begin
  first <= count[5:0]%10;
  second <= count[5:0]/10;
  end
 end
  

always @ (*)
begin
  case(first)
   4'd0 : sseg_temp1 = 7'b1000000; //0
   4'd1 : sseg_temp1 = 7'b1111001; //1
   4'd2 : sseg_temp1 = 7'b0100100; //2
   4'd3 : sseg_temp1 = 7'b0110000; //3
   4'd4 : sseg_temp1 = 7'b0011001; //4
   4'd5 : sseg_temp1 = 7'b0010010; //5
   4'd6 : sseg_temp1 = 7'b0000010; //6
   4'd7 : sseg_temp1 = 7'b1111000; //7
   4'd8 : sseg_temp1 = 7'b0000000; //8
   4'd9 : sseg_temp1 = 7'b0010000; //9
   default : sseg_temp1 = 7'b0111111; //dash
  endcase

  case(second)
   4'd0 : sseg_temp2 = 7'b1000000; //0
   4'd1 : sseg_temp2 = 7'b1111001; //1
   4'd2 : sseg_temp2 = 7'b0100100; //2
   4'd3 : sseg_temp2 = 7'b0110000; //3
   4'd4 : sseg_temp2 = 7'b0011001; //4
   4'd5 : sseg_temp2 = 7'b0010010; //5
   4'd6 : sseg_temp2 = 7'b0000010; //6
   4'd7 : sseg_temp2 = 7'b1111000; //7
   4'd8 : sseg_temp2 = 7'b0000000; //8
   4'd9 : sseg_temp2 = 7'b0010000; //9
   default : sseg_temp2 = 7'b0111111; //dash
  endcase
end
endmodule

