; file: first.asm

%include "asm_io.inc"

; 初始化的数据放到.data段中
segment .data

prompt1 db "Enter a number: ", 0
prompt2 db "Enter another number: ", 0
outmsg1 db "You entered ", 0
outmsg2 db " and ", 0
outmsg3 db ", the sum of these is ", 0

; 未初始化的数据方到.bss段中
input1 resd 1
input2 resd 1

; 代码放到.text段中
segment .text
        global   asm_main
asm_main:
        enter    0,0                  ; 开始执行
        pusha

        mov      eax, prompt1
        call     print_string

        call     read_int
        mov      [input1], eax

        mov      eax, prompt2
        call     print_string

        call     read_int
        mov      [input2], eax

        mov      eax, [input1]
        add      eax, [input2]
        mov      ebx, eax

        dump_regs 1
        dump_mem  2, outmsg1, 1

        mov      eax, outmsg1
        call     print_string
        mov      eax, [input1]
        call     print_int
        mov      eax, outmsg2
        call     print_string
        mov      eax, [input2]
        call     print_int
        mov      eax, outmsg3
        call     print_string
        mov      eax, ebx
        call     print_int
        call     print_nl
        
        popa
        mov      eax, 0
        leave
        ret


        