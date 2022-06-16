module div_clock(clk_20, rst_n, clk_1Hz);
input clk_20, rst_n;
output clk_1Hz;

reg clk_1Hz = 1'b0;
reg [27:0] counter;
 
always@(posedge clk_20)
begin
    if (~rst_n)
        begin
            clk_1Hz <= 0;
            counter <= 0;
        end
    else
        begin
            counter <= counter + 1;
            if ( counter == 28'd10000000)
                begin
                    counter <= 0;
                    clk_1Hz <= ~clk_1Hz;
                end
        end
end
endmodule   