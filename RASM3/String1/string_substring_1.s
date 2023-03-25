// Programer: Andrew Cesario
// Rasm #3
// Purpose: string_substring_1
// Author: Andrew Cesario
// Date: 3/24/2023
//
//
// X0-X2 - parameters to linux function services
// X8 - linux function number
//
//

.global string_substring_1

string_substring_1:
    // Save the return address and preserve registers as per AAPCS
    stp x29, x30, [sp, -16]!  // Save the frame pointer and link register and decrement the stack pointer by 16 bytes
    stp x19, x20, [sp, -16]!  // Save x19 and x20 and decrement the stack pointer by 16 bytes
    stp x21, x22, [sp, -16]!  // Save x21 and x22 and decrement the stack pointer by 16 bytes
    stp x23, x24, [sp, -16]!  // Save x23 and x24 and decrement the stack pointer by 16 bytes
    stp x25, x26, [sp, -16]!  // Save x25 and x26 and decrement the stack pointer by 16 bytes
    stp x27, x28, [sp, -16]!  // Save x27 and x28 and decrement the stack pointer by 16 bytes
    // Set up the frame pointer
    mov x29, sp
    
    // Move the passed string, beginning index, and end index to x19, x20, and x21 respectively
    mov x19, x0
    mov x20, x1
    mov x21, x2
    
    // Calculate the size of the substring
    sub x0, x21, x20    // size = end - start
    add x0, x0, #1
    mov x23, x0
    
    // Allocate memory for the new string using malloc
    bl malloc
    
    // Store the pointer to the allocated memory in ptrString
    ldr x3, =ptrString
    str x0, [x3]
    
    // Copy the substring to the newly allocated memory
    mov x4, #0          // i = 0
    add x19, x19, x20   // src = original string + start
loop:
    cmp x4, x23          // i == size?
    b.ge end_loop
    ldrb w2, [x19], #1   // Load the current byte of the string to w2 and increment x1 by 1
    strb w2, [x0], #1   // Store the current byte to the new memory location and increment x3 by 1
    add x4, x4, #1      // i++
    b loop
end_loop:

    mov w2, #0     // Set w7 to 0 for null terminator
    strb w2, [x0]  // Add null terminator to the end of the string

    // Restore the return address and registers
    ldp x27, x28, [sp], 16  // Restore x27 and x28 and increment the stack pointer by 16 bytes
    ldp x25, x26, [sp], 16  // Restore x25 and x26 and increment the stack pointer by 16 bytes
    ldp x23, x24, [sp], 16  // Restore x23 and x24 and increment the stack pointer by 16 bytes
    ldp x21, x22, [sp], 16  // Restore x21 and x22 and increment the stack pointer by 16 bytes
    ldp x19, x20, [sp], 16  // Restore x19 and x20 and increment the stack pointer by 16 bytes
    ldp x29, x30, [sp], 16  // Restore the frame pointer and link register and increment the stack pointer by
    ldr x0,=ptrString  // load the pointer to the string into x0
    ret
    
    
.data
ptrString: .quad 0
