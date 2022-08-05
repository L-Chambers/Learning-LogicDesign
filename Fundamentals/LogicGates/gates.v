`timescale 1ns / 1ps // `timescale <time_unit>/<time_precision> 
//////////////////////////////////////////////////////////////////////////////////
// Author: Lauren Chambers
//         laalcham@ucsc.edu
// 
// Project: Logic Design Fundamentals: Logic Gates
// File Name: gates.v
// Dependencies: none
// Description: introduction to logic gates in Verilog 
//////////////////////////////////////////////////////////////////////////////////

module gates();
    
    reg [3:0] A; // 4 bit bus
    reg [3:0] B; // 4 bit bus
    reg C;       // single bit
    reg D;        // single bit

    // this block executes once (not synthesizable)
    initial begin

        A = 4'b0101;  // 5 in decimal, A = 'd5
        B = 4'b1011;  // 11 in decimal, B = 'd11
        C = 1'b0;     
        D = 1'b1;

        $display("A is: %d = %b", A, A);
        $display("B is: %d = %b", B, B);
        $display("C is: %d = %b", C, C);
        $display("D is: %d = %b", D, D);

        $display(" ");
        $display("UNARY OPERATIONS");
        $display("--------------------");
        $display("            NOT:  ~A = %b", ~A);
        $display("            NOT:  ~C = %b", ~C);
        $display("  reductive AND:  &A = %b", &A);
        $display("  reductive OR:   |A = %b", |A);
        $display("  reductive XOR:  ^A = %b", &A);
    
        $display(" ");
        $display("BINARY OPERATIONS");    
        $display("--------------------");
        $display("  bitwise AND:  (A & B) = (%b & %b) = %b", A, B, A & B);
        $display("  bitwise AND:  (C & D) = (%b & %b) = %b", C, D, C & D);
        $display("  bitwise  OR:  (A | B) = (%b | %b) = %b", A, B, A | B);
        $display("  bitwise  OR:  (C | D) = (%b | %b) = %b", C, D, C | D);
        $display("  bitwise XOR:  (A ^ B) = (%b ^ %b) = %b", A, B, A ^ B);
        $display("  bitwise XOR:  (C ^ D) = (%b ^ %b) = %b", C, D, C ^ D);

     end

endmodule