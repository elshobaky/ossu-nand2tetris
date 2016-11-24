// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(RESET)
  // initialize screen address = 16384
  @SCREEN
  D=A
  @address
  M=D
  // initialize n = 8192 (number of screem memory registers)
  @8192
  D=A
  @n
  M=D
  // initialize i = 0 (for fill and clar loop iterations)
  @i
  M=0

//main loop listns to keyboard and take action
(LOOP)
  @KBD
  D=M
  @FILL
  D;JNE
  @CLEAR
  D;JEQ
  @LOOP
  0;JMP

(FILL)
  // if i == n : end loop RESET and Goto Main loop
  @i
  D=M
  @n
  D=D-M
  @RESET
  D; JEQ
  // fill screen address
  @address
  A=M
  M=-1
  // address ++
  @address
  M=M+1
  // i++
  @i
  M=M+1
  // loop
  @FILL
  0;JMP

(CLEAR)
  // if i == n : end loop RESET and Goto Main loop
  @i
  D=M
  @n
  D=D-M
  @RESET
  D; JEQ
  // clear screen address
  @address
  A=M
  M=0
  // address ++
  @address
  M=M+1
  // i++
  @i
  M=M+1
  // loop
  @CLEAR
  0;JMP
