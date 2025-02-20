`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2025 02:13:58 PM
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter(
    input clk,
    output rollover
    );
    parameter n = 3;
    parameter k = 6;
    
    reg [n-1:0] count;
    
    always @ (posedge clk) begin
        if (count == k - 1)
            count <= 0;
        else
            count <= count + 1;
    end
    
    assign rollover = (count == k - 1);
    
endmodule
