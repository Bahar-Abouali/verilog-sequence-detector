# Sequence Detector using Verilog HDL (FSM Design)

## Overview
This project is a simple sequence detector designed using Verilog HDL as part of my learning in digital design in university.  
It is based on a Finite State Machine (FSM) approach and was simulated using ModelSim to verify correct functionality.

The circuit takes a serial input bit (`a`) and checks for a specific sequence. When the sequence is detected, the output `y` goes high.

---

## Design Approach
The design is implemented using a synchronous FSM model.  
State transitions are controlled using a clock signal and an active-high reset.

I used a case-based state machine structure to define all possible states and transitions.

Main signals:
- `a` → serial input bit
- `clk` → clock signal
- `reset` → resets FSM to initial state
- `y` → output signal (high when sequence is detected)

---

## FSM Behavior
The FSM goes through different states depending on the input bit stream.  
It keeps track of previous inputs using states and detects when the required pattern occurs.

When the full sequence is matched, the output `y` is asserted.

---

## Files in this Project
```

seqdet.v       → Verilog design (FSM implementation)
tb_seqdet.v    → Testbench used for simulation in ModelSim

```

---

## Testbench Description
The testbench was written to verify the design using ModelSim.

What I did in the testbench:
- Generated a clock signal using an always block
- Applied a 32-bit input sequence using a shift register
- Tested reset functionality at the beginning
- Observed output `y` during simulation
- Used `$finish` to end simulation properly

---

## Simulation Tool
This project was simulated using **ModelSim**.

Steps used:
- Compile both design and testbench files
- Run simulation
- Observe waveforms for input and output signals
- Check correctness of FSM transitions

---

## What I Learned
Through this project, I learned:
- How FSM-based designs work in Verilog
- How to write synthesizable Verilog code
- How state transitions are implemented using case statements
- How to create a proper testbench for simulation
- How to use ModelSim for debugging and waveform analysis

---

## Conclusion
This project helped me understand practical digital design concepts using Verilog.  
It also improved my understanding of FSM design and simulation-based verification using ModelSim.

---

## Author
Computer Engineering Student  'Bahar Abouali'
Focus: Verilog HDL, Digital Logic Design, FSM Modeling, ModelSim Simulation
```