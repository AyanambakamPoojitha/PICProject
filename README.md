# PICProject
a hand free scroller designed by using pic microcontroller and sensor
#ABOUT
The project is done to get an idea on pic microcontroller.it can also be done using open cv but the aim is to use a micro controller.I have used PIC18F4520 microcontroller. i am a beginner to use of microcontroller .The system uses a motion-sensing module which is on the user’s head to detect pitch movement. The sensor data is processed by a microcontroller.•	The microcontroller (PIC18F4520) works as the brain of the system. It performs all the important tasks required to detect head movement and convert it into meaningful commands.
#COMPONENTS
PIC18F4520
POTENTIOMETER(SIMULATES HEAD MOVEMENT){MPU6050 IS UNAVAILABLE ON PROTEUS }
USB-TTL
CRYSTAL 8MHzn (clock for PIUC)
CAPACITORS(crystal stability)
10k ohm rtresistors
Working
Rotating the POT simulates head movement:
- Rotate right → Head moves down
- Rotate left → Head moves up

PIC reads this using ADC and sends:
 "U" → Scroll up
"D" → Scroll down
#software used
mikroC for PIC programming
proteus for circuit simulation
 I have tried to finish the project but i have to learn more about UART which i needed to  use this  in project and how to handle it and code for it . I'll make further changes after learning more about that
