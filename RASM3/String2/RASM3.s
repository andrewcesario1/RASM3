// Programer: Andrew Cesario, Alan Banos
// RASM3
// Purpose: Test functions for 3 strings
// Author: Andrew Cesario, Alan Banos
// Date: 3/24/2023

// Define a constant named SIZE with a value of 21
.EQU SIZE, 21

// Declare the _start label as a global symbol
.global main

// _start label marks the beginning of the program
main:

//header
    ldr     x0, =szHeader   //load  address of header into x0
    bl      putstring       //call function with szHeader as argument

// prompt #1
    ldr     x0, =s1           // Load the address of string 1 into x0
    bl      string_length    // Call the function string_length with s1 as argument
    ldr     x1, =szInt       // Load the address of string szInt into x1
    bl      int64asc         // Convert the result of string_length to a string and store it in szInt
    ldr     x0, =s1Length    // Load the address of s1Length into x0
    bl      putstring        // Print the length of string 1
    ldr     x0, =szInt       // Load the address of szInt into x0
    bl      putstring        // Print the length of string 1 as a string
    ldr     x0, =chCr        // Load the address of chCr into x0
    bl      putch            // Print a newline character

    ldr     x0, =s2           // Load the address of string 2 into x0
    bl      string_length    // Call the function string_length with s2 as argument
    ldr     x1, =szInt       // Load the address of string szInt into x1
    bl      int64asc         // Convert the result of string_length to a string and store it in szInt
    ldr     x0, =s2Length    // Load the address of s2Length into x0
    bl      putstring        // Print the length of string 2
    ldr     x0, =szInt       // Load the address of szInt into x0
    bl      putstring        // Print the length of string 2 as a string
    ldr     x0, =chCr        // Load the address of chCr into x0
    bl      putch            // Print a newline character

    ldr     x0, =s3           // Load the address of string 3 into x0
    bl      string_length    // Call the function string_length with s3 as argument
    ldr     x1, =szInt       // Load the address of string szInt into x1
    bl      int64asc         // Convert the result of string_length to a string and store it in szInt
    ldr     x0, =s3Length    // Load the address of s3Length into x0
    bl      putstring        // Print the length of string 3
    ldr     x0, =szInt       // Load the address of szInt into x0
    bl      putstring        // Print the length of string 3 as a string
    ldr     x0, =chCr        // Load the address of chCr into x0
    bl      putch            // Print a newline character

 // prompt #2
    ldr     x0, =s1           // Load the address of string 1 into x0
    ldr     x1, =s3           // Load the address of string 3 into x1
    bl      string_equals     // Call the function string_equals with x0 and x1 as parameters
    mov     x19, x0           // Move the return value of the function to x19
    ldr     x0, =szEquals1    // Load the address of string "Equals 1: " into x0
    bl      putstring         // Call the function putstring with x0 as parameter
    mov     x0, x19           // Move the return value of the function to x0
    bl      boolean           // Call the function boolean with x0 as parameter
    bl      putstring         // Call the function putstring with the return value of boolean as parameter
    
    ldr     x0, =s1           // Load the address of string 1 into x0
    ldr     x1, =s1           // Load the address of string 1 into x1
    bl      string_equals     // Call the function string_equals with x0 and x1 as parameters
    mov     x19, x0           // Move the return value of the function to x19
    ldr     x0, =szEquals2    // Load the address of string "Equals 2: " into x0
    bl      putstring         // Call the function putstring with x0 as parameter
    mov     x0, x19           // Move the return value of the function to x0
    bl      boolean           // Call the function boolean with x0 as parameter
    bl      putstring         // Call the function putstring with the return value of boolean as parameter
    
