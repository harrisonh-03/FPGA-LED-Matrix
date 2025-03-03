module matrix_sm(
    input clock,
    input [2:0] rgb1,
    input [2:0] rgb2,
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
    
    typedef enum logic [2:0] { init,
                         shiftBit,
                         setClock,
                         disableOutput,
                         setAddress,
                         latch,
                         enableOutput } State;
    
    State currentState, nextState;
    
    logic [6:0] shift;
    logic [4:0] address;
    
    always_ff @(posedge clock) begin
        currentState = nextState;
    end
    
    always_comb begin
        case(currentState)
            init: nextState = shiftBit;
            
            shiftBit: nextState = setClock;
            
            setClock: begin
                if (shift != 64)
                    nextState = shiftBit;
                else
                    nextState = disableOutput;
            end
            
            disableOutput: begin
                nextState = setAddress;
            end
            
            setAddress: nextState = latch;
            
            latch: nextState = enableOutput;
            
            enableOutput: nextState = shiftBit;
            
            default: nextState = init;
        endcase
    end
    
    always_ff @(posedge clock) begin
    
        case(currentState)
            init: begin
                shift <= 0;
                address <= 0;
                OE <= 0;
                LAT <= 0;
                CLK <= 0;
            end
            
            shiftBit: begin
                    R1 <= rgb1[2];
                    G1 <= rgb1[1];
                    B1 <= rgb1[0];
                    R2 <= rgb2[2];
                    G2 <= rgb2[1];
                    B2 <= rgb2[0];
                CLK <= 0;
                shift += 1;
            end
            
            setClock: begin
                CLK <= 1;
            end
            
            disableOutput: begin
                OE <= 1;
                CLK <= 0;
            end
            
            setAddress: begin
                A <= address[0];
                B <= address[1];
                C <= address[2];
                D <= address[3];
                E <= address[4];
                //address += 1;   //comment out to display single row
            end
            
            latch: begin
                LAT <= ~LAT;
            end
            
            enableOutput: begin
                OE <= 0;
            end
        endcase
    end
    
endmodule
