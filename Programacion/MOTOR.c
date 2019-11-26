/*
 * File:   MOTOR.c
 * Author: Usuario
 *
 * Created on 28 de octubre de 2019, 12:04 PM
 */

#include <xc.h>
#include <stdint.h>
#include "MOTOR.h"
#include "PIC18F4550.h"
#include "GPIO.h"
#include "PWM4550.h"

#define _XTAL_FREQ  4000000

void motoresmov(int16_t DifX, int16_t DifY) { 
    int16_t DifA=DifX+DifY;
    int16_t DifB=DifX-DifY;
    DifA=Conversion(DifA);
    DifB=Conversion(DifB);
    PWMDutyCycle1(50);
    PWMDutyCycle2(50);
    if(DifA<0) {
        IZQ_HORARIO();
    } else {
        IZQ_ANTIHORARIO();
    }
    if(DifB<0) {
        DER_HORARIO();
    } else {
        DER_ANTIHORARIO();
    }
    if(DifB!=0) {
        ENCENDER_DERECHO();
    }
    if(DifA!=0) {
        ENCENDER_IZQUIERDO();
    }    
    CONTADOR(DifA, DifB);
    APAGAR_IZQUIERDO();
    APAGAR_DERECHO();
}


int16_t Conversion(int16_t Dif) {
    //200 pasos =38.32743037 mm
    //? pasos= X mm
    //? pasos=X*5.218194855
    uint16_t B=abs(Dif);
    float X1=B*5.218194855;
    uint16_t X2=B*5.218194855;
    if((X1-X2)>=0.5) {
        X2++;
    }
    if(Dif<0) {
        Dif=X2;                
    } else {
        Dif=(-X2);
    }
    return Dif;
}
void Accion(void) {
    if(PORTDbits.RD4==0) {
        PORTDbits.RD4=1;
    } else {
        PORTDbits.RD4=0;
    }
    __delay_ms(1000);
}

