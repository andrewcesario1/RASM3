// Programer: Andrew Cesario
// RASM #3
// Purpose: string_charAt
// Author: Andrew Cesario
// Date: 3/24/2023
//
//
// X0-X2 - parameters to linux function services
// X8 - linux function number
//
//

// Declare a global function named "string_charAt"
.global string_charAt

string_charAt:
    // Save the return address and preserve registers as per AAPCS
    stp x29, x30, [sp, -16]!  // Save the frame pointer and link register and decrement the stack pointer by 16 bytes
    stp x19, x20, [sp, -16]!  // Save x19 and x20 and decrement the stack pointer by 16 bytes
    stp x21, x22, [sp, -16]!  // Save x21 and x22 and decrement the stack pointer by 16 bytes
    stp x23, x24, [sp, -16]!  // Save x23 and x24 and decrement the stack pointer by 16 bytes
    stp x25, x26, [sp, -16]!  // Save x25 and x26 and decrement the stack pointer by 16 bytes
    stp x27, x28, [sp, -16]!  // Save x27 and x28 and decrement the stack pointer by 16 bytes
    // Set up the frame pointer
    mov x29, sp
    
    // Move parameters to registers
    mov x19, x0 // move string to x19
    mov x20, x1 // move position to x20
    
    // Calculate pointer to the character
    add x0, x19, x20 // add string pointer and position to get the character pointer
    
    // Load the character from memory
    ldrb w0, [x0] // load a byte from the character pointer to x0
    ldr x1,=ch
    strb w0, [x1]  // Store the current byte to the new memory location and increment x3 by 1
    
    // Restore the return address and registers
    ldp x27, x28, [sp], 16  // Restore x27 and x28 and increment the stack pointer by 16 bytes
    ldp x25, x26, [sp], 16  // Restore x25 and x26 and increment the stack pointer by 16 bytes
    ldp x23, x24, [sp], 16  // Restore x23 and x24 and increment the stack pointer by 16 bytes
    ldp x21, x22, [sp], 16  // Restore x21 and x22 and increment the stack pointer by 16 bytes
    ldp x19, x20, [sp], 16  // Restore x19 and x20 and increment the stack pointer by 16 bytes
    ldp x29, x30, [sp], 16  // Restore the frame pointer and link register and increment the stack pointer by 16 bytes
    
    ldr x0,=ch
    ret // return the character in x0
    
// Declare a data section
.data
// Declare a byte of memory with initial value 0 and label "ch"
ch:  .byte 0
