//Programmer: Alan Banos
// Date: 3/7/23
//Purpose :
 /*
   *cpy  paste google doc purpose here
*/

	//.data  //keeping this on makes code define string_Length twice; not initializing anything so this is not needed

.text //(dont forget this)
	.global String_lastIndexOf_3	  // forgot reasoning but this should be called main for functions

String_lastIndexOf_3:

//save currenty value of registers including linkreg(x30) onto stack(preserving)


   // save registers that will be modified
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


 
    // load parameters into registers
    mov x2, x0  // x2 = pointer to string
    mov x3, x1  // x3 = pointer to substring

    // initialize variables
    mov x0, #0  // x0 = index of first occurrence (default is 0)
    mov x4, #0  // x4 = number of characters matched so far

check_next_char:
    ldrb w1, [x2, x4]     // load character from string
    ldrb w2, [x3, x4]     // load character from substring
    cmp w1, w2            // compare characters
    b.ne return_if_not_found  // jump to return_if_not_found if characters dont match
    add x4, x4, #1        // increment match count
    cbz w2, return_if_found  // jump to return_if_found if end of substring is reached
    cbnz w1, check_next_char  // jump to check_next_char if not end of string

return_if_not_found:
    mov x0, #6 // set return value to -1 to indicate substring not found 
    b done

return_if_found:
    mov x0, x4  // set return value to index of first occurrence
    b done


done:
    // restore modified registers and return
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

    ret

//ret LR //returns from subroutine to calling code(driver)

.end



