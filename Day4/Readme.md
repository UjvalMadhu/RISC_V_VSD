# Day 4 of RISC-V Design: Micro-Architecture

This repository contains the RISC-V Micro Architecture Designed using TL-Verilog based on the
instructions provided by [VSD](https://vlsisystemdesign.com) and [Redwood EDA](https://www.redwoodeda.com)


- **Author :** Ujval Madhu
- **Acknowledgement :** Steve Hoover, Redwood EDA, LLC
- **Change Log :**  V 1.0, 21 March 2025


## Tools Used
- TL-Verilog
- [Makerchip](https://www.makerchip.com)

## Project Index


|  Sl No. | Project| Description| Bookmark* |
|:-------|:-------|:-----------|:----------|
| 1 | riscv_mc_arch| This is an implementation of the RISC-V u-architecture in TL-Verilog | [Makerchip link](https://myth.makerchip.com/sandbox/0jRfjh1Qk/0X6hX5V) |

*Bookmarks might not work after a point of time


## Description

Day 4 work culminated in the the design of a simple RV321 compliant RISC-V processor without pipelining. 

The genral diagram showing the different operations of the design is illustrated here:

<p>
    <img = src = "./Figures/day4_arch.png">
</p>

The Key constituents of the design includes:

### Instruction Fetch (IF):

The PC (Program Counter) holds the address of the next instruction.
The IMem Rd (Instruction Memory Read) unit fetches the instruction from memory at the address specified by the PC.
The PC is incremented by +1 to point to the subsequent instruction in memory.
Branch prediction mechanism is implemented using the signal $taken_br.
If a branch is predicted to be taken, the next PC is determined by the $br_tgt_pc (branch target PC), which is calculated  and fed back. A multiplexer selects between the incremented PC and the branch target PC.


### The fetched instruction is passed to the Dec (Decode) unit:

The Decode unit analyzes the instruction to identify the operation and the required operands (source and destination registers).
It reads the values of the source registers from the RF Rd (Register File Read) port.

The constituents of the Instruction are explained in detail here

- ==Opcode (7 bits)==: This is the most significant part of the instruction. It fundamentally identifies the type of instruction (e.g., load, store, arithmetic, branch, jump). The opcode determines the major operation to be performed and which instruction format is being used.

- ==rd (Destination Register) (5 bits)==: For instructions that write a result to a register (like arithmetic operations, loads, and jumps with link), this field specifies the register that will receive the result. It's usually located towards the beginning of the instruction format.

- ==rs1 (First Source Register) (5 bits)==: For instructions that read one or two operands from registers, this field specifies the first source register.

- ==rs2 (Second Source Register) (5 bits)==: For instructions that read two operands from registers (like most R-type arithmetic and logical operations, and store instructions), this field specifies the second source register.

- ==funct3 (Function Code 3 bits) (3 bits)==: This field provides additional opcode bits and is used to distinguish between different variants of instructions within the same major opcode group. For example, within the "load" opcode, the funct3 field differentiates between load byte (LB), load halfword (LH), and load word (LW).

- ==funct7 (Function Code 7 bits) (7 bits)==: This field provides even more opcode bits, primarily used in R-type instructions (register-register operations) to further differentiate between different arithmetic and logical operations (e.g., add vs. subtract, AND vs. OR).

- ==Immediate (various bit lengths and positions)==: Many RISC-V instructions use an immediate value (a constant embedded within the instruction). The size and position of the immediate field vary depending on the instruction format (I-type, S-type, B-type, U-type, J-type). 

The immediate can represent:

- Offsets for memory access (loads and stores).
- Immediate operands for arithmetic and logical operations.
- Branch offsets.
- Jump offsets.
- Instruction Formats in RV32I and their Decoded Constituents:

The RV32I base instruction set primarily uses six instruction formats:

- ==R-type (Register-Register)==: Used for arithmetic and logical operations between two registers.

- - Fields: funct7, rs2, rs1, funct3, rd, opcode
- - Decoded constituents: opcode, rd, rs1, rs2, funct3, funct7

- ==I-type (Immediate)==: Used for arithmetic and logical operations with an immediate operand, as well as for load instructions and JALR.

- Fields: immediate[11:0], rs1, funct3, rd, opcode
- Decoded constituents: opcode, rd, rs1, funct3, immediate

- ==S-type (Store)==: Used for store instructions.

- - Fields: immediate[11:5], rs2, rs1, funct3, immediate[4:0], opcode
- - Decoded constituents: opcode, rs1, rs2, funct3, immediate

- B-type (Branch): Used for conditional branch instructions.

Fields: immediate[12|10:5], rs2, rs1, funct3, immediate[4:1|11], opcode
Decoded constituents: opcode, rs1, rs2, funct3, immediate
U-type (Upper Immediate): Used for instructions like LUI (Load Upper Immediate) and AUIPC (Add Upper Immediate to PC).

Fields: immediate[31:12], rd, opcode
Decoded constituents: opcode, rd, immediate
J-type (Jump): Used for the JAL (Jump and Link) instruction.

Fields: immediate[20|10:1|11|19:12], rd, opcode
Decoded constituents: opcode, rd, immediate

The RISC-V instruction format used for decoding is shown here:

<p>
    <img = src = "./Figures/riscv_instr_format.png">
</p>


### Execute (EX):

The decoded instruction and the fetched register values are sent to the ALU (Arithmetic Logic Unit).
The ALU performs the operation specified by the instruction decoded by the decode unit.
The branch condition is also evaluated in this stage using the comparator < > which checks the instruction, and generates the $taken_br signal indicating whether the branch condition is met. The result of this comparison influences the next PC in the Instruction Fetch stage.


### Write Back (WB):

The result from the ALU is written back to the RF Wr (Register File Write) port into the destination register.


## Verification
The implementation is verified using a test program that is written into the instruction memory to sum the numbers 1 to 9.
The value of the register file was observed to be equal to the required sum during the simulation. 


### Output

The output waveforms generated using makerchip is shown below:


1. RISC-V Micro Architecture Generated using Makerchip
<p>
    <img = src = "./Figures/uarch.png">
</p>

2. Waveforms from the register file read and write transactions
<p>
    <img = src = "./Figures/waveforms.png">
</p>


## License

This project is licensed under the GNU General Public License, Version 3 - see the [LICENSE.md](../LICENSE.md) file for details.

## Contact

- Author: Ujval Madhu
- Email: ujvalmadhu003@gmail.com