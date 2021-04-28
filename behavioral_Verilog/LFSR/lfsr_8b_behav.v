`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Lauren Chambers and Kenzie Milhous
// Logic Design with Verilog
// April 2021
// 
// Design Name: 8-bit LFSR
// Module Name: lfsr_behavioral
// Project Name: LFSR
// Description: This 8-bit linear feedback shift register is implemented with behavioral Verilog.
// 
// Dependencies: none
//////////////////////////////////////////////////////////////////////////////////


module lfsr_behavioral(
    input clk, // drives the Flip Flops
    input res_n, // active low reset
    input [7:0] data_in, // load 8-bit bus in on low reset
    output [7:0] data_out // present state of the LFSR
    );
    
    //
    // Q will be synthesized as a register of Flip Flops
    //
    reg [7:0] Q;
    assign data_out = Q;
    
    // 
    // this block is executed 1 time before time 0 
    // Q can be initialized to anything but 0 to generate pseudorandom numbers
    // 
    initial begin
        Q = 8'h01;
    end
	
	//
	// on the positive clock edge the Flip Flops will be updated
	// the if-else is synthesized as a multiplexer
	// non-blocked assignment <= is used for synchronous blocks.
	//
    always @(posedge clk) begin
        if (~res_n) begin
            Q[7:0] <= data_in[7:0];   
        end
        else begin
            Q[0] <= Q[7];
            Q[1] <= Q[0];
            Q[2] <= (Q[7] ^ Q[1]);
            Q[3] <= (Q[7] ^ Q[2]);
            Q[4] <= (Q[7] ^ Q[3]);
            Q[5] <= Q[4];
            Q[6] <= Q[5];
            Q[7] <= Q[6];
        end
    end

    
endmodule
