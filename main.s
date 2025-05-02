;******************** (C) COPYRIGHT HAW-Hamburg ********************************
;* File Name          : main.s
;* Author             : Martin Becke    
;* Version            : V1.0
;* Date               : 01.06.2021
;* Description        : This is a simple main to demonstrate data transfer
;                     : and manipulation.
;                     : 
;
;*******************************************************************************
    EXTERN initITSboard ; Helper to organize the setup of the board

    EXPORT main         ; we need this for the linker - In this context it set the entry point,too

;VariableC  EQU 0xaffe
    
;* We need some data to work on
    AREA DATA, DATA, align=2    
VariableA   DCW 0xbeef
VariableB   DCW 0x1234
VariableC   DCW 0xaffe

;* We need minimal memory setup of InRootSection placed in Code Section 
    AREA  |.text|, CODE, READONLY, ALIGN = 3    
    ALIGN   
main
    BL initITSboard             ; needed by the board to setup
;* swap memory - Is there another, at least optimized approach?
    ldr     R0,=VariableA   ; Anw01
    ldrb    R2,[R0]         ; Anw02
    ldrb    R3,[R0,#1]      ; Anw03
    lsl     R2, #8          ; Anw04
    orr     R2, R3          ; Anw05
    strh    R2,[R0]         ; Anw06 
    

    ldr     R8,=VariableC   ; Anw07
	ldrb    R5, [R8]   		; Anw08
	ldrb    R9, [R8,#1] 	; Anw09
    lsl     R9, #8          ; Anw0A	
	orr     R5, R9			; Anw0B
    strh    R5,[R8]         ; Anw0C


	;ldr     R8,=VariableC   ; Anw07
	;mov     R5, #0xAF  	 ; Anw08
    ;lsl     R5, #8          ; Anw09	
	;mov     R9, #0xFE		 ; Anw0A
	;orr     R5, R9			 ; Anw0B
    ;strh    R5,[R8]         ; Anw0C
	
    
;* Change value from x1234 to x4321
    ldr     R1,=VariableB   ; Anw0D
    mov     R6, #0x12       ; Anw0E
	mov     R7, #0x34 		; Anw0F
	lsl		R6, #8			; Anw10
    orr     R6, R7      	; Anw11
    strh    R6,[R1]         ; Anw12
    b .                     ; Anw13
    
    ALIGN
    END