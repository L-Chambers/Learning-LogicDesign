`timescale 1ns / 1ps // `timescale <time_unit>/<time_precision> 
//////////////////////////////////////////////////////////////////////////////////
// Author: Lauren Chambers
//         laalcham@ucsc.edu
// 
// Project: Logic Design Fundamentals: Logic Gates
// File Name: adder_4b.v
// Dependencies: none
// Description: introduction to adders in Verilog 
//////////////////////////////////////////////////////////////////////////////////

module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    // // Full Adder using SOP
    // sum   = (a & b & cin) | (a & ~b & ~cin) | (~a & b & ~cin) | (~a & ~b & cin);
    // carry = (a & b & cin) | (a & b & ~cin) | (a & ~b & cin) | (~a & b & cin);

    assign sum = (a ^ b ^ cin);
    assign cout = (a & b) | (a & cin) | (b & cin);

endmodule


module adder_4b (
    input  cin,
    input  [3:0] a,
    input  [3:0] b,
    output [3:0] sum,
    output cout
);

    wire c01; // carry from bit 0 to bit 1
    wire c12; // carry from bit 1 to bit 2
    wire c23; // carry from bit 2 to bit 3

    full_adder bit0 (.a(a[0]), .b(b[0]), .cin(cins), .sum(sum[0]), .cout(c01));
    full_adder bit1 (.a(a[1]), .b(b[1]), .cin(c01),  .sum(sum[1]), .cout(c12));
    full_adder bit2 (.a(a[2]), .b(b[2]), .cin(c12),  .sum(sum[2]), .cout(c23));
    full_adder bit3 (.a(a[3]), .b(b[3]), .cin(c23),  .sum(sum[3]), .cout(cout));

endmodule


module adder_16b (
    input  [15:0] a,
    input  [15:0] b,
    output [15:0] sum,
    output cout
);
    wire c34; // carry from bit 3 to bit 4
    wire c78; // carry from bit 7 to bit 8
    wire c1112; // carry from bit 11 to bit 12

    adder_4b bits0to3   (.cin(1'b0),  .a(a[3:0]),   .b(b[3:0]),   .sum(sum[3:0]),   .cout(c34));
    adder_4b bits4to7   (.cin(c34),   .a(a[7:4]),   .b(b[7:4]),   .sum(sum[7:4]),   .cout(c78));
    adder_4b bits8to11  (.cin(c78),   .a(a[11:8]),  .b(b[11:8]),  .sum(sum[11:8]),  .cout(c1112));
    adder_4b bits12to15 (.cin(c1112), .a(a[15:12]), .b(b[15:12]), .sum(sum[15:12]), .cout(cout));


endmodule