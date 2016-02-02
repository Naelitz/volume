; Hello World in Intel Assembler
.MODEL SMALL ; Small memory model
.586
.STACK 100h
.DATA
widthString   DB   'Enter width -> $'
widthIn	DW	?
heightString	DB	'Enter Height -> $'
heightIn	DW	?
lengthString	DB	'Enter Length -> $'
lengthIn	DW	?
endVolume	DB	'Your volume is 1 cu. ft. and 960 cu. inches or 2688 cu. inches $'

.CODE
VOLUME	PROC
	mov	ax,@DATA
	mov ds, ax
	mov dx, offset widthString
	mov ah, 9h
	int 21h
	CALL GETDEC
	mov widthIn, ax 
	mov dx, OFFSET heightString
	mov ah, 9h
	int 21h
	CALL GETDEC
	mov heightIn, ax
	mov dx, OFFSET widthString
	mov ah, 9h
	int 21h
	mov ax, 4c00h
	int 21h
VOLUME	ENDP
	END	VOLUME