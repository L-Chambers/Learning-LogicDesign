# Logic Design Fundamentals: Multiplexers
A multiplexer is a combinational logic circuit that is used to forward a single input from a set of inputs. The selection of an input is driven by a separate set of inputs that make up a select line. he input set can be a set of single bits or a set of multiple bits (buses). For a multiplexer with 2^n inputs, you need a select line with n bits.

Multiplexers can be used to implement logic functions. The choice of select bits from a set of inputs can affect hardware costs.

In this folder you will find a file structural.v with a multiplexer implemented with structural Verilog, and a file behavioral.v with several examples of multipliers implemented with behavioral Verilog.