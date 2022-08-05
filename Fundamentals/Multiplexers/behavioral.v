`timescale 1ns / 1ps // `timescale <time_unit>/<time_precision> 
//////////////////////////////////////////////////////////////////////////////////
// Author: Lauren Chambers
//         laalcham@ucsc.edu
// 
// Project: Logic Design Fundamentals: Multiplexers
// File Name: behavioral.v
// Dependencies: none
// Description: various implementations of multiplexers using behavioral Verilog
//////////////////////////////////////////////////////////////////////////////////


//
// MULTIPLEX 1 bit out of 2 bits
// 
//
module mux_2to1(
  input [1:0] in,
  input sel,
  output o,
);

  always @(*) begin
    if (sel)    
      o = in[0];  // blocking assignment
    else
      o = in[1];
  end

endmodule

//
// MULTIPLEX 1 bit out of 4 bits: 
// using IF/ELSEIF/ELSE STATEMENT
//
module mux_4to1(
  input [3:0] in,    // Input Set: 2-bit wire
  input [1:0] sel,   // Select: 2-bit wire
  output o,          // 1-bit output
);

  always @(*) begin
    if (sel == 2'b00)
      o = in[0];
    else if (sel == 2'b01)
      o = in[1];
    else if (sel == 2'b10)
      o = in[2];
    else if (sel == 2'b11)
      o = in[2];
    else
      o = 1'bx; // catch bugs: mux is not well defined for any other input
  end

endmodule

//
// MULTIPLEX 1 bit out of 4 bits: 
// using CASE STATEMENT
//
module mux_4to1(
  input [3:0] in,    // Input Set: 4-bit wire
  input [1:0] sel,   // Select: 2-bit wire
  output o,          // 1-bit output
);

  always @(*) begin
    case(sel) 
      2'b00:    o = in[0];
      2'b01:    o = in[1];
      2'b10:    o = in[2];
      2'b11:    o = in[3];
      default:  o = 1'bx;   // catch bugs
    endcase
  end

endmodule


//
// MULTIPLEX 1 bit out of 8 bits
// using mux_8to1
//
module mux_4to1(
  input [7:0] in,   // Input Set @in: choose from 8 bits (bit 0-7)
  input [2:0] sel,  // Select @sel: 2^3 = 8 possible values
  output o          // Output @o: single bit from @in
);

  // 2 muxes will output the option for the
  wire msb_is_0, msb_is_1; // MSB of the bit number (0-7)

  // this mux choses from options 3'b000, 3'b001, 3'b010, 3'b011
  mux_4to1 in30 (.in(in[3:0], .sel(in[1:0]), .o(msb_is_0));

  // this mux choses from options 3'b100, 3'b101, 3'b110, 3'b111
  mux_4to1 in74 (.in(in[7:4], .sel(in[1:0]), .o(msb_is_1));

  always @(*) begin
    if (sel[2] == 1'b0)
      o = msb_is_0;
    else if (sel[2] == 1'b1)
      o = msb_is_1;
    else 
      o = 1'bx;
  end

endmodule