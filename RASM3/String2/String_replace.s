//Programmer: Alan Banos
// Date: 3/7/23
//Purpose :
 /*
   *cpy  paste google doc purpose here
*/

	.data
ptrStr: .word 0 	// A variable to store a pointer to the new string

.text
	.global String_replace	

String_replace:

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

/*
x0 a pointer to a string String
x1 a character to replace 'a'
x2 a replacement character 'o'
*/

mov x2, #0
loop:
    ldrb    w4, [x0, x2]          // Load the current character of the input string into w4
    cmp     w4, #0                // Check if we have reached the end of the string
    beq     done                  // If so, exit the loop
    cmp     w4, #'a'              // Check if the current character is 'a'
    b.ne    copy_char             // If not, copy the character to the output string
    mov     w4, #'o'              // If it is, replace it with 'o'
copy_char:
    strb    w4, [x1, x3]          // Store the current character in the output string
    add     x2, x2, #1            // Increment the input string index
    add     x3, x3, #1            // Increment the output string index
    b       loop                  // Go back to the beginning of the loop
done:


/*
mov x9, #0  //increment
		
loop:
		// Load a byte from x0 into w4
		LDRB W4, [X0, X9]
	
		cmp w4, #0           // Check if the byte is the null terminator
        beq end              // If it is, exit the loop, otherwise continue
		
		 cmp w4, w1        // Compare the byte to the search character(x1)
        b.ne loop_continue  // If they dont match branch to loop_continiue, otherwise its a match
		
		 strb w2, [x0, x9]   // If they do match, replace the byte with the replacement character
								//stores w2(replace char) into current string byte
		 loop_continue:
		 add x9, x9, #1 //increment xounter
        b loop //loop back if it matches
		
		end:
	*/
		

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



