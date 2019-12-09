#ifndef DEFINES_4550_4MHZ_H_
#define DEFINES_4550_4MHZ_H_


#include <xc.h>
#include <stdint.h>
#include "BITSCONF50.h"
#include "EEPROM.h"
#include "GPIO.h"
#include "interrupcciones.h"
#include "Mensajes50.h"
#include "MOTOR.h"
#include "PWM4550.h"
#include "SETPOINTS.h"
#include "PIC18F4550.h"
#include "UART50.h"
#define _XTAL_FREQ  4000000
#define     BAUD        9600


//UART DEFINES
#define CTX         TRISCbits.RC6
#define CRX         TRISCbits.RC7
#define RegistroTX  TXSTAbits.TRMT
#define RegistroRX  PIR1bits.RCIF


//GPIO DEFINES
#define PRIORIDADES RCONbits.IPEN //EXISTENCIA DE PRIORIDADES
#define TBOTONX     TRISBbits.RB0
#define TBOTONY     TRISBbits.RB1
#define TBOTONP     TRISBbits.RB2
#define BOTONX      PORTBbits.RB1
#define BOTONY      PORTBbits.RB0
#define BOTONPARO   PORTBbits.RB2
#define ENABLE0     INTCONbits.INT0IE
#define ENABLE1     INTCON3bits.INT1E
#define ENABLE2     INTCON3bits.INT2IE
#define BANDERA1    INTCONbits.INT0IF
#define BANDERA0    INTCON3bits.INT1IF
#define BANDERA2    INTCON3bits.INT2IF
#define UPDOWN0     INTCON2bits.INTEDG0 //interrupcion externa cuando sube=1 baja=0
#define UPDOWN1     INTCON2bits.INTEDG1
#define UPDOWN2     INTCON2bits.INTEDG2
#define PULL_UPINT  INTCON2bits.RBPU /*0 activar pull up 1 desactitvarlo*/
#define INTERRUPCION INTCONbits.GIE

#define DirA        PORTDbits.RD1   /*motorA 0 Horario -1 Antihorario*/
#define DirB        PORTDbits.RD0   /*motorA 0 Horario -1 Antihorario*/
#define ENABLEA     PORTDbits.RD3   /*motorA NEGADO*/
#define ENABLEB     PORTDbits.RD2   /*motorB NEGADO*/
#define LEDAZUL     PORTDbits.RD4   
#define LEDVERDE    PORTDbits.RD5   
#define LEDROJO     PORTDbits.RD6   
#define SOLENOIDE   PORTDbits.RD7   
//PWM
#define TRPWMMOTORA TRISCbits.RC2
#define TRPWMMOTORB TRISCbits.RC1

#define PWMMOTORA   PORTCbits.CCP1   /*PWM motor A*/
#define PWMMOTORB   PORTCbits.CCP2  /*PWM motor B*/

#define INITTMR2    T2CONbits.TMR2ON

//EEPROM
#define LIMITSET    160
#define LIMITINS    252
#define XACTUAL     252
#define YACTUAL     254
#define MEMTOTAL    255

//MECANICA
#define LIMITX      300
#define LIMITY      300
//TIMER0
#define TIMER0enable    T0CONbits.TMR0ON
#define TIMER0Bandera   INTCONbits.T0IF


#endif	/*DEFINES_4550_4MHZ_H_*/  
