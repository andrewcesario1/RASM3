// Programer: Andrew Cesario
// RASM3
// Purpose: Test functions for 3 strings
// Author: Andrew Cesario, Allan
// Date: 3/24/2023

// Define a constant named SIZE with a value of 21
.EQU SIZE, 21

// Declare the _start label as a global symbol
.global main

// _start label marks the beginning of the program
main:
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
    ldr     x0, =szIndex1
    bl      putstring
    
    ldr     x0, =chCr
    bl      putch
    
// prompt #12
    ldr     x0, =szIndex2
    bl      putstring
    
    ldr     x0, =chCr
    bl      putch
    
// prompt #13
    ldr     x0, =szIndex3
    bl      putstring
    
    ldr     x0, =chCr
    bl      putch
    
// prompt #14
    ldr     x0, =szLastIndex1
    bl      putstring

    ldr     x0, =chCr
    bl      putch
    
// prompt #15
    ldr     x0, =szLastIndex2
    bl      putstring
    
// prompt #16
    ldr     x0, =szLastIndex3
    bl      putstring
    
    ldr     x0, =chCr
    bl      putch
    
// prompt #17
    ldr     x0, =szReplace
    bl      putstring
    
    ldr     x0, =chCr
    bl      putch  
      
// prompt #18
    ldr     x0, =szLower
    bl      putstring

    ldr     x0, =chCr
    bl      putch
        
// prompt #19
    ldr     x0, =szUpper
    bl      putstring

    ldr     x0, =chCr
    bl      putch
        
// prompt #20
    ldr     x0, =szConcat
    bl      putstring

    ldr     x0, =chCr
    bl      putch
        
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
s1Length:        .asciz   "s1.length() = "
s2Length:        .asciz   "s2.length() = "
s3Length:        .asciz   "s3.length() = "
szEquals1:       .asciz   "String_equals(s1,s3) = "
szEquals2:       .asciz   "String_equals(s1,s1) = "
szEqualsIgnore1: .asciz    "String_equalsIgnoreCase(s1,s3) = "
szEqualsIgnore2: .asciz    "String_equalsIgnoreCase(s1,s2) = "
szCopy:          .asciz  "s4 = String_copy(s1)\n"
s1Copy:          .asciz  "s1 = "
s4Copy:          .asciz  "s4 = "
szSubstring1:    .asciz    "String_substring_1(s3,4,14) = \""
szSubstring2:    .asciz    "String_substring_2(s3,7) = \""
szCharAt:        .asciz    "String_charAt(s2,4) = \'"
szStartsWith1:   .asciz    "String_startsWith_1(s1,11,\"hat.\") = "
szStartsWith2:   .asciz    "String_startsWith_2(s1,\"Cat\") = "
szEndsWith:      .asciz    "String_endsWith(s1,\"in the hat.\") = "
szIndex1:        .asciz    "String_indexOf_1(s2,\'g\') = "
szIndex2:        .asciz    "String_indexOf_2(s2,\'g\',9) = "
szIndex3:        .asciz    "String_indexOf_3(s2,\"eggs\") = "
szLastIndex1:    .asciz    "String_lastIndexOf_1(s2,\'g\') = "
szLastIndex2:    .asciz    "String_lastIndexOf_2(s2,\'g\',6) = "
szLastIndex3:    .asciz    "String_lastIndexOf_3(s2,\"egg\") = "
szReplace:       .asciz    "String_replace(s1,\'a\',\'o\') = \""
szLower:         .asciz    "String_toLowerCase(s1) = \""
szUpper:         .asciz    "String_toUpperCase(s1) = \""
szConcat:        .asciz    "String_concat(s1, \" \");\nString_concat(s1, s2) = \""

szStarts1:       .asciz   "hat."
szStarts2:       .asciz   "Cat"
szEnds:          .asciz   "in the hat."
szInt:           .skip 21
szQuote:         .asciz "\""
szSingle:        .asciz "\'"
szTrue:          .asciz "TRUE\n"
szFalse:         .asciz "FALSE\n"
chCr:            .byte 10
