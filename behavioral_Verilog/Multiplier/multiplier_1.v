`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Lauren Chambers and Kenzie Milhous
// Logic Design with Verilog
// April 2021
// 
// Design Name: 16-bit multiplier
// Module Name: multiplier_1.v
// Project Name: Lab 1
// Description: Multiplies two 16-bit integers and asserts a done signal when product
//				is ready. Multiplies via accumulation up to 1x/clock cycle
// 
// Dependencies: accumulator.v
//////////////////////////////////////////////////////////////////////////////////

//
// Main: multiplier_1
//
// drives accumulation logic.
//
module multiplier_1(
    input clk,
    input res_n,
    input start,
    input [15:0] arg1, arg2,
    output done,
    output [31:0] product
    );
    
    // internal wires
    reg inc;
    reg assertDone;
    wire [31:0] num_accumulations;
    
    // interface I/O
    assign done = assertDone;
   
    // start accumulation on the start signal
    always @(start) begin
        inc = 1'b1;
        assertDone = 1'b0;
    end
    
    // end accumulation when num_accumulations == arg2
    always @(posedge clk) begin
        if (num_accumulations == (arg2 - 1)) begin
            inc <= 1'b0;
            assertDone <= 1'b1;
        end
    end
    
    // the accumulator ends up reflecting product of arg1 and arg 2
    accumulator acc (.clk(clk), .res_n(res_n), .inc(inc), .step(arg1), .sum(product), .num_acc(num_accumulations));   
    
endmodule


// 
// Helper Module: accumulator_1
// 
// this design uses 2 adders and one 2-1 multiplexer.
// the multiplexer is used to dynamically select the value to add to the accumulator.
//
module accumulator (
    input clk,
    input res_n,
    input inc,
    input [15:0] step,
    output [31:0] sum,
    output [31:0] num_acc
);

    // 16-bit register sum
    reg [31:0] accum;
    reg [31:0] num_accumulations;
    assign sum = accum;
    assign num_acc = num_accumulations;
    
    // update every clock cycle

    always @(posedge clk) begin
        // reset
        if (~res_n) begin
            accum <= 32'b0;
            num_accumulations <= 32'b0;
        end
        else if (res_n && inc) begin
            accum <= accum + step;
            num_accumulations <= num_accumulations + 1;
        end
    end
    
endmodule

