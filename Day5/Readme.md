# Day 5 of RISC-V Design: Micro-Architecture

This repository contains the RISC-V Micro Architecture Designed using TL-Verilog based on the
instructions provided by [VSD](https://vlsisystemdesign.com) and [Redwood EDA](https://www.redwoodeda.com)


- **Author :** Ujval Madhu
- **Acknowledgement :** Steve Hoover, Redwood EDA, LLC
- **Change Log :**  V 1.0, 21 March 2025


## Tools Used
- TL-Verilog
- [Makerchip](https://www.makerchip.com)

## Project Index


|  Sl No. | Project| Description| Bookmark |
|:-------|:-------|:-----------|:----------|
| 1 | riscv_mc_arch| This is an implementation of the RISC-V u-architecture in TL-Verilog |  |

Bookmarks might not work after a point of time.


## Description:

The RISCV implementation from Day4 is updated to be pipelined version in this project.

Some Hazards that could arise from pipelining are also effectively mitigated in this implementation:
1. Branch Control Hazard
2. Read-Write Hazard
3. Read After Write Hazard: This deals the case where we need to write an operand to the Register file, which will be used by the next instruction in the ALU. This is done by creating register bypasses to the ALU, which would allow the output from the previous execution to be directly used by the ALU in the next execution.

Another improvement that was made was the correction of the branch target path. Since, we are not developing an early branch predictor path, and we will have two cycles that will have to be be discarded after a branch prediction has been detected. This is done by implementing a valid signal that activates the RF write only when the previous two cycles did not have any branches predicted.

The complete RV321 Base Instruction set(Except FENCE, ECALL, EBRAKE) is coded to the decode logic in this implementation.



#### Output Waveforms

The output waveforms generated using makerchip is shown below:


1. RISC-V Micro Architecture
<p>
    <img = src = "./Figures/cb_calc_waveform.PNG">
</p>


## License

This project is licensed under the GNU General Public License, Version 3 - see the [LICENSE.md](../LICENSE.md) file for details.

## Contact

- Author: Ujval Madhu
- Email: ujvalmadhu003@gmail.com