// prompt #3
    ldr     x0, =s1           // Load the address of string 1 into x0
    ldr     x1, =s3           // Load the address of string 3 into x1
    bl      string_equalsIgnoreCase     // Call the function string_equalsIgnoreCase with x0 and x1 as parameters
    mov     x19, x0           // Move the return value of the function to x19
    ldr     x0, =szEqualsIgnore1    // Load the address of string "EqualsIgnore 1: " into x0
    bl      putstring         // Call the function putstring with x0 as parameter
    mov     x0, x19           // Move the return value of the function to x0
    bl      boolean           // Call the function boolean with x0 as parameter
    bl      putstring         // Call the function putstring with the return value of boolean as parameter
    
    ldr     x0, =s1           // Load the address of string 1 into x0
    ldr     x1, =s2           // Load the address of string 2 into x1
    bl      string_equalsIgnoreCase     // Call the function string_equalsIgnoreCase with x0 and x1 as parameters
    mov     x19, x0           // Move the return value of the function to x19
    ldr     x0, =szEqualsIgnore2    // Load the address of string "EqualsIgnore 2: " into x0
    bl      putstring         // Call the function putstring with x0 as parameter
    mov     x0, x19           // Move the return value of the function to x0
    bl      boolean           // Call the function boolean with x0 as parameter
    bl      putstring         // Call the function putstring with the return value of boolean as parameter
    
// prompt #4
    ldr     x0, =szCopy     // Load the address of szCopy into register x0
    bl      putstring       // Call putstring function to print szCopy string
    ldr     x0, =s1Copy     // Load the address of s1Copy into register x0
    bl      putstring       // Call putstring function to print s1Copy string
    ldr     x0, =s1         // Load the address of s1 into register x0
    bl      string_copy     // Call string_copy function to copy the string in s1 to s4
    
    ldr     x1, =s4         // Load the address of s4 into register x1
    ldr     x2, [x0]        // Load the value at the address stored in x0 into x2
    str     x2,[x1]         // Store the value of x2 at the address stored in x1
    
    ldr     x0, =s1         // Load the address of s1 into register x0
    bl      putstring       // Call putstring function to print s1 string
    ldr     x0, =chCr       // Load the address of chCr into register x0
    bl      putch           // Call putch function to print chCr character
    ldr     x0, =s4Copy     // Load the address of s4Copy into register x0
    bl      putstring       // Call putstring function to print s4Copy string
    
    ldr     x0, =s4         // Load the address of s4 into register x0
    ldr     x0,[x0]         // Load the value at the address stored in x0 into x0
    bl      putstring       // Call putstring function to print the string in s4
    
    ldr     x0, =chCr       // Load the address of chCr into register x0
    bl      putch           // Call putch function to print chCr character
    
    ldr     x0, =s4         // Load the address of s4 into register x0
    ldr     x0, [x0]        // Load the value at the address stored in x0 into x0
    bl      free            // Call free function to free the memory allocated for s4
    
// prompt #5
    ldr     x0, =szSubstring1  // load the address of the first substring to register x0
    bl      putstring         // call the putstring subroutine to print the string at address x0
    
    ldr     x0, =s3           // load the address of string s3 to register x0
    mov     x1, #4            // move the value 4 to register x1
    mov     x2, #14           // move the value 14 to register x2
    bl      string_substring_1   // call the string_substring_1 subroutine with arguments x0, x1, and x2
    
    ldr     x1, =s4           // load the address of string s4 to register x1
    ldr     x2, [x0]          // load the value at address x0 to register x2
    
    ldr     x0, =s4           // load the address of string s4 to register x0
    ldr     x0, [x0]          // load the value at address x0 to register x0
    bl      putstring         // call the putstring subroutine to print the string at address x0
    ldr     x0, =szQuote      // load the address of the quote symbol to register x0
    bl      putstring         // call the putstring subroutine to print the quote symbol
    
    ldr     x0, =chCr         // load the address of the carriage return symbol to register x0
    bl      putch             // call the putch subroutine to print the carriage return
    
    ldr     x0, =s4           // load the address of string s4 to register x0
    ldr     x0, [x0]          // load the value at address x0 to register x0
    bl      free              // call the free subroutine to free the memory allocated to s4
    
