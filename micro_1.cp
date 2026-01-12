#line 1 "C:/Users/chall/Desktop/pic project_mic/micro_1.c"





unsigned int adcValue;
unsigned int center = 0;
unsigned int threshold = 80;

void main() {

 ADCON1 = 0x0E;
 TRISA = 0x01;
 TRISC = 0x80;

 UART1_Init(9600);
 Delay_ms(100);

 ADC_Init();
 Delay_ms(100);


 center = ADC_Read(0);
 Delay_ms(200);

 while(1) {

 adcValue = ADC_Read(0);

 if(adcValue > center + threshold) {
 UART1_Write_Text("D");
 Delay_ms(300);
 }

 else if(adcValue < center - threshold) {
 UART1_Write_Text("U");
 Delay_ms(300);
 }
 }
}
