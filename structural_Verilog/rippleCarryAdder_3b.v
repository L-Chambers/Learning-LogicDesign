`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Lauren Chambers for learning-LogicDesign
// 
// Module Name: rippleCarryAdder_3b
// Description: A ripple carry adder uses full adders to compute a sum and carryout 
// 				for each 2's place. The carryout of a lower-order 2's place becomes
//				the carry-in of the next 2's place. 
// 
// Dependencies: fullAdder.v
//////////////////////////////////////////////////////////////////////////////////

//
// 3-bit output is s3s2s1
//
module ripple_carry_adder(
    input cin, // carry in for adder 0
    input a0,
    input a1,
    input a2,
    input b0,
    input b1,
    input b2,
    output s3, // sum bit 3
    output s2, // sum bit 2
    output s1, // sum bit 1
    output s0  // sum bit 0
    );
    
    // wires to go from adders 0 and 1 and from 1 to 2
    wire wire01, wire12;
    
    // to create a 3-bit adder, 3 full adders are needed.
    full_adder FA0 (.a(a0), .b(b0), .cin(cin), .s(s0), .cout(wire01));
    full_adder FA1 (.a(a1), .b(b1), .cin(wire01), .s(s1), .cout(wire12));
    full_adder FA2 (.a(a2), .b(b2), .cin(wire12), .s(s2), .cout(s3));
    
endmodule

