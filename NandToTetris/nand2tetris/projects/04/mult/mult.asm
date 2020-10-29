// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

  @R1
  D=M
  @R3
  M=D
  @R2
  M=0

(LOOP)
  //-----Ejeta para END se for 0-----//
  @R3
  D=M
  @END
  D;JEQ
  //-----Ejeta para END se for 0-----//

  //-----SOMA-----//
  @R0
  D=M
  @R2
  M=D+M
  //-----SOMA-----//

  //-----REDUZ LOOP-----//
  @R3
  M=M-1
  //-----REDUZ LOOP-----//

  //-----LOOPA-----//
  @LOOP
  0;JMP
  //-----LOOPA-----//
(END)
  @END
  0;JMP
