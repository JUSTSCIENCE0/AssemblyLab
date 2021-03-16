.data

format: .asciz "%d\n"
array: .word 1, -1, 2, -2, 3, -3, 4, -4, 5, -5, 6, -6
number: .word 0

.text

invert_negative:
    ldr r3, address_of_array
    mov r2, #0
    mov r7, #-1
invert_loop:
    cmp r2, #12
    beq end_inv
    add r4, r3, r2, LSL #2
    ldr r1, [r4]
    cmp r1, #0
    bpl is_positive
    mul r1, r1, r7
    str r1, [r4]
is_positive:
    add r2, r2, #1
    b invert_loop
end_inv:
    b inverted

summ_array:
    ldr r3, address_of_array
    mov r2, #0
    mov r7, #0
summ_loop:
    cmp r2, #12
    beq end_summ
    add r4, r3, r2, LSL #2
    ldr r1, [r4]
    add r7, r1, r7
    add r2, r2, #1
    b summ_loop
end_summ:
    mov r0, r7
    b summed

.global _start
_start:
    bl invert_negative
inverted:
    bl summ_array
summed:

end:
   bx lr

address_of_array: .word array
addr_number: .word number
addr_format: .word format
