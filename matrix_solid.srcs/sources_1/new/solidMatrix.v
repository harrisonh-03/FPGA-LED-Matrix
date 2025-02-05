`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2025 04:11:32 PM
// Design Name: 
// Module Name: solidMatrix
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


module solidMatrix(
    input CLK100MHZ,
    output reg R1,
    output reg R2,
    output reg G1,
    output reg G2,
    output reg B1,
    output reg B2,
    output A,
    output B,
    output C,
    output D,
    output E,
    output OE,
    output LAT,
    output CLK
    );
    
    
    assign A = 0;
    assign B = 0;
    assign C = 0;
    assign D = 0;
    assign E = 0;
    
    assign OE = 1;
    assign CLK = CLK100MHZ;
    
    always @ (posedge CLK100MHZ) begin
        B1 <= 255;
        B2 <= 255;
        R1 <= 0;
        R2 <= 0;
        G1 <= 0;
        G2 <= 0;
    end
    
    wire Q;
    counter #(.n(6), .k(64)) C1 (.clk(CLK), .enable(1), .rst(0), .rollover(LAT), .Q(Q)); 
endmodule
