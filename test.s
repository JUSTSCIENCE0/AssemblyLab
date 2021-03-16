.global main
.data

HelloStr:
    .asciz "Hello World\n"
	len = . - HelloStr
 .text
main:
    mov r7, #4                    // Save the return address on the stack
    mov r0, #1                    // Save the frame pointer on the stack

	ldr r1, =HelloStr
	ldr r2, =len

	swi #0

	mov r7, #1
	mov r0, #0
	swi #0
