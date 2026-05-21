# Five-Operation ALU: Transistor-Level to RTL Design

This project demonstrates the design and verification of a 4-bit Arithmetic Logic Unit (ALU) through two distinct engineering lenses: **Transistor-Level** using LTspice and **Register Transfer Level** using Verilog.

## 🚀 Project Overview
The ALU is the heart of any processor. This project bridges the gap between physical hardware design and high-level hardware description. By implementing the same logic in both LTspice and Verilog, I explored the relationship between CMOS gate delays and functional logic verification.

### Supported Operations
The ALU performs 5 operations based on a selection signal:
1. **ADD:** 4-bit Binary Addition
2. **SUB:** 4-bit Binary Subtraction
3. **Multiplier:** 4-bit binary Multiplier
4. **ASR:** Arithmetic Shift Right
5. **Modulus:** Modulus Function


---

## 🛠️ Design Methodologies

### 1. Transistor-Level Design (LTspice)
Built using a bottom-up approach:
- **Gate Level:** Designed CMOS-based NOT, NAND, and NOR gates.
- **Component Level:** Built Full Adders and 5-to-1 Multiplexers using the basic gates.
- **Verification:** Performed Transient Analysis to observe voltage levels and switching characteristics.
- **File:** `Five_Op_ALU.asc`

### 2. Digital RTL Design (Verilog)
A synthesizable implementation focused on logic flow:
- **Architecture:** Behavioral modeling for arithmetic and logical units.
- **Testbench:** Created a comprehensive test suite to verify all operations across various input combinations (Corner cases).
- **Sim Tool:** ModelSim.

---

## 📊 Visualizations & Results

### LTspice Schematic
*Transistor-level implementation showing the interconnection of CMOS gates.*

### Logic Verification (Waveforms)
*Verilog simulation results confirming the accuracy of the ALU operations.*
