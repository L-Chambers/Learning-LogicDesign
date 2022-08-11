# Logic Design Fundamentals: Combinational Logic
A combinational logic circuit is made up of logic gates. Combinational logic runs independently of any clock and output vaues are based on the current input values. In other words, combinational logic does not involve state.

<br>

### **Combinational Logic Classifications**
|  Arithmetic and Logic Functions |  Data Transmission | Converters|
|:---|:---|:---|
|Adders       |Multiplexers   |Binary    |
|Subtractors  |Demultiplexers |7-Segment |
|Comparators  |Encoders       | 
|             |Decoders

### **Combinational Logic Design**
The following steps can be taken to realize a combinational logic circuit:
1. identify inputs and outputs
2. symbolize the identified inputs/outputs as variables
3. express their relationship using a truth table
4. derive the boolean expression(s) from the truth table
5. minimize the expressions (optional)
6. design the logic diagram (optional)

<br>

### **Logic Gates**
Logic gates are the building blocks of combinational logic. Logic gates in Verilog include:
- NOT ~
- AND &
- OR  |
- XOR ^

<br>

---
### **Boolean Algebra**
Boolean Algebra is a branch of algebra in which input values are binary (either 0 or 1). Logical operations such as conjunction/AND, disjunction/OR, and negation/NOT. Boolen expressions consist of input values and logical operators and are way to represent a logic circuit. 

> **a & b** implies an AND gate where a and b are inputs. 

> **(a & b) | (c ^ d)** implies an OR gate where the output of an AND gate and an XOR gate are inputs.

<br>

----

### **Truth Tables**
Combinational logic expressions (a subcategory of boolean expressions) can be derived from **truth tables**. Truth tables inform an output value for every combination of input values. See the following examples where boolean expressions are derived from truth tables. 

> Investigate the truth tables for the Verilog logic gates in LogicGates/README.md 

----
<br> 

### Example 4: Deriving a Logic Expression from a Truth Table
Below is a truth table for a circuit with 3 inputs and 1 output. All possible combinations of input values have a defined output value. The minterm column contains the boolean expression for each set of input values. 

 row| a| b| c| minterm    | out|
|---|--|--|--|------------|------:|
|**0**| 0| 0| 0|~a & ~b & ~c| 1|
|**1**| 0| 0| 1|~a & ~b &  c| 1|
|**2**| 0| 1| 0|~a &  b &  c| 0|
|**3**| 0| 1| 1|~a &  b &  c| 0|
|**4**| 1| 0| 0| a & ~b & ~c| 1|
|**5**| 1| 0| 1| a & ~b &  c| 0|
|**6**| 1| 1| 0| a &  b & ~c| 1|
|**7**| 1| 1| 1| a &  b &  c| 1|

<br>

> **minterm** == for a function of n variables, a minterm is a product term that includes all n variables. 

<br>


As you can see, the out signal is 1 for minterms 0, 1, 4, 6, and 7. Let's find the "Sum of Products" (SOP) for this truth table. Every term in the SOP represents an input set for which the out signal should be 1. 

out = (minterm 0) OR (minterm 1) OR (minterm 4) OR (minterm 6) OR (minterm 7)    

    out = (~a & ~b & ~c) | 
          (~a & ~b &  c) | 
          ( a & ~b & ~c) | 
          ( a &  b & ~c) |
          ( a &  b &  c);

Let's find the "Product of Sums" (POS) for this truth table. Every term in the POS represents a set for which the out signal should NOT be 1. 

out = NOT ((minterm 2) OR (minterm 3) OR (minterm 5))\
out = NOT(minterm 2) AND NOT(minterm3) AND NOT(minterm5)

    // one option
    out = ~(~a &  b & ~c) &
          ~(~a &  b &  c) &
          ~( a & ~b &  c);
    
    // or we can distribute and say
    out =  ( a | ~b |  c) &
           ( a | ~b | ~c) &
           (~a |  b | ~c);

<br>
  
---


### Example 2: **Full Adder**
The circuit for a full adder adds two bits and a carry in to get a sum and a carry out. See the truth table below. 

### **Truth Table: Full Adder**
|  a|  b| cin| sum| carry|
|---|---|----|---:|-----:|
|  0|  0|   0|  0|      0|
|  0|  0|   1|  1|      0|
|  0|  1|   0|  1|      0|  
|  0|  1|   1|  0|      1|
|  1|  0|   0|  1|      0|
|  1|  0|   1|  0|      1|
|  1|  1|   0|  0|      1|
|  1|  1|   1|  1|      1| 

<br>

---

### Example 3 : **Full Subtractor**
The circuit for a full subtractor subtracts two bits and a carry in to get a difference and a borrow. See the truth table below. 

difference = (a- b - cin )\
borrow = (b + cin) > a

### **Truth Table: Full Subtractor**
|  a|  b| cin| difference| borrow|
|---|---|----|----------:|------:|
|  0|  0|   0|          0|      0|
|  0|  0|   1|          1|      1|
|  0|  1|   0|          1|      1|  
|  0|  1|   1|          0|      1|
|  1|  0|   0|          1|      0| 
|  1|  0|   1|          0|      0|
|  1|  1|   0|          0|      0|
|  1|  1|   1|          1|      1| 

<br>

<!-- ### Example 4: **Multiplexer**
The circuit for a multiplexer forwards 1 input signal out many based on a select input. 2:1, 4:1, 8:1, and 16:1 multiplexer.  -->

<br>


