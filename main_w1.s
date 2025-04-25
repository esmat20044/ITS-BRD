;******************** (C) COPYRIGHT HAW-Hamburg ********************************
;* File Name          : main.s
;* Author             : Martin Becke    
;* Version            : V1.0
;* Date               : 01.06.2021
;* Description        : This is a simple main to setup three LEDs
;                     :
;                     : 
;
;*******************************************************************************
    EXTERN initITSboard ; Helper to organize the setup of the board

    EXPORT main         ; we need this for the linker - In this context it set the entry point,too


; setup the peripherie - Mapping the GPIO
PERIPH_BASE         equ 0x40000000                 
AHB1PERIPH_BASE     equ (PERIPH_BASE + 0x00020000)  
GPIOD_BASE          equ (AHB1PERIPH_BASE + 0x0C00)  
    
GPIO_D_SET          equ (GPIOD_BASE + 0x18)
GPIO_D_CLR          equ (GPIOD_BASE + 0x1A) 
    

;* We need minimal memory setup of InRootSection placed in Code Section 
    AREA  |.text|, CODE, READONLY, ALIGN = 3    
    ALIGN   
main
    BL initITSboard             ; needed by the board to setup                                         heir wird der Board  eingerichtet
    nop                         ; no operation    
    LDR     R6, =GPIO_D_SET     ; get the address of the GPIO data set register
;   LDR     R7, =GPIO_D_CLR     ; get the address of the GPIO data clear register
    MOV     R0, #0x03           ; load mask 0b0001                                     mit #0x03  geht LED an Pin0 und 1  gleichzeitig an
;   MOV     R1, #0x02           ; load mask 0b0010
;   MOV     R2, #0x40           ; load mask 0b0100
;   MOV     R3, #0x80           ; load mask 0b1000

    ; Set LED
;*    STRB    R2, [R6]    ; switch on LED D14               				hier geht das blaue licht von D14 an 								
;*    STRB    R3, [R6]    ; switch on LED D15								hier geht das n�chste blaue licht von D15 an 				
;*    STRB    R0, [R6]    ; switch on LED D08  							    hier geht das blaue licht von D8 an
;*    STRB    R0, [R7]    ; switch off LED D08  							hier wird das blaue licht von D8 wieder ausgemacht
	  STRB    R0, [R6]    ; switch on LED D08  							    hier geht das blaue licht von D8 wieder an
;	  STRB    R1, [R6]    ; switch on LED D09 						    	hier geht das blaue licht von D9 an
;*    STRB    R2, [R7]    ; switch off LED D14  							hier geht das blaue licht von D14 aus
;*    STRB    R3, [R7]    ; switch off LED D15				     			hier geht das blaue licht von D15 aus
    b .
    
    ALIGN
    END
