[bits 16]
       jmp short yukleyici_basla
	   nop
	   
	   yukleyici_basla:
	   
	   
	     mov ax, 07C0h,
		 add ax, 544
		 cli 
		 
		 mov ss, ax
		 mov sp,2048
		 
		 
		sti
		mov ax, 07C0h
		mov ds,ax
		
		mov dl,0
		mov dh,0
		call imlectasi
		mov si,metin1
		call yazdir
		
		mov dl,5
		mov dh,1
		call imlectasi
		mov si,metin2
		call yazdir

		mov dl,2
		mov dh,3
		call imlectasi
		mov si,metin3
		call yazdir
		
		mov dl,1
		mov dh,4
		call imlectasi
		mov si,metin4
		call yazdir
		
		
		
		
		jmp $
		
		
		
		imlectasi:
		
		pusha
		
		mov bh,0
		mov ah,2
		
		int 0x10
		
		popa
		ret
		
		
		yazdir:
		
		pusha
		
		
		
		mov ah, 0x0E
		mov bh, 0
		
		birsonrakikarakter:
		  lodsb
		  
		  cmp al,0
		  je bitir
		  
		  int 0x10
		  jmp birsonrakikarakter
		  
		  bitir:
		  
		  popa
		  ret
 		  
		metin1         db       'merhaba bilgisayar',0
		metin2        db        'nasilsin',0
		metin3        db       'iyiyim',0
		metin4        db       'aferin sana'
		times 510 -  ($ -$$)  db 0
		dw 0xAA55
		
		 