.data
	
	szX: .asciz "COT IN THE HOT." //15
	szY: .asciz " Green eggs and ham." //21
	
	//szX: .asciz "Cat " //4 bytes
	//szY: .asciz "in the hat." //12 bytes the /o is included
	ptrString: .quad 0
	
	.text 
	.global String_concat	 
	
String_concat:

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



	//get enough allocated memory from heap
	MOV X0, #36 //16 bytes 
	BL malloc  //malloc returns address of the block of data that lives in heap into X0
	
	//now were gonna save that address of the allocated memory into ptrString
	LDR X1, =ptrString
	STR X0,[X1]
	
	
	// ldrb is copying one byte from a data segment(a .data label)
	// sdrb is being used to paste that data segment into the memory allocated 
	//then were just looping that proccess
	
	MOV X9, #0
	
	loop1:
	//copies first label into memory
	LDR X1, =szX
    // Load a byte from szX into W2
    LDRB W2, [X1, X9]
	//stores that byte which is now in w2 into [x0](memory)
	STRB W2, [X0, X9]
 
	//loop it x times; this also increment the byte im accessing at the same time
	ADD  X9, X9, #1      //; Increment counter by one
    CMP     X9, #15      //; Compare counter with the loop limit; 4 can be replaces using stringlength
    B.LT    loop1 
	
	//now copying szY
	MOV X9, #0 //dont make it 0
	
	loop2:
	//copies first label into memory
	LDR X1, =szY
    // Load a byte from szX into W2
    LDRB W2, [X1, X9]
	//stores that byte which is now in w2 into [x0](memory)
	
	MOV X5, X9 //now 5 has value of x9
	//to concate any value you change #15 to size of first string, thats why its 15
	ADD X5, X5, #15 // add 15 it to simulate STRB W2, [X0, X9, #15]
	STRB W2, [X0, X5] //add 4 here, so doesnt replace cat
 
	//loop it x times; this also increment the byte im accessing at the same time
	ADD  X9, X9, #1      //; Increment counter by one
    CMP     X9, #21         //; Compare counter with the loop limit; szY is 12 bits
    B.LT    loop2 
	
	
	
//tput whats copied into memory
ldr x0, =ptrString
ldr x0, [x0]
bl putstring

/*
//return value to driver
ldr x0, =ptrString
ldr x0, [x0]
*/

	//frees
	LDR X0, =ptrString
	LDR X0, [X0] //idk why this is needed; same as previous line idk
	BL free


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



	ret LR
	
	