/*
 * File:   SPARC50.c
 * Author: Usuario
 *
 * Created on 27 de octubre de 2019, 01:00 PM
 */


#include <xc.h>
#include <stdint.h>
#include "PIC18F4550.h"
#include "UART50.h"
#include "MOTOR.h"
#include "BITSCONF50.h"
#define     BAUD        9600



uint8_t Acci=0;
uint8_t MenGu='0';
uint8_t Send=0;
uint8_t MenGu2='0';
uint16_t XvalorR=0;
uint16_t YvalorR=0;
uint16_t Xvalorn=0;
uint16_t Yvalorn=0;
        
        

void main(void) {
    OSCCON = 0x60;
    UARTconfi ();
    while (PIR1bits.RCIF == 0){ // Espera hasta que el registro de RX este lleno
    }
    while(1) {
        
        
    }
    return;
}
