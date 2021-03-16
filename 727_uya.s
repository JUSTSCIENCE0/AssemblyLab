.data

success: .asciz "Success!\n"
.balign 4
array: .skip 48
format: .asciz "%d\n"
informat: .asciz "%d"
tmp: .word 0
number: .word 0
.text

initialize_array:
    mov r2, #0
init_loop:
    cmp r2, #12           
    beq end_init      
    ldr r7, addr_tmp
    str r2, [r7]
    ldr r0, addr_informat
    ldr r1, addr_number
    bl scanf

    ldr r3, address_of_array
    ldr r2, addr_tmp
    ldr r2, [r2]
    add r4, r3, r2, LSL #2

    ldr r0, addr_number
    ldr r0, [r0]
    str r0, [r4]
    add r2, r2, #1         
    b init_loop
end_init:
    ldr r0, address_of_success
    bl printf
    b initialized

print_array:
    mov r2, #0
print_loop:
    ldr r3, address_of_array
    cmp r2, #12
    beq end_print
    add r4, r3, r2, LSL #2
    ldr r1, [r4]

    ldr r7, addr_tmp
    str r2, [r7]

    ldr r0, address_of_format
    bl printf

    ldr r2, addr_tmp
    ldr r2, [r2]
    add r2, r2, #1
    b print_loop
end_print:
    ldr r0, address_of_success
    bl printf
    b printed

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
    ldr r0, address_of_success
    bl printf
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
    ldr r0, address_of_format
    mov r1, r7
    bl printf
    ldr r0, address_of_success
    bl printf
    b summed

.global main
main:
    bl initialize_array
initialized:
    bl invert_negative
inverted:
    bl print_array
printed:
    bl summ_array
summed:

end:
   ldr r0, address_of_success
   bl printf
   bx lr

address_of_format: .word format
address_of_success: .word success
address_of_array: .word array
addr_tmp: .word tmp
addr_informat: .word informat
addr_number: .word number
