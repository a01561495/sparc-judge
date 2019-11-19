/*
 * File:   interrupcciones.c
 * Author: Usuario
 *
 * Created on 17 de noviembre de 2019, 08:12 PM
 */


#include <xc.h>
#include <stdint.h>
#include "interrupcciones.h"

void inter_init(void) {
    TRISBbits.RB1=0;
    TRISBbits.RB0=0;
    INTCONbits.INT0IE=1;
    INTCON3bits.INT1E=1;
    INTCONbits.INT0IF=0;
    INTCON3bits.INT1IF=0;
    RCONbits.IPEN=0;
    INTCON2bits.RBPU=0;
    INTCON2bits.INTEDG0=0;
    INTCON2bits.INTEDG1=0;
    INTCONbits.GIE=1;
}
void Timer0init(void) {
    //temporizador=(4/Fosc)*prescaler*(x+1)
    INTCONbits.GIE=0;
    T0CONbits.T0CS=0;
    T0CONbits.PSA=0;
    T0CONbits.T0PS=0b111;
    T0CONbits.T08BIT=0;
    T0CONbits.TMR0ON=0;
    INTCONbits.TMR0IF=0;
    INTCONbits.TMR0IE=1;
    INTCONbits.PEIE=1;
    INTCONbits.GIE=1;
}