# learning-LogicDesign

## 1]  What is a FPGA?
A Field Programmable Gate Array (FPGA) is an integrated circuit that can be configured by a user after manufacturing. It's *field-programmable*!

FPGAs are programmed using a Hardware Description Language (HDL) such as Verilog or VHDL. 

<br/>

--- 
## 2] How does an FPGA differ from an ASIC?
Application Specific Integrated Circuits (ASICs) are designed for a sole purpose and cannot changed in field. FPGAs offer the flexibility that ASICs do not. FPGAs can be used to develop ASIC designs because they allow users to model and verify a SoC quickly and accurately. ASICs are more power efficient than FPGAs and are cheaper when mass produced. 

<br/>

---
## 3]  What are FPGAs made of?
The internal, programmable structure of an FPGA is called the FPGA's "fabric." The fabric is made of an array of programmable logic cells called Combinational Logic Blocks (CLBs). Programmable interconnect between them allows a CLB to be connected to any other CLB.

The fabric of an FPGA can be surrounded by several components. input/output blocks (IOBs), digital signal processing (DSP) blocks, clock resources, and memory are common. 

<br/>

### 3.1 CLBs
CLBs are what give the FPGA the ability to be reprogrammed. FPGA can contain thousands of CLBs, so virtually any logic function can be implemented using them. Each CLB contains a number of hardware elements such as look-up tables (LUTs), multiplexers, and flip-flops.

<br/>

### 3.2 Programmable Interconnect
Programmable interconnect is a network of signal pathways that connects CLBs to eachother and to other resoures on the board, such as the IOBs.

<br/>

---
## 4]  What are FPGAs used for?
Because of their flexibility, FPGAs are well suited for a variety of applications. Some applications include:
- ASIC prototyping 
- Aerospace and Defense
- Automotive
- Consumer electronics
- Video and image processing 
- Wired Communications
- Wireless Communications 
