/*
 * File:   GPIO.c
 * Author: Usuario
 *
 * Created on 20 de noviembre de 2019, 11:08 AM
 */


#include <xc.h>
#include <stdint.h>
#include "GPIO.h"

void inter_init(void) {
    TRISBbits.RB1=1;
    TRISBbits.RB0=1;
    INTCONbits.INT0IE=1;
    INTCON3bits.INT1E=1;
    INTCONbits.INT0IF=0;
    INTCON3bits.INT1IF=0;
    RCONbits.IPEN=0;
    INTCON2bits.RBPU=0;
    INTCON2bits.INTEDG0=0;
    INTCON2bits.INTEDG1=0;
    INTCONbits.GIE=1;
    
    CMCON=0xFF;
    TRISDbits.RD0=0;
    TRISDbits.RD1=0;
    TRISDbits.RD2=0;
    TRISDbits.RD3=0; 
    TRISDbits.RD4=0; //pulsador
}

void IZQ_HORARIO(void) {
    PORTDbits.RD0=1;
}
void IZQ_ANTIHORARIO(void) {
    PORTDbits.RD0=0;
}
void DER_HORARIO(void) {
    PORTDbits.RD1=1;
}
void DER_ANTIHORARIO(void) {
    PORTDbits.RD1=0;
}

void ENCENDER_DERECHO(void) {
    PORTDbits.RD2=1;
}

void ENCENDER_IZQUIERDO(void) {
    PORTDbits.RD3=1;
}

void APAGAR_DERECHO(void) {
    PORTDbits.RD2=0;
}

void APAGAR_IZQUIERDO(void) {
    PORTDbits.RD3=0;
}
