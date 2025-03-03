`timescale 1ns / 1ps

module counter(
    input clk,
    output rollover
    );
    parameter n = 16;
    parameter k = 200;
    
    logic [n-1:0] count;
    
    initial begin
        count <= 0;
    end
    
    always @ (posedge clk) begin
            if (count == k - 1)
                count <= 0;
            else
                count <= count + 1;
    end
    
    assign rollover = (count == k - 1);
    
endmodule
