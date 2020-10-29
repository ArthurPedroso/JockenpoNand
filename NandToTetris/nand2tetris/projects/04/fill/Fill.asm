// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

  @ScreenColor
  M=-1

(LISTEN_TO_INPUT)
  @KBD
  D=M
  @SCREEN_COLOR_TO_BLACK
  D;JNE
  @ScreenColor
  M=0
  @CHANGE_ALL_SCREEN_PIXELS
  0;JMP
(SCREEN_COLOR_TO_BLACK)
  @ScreenColor
  M=-1

(CHANGE_ALL_SCREEN_PIXELS)
  @8192
  D=A
  @Index
  M=D
(SCREEN_LOOP)
  //-----Ejeta para LOOP_END se for 0-----//
  @Index
  D=M
  @LOOP_END
  D;JEQ
  //-----Ejeta para LOOP_END se for 0-----//


  //-----Preenche todos os pixels-----//
  @ScreenColor
  D=M
  @PIXELS_TO_BLACK
  D;JNE

//(PIXELS_TO_WHITE)//
  @8192
  D=A
  @Index
  D=D-M
  @SCREEN
  A=D+A
  M=0
  @PIXELS_END
  0;JMP

(PIXELS_TO_BLACK)
  @8192
  D=A
  @Index
  D=D-M
  @SCREEN
  A=D+A
  M=-1
(PIXELS_END)
  //-----Preenche todos os pixels-----//


  //-----REDUZ SCREEN_LOOP-----//
  @Index
  M=M-1
  //-----REDUZ SCREEN_LOOP-----//

  //-----LOOPA-----//
  @SCREEN_LOOP
  0;JMP
  //-----LOOPA-----//
  //LOOP_END
(LOOP_END)
  @LISTEN_TO_INPUT
  0;JMP
(END)
  @END
  0;JMP
