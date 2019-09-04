; A boot sector is a 512-byte block that is treated as entry point to
; an operating system. The boot sector is located in the first sector of
; a storage device, thus the BIOS will traverse the connected storage devices to
; find a boot sector to be loaded into memory and instructs the CPU to execute
; it. However, as the bytes in a storage device can be interpreted as either
; data or code, and there is no way to differentiate them, by convention,
; the last two bytes of a intended boot sector must be set to the magic number
; 0xaa55.
;
; The following is the assembly of a boot sector that performs an infinite loop.
; It needs to be compiled into binary format (see REAME.md), which will be:
;     e9 fd ff 00 00 00 00 00 00 00 00 00 00 00 00 00
;     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
;     ...
;     00 00 00 00 00 00 00 00 00 00 00 00 00 00 55 aa
; Notice that the last two bytes are in "little-endian" for x86 architecture
; [TODO] take a closer look on endianness (i.e. it is in the scope of a number,
;     then what defines the size of the number?)

; Infinite loop that does nothing, which actually prevents the CPU to execute
; "next instruction" (a.k.a random bytes) and enter undefined state.
loop:
    jmp loop

; Pad the rest with zeros until the 510-th byte.
times 510-($-$$) db 0

; Write the last two bytes with boot sector hint.
dw 0xaa55