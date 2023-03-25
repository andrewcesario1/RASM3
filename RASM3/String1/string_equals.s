// Programer: Andrew Cesario
// Rasm #3
// Purpose: string_equals
// Author: Andrew Cesario
// Date: 3/24/2023

// Function to compare two strings and return 1 if they are equal, 0 otherwise
// Arguments:
// x0 - Pointer to first string
// x1 - Pointer to second string
// Return:
// x0 - 1 if strings are equal, 0 otherwise

.global string_equals

string_equals:
    // Save the return address and preserve registers as per AAPCS
    stp x29, x30, [sp, -16]!  // Save the frame pointer and link register and decrement the stack pointer by 16 bytes
    stp x19, x20, [sp, -16]!  // Save x19 and x20 and decrement the stack pointer by 16 bytes
    stp x21, x22, [sp, -16]!  // Save x21 and x22 and decrement the stack pointer by 16 bytes
    stp x23, x24, [sp, -16]!  // Save x23 and x24 and decrement the stack pointer by 16 bytes
    stp x25, x26, [sp, -16]!  // Save x25 and x26 and decrement the stack pointer by 16 bytes
    stp x27, x28, [sp, -16]!  // Save x27 and x28 and decrement the stack pointer by 16 bytes
    // Set up the frame pointer
    mov x29, sp
    
    // Loop through both strings
loop:
    // Load the current characters from the strings
    ldrb w19, [x0], 1   // Load 1 byte from the first string into w19 and increment the pointer
    ldrb w20, [x1], 1   // Load 1 byte from the second string into w20 and increment the pointer

    // Check if the characters are equal
    cmp w19, w20
    b.ne not_equal   // If the characters are not equal, exit the loop

    // Check if both strings have reached their null terminator
    cbz w19, equal   // If both strings have reached their null terminator, return 1
    b loop   // Otherwise, continue looping
        
equal:
        // Both strings are equal, set x0 to 1
    mov x0, #1
    b end
not_equal:
    mov x0, #0
    b end
        
end:
    // Restore the return address and registers
    ldp x27, x28, [sp], 16  // Restore x27 and x28 and increment the stack pointer by 16 bytes
    ldp x25, x26, [sp], 16  // Restore x25 and x26 and increment the stack pointer by 16 bytes
    ldp x23, x24, [sp], 16  // Restore x23 and x24 and increment the stack pointer by 16 bytes
    ldp x21, x22, [sp], 16  // Restore x21 and x22 and increment the stack pointer by 16 bytes
    ldp x19, x20, [sp], 16  // Restore x19 and x20 and increment the stack pointer by 16 bytes
    ldp x29, x30, [sp], 16  // Restore the frame pointer and link register and increment the stack pointer by 16 bytes
    ret

