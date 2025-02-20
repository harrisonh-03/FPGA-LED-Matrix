`timescale 1ns / 1ps

module matrix(
    input CLK100MHZ,
    output logic A,    
    output logic B, 
    output logic C, 
    output logic D, 
    output logic E, 
    output logic CLK,    
    output logic R1, 
    output logic G1, 
    output logic B1, 
    output logic R2, 
    output logic G2, 
    output logic B2, 
    output logic OE, 
    output logic LAT  
    );
    
    logic clk100KHz;
    counter #(.n(10), .k(1000)) matrixClock (
        .clk(CLK100MHZ),
        .rollover(clk100KHz)
    );
    
    logic [4:0] address;
    logic [6:0] shift_count;
    initial begin
        CLK <= 0;
        OE <= 0;
        LAT <= 0;
        address <= 0;
        shift_count <= 0;
    end
    
    always @(posedge clk100KHz) begin
        if (shift_count < 64) begin
            CLK <= 1;
            R1 <= 0;
            G1 <= 1;
            B1 <= 0;
            R2 <= 0;
            G2 <= 1;
            B2 <= 0;
            CLK <= 0;
            shift_count += 1;
        end else begin
            shift_count <= 0;
            OE <= 1;
            A <= address[0];
            B <= address[1];
            C <= address[2];
            D <= address[3];
            E <= address[4];
            if (address == 31) begin
                address <= 0;
            end else begin
                address += 1;
            end
            LAT <= ~LAT;
            OE <= 0;
        end
    end
    
    
endmodule
