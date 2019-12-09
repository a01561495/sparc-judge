/*
 * File:   GPIO.c
 * Author: Usuario
 *
 * Created on 20 de noviembre de 2019, 11:08 AM
 */


#include <xc.h>
#include <stdint.h>
#include "GPIO.h"
#include "DEFINES_4550_4MHZ.h"

void inter_init(void) {
    TBOTONX=1;
    TBOTONY=1;
    TBOTONP=1;
    ENABLE0=1;
    ENABLE1=1;
    ENABLE2=1;
    BANDERA0=0;
    BANDERA1=0;
    BANDERA2=0;
    PRIORIDADES=0;
    PULL_UPINT=1;
    UPDOWN0=1;
    UPDOWN1=1;
    UPDOWN2=1;
    INTERRUPCION=1;
    
    CMCON=0xFF;
    CVRCONbits.CVREN = 0; 
    TRISDbits.RD0=0;
    TRISDbits.RD1=0;
    TRISDbits.RD2=0;
    TRISDbits.RD3=0; 
    TRISDbits.RD4=0; 
    TRISDbits.RD5=0;
    TRISDbits.RD6=0;
    TRISDbits.RD7=0;
    DirA=0;     
    DirB=0;
    ENABLEA=1; 
    ENABLEB=1;
    LEDAZUL=0;      
    LEDVERDE=0;       
    LEDROJO=0;    
    SOLENOIDE=0;    
}

void DIR_B(uint8_t X) {
    if(X==1) {
        DirB=1;
    } else {
        DirB=0;
    }
    
}
void DIR_A(uint8_t X) {
    if(X==1) {
        DirA=1;
    } else {
        DirA=0;
    }
    
}


void ENABLE_A(uint8_t X) {
    if(X==1) {
        ENABLEA=0;
    } else {
        ENABLEA=1;
    }
}

void ENABLE_B(uint8_t X) {
    if(X==1) {
        ENABLEB=0;
    } else {
        ENABLEB=1;
    }
}