// prompt #6
    ldr     x0, =szSubstring2   // Load address of szSubstring2 into register x0
    bl      putstring           // Call putstring with x0 as argument

    ldr     x0, =s3             // Load address of s3 into register x0
    mov     x1, #7              // Move integer 7 into register x1
    bl      string_substring_2  // Call string_substring_2 with x0 and x1 as arguments

    ldr     x1, =s4             // Load address of s4 into register x1
    ldr     x2, [x0]            // Load value at address stored in x0 into register x2

    ldr     x0, =s4             // Load address of s4 into register x0
    ldr     x0, [x0]            // Load value at address stored in x0 into register x0
    bl      putstring           // Call putstring with x0 as argument

    ldr     x0, =szQuote        // Load address of szQuote into register x0
    bl      putstring           // Call putstring with x0 as argument

    ldr     x0, =chCr           // Load address of chCr into register x0
    bl      putch              // Call putch with x0 as argument

    ldr     x0, =s4             // Load address of s4 into register x0
    ldr     x0, [x0]            // Load value at address stored in x0 into register x0
    bl      free                // Call free with x0 as argument
    
// Prompt #7
    ldr     x0, =szCharAt      // Load address of string szCharAt into x0 register
    bl      putstring         // Call putstring function to print szCharAt string to console
    
    ldr     x0, =s2           // Load address of string s2 into x0 register
    mov     x1, #4            // Move the value 4 into x1 register
    bl      string_charAt     // Call string_charAt function with arguments x0 and x1 to get the 4th character of s2
    
    ldr     x1, =s4           // Load address of string s4 into x1 register
    str     x0, [x1]          // Store the result of the string_charAt function (in x0) into s4
    bl      putstring         // Call putstring function to print s4 to console
    
    ldr     x0, =szSingle     // Load address of string szSingle into x0 register
    bl      putstring         // Call putstring function to print szSingle string to console
    
    ldr     x0, =chCr         // Load the character value of the carriage return into x0 register
    bl      putch             // Call putch function to print the carriage return character to console

// Prompt #8
    ldr     x0, =szStartsWith1 // Load address of string szStartsWith1 into x0 register
    bl      putstring          // Call putstring function to print szStartsWith1 string to console
    ldr     x0, =s1            // Load address of string s1 into x0 register
    ldr     x1, =szStarts1     // Load address of string szStarts1 into x1 register
    mov     x2, #11            // Move the value 11 into x2 register
    bl      string_startsWith_1 // Call string_startsWith_1
    bl      boolean           // Call boolean
    bl      putstring         // Call putstring
    
// prompt #9
    ldr x0, =szStartsWith2   // Load the address of string szStartsWith2 into register x0
    bl putstring             // Call putstring function to print the contents of szStartsWith2 on console
    ldr x0, =s1              // Load the address of string s1 into register x0
    ldr x1, =szStarts2       // Load the address of string szStarts2 into register x1
    bl string_startsWith_2   // Call the function string_startsWith_2 to check if s1 starts with szStarts2
    bl boolean               // Call boolean function to convert the result of string_startsWith_2 to a boolean value
    bl putstring             // Call putstring function to print the result of boolean conversion on console
    
// prompt #10
    ldr x0, =szEndsWith      // Load the address of string szEndsWith into register x0
    bl putstring             // Call putstring function to print the contents of szEndsWith on console
    ldr x0, =s1              // Load the address of string s1 into register x0
    ldr x1, =szEnds          // Load the address of string szEnds into register x1
    bl string_endsWith       // Call the function string_endsWith to check if s1 ends with szEnds
    bl boolean               // Call boolean function to convert the result of string_endsWith to a boolean value
    bl putstring             // Call putstring function to print the result of boolean conversion on console
    
 
// prompt #11   

    ldr x0, =szIndex1 	    //"String_indexOf_1(s2,\'g\') = "
    bl putstring  	    //branch to putstring to print
	
//outpute the index and return in x0
    ldr x1, =s2  	    //string
    ldr x2, =arg_13         //char
    bl String_indexOf_1     //branch to return index into x0
	
