//Programmer: Alan Banos
// Date: 3/7/23
//Purpose :
 /*
   You pass a string into it(x0), and a char(x1), and a integer in x3
Returns index of where ch was first encountered in the string in x0, but searching begins sfter index x3
*/

	//.data  //keeping this on makes code define string_Length twice; not initializing anything so this is not needed

.text //(dont forget this)
	.global String_indexOf_2	  // forgot reasoning but this should be called main for functions

String_indexOf_2:

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

//X0 contains a string
//X1 contains a character

  // Get function arguments
    mov x0, x0                 // x0 = string 
    mov x1, x1                 // x1 = character to find
	mov x2, x2                 // x2 = index value u start search from
	
    add x0, x0, x2  
// ldrb w3, [x0], #1 is equivalent to "ldrb w3, [x0]" followed by "add x0, x0, #1". 
	ldrb w3, [x0], #1   // load first character in string into w3
	mov x4, x2                 // initialize index to specified starting index; starting indez is x4 and it has value of x2

loop:
    cmp w3, #0                 // check if end of string; null terminating strings
    b.eq not_found
    cmp x3, x1                 // compare current character to search character
    b.eq found
    add x4, x4, #1             // increment index
    ldrb w3, [x0], #1          // load next character in string into w3
    b loop
found:
    mov x0, x4                 // return index; which is incremented into x0
    b end
not_found:
    mov x0, #-1                // return -1 into x0
    b end


end:

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



