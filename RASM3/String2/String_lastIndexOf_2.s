//Programmer: Alan Banos
// Date: 3/7/23
//Purpose :
 /*
   *cpy  paste google doc purpose here
*/

	//.data  

.text //(dont forget this)
	.global String_lastIndexOf_2	

String_lastIndexOf_2:

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

//arguments: x0 holds string, x1 char, x2 index

/*
bl String_length // Branch to String_length
mov x19, x1
mov x20, x0 // Move result from String_length into X0
cmp x2, #0 // Compare X2 to zero to check register contents
mvnlt x21, #1 // If the index is invalid, the return value is set to -1
blt endLoop // If the index is invalid, immediately exit the subroutine
cmp x2, x20 // Check if the index equals the length of the string
movge x21, #-1 // If it is invalid(greater than or equal), set to -1
b.ge endLoop // If invalid, branch to end
add x19, x19, x2 // Move index into X0
mov x21, x2 // Move the index into X21
*/

bl String_length // Branch to String_length
mov x19, x1 // Move the second argument to x19
mov x20, x0 // Move the first argument to x20
cmp x2, #0 // Compare x2 to zero to check register contents
b.lt endLoop // If the index is invalid, immediately exit the subroutine
cmp x2, x20 // Check if the index equals the length of the string
b.ge invalidIndex // If it is invalid (greater than or equal), branch to invalidIndex
add x19, x19, x2 // Add index to the pointer to get the address of the character
mov x21, x2 // Move the index into x21
b endLoop // Jump to the end of the loop

invalidIndex:
mov x21, #-1 // Set return value to -1 for invalid index

loop:
ldrb w22, [x19], #-1 // Load the char of our string into W22
cmp w22, w2 // Compare the chars
beq endLoop // If they are the same, exit loop
sub x21, x21, #1 // Subtract our index by 1
cmp x21, #0 // Check if index is zero
b.gt loop // As long as its greater or equal to zero, continue

endLoop:
mov x21, #-1
mov x0, x21 // Move result into X0 for return


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



