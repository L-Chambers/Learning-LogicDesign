`timescale 1ns / 1ps // `timescale <time_unit>/<time_precision> 
//////////////////////////////////////////////////////////////////////////////////
// Author: Lauren Chambers
//         laalcham@ucsc.edu
// 
// Project: Logic Design Fundamentals: Multiplexers
// File Name: structural.v
// Dependencies: none
// Description: various implementations of multiplexers using structural Verilog 
//////////////////////////////////////////////////////////////////////////////////

//
// MULTIPLEX 1 bit out of 4 bits
//
//
module mux_4to1(
  input [3:0] in,   // Input Set @in: choose from 4 bits
  input [1:0] sel,  // Select @sel: 2^2 = 4 possible values
  output o          // Output @o: single bit from @in
);

  assign o = (~sel[1] & ~sel[0] & in[0]) | // 2'b00 selects bit 0
             (~sel[1] &  sel[0] & in[1]) | // 2'b01 selects bit 1
             ( sel[1] & ~sel[0] & in[2]) | // 2'b10 selects bit 2
             ( sel[1] &  sel[0] & in[3]);  // 2'b11 selects bit 3

endmodule

module mux_8to1(
  input [7:0] in,   // Input Set @in: choose from 8 bits
  input [2:0] sel,  // Select @sel: 2^2 = 4 possible values
  output o          // Output @o: single bit from @in
)

  wire msbis0, msbis1;

  mux_4to1 inputs0to3 (.in(in[3:0]), .sel(sel[1:0]), .o(msbis0));
  mux_4to1 inputs4to7 (.in(in[7:4]), .sel(sel[1:0]), .o(msbis1));

  assign o = (sel[2] & msbis1) | (~sel[2] & msbis0);

endmodule