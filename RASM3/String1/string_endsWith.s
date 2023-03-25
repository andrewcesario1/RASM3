// Programer: Andrew Cesario
// Rasm #3
// Purpose: string_endsWith
// Author: Andrew Cesario
// Date: 3/24/2023
//
//
// X0-X2 - parameters to linux function services
// X8 - linux function number
//
//

.global string_endsWith

string_endsWith:
    // Save the return address and preserve registers as per AAPCS
    stp x29, x30, [sp, -16]!  // Save the frame pointer and link register and decrement the stack pointer by 16 bytes
    stp x19, x20, [sp, -16]!  // Save x19 and x20 and decrement the stack pointer by 16 bytes
    stp x21, x22, [sp, -16]!  // Save x21 and x22 and decrement the stack pointer by 16 bytes
    stp x23, x24, [sp, -16]!  // Save x23 and x24 and decrement the stack pointer by 16 bytes
    stp x25, x26, [sp, -16]!  // Save x25 and x26 and decrement the stack pointer by 16 bytes
    stp x27, x28, [sp, -16]!  // Save x27 and x28 and decrement the stack pointer by 16 bytes
    // Set up the frame pointer
    mov x29, sp
    
    mov x19, x0  // move first argument to x19
    mov x20, x1  // move second argument to x20
    
    bl string_length  // call string_length function
    
    mov x21, x0  // move the result of string_length to x21
    
    mov x0, x20  // move the second argument to x0
    bl string_length  // call string_length function
    
    mov x22, x0  // move the result of string_length to x22
    
    cmp x22, x21  // compare x22 with x21
    b.gt false  // if x22 is greater than x21, branch to false label

    mov x0, x19  // move the first argument to x0
    mov x1, x20  // move the second argument to x1
    
    sub x21, x21, x22  // subtract x22 from x21 and store result in x21
    mov x2, x21  // move x21 to x2
    
    bl string_startsWith_1  // call string_startsWith_1 function
    b end  // branch to end label
    
false:
    mov x0, #0  // move 0 to x0
    
end:
    // Restore the return address and registers
    ldp x27, x28, [sp], 16  // Restore x27 and x28 and increment the stack pointer by 16 bytes
    ldp x25, x26, [sp], 16  // Restore x25 and x26 and increment the stack pointer by 16 bytes
    ldp x23, x24, [sp], 16  // Restore x23 and x24 and increment the stack pointer by 16 bytes
    ldp x21, x22, [sp], 16  // Restore x21 and x22 and increment the stack pointer by 16 bytes
    ldp x19, x20, [sp], 16  // Restore x19 and x20 and increment the stack pointer by 16 bytes
    ldp x29, x30, [sp], 16  // Restore the frame pointer and link register and increment the stack pointer by 16 bytes
    ret

