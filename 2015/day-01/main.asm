section .data
    floor db 0
    instructions times 4096 db 0
    message db "Santa ended up on floor ", 0

section .text
    global _start

_start:
    ; open input file
    mov eax, 5
    mov ebx, input_filename
    mov ecx, 0
    int 0x80

    ; get file descriptor into ebx
    mov ebx, eax

    ; allocate buffer for reading
    mov eax, 4
    xor ecx, ecx
    mov cl, buffer_size
    mov edx, instructions
    int 0x80

    ; read from file
    mov eax, 3
    mov ebx, [ebp - 4]
    mov ecx, instructions
    mov edx, buffer_size
    int 0x80

    ; close file
    mov eax, 6
    mov ebx, [ebp - 4]
    int 0x80

    ; process input
    mov esi, instructions
    mov edi, message

next_char:
    cmp byte [esi], 0
    je print_result

    ; update floor
    cmp byte [esi], '('
    je increment_floor
    cmp byte [esi], ')'
    je decrement_floor

    ; skip non-parenthesis characters
    jmp skip_char

increment_floor:
    inc byte [floor]
    jmp skip_char

decrement_floor:
    dec byte [floor]
    jmp skip_char

skip_char:
    inc esi
    jmp next_char

print_result:
    ; open output file
    mov eax, 5
    mov ebx, output_filename
    mov ecx, 644  ; file permissions
    int 0x80

    ; get file descriptor into ebx
    mov ebx, eax

    ; write message to file
    mov eax, 4
    mov ecx, message
    mov edx, message_length
    int 0x80

    ; write floor value to file
    mov eax, 4
    mov ecx, floor
    mov edx, 1
    int 0x80

    ; write newline to file
    mov eax, 4
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; close file
    mov eax, 6
    mov ebx, [ebp - 8]
    int 0x80

    ; exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .bss
    buffer resb buffer_size
section .data
    input_filename db 'input.txt', 0
    output_filename db 'output.txt', 0
    buffer_size equ 4096
    message_length equ $ - message
    newline db 10

