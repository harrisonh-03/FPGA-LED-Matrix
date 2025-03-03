module matrixGradient(
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
    
    logic [31:0] r1;
    logic [31:0] r2;
    logic [31:0] g1;
    logic [31:0] g2;
    logic [31:0] b1;
    logic [31:0] b2;
    assign r1[9:0] = 1;
    assign g1[9:0] = 0;
    assign b1[9:0] = 0;
    
    assign r1[19:10] = 0;
    assign g1[19:10] = 0;
    assign b1[19:10] = 1;
    
    assign r1[29:20] = 0;
    assign g1[29:20] = 1;
    assign b1[29:20] = 0;   
     
    assign r1[31:30] = 1;
    assign g1[31:30] = 1;
    assign b1[31:30] = 0;
    assign r2[7:0] = 1;
    assign g2[7:0] = 1;
    assign b2[7:0] = 0;
    
    assign r2[17:8] = 1;
    assign g2[17:8] = 0;
    assign b2[17:8] = 1;

    assign r2[27:18] = 0;
    assign g2[27:18] = 1;
    assign b2[27:18] = 1;   
    
    assign r2[31:28] = 1;
    assign g2[31:28] = 1;
    assign b2[31:28] = 1;     
                 
    logic clk20MHz;
    counter #(.n(3), .k(5)) MHz25 (
        .clk(CLK100MHZ),
        .rollover(clk20MHz)
    );
    
    gradientFSM F1 (
        .clock(clk20MHz),
        .r1(r1),
        .r2(r2),
        .g1(g1),
        .g2(g2),
        .b1(b1),
        .b2(b2),
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
    
    
endmodule
