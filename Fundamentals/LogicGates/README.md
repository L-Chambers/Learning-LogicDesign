# Logic Design Fundamentals: Logic Gates
Logic gates are the building blocks of digital circuits. A logic gate carries out a logic function on one or more binary inputs. Voltages at input terminals are considered as 0s or 1s. Depending on the gate type and digital input values, the output terminal will have a high or low voltage. 

**In Verilog, the following characters are used to repesent gates:**
  - NOT ~
  - AND &
  - OR  |
  - XOR ^

<style>
.green {
    color: green;
    font-weight:700;
    font-size: 18px;
}
</style>

---

<div class="green"> NOT Gate </div>

|  a|  ~a|
|---|---:|
|  0|  1|   
|  1|  0|  

---

<div class="green"> AND Gate </div>

|  a|   b| (a & b)|
|---|---|---:|
|  0|  0|   0|   
|  0|  1|   0|   
|  1|  0|   0|   
|  1|  1|   1| 

---

<div class="green"> OR Gate </div>

|  a|   b| (a \| b)|
|---|---|---:|
|  0|  0|   0|   
|  0|  1|   1|   
|  1|  0|   1|   
|  1|  1|   1| 

---

<div class="green"> XOR Gate </div>

|  a|   b| (a ^ b)|
|---|---|---:|
|  0|  0|   0|   
|  0|  1|   1|   
|  1|  0|   1|   
|  1|  1|   0| 

---

