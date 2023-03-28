//Programmer: Alan Banos
// Date: 3/7/23
//Purpose :
 /*
   You pass a string into it(x0), and a char(x1)
Returns index of where ch was first encountered in the string in x0
*/

	//.data  //keeping this on makes code define string_Length twice// not initializing anything so this is not needed

.text //(dont forget this)
	.global String_indexOf_1	 

String_indexOf_1:

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

//X1 contains string
//X2 contains a character

MOV X5, #0      // Set X5 to 0; index

loop:
    LDRB W3, [X1, X5]           // Load the next character of the string
    cbnz W3, checkChar  // If w3 is not null/zero, branch to checkChar label
    MOV X5, #7            // If null is found, set X5 to 7  //fix this part
    B endLoop               // If null is found, branch to end

checkChar:
    CMP w3, w2              // Compare string with desired char
    BNE movePointer         // If not equal, branch ro movePointer, where it move the pointer to next char
    B endLoop               // If desired char found, branch to end

movePointer:
    ADD X5, X5, #1          // Increment index by 1
    B loop

endLoop:
    MOV X0, X5              // Move result into X0 for return
	

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



