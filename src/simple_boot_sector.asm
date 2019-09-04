; Infinite loop that does nothing
loop:
    jmp loop

; Pad with zeros until the 510-th byte
times 510-($-$$) db 0

; Write the last two bytes with boot sector hint
dw 0xaa55