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
#include "DEFINES_4550_4MHZ.h"


void motoresmov(int16_t DifX, int16_t DifY) { 
    int16_t DifA=DifX+DifY;
    int16_t DifB=DifX-DifY;
    DifA=Conversion(DifA);
    DifB=Conversion(DifB);
    
    if(DifA<0) {
        DIR_A(0);
    } else {
        DIR_A(1);
    }
    if(DifB<0) {
        DIR_B(0);
    } else {
        DIR_B(1);
    }
    if(DifB!=0) {
        ENABLE_B(1);
    }
    if(DifA!=0) {
        ENABLE_A(1);
    }    
    CONTADOR(DifA, DifB);
}


int16_t Conversion(int16_t Dif) {
    //200 pasos =38.32743037 mm
    //? pasos= X mm
    //? pasos=X*5.218194855
    uint16_t B=abs(Dif);
    float X1=B*5;
    uint16_t X2=B*5;
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
    
    if(banderaaccion==0) {
        banderaaccion=1;
        SOLENOIDE=1;
        
    } else if(banderaaccion==1){
        banderaaccion=0;
        SOLENOIDE=0;
    }
    __delay_ms(1000);
}

