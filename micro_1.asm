
_main:

;micro_1.c,10 :: 		void main() {
;micro_1.c,12 :: 		ADCON1 = 0x0E;     // RA0 as analog, others digital
	MOVLW       14
	MOVWF       ADCON1+0 
;micro_1.c,13 :: 		TRISA = 0x01;     // RA0 input
	MOVLW       1
	MOVWF       TRISA+0 
;micro_1.c,14 :: 		TRISC = 0x80;     // RC7 input, RC6 output
	MOVLW       128
	MOVWF       TRISC+0 
;micro_1.c,16 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;micro_1.c,17 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;micro_1.c,19 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;micro_1.c,20 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
;micro_1.c,23 :: 		center = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _center+0 
	MOVF        R1, 0 
	MOVWF       _center+1 
;micro_1.c,24 :: 		Delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
;micro_1.c,26 :: 		while(1) {
L_main3:
;micro_1.c,28 :: 		adcValue = ADC_Read(0);   // Read POT (Head movement)
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adcValue+0 
	MOVF        R1, 0 
	MOVWF       _adcValue+1 
;micro_1.c,30 :: 		if(adcValue > center + threshold) {
	MOVF        _threshold+0, 0 
	ADDWF       _center+0, 0 
	MOVWF       R3 
	MOVF        _threshold+1, 0 
	ADDWFC      _center+1, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main11
	MOVF        R0, 0 
	SUBWF       R3, 0 
L__main11:
	BTFSC       STATUS+0, 0 
	GOTO        L_main5
;micro_1.c,31 :: 		UART1_Write_Text("D");   // Scroll Down
	MOVLW       ?lstr1_micro_1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_micro_1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;micro_1.c,32 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;micro_1.c,33 :: 		}
	GOTO        L_main7
L_main5:
;micro_1.c,35 :: 		else if(adcValue < center - threshold) {
	MOVF        _threshold+0, 0 
	SUBWF       _center+0, 0 
	MOVWF       R1 
	MOVF        _threshold+1, 0 
	SUBWFB      _center+1, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       _adcValue+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main12
	MOVF        R1, 0 
	SUBWF       _adcValue+0, 0 
L__main12:
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
;micro_1.c,36 :: 		UART1_Write_Text("U");   // Scroll Up
	MOVLW       ?lstr2_micro_1+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_micro_1+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;micro_1.c,37 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	NOP
;micro_1.c,38 :: 		}
L_main8:
L_main7:
;micro_1.c,39 :: 		}
	GOTO        L_main3
;micro_1.c,40 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
