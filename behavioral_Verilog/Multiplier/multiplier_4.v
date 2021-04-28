`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Lauren Chambers and Kenzie Milhous
// Logic Design with Verilog
// April 2021
// 
// Design Name: 16-bit multiplier
// Module Name: multiplier_4.v
// Project Name: Lab 1
// Description: Multiplies two 16-bit integers and asserts a done signal when product
//				is ready. Multiplies via accumulation up to 4x/clock cycle.
// 
// Dependencies: accumulator_4.v
//////////////////////////////////////////////////////////////////////////////////

//
// Main: multiplier_4
//
// takes ~1/4 of the clock cycles that multiplier_1 does
// uses more hardware for combinatorial logic
//
module multiplier_4(
    input clk,
    input res_n,
    input start,
    input [15:0] arg1, arg2,
    output done,
    output [31:0] product
    );
    
    // internal wires
    reg res_accum;
    reg inc;
    reg assertDone;
    wire step;
    reg [31:0] i;
    reg [2:0] n;
    reg [31:0] numx4; // # of x4 accumulations
    wire [31:0] num_accumulations;
    
    // start accumulation on the start signal
    always @(start) begin
        inc = 1'b1;
        assertDone = 1'b0;
        numx4 = arg2 / 4;
        if (numx4 == 0)
            n = arg2 - 4*(arg2/4); // 0-3 more accumulations (MODULO)
        else
            n = 3'd4;
    end
    
    // end accumulation when num_accumulations == arg2
    always @(posedge clk) begin
        if (num_accumulations >= (numx4)) begin
            inc <= 1'b0;
            assertDone <= 1'b1;
        end
        else if (num_accumulations == (numx4 - 1)) begin
            n <= arg2 - 4*(arg2/4); // 0-3 more accumulations
        end
    end
    
    assign done = assertDone;
    accumulator_4 acc4 (.clk(clk), .n(n), .res_n(res_n), .inc(inc), .step(arg1), .sum(product), .num_acc(num_accumulations));   
endmodule


// 
// Helper Module: accumulator_4
// 
// this design uses 7 adders and one 5-1 multiplexer.
// the multiplexer is used to dynamically select the value to add to the accumulator.
//
module accumulator_4(
    input clk,
    input res_n,
    input inc,
    input [2:0] n,
    input [15:0] step,
    output [31:0] sum,
    output [31:0] num_acc
    );
    
	// 32-bit register sum, number of accumulations
	reg [31:0] accum;
	reg [31:0] num_accumulations;
	reg [15:0] step1, step2, step3, step4;
    assign sum = accum;
    assign num_acc = num_accumulations;
	
	initial begin
		accum = 32'b0;
		num_accumulations = 32'b0;
	end
	

	
	// 
	// combinational logic block, updated on any input change *
	// 4 adders are chained together so that accumulator +(1-4)*step is available
	// blocked assignment
	// 
	always@(*) begin
		step1 = step;
		step2 = step1 + step;
		step3 = step2 + step;
		step4 = step3 + step;
	end

	// 
	// sequential logic block
	// updates the accumulator every clock cycle
	// implements a 5-1 multiplexer
	//
	always@(posedge clk) begin
		if (~res_n) // reset accumulator on active low res_n
			accum <= 32'b0;
		else if (inc) begin // increment accumulator by (1-4) * step
			if (n == 1) 
				accum <= accum + step1;
			else if (n == 2) 
				accum <= accum + step2;
			else if (n == 3) 
				accum <= accum + step3;
			else if (n == 4) 
				accum <= accum + step4;
			num_accumulations <= num_accumulations + 1;
		end
	end
	
endmodule

