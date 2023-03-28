//Programmer: Alan Banos
// Date: 3/7/23
//Purpose :
// Subroutine String_length: Provided a pointer to a null terminated string, String_length will 
//     return the length of the string in X0
// X0: Must point to a null terminated string
// LR: Must contain the return address
// All registers are preserved, except X0; even if u use them

	//.data  //keeping this on makes code define string_Length twice; not initializing anything so this is not needed

.text //(dont forget this)
	.global String_length	  // forgot reasoning but this should be called main for functions

String_length:

//save currenty value of registers including linkreg(x30) onto stack(preserving)
STR X1, [SP, #-16]!
STR X2, [SP, #-16]!
STR X3, [SP, #-16]!
STR X4, [SP, #-16]!
STR X5, [SP, #-16]!
STR X6, [SP, #-16]!
STR X7, [SP, #-16]!
STR X8, [SP, #-16]!
STR X9, [SP, #-16]!
STR X10, [SP, #-16]!
STR X11, [SP, #-16]!
STR X12, [SP, #-16]!
STR X13, [SP, #-16]!
STR X14, [SP, #-16]!
STR X15, [SP, #-16]!
STR X16, [SP, #-16]!
STR X18, [SP, #-16]!
STR X19, [SP, #-16]!
STR X20, [SP, #-16]!
STR X21, [SP, #-16]!
STR X22, [SP, #-16]!
STR X22, [SP, #-16]!
STR X23, [SP, #-16]!
STR X24, [SP, #-16]!
STR X25, [SP, #-16]!
STR X26, [SP, #-16]!
STR X27, [SP, #-16]!
STR X28, [SP, #-16]!
STR X29, [SP, #-16]!
STR X30, [SP, #-16]!


//X0 is passed into this; X0 holds "This is a string"
//initiallize counter
MOV X1, #0

loop: 
//load current character into register w2

ldrb W2, [X0, X1]

//if character is null dont increment(/o is not counted) and go to done and end
cbz W2, done

//if not done increment the counter and loop back to beginning
ADD X1, X1, #1
b loop

done: 
//store number increments(size of string) into X0

MOV X0, X1 //X0 will be returned

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
LDR X18, [SP], #16
LDR X17, [SP], #16
LDR X16, [SP], #16
LDR X15, [SP], #16
LDR X14, [SP], #16
LDR X13, [SP], #16
LDR X12, [SP], #16
LDR X11, [SP], #16
LDR X10, [SP], #16
LDR X9, [SP], #16
LDR X8, [SP], #16
LDR X7, [SP], #16
LDR X6, [SP], #16
LDR X5, [SP], #16
LDR X4, [SP], #16
LDR X3, [SP], #16
LDR X2, [SP], #16
LDR X1, [SP], #16


ret LR //returns from subroutine to calling code(driver)

.end



