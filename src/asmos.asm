; From http://mikeos.berlios.de/write-your-own-os.html
; (c) 2013 Mike Saunders and MikeOS Developers

	BITS 16

start:
	; Set up segment registers
	mov ax, 07c0h
	add ax, 288
	mov ss, ax
	mov sp, 4096

	mov ax, 07c0h
	mov ds, ax

	mov si, text_string
	call print_string

	jmp $

	text_string db 'My first OS!', 0

print_string:
	mov ah, 0Eh

.repeat:
	lodsb
	cmp al, 0
	je .done
	int 10h
	jmp .repeat

.done:
	ret

	; Pad with zeroes
	times 510-($-$$) db 0

	; Boot signature
	dw 0xAA55

