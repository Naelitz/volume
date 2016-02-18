; Hello World in Intel Assembler
.MODEL SMALL ; Small memory model
.586
.STACK 100h
.DATA
widthString   DB   'Enter width in (feet) (inches) format -> $'
widthInFt	DW	?
widthInIn	DW	?
heightString	DB	'Enter Height in (feet) (inches) format -> $'
heightInFt	DW	?
heightInIn	DW	?
lengthString	DB	'Enter Length in (feet) (inches) format -> $'
lengthInFt	DW	?
lengthInIn	DW	?
volumeInIn DW ?
endVolumeA	DB	'Your volume is $'
endVolumeB	DB	' cu. ft. and $'
endVolumeC	DB	' cu. inches or $'
endVolumeD	DB	' cu. inches$'

.CODE

; ---------------------------	 UTIL.LIB Imports	 ---------------------------
EXTRN GetDec: NEAR
EXTRN PutDec: NEAR
; ------------------------------------------------------------------------------

VOLUME	PROC
	mov	ax,@DATA
	mov ds, ax
	mov dx, offset widthString
	mov ah, 9h
	int 21h
	CALL GETDEC
	imul ax, 12
	mov widthInFt, ax 					;Height feet to inches
	CALL GETDEC 
	add ax, widthInFt
	mov widthInIn, ax
	mov dx, OFFSET heightString
	mov ah, 9h
	int 21h
	CALL GETDEC
	imul ax, 12
	mov heightInFt, ax					;Height feet to inches
	CALL GETDEC
	add ax, heightInFt
	mov heightInIn, ax
	mov dx, OFFSET lengthString
	mov ah, 9h
	int 21h
	CALL GETDEC
	imul ax, 12
	mov lengthInFt, ax					;Length feet to inches
	CALL GETDEC
	add ax, lengthInFt
	mov lengthInIn, ax
	;---------------------------------------------------------------
	; Calculation
	;---------------------------------------------------------------
	mov ax, widthinin
	imul ax, heightinin
	imul ax, lengthinin
	mov volumeInIn, ax
	
	
	mov dx, OFFSET endVolumeA
	mov ah, 9h
	int 21h
	mov ax, widthInIn
	CALL PutDec
	mov dx, OFFSET endVolumeB
	mov ah, 9h
	int 21h
	mov ax, heightInIn
	CALL putdec
	mov dx, OFFSET endVolumeC
	mov ah, 9h
	int 21h
	mov ax, volumeInIn
	CALL putdec
	mov dx, OFFSET endVolumeD
	mov ah, 9h
	int 21h
	
	mov ax, 4c00h
	int 21h
VOLUME	ENDP
	END	VOLUME
	
	