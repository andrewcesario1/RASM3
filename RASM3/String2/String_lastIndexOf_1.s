//Programmer: Alan Banos
// Date: 3/7/23
//Purpose :
 /*
   
*/

	//.data  

.text //(dont forget this)
	.global String_lastIndexOf_1	 

String_lastIndexOf_1:

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

//x0 holds string; X2 holds character

bl String_length // Call the String_length function; x0 is the parameter explicitly
mov x4, x1 // Copy the string pointer to x4 (r4 in ARM)
mov x5, x0 // Copy the string length to x5 (r5 in ARM)
sub x5, x5, #1 // Subtract 1 from the string length
add x4, x4, x5 // Add the string length to the string pointer

loop:
ldrb w6, [x4], #-1 // Load the current character and decrement x4 (r4) by 1
cmp w6, w2 // Compare the current character to the search character
beq endLoop // If they are equal, jump to endLoop
sub x5, x5, #1 // Decrement the index (x5 or r5) by 1
cmp x5, #0 // Compare the index (x5 or r5) to 0
bge loop // If the index is not 0, jump to loop

// If we reach this point, the character was not found in the string
mov x0, #8 // Set x0 to -1 to indicate character not found
b end // Jump to the end

endLoop:
mov x0, x5 // Move the index to x0 to indicate last occurrence of the character

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



