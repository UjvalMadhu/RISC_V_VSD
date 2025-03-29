# Day 3 of RISC-V Design: TL-Verilog Essential Training

This repository contains various TL-verilog files that were designed as part of an onramp for the RISC-V Design course offered by [VSD](https://vlsisystemdesign.com) and [Redwood EDA](https://www.redwoodeda.com)

**TL-Verilog (Transaction Level Verilog )** is a Hardware Description Language based on verilog but at a higher level of abstraction. Think of what Python would be to C. 

It is used for designing hardware based on transaction level modelling (TLM).

TLM is a high-level modeling methodology used in hardware design to describe and simulate digital systems. Instead of focusing on the detailed signal-level behavior and cycle-by-cycle operation (as in Register-Transfer Level - RTL), TLM models focus on interactions between components as transactions.

A transaction represents a complete data transfer or operation between two or more components, without necessarily specifying the exact timing and implementation details of that transfer at the signal level.

TL-Verilog can be used for rapid prototyping as it is much easier to code and works at a higher level of abstraction than Verilog. The designer can focus on functionality and architecture rather than the intricacies associated with bit level and signal level modeling.


- **Author :** Ujval Madhu
- **Acknowledgement :** Steve Hoover, Redwood EDA, LLC
- **Change Log :**  V 1.0, 21 March 2025


## Tools Used
- TL-Verilog
- [Makerchip](https://www.makerchip.com)

## Project Index


|  Sl No. | Project| Description| Bookmark |
|:-------|:-------|:-----------|:----------|
| 1 | Combinatorial Calculator | This is a simple combinatorial calculator that supports addition, subtraction, division and multiplication of 32 bit operands. |  |
| 2 | Fibonacci Sequence Generator  | This shows a 32 bit Fibonacci Sequence generator |  |
| 3 | 32-Bit Counter| A simple 32 bit up counter |  |
| 4 | Sequential Calculator | This is an implementation of the simple calculator with sequential logic and output feedback| [Makerchip link](https://makerchip.com/sandbox/0ADf9hQRW/08qh6Wy) |
| 5 | Pythagoras's Theorem | Pipelined logic to calculates the hypotenuse of a right triangle| [Makerchip link](https://makerchip.com/sandbox/0ADf9hQRW/0X6hXjN) |
| 6 | Pipeline Error Detector| Compiles various errors that can occur at different stages of a pipeline | [Makerchip link](https://makerchip.com/sandbox/0ADf9hQRW/01jhMx4) |
| 7 | Piplelined Sequential Calculator with Oscillating Reset | This calculator implementation has a feedback path whereby the output from one calculation will act as the 2nd operand for the next calculation.| [Makerchip link](https://makerchip.com/sandbox/0ADf9hQRW/098hk8g#) |
| 8 | Pipelined Sequential Calculator with Memory and Recall| Features of oscillating Reset, Validity, Memory and Recall are added to the Sequential Calculator |[Makerchip Link](https://makerchip.com/sandbox/0ADf9hQRW/0g5hA8l) |
| 9 | Pythagoras's Theorem in 3D |  This is an implementation where the Pythagoras Theorem is used to calculate the distance in a 3D space.| [Makerchip Link](https://makerchip.com/sandbox/0ADf9hQRW/0Q1hk7O) |


Bookmarks might not work after a point of time.

#### Output Waveforms

The output waveforms generated using makerchip is shown below:


1. Simple Calculator
<p>
    <img = src = "./Figures/cb_calc_waveform.PNG">
</p>

2. Fibonacci Sequence Generator
<p>
    <img = src = "./Figures/fib_gen_waveform.png">
</p>

3. 32 bit Counter
<p>
    <img = src = "./Figures/counter_waveform.png">
</p>

4. Sequential Calculator
<p>
    <img = src = "./Figures/seq_calc_waveform.png">
</p>

5. Pipelined Pythagoras's Theorem (output "h" is obtained after 2 clock cycles)
<p>
    <img = src = "./Figures/pythagoras_waveform.png">
</p>

6. Pipeline Error Detector
<p>
    <img = src = "./Figures/error_detector_waveform.png">
</p>

7. Pipelined Sequential Calculator (Notice there is also an oscillating  reset feature)
<p>
    <img = src = "./Figures/pipelined_seq_calc_waveform.png">
</p>

8. Pipelined Sequential Calculator with Memory and Recall
<p>
    <img = src = "./Figures/seq_calc_mem_recall_waveform.png">
</p>

9. Pythagoras's Theorem for distance calculation in 3D Space
<p>
    <img = src = "./Figures/pythagoras_3D_waveform.png">
</p>


## License

This project is licensed under the GNU General Public License, Version 3 - see the [LICENSE.md](../LICENSE.md) file for details.

## Contact

- Author: Ujval Madhu
- Email: ujvalmadhu003@gmail.com