//Store x0 in szResult
    ldr x3, =szResult       //load address into x3
    str x0, [x3]            //store value of index inx0 into =szResult
	
//convert value in szResult into string
    ldr x1, =szResult       //load address in x1
    bl int64asc             //convert contents of address into asc
	
//output string
    ldr x0, =szResult 	   //load address into x0
    bl putstring   	   //print out result, index
	
//skip a line in the end
    ldr     x0, =chCr 	   //loads carriage return
    bl      putch  	   //print carriage return
    
// prompt #12
    ldr     x0, =szIndex2  //load adrees in x0
    bl      putstring  	   //print out Index
	
    ldr x0, =s2  	   //loads address of string in x0
    ldr x1, =arg_13        //char as an argument is passed into functuon
    mov x2, #9  	   //passing int like this fixed segmentation fault
    bl String_indexOf_2    //returns value in x0
	
    ldr x3, =szResult      //load in szResult
    str x0, [x3]           //Store x0 in szResult
	
    ldr x1, =szResult     //load address szResult
    bl int64asc           //convert value in szResult into string
	
    ldr x0, =szResult     //load address
    bl putstring	  //output string
	
    ldr     x0, =chCr     //Load the address of chCr into register 0
    bl      putch	  //branch to putstring function with chCr as parameter
    
// prompt #13  //ring is returdned not a int
    ldr     x0, =szIndex3 //load addrees of szIndex3 into x0
    bl      putstring     //branch to putsring function
    
//outpute the index and return in x0
    ldr x0, =s2b         //string is loaded as parameter
    ldr x1, =szEggs 	 //substring
    bl String_indexOf_3  //return value in x0
	
    ldr x3, =szResult    //loadd adress pf szResult into x0
    str x0, [x3]  	//Store x0 in szResult
	
//convert value in szResult into string
    ldr x1, =szResult    //loadd adress pf szResult into x0
    bl int64asc		 //call the function with szResult as paarmeter
	
//output string
    ldr x0, =szResult	 //load adress into x0 for putstring
    bl putstring  	 //output result
	
    ldr     x0, =chCr	 //load chCr
    bl      putch	 //carriage return
    
	
// prompt #14
    ldr     x0, =szLastIndex1   //load address of szLast Index1 into x0
    bl      putstring           //call the putsring function
	
    ldr x0, =s2                //string "Green eggs and ham."
    ldr x2, =arg_13            //char 'g'
    bl String_lastIndexOf_1    //returns value in x0
	
//Store x0 in szResult
    ldr x3, =szResult       //Load the address of szResult into register x3
    str x0, [x3]           //Store the value of register x0 into the memory location pointed to by register x3

//convert value in szResult into string
    ldr x1, =szResult     //Load the address of szResult into register x1
    bl int64asc            //Call the subroutine int64asc to convert the value stored in szResult into a string

//output string
    ldr x0, =szResult      //Load the address of szResult into register x0
    bl putstring           //Call the subroutine putstring to output the string stored in szResult

//Output a newline character
    ldr x0, =chCr          //Load the address of the newline character into register x0
    bl putch               //Call the subroutine putch to output the newline character

// prompt #15
    ldr x0, =szLastIndex2  //Load the address of szLastIndex2 into register x0
    bl putstring           //Call the subroutine putstring to output the string stored in szLastIndex2

    ldr x0, =s2             //Load the address of s2 into register x0 (string argument for the String_lastIndexOf_2 function
    ldr x1, =arg_13         //Load the address of arg_13 into register x1 (string argument for the String_lastIndexOf_2 function)
    mov x2, #6              //Load the value 6 into register x2 (integer argument for the String_lastIndexOf_2 function)
    bl String_lastIndexOf_2  //Call the subroutine String_lastIndexOf_2, which returns the last index of the substring s2 in the string arg_13
			    //The result is stored in register x0

    ldr x3, =szResult      //Load the address of szResult into register x3
    str x0, [x3]           //Store the value of register x0 into the memory location pointed to by register x3

    ldr x1, =szResult     //Load the address of szResult into register x1
    bl int64asc           //Call the subroutine int64asc to convert the value stored in szResult into a string

    ldr x0, =szResult     //Load the address of szResult into register x0
    bl putstring          //Call the subroutine putstring to output the string stored in szResult

    ldr x0, =chCr         //Load the address of the newline character into register x0
    bl putch              //Call the subroutine putch to output the newline character

