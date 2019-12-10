/*
 * File:   SPARC.c
 * Author: Usuario
 *
 * Created on 17 de noviembre de 2019, 06:12 PM
 */


#include <xc.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "PIC18F4550.h"
#include "UART50.h"
#include "PWM4550.h"
#include "EEPROM.h"
#include "Mensajes50.h"
#include "SETPOINTS.h"
#include "BITSCONF50.h"
#include "MOTOR.h"
#include "GPIO.h"
#include "DEFINES_4550_4MHZ.h"
#include "interrupcciones.h"


//hay una parte de codigo sacada de internet en UART





uint8_t Acci=0;
uint8_t E=0;
uint16_t XvalorR=0;
uint16_t YvalorR=0;
uint16_t Xvalorn=0;
uint16_t Yvalorn=0;
int16_t DifX=0;
int16_t DifY=0;
uint8_t DirEEPROM=0;
uint16_t *PX=&XvalorR;
uint16_t *PY=&YvalorR;
uint16_t *PXN=&Xvalorn;
uint16_t *PYN=&Yvalorn;
        
void __interrupt() INT_isr(void) {
    __delay_ms(10);
    if(BANDERA0==1&&BOTONX==1) {
        interrupcionX();
        motoresmov(5,0);
        *PX=0;
        *PXN=0;
        BANDERA0=0;
    } else if(BANDERA1==1&&BOTONY==1) {
        interrupcionY();
        motoresmov(0,5);
        *PY=0;
        *PYN=0;
        BANDERA1=0;
        
    }else if(BANDERA2==1&&BOTONPARO==1) {
        PARO2aden();
        while(BOTONPARO==1);
        PARO2out();
        BANDERA2=0;
        
    }
    BANDERA0=0;
    BANDERA1=0;
    BANDERA1=0;
}

void main(void) {
    OSCCON = 0x60;
    UARTconfi();
    PWMconfi();
    CHECK();
    inter_init();
    Acci=UARTRead();
    Acci=0;
    XvalorR=ExtraerDato(XACTUAL);
    YvalorR=ExtraerDato(YACTUAL);
    if(BOTONX==0) {
        motoresmov(-1000, 0);
    } else {
        motoresmov(5, 0);
    }
     if(BOTONY==0) {
        motoresmov(0, -1000);
    } else {
         motoresmov(0, 5);
    }
    
    
    while(1) {
        E=0;
        Menimp();
        Acci=UARTRead();
        if(Acci=='M'||Acci=='m') {
            Xvalorn=Obt('X');
            if(Xvalorn>LIMITX) {   
                E=1;
            }
            if(E==0){
                Yvalorn=Obt('Y');
            }
            if(Yvalorn>LIMITY) {   
                E=1;
            }
            if(Xvalorn==30000||Yvalorn==30000) {
                E=2;
            }
            if(E==0) {
                DifX=Xvalorn-XvalorR;
                DifY=Yvalorn-YvalorR;
                OCUPADO();
                motoresmov(DifX, DifY);
                Mensaje_comando_completado();
                XvalorR=Xvalorn;
                YvalorR=Yvalorn;
            } else if(E==1) {
                NOcoordenada();
            } else {
                Tardanza();
            }
            Acci=0;
        }else if(Acci=='A'||Acci=='a') {
            OCUPADO();
            Accion();
            Mensaje_comando_completado();
            Acci=0;
        }else if(Acci=='S'||Acci=='s') {
            OCUPADO();
            imprimirSet();
            DirEEPROM=MOVASETPOINT(XvalorR, YvalorR);           
            if(DirEEPROM<160){
                XvalorR=ExtraerDato(DirEEPROM+4);
                YvalorR=ExtraerDato(DirEEPROM+6);
            }
            Mensaje_comando_completado();
            Acci=0;

        } else if(Acci=='E'||Acci=='e') {
            imprimirSet();
            EditseT();
            Mensaje_comando_completado();
            Acci=0;

        } else if(Acci=='C'||Acci=='c') {
            CREARINS();
            Mensaje_comando_completado();
            Acci=0;
        } else if(Acci=='F'||Acci=='f') {
            OCUPADO();
            imprimirINS();
            DirEEPROM=PREEJECUTAR(XvalorR, YvalorR);
            if(DirEEPROM<160){
                XvalorR=ExtraerDato(DirEEPROM+4);
                YvalorR=ExtraerDato(DirEEPROM+6);
            }
            Acci=0;
        } else if(Acci=='L'||Acci=='l') {
            imprimirSet();
            Acci=0;
        } else if(Acci=='N'||Acci=='n') {
            imprimirINS();
            Acci=0;
        } else if(Acci=='T'||Acci=='t') {
            COORReal (XvalorR, YvalorR);
        }else if(Acci=='R'||Acci=='r') {
            OCUPADO();
            if(BOTONX==0) {
                motoresmov(-1000, 0);
            }
             if(BOTONY==0) {
                motoresmov(0, -1000);
            }
            Mensaje_comando_completado();            
        }else if(Acci==NULL){
            Tardanza();
        }else {
            NOcomando();
        }
        Xvalorn=0;
        Yvalorn=0;
        GuardarsetX(XACTUAL, XvalorR);
        GuardarsetY(YACTUAL, YvalorR);
    }
    return;
}
