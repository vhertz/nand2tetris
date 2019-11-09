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

(INIT)
    @8192
    D=A
    @SCREEN_SIZE    // SCREEN_SIZE <- 8192
    M=D
(LOOP)
    @i
    M=0             // i <- 0
    @KBD
    D=M
    @WHITEOUT
    D;JEQ           // if KBD=0 then goto WHITEOUT
(BLACKOUT)
    @SCREEN_SIZE
    D=M
    @i
    D=D-M
    @END
    D;JLE           // if SCREEN_SIZE - i <= 0 then goto END
    @SCREEN
    D=A
    @i
    A=D+M
    M=-1            // Memory[SCREEN + i] <- -1 (0xffff)
    @i
    M=M+1           // i++
    @BLACKOUT
    0;JMP
(WHITEOUT)
    @SCREEN_SIZE
    D=M
    @i
    D=D-M
    @END
    D;JLE           // if SCREEN_SIZE - i <= 0 then goto END
    @SCREEN
    D=A
    @i
    A=D+M
    M=0             // Memory[SCREEN + i] <- 0
    @i
    M=M+1           // i++
    @WHITEOUT
    0;JMP
(END)
    @LOOP
    0;JMP