// prompt #16
    ldr x0, =szLastIndex3   //Load the address of the szLaststring3 into register x0
    bl      putstring        //Call the subroutine putstring to output the newline character


    ldr x0, =s2b          // Load the address of the string "s2b" into register x0 
    ldr x1, =szEggs       // Load the address of the string "s2b" into register x0
    bl String_indexOf_3   // Call the function "String_indexOf_3" to find the index of the substring in the string
	
    ldr x3, =szResult     // Load the address of the variable "szResult" into register x3
    str x0, [x3]          // Store the value in x0 (which contains the index of the substring) into the variable "szResult"
	
   ldr x1, =szResult      //convert value in szResult into string 
   bl int64asc           //call int64asc
	
  //output string
    ldr x0, =szResult     // Load the address of the variable "szResult" into register x0
    bl putstring          //Call the subroutine putstring to output it
	
    ldr x0, =chCr         //Load the address of the newline character into register x0
    bl putch              //Call the subroutine putch to output the newline character
      
// prompt #17 

    ldr     x0, =szReplace // Load the address of the variable "szReplace" into register x0
    bl      putstring      // //Call the subroutine putstring to output it
	
    //ldr x0 =sla       // "Cat in the hat"
    //ldr x1 =arg_17a    //'a'
    //ldr x2 =arg_17b    //'o'
    //bl String_replace   //x0 holds new string
    //bl putstring      //prints it out


    ldr x0, =s1z       // Load the address of a string called s1z into register x0
    bl putstring       // Call a subroutine called putstring to print the string in s1z
	
    ldr x0, =szQuote  // Load the address of a string containing a single quotee into register x0
    bl putstring     // Call a subroutine called putstring to print the string in szQuote
	
    ldr x0, =chCr         //Load the address of the newline character into register x0
    bl putch              //Call the subroutine putch to output the newline character
      
// prompt #18   :)
    ldr     x0, =szLower  //load address
    bl      putstring     //branch
	
	
    ldr x0, =s1b          // "Cot in the hot."  
    bl String_toLowerCase  //call lowercase function and return in x0
    bl putstring          //call putstring function
	
	ldr x0, =szQuote
	bl putstring

    ldr x0, =chCr         //Load the address of the newline character into register x0
    bl putch              //Call the subroutine putch to output the newline character
        
// prompt #19 :)
    ldr     x0, =szUpper   //load szUpper into x0
    bl      putstring      //call function
	
	
    ldr x0, =s1b           // "Cot in the hot."  
    bl String_toUpperCase   //capitalize the string 
    bl putstring           //call the string
	
	ldr x0, =szQuote
	bl putstring

   ldr x0, =chCr         //Load the address of the newline character into register x0
    bl putch              //Call the subroutine putch to output the newline character
        
// prompt #20  :)
    ldr     x0, =szConcat  //load concat
    bl      putstring      //branch function
	
    ldr x0, =s1b           //load string
    bl String_length       //return string length into x0
    mov x3, x0             //move x0 length into x3
	
    ldr x0, =szSpace       //load szSpeace
    bl String_length       //return string length to x0
    mov x4, x0             //move x0 into x4
	
    ldr x1, =s1b          //load label
    ldr x2, =szSpace       //loadl label as argument
    mov x3, x3            //lenght of s1b
    mov x4, x4            //length of szSpace
    bl String_concat       //call conact; which also outputs 
	  
	ldr x0, =szQuote
	bl putstring
	
   ldr x0, =chCr         //Load the address of the newline character into register x0
    bl putch              //Call the subroutine putch to output the newline character
        
    b end


