// Programer: Andrew Cesario
// Rasm #3
// Purpose: string_equalsIgnoreCase
// Author: Andrew Cesario
// Date: 3/24/2023

.global string_equalsIgnoreCase

string_equalsIgnoreCase:
    // Save the return address and preserve registers as per AAPCS
    stp x29, x30, [sp, -16]!  // Save the frame pointer and link register and decrement the stack pointer by 16 bytes
    stp x19, x20, [sp, -16]!  // Save x19 and x20 and decrement the stack pointer by 16 bytes
    stp x21, x22, [sp, -16]!  // Save x21 and x22 and decrement the stack pointer by 16 bytes
    stp x23, x24, [sp, -16]!  // Save x23 and x24 and decrement the stack pointer by 16 bytes
    stp x25, x26, [sp, -16]!  // Save x25 and x26 and decrement the stack pointer by 16 bytes
    stp x27, x28, [sp, -16]!  // Save x27 and x28 and decrement the stack pointer by 16 bytes
    // Set up the frame pointer
    mov x29, sp
    
    // Load the pointers to the strings into x19 and x20
    mov x19, x0
    mov x20, x1
    
    // Loop through the strings
loop:
        // Load the current characters from the strings
    ldrb w19, [x0], 1   // Load 1 byte from the first string into w19 and increment the pointer
    ldrb w20, [x1], 1   // Load 1 byte from the second string into w20 and increment the
    
    cmp w19, w20         // Compare the characters
    beq compare            // If characters match, branch to equal
    
    cmp w19, #65         // If character from string 1 is uppercase
    blt not_equal        // If it's not a letter, it's not equal
    cmp w19, #90         // Check if character from string 1 is uppercase
    ble lowercase_1      // If it is, branch to lowercase_1 to convert it to lowercase
    cmp w20, #65         // If character from string 2 is uppercase
    blt not_equal        // If it's not a letter, it's not equal
    cmp w20, #90         // Check if character from string 2 is uppercase
    ble lowercase_2      // If it is, branch to lowercase_2 to convert it to lowercase
    b not_equal          // Otherwise, characters are not equal

lowercase_1:
    add w19, w19, #32    // Convert uppercase to lowercase
    b compare            // Branch to compare

lowercase_2:
    add w20, w20, #32    // Convert uppercase to lowercase

compare:
    cmp w19, w20         // Compare the characters again
    b.ne not_equal       // If they don't match, branch to not_equal
    cbnz w19, loop       // If we haven't reached the end of the string, branch to loop

equal:
    mov w0, #1           // Strings are equal, set return value to 1
    b done

not_equal:
    mov w0, #0           // Strings are not equal, set return value to 0

done:
    // Return from the function and restore the registers
    done:
        // Restore the return address and registers
        ldp x27, x28, [sp], 16  // Restore x27 and x28 and increment the stack pointer by 16 bytes
        ldp x25, x26, [sp], 16  // Restore x25 and x26 and increment the stack pointer by 16 bytes
        ldp x23, x24, [sp], 16  // Restore x23 and x24 and increment the stack pointer by 16 bytes
        ldp x21, x22, [sp], 16  // Restore x21 and x22 and increment the stack pointer by 16 bytes
        ldp x19, x20, [sp], 16  // Restore x19 and x20 and increment the stack pointer by 16 bytes
        ldp x29, x30, [sp], 16  // Restore the frame pointer and link register and increment the stack pointer by 16 bytes
        ret

