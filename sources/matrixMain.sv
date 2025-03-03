module matrixMain(
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
    output logic LAT,
    output [5:0] LED
    );
    
    //oscillate solid colors
    logic [2:0] rgb1, rgb2;
    initial begin
        rgb1 <= 3'b111;
        rgb2 <= 3'b000;
    end
    
    logic clk1sec;
    counter #(.n(27), .k(100000000)) secCount (
        .clk(CLK100MHZ),
        .rollover(clk1sec)
    );
    
   /* always_ff @(posedge CLK100MHZ) begin
        if (clk1sec) begin
            rgb1 += 1;
            rgb2 += 1;
        end
    end*/
    
    logic clk25MHz;
    counter #(.n(3), .k(4)) MHz25 (
        .clk(CLK100MHZ),
        .rollover(clk25MHz)
    );
    //need to look into ROM/RAM
    
    matrix_sm S1 (
        .clock(clk25MHz),
        .rgb1(rgb1),
        .rgb2(rgb2),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .R1(R1),
        .R2(R2),
        .G1(G1),
        .G2(G2),
        .B1(B1),
        .B2(B2),
        .CLK(CLK),
        .OE(OE),
        .LAT(LAT)
    );
    
    assign LED[5:3] = rgb1;
    assign LED[2:0] = rgb2;
    
endmodule
