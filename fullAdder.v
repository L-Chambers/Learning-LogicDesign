`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Lauren Chambers for learning-LogicDesign
// 
// Module Name: full_adder
// Description: A full adder sums 3 input bits and outputs the result sum and carryout bits.
// 
// Dependencies: none
//////////////////////////////////////////////////////////////////////////////////

module full_adder(
    
    // declare inputs and outputs for full adder
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
 
    // sum is 1 if there is an odd # of 1s as input (1 or 3)
    assign s = a ^ b ^ cin;
    // carryout is 1 if the sum is 2 or 3
    assign cout = (a & b) | (a & cin) | (b & cin); 
    
endmodule
