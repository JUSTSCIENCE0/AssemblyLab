.486                                
.model flat, stdcall                
option casemap :none                

include \masm32\macros\macros.asm
include masm32.inc
include kernel32.inc

includelib masm32.lib
includelib kernel32.lib

.code
start:
  print chr$("Hello, World!",13,10)
  exit
end start