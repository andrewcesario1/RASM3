//Programmer: Alan Banos
// Date: 3/7/23
//Purpose :
 /*
 only one that worked first time :)
    does not return any value. Instead, the function modifies the contents of the memory pointed
	to by its input argument char *str to convert all uppercase letters in the string to lowercase.
*/

	//.data 

.text //(dont forget this)
	.global String_toLowerCase	  // forgot reasoning but this should be called main for functions

String_toLowerCase:

//save currenty value of registers including linkreg(x30) onto stack
//save currenty value of registers including linkreg(x30) onto stack(preserving)
STR X19, [SP, #-16]!
STR X20, [SP, #-16]!
STR X21, [SP, #-16]!
STR X22, [SP, #-16]!
STR X23, [SP, #-16]!
STR X24, [SP, #-16]!
STR X25, [SP, #-16]!
STR X26, [SP, #-16]!
STR X27, [SP, #-16]!
STR X28, [SP, #-16]!
STR X29, [SP, #-16]!
STR X30, [SP, #-16]!

	mov x9, #0
		
// Load a byte from x0 into w1
    LDRB W1, [X0, X9]
	
loop:
        // Check if the end of the string has been reached
        cbz w1, done //f the value of the W1 register is zero, then the execution continues at the "done" label. otherwise continue

        // Check if the character is uppercase (ASCII value between 65 and 90)
        cmp w1, 65  //checking whether the value in W1 is less than 65, and if it is, it will brnach to skip label
        blt skip
        cmp w1, 90 // if the value in W1 is greater than 90, the BGT instruction will jump to the "skip" label
        bgt skip

		//if it passes both condition it goes here
		
        // Convert uppercase to lowercase by adding 32 (ASCII value difference)
        add w1, w1, 32
        strb w1, [x0, x9] //store updated w1 into x0 with offset

skip: //increments counter

        add x9, x9, #1  
        ldrb w1, [x0, x9] //loads updated byte into w1
        b loop

done:


//restore og value of register back to stack in reverse order (pop)
LDR X30, [SP], #16
LDR X29, [SP], #16
LDR X28, [SP], #16
LDR X27, [SP], #16
LDR X26, [SP], #16
LDR X25, [SP], #16
LDR X24, [SP], #16
LDR X23, [SP], #16
LDR X22, [SP], #16
LDR X21, [SP], #16
LDR X20, [SP], #16
LDR X19, [SP], #16
ret LR //returns from subroutine to calling code(driver)

.end



