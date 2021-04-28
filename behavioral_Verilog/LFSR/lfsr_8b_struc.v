`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Lauren Chambers and Kenzie Milhous
// Logic Design with Verilog
// April 2021
// 
// Design Name: 8-bit LFSR
// Module Name: lfsr_structural
// Project Name: Lab 1
// Description: This 8-bit linear feedback shift register is implemented with structural Verilog. 
// 
// Dependencies: none
//////////////////////////////////////////////////////////////////////////////////


module lfsr_structural(
    input clk, // drives the Flip Flops
    input res_n, // active low reset
    input [7:0] data_in, // load 8-bit bus in on low reset
    output [7:0] data_out // present state of the LFSR
    );
    
    //
    // Q is a 8-bit bus wired from the Flip Flops
    // D is an 8-bit output of next-state equations for the FFs
    //
    wire [7:0] D, Q, Din;
    
    // shorter wire names for readability in the NS equations
    assign Din = data_in;
    assign data_out = Q;  
    
   	//
   	// Next state equations for each FF
   	// instead of a multiplexer (behavioral design) an OR gate outputs the appropriate NAS bit
   	assign D[0] = (Q[7] & res_n) | (Din[0] & ~res_n);
    assign D[1]= (Q[0] & res_n) | (Din[1] & ~res_n);
    assign D[2] = ((Q[7] ^ Q[1]) & res_n) | (Din[2] & ~res_n); 
    assign D[3] = ((Q[7] ^ Q[2]) & res_n) | (Din[3] & ~res_n); 
    assign D[4] = ((Q[7] ^ Q[3]) & res_n) | (Din[4] & ~res_n);
    assign D[5] = (Q[4] & res_n) | (Din[5] & ~res_n);
    assign D[6] = (Q[5] & res_n) | (Din[6] & ~res_n);
    assign D[7] = (Q[6] & res_n) | (Din[7] & ~res_n);
    
    // 
    // 8 Flip-Flops are explicitly declared 
    // Q can be initialized to anything but 0 to generate pseudorandom numbers
    // the FFs are always enabled.
    //
    FDRE #(.INIT(1'b1)) FF_0 (.C(clk), .CE(1'b1), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) FF_1 (.C(clk), .CE(1'b1), .D(D[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) FF_2 (.C(clk), .CE(1'b1), .D(D[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) FF_3 (.C(clk), .CE(1'b1), .D(D[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b0)) FF_4 (.C(clk), .CE(1'b1), .D(D[4]), .Q(Q[4]));
    FDRE #(.INIT(1'b0)) FF_5 (.C(clk), .CE(1'b1), .D(D[5]), .Q(Q[5]));
    FDRE #(.INIT(1'b0)) FF_6 (.C(clk), .CE(1'b1), .D(D[6]), .Q(Q[6]));
    FDRE #(.INIT(1'b0)) FF_7 (.C(clk), .CE(1'b1), .D(D[7]), .Q(Q[7]));

    
endmodule