// Output for true and false
boolean:
    cmp     x0, #1
    b.eq    true
    
    ldr     x0, =szFalse
    ret
    
true:
    ldr     x0, =szTrue
    ret
   
end:
// Setup the parameters to exit the program
// and then call Linux to do it.
    mov     X0, #0         // Use 0 return code
    mov     X8, #93        // Service command code 93 terminates this program
    svc     0              // Call linux to terminate the program

.data // Data values
s1:              .asciz   "Cat in the hat."
s2:              .asciz   "Green eggs and ham."
s3:              .asciz   "cat in the hat."
s4:              .skip    25
s1Length:        .asciz   "1.s1.length() = "
s2Length:        .asciz   "  s2.length() = "
s3Length:        .asciz   "  s3.length() = "
szEquals1:       .asciz   "2. String_equals(s1,s3) = "
szEquals2:       .asciz   "3. String_equals(s1,s1) = "
szEqualsIgnore1: .asciz    "4. String_equalsIgnoreCase(s1,s3) = "
szEqualsIgnore2: .asciz    "5. String_equalsIgnoreCase(s1,s2) = "
szCopy:          .asciz  "6. s4 = String_copy(s1)\n"
s1Copy:          .asciz  "   s1 = "
s4Copy:          .asciz  "   s4 = "
szSubstring1:    .asciz    "7. String_substring_1(s3,4,14) = \""
szSubstring2:    .asciz    "8. String_substring_2(s3,7) = \""
szCharAt:        .asciz    "9. String_charAt(s2,4) = \'"
szStartsWith1:   .asciz    "10. String_startsWith_1(s1,11,\"hat.\") = "
szStartsWith2:   .asciz    "11. String_startsWith_2(s1,\"Cat\") = "
szEndsWith:      .asciz    "12. String_endsWith(s1,\"in the hat.\") = "
szIndex1:        .asciz    "13. String_indexOf_1(s2,\'g\') = "
szIndex2:        .asciz    "14. String_indexOf_2(s2,\'g\',9) = "
szIndex3:        .asciz    "15. String_indexOf_3(s2,\"eggs\") = "
szLastIndex1:    .asciz    "16. String_lastIndexOf_1(s2,\'g\') = "
szLastIndex2:    .asciz    "17. String_lastIndexOf_2(s2,\'g\',6) = "
szLastIndex3:    .asciz    "18. String_lastIndexOf_3(s2,\"egg\") = "
szReplace:       .asciz    "19. String_replace(s1,\'a\',\'o\') = \""
szLower:         .asciz    "20. String_toLowerCase(s1) = \""
szUpper:         .asciz    "21. String_toUpperCase(s1) = \""
szConcat:        .asciz    "22. String_concat(s1, \" \");\nString_concat(s1, s2) = \""

szStarts1:       .asciz   "hat."
szStarts2:       .asciz   "Cat"
szEnds:          .asciz   "in the hat."
szInt:           .skip 21
szQuote:         .asciz "\""
szSingle:        .asciz "\'"
szTrue:          .asciz "TRUE\n"
szFalse:         .asciz "FALSE\n"
chCr:            .byte 10
//Alan stuff
arg_13: .byte 'g'   
szResult: .space 21 //holds string conversions and outputs them; for all indexs
s1a: .asciz "Cat in the hat"
s1b: .asciz "Cot in the hot"
s1z: .asciz "Cot in the hot"
s2b:              .asciz   "Green eggs and ham."
szSpace: .asciz " "
szEggs: .asciz "eggs"
arg_17a: .byte 'a'
arg_17b: .byte 'b'

szHeader: .asciz "Name: Alan & Andrew \nProgram: RASM3 \nClass: CS3B \nDate: 3/25/2023 \nS1 = Cat in the hat. \nS2 = Green eggs and ham. \nS3 = cat in the hat. \n\n"



