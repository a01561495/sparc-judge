/*
 * File:   EEPROM.c
 * Author: Usuario
 *
 * Created on 18 de noviembre de 2019, 11:19 AM
 */


#include <xc.h>
#include <stdint.h>
#include "EEPROM.h"

void EEPROM_W(uint8_t dir, uint8_t dato) {
    EEADR = dir;
    EEDATA = dato;
    EECON1bits.EEPGD=0;
    EECON1bits.CFGS=0;
    EECON1bits.WREN=1;
    INTCONbits.GIE=0;
    EECON2=0x55;
    EECON2=0x0AA;
    EECON1bits.WR=1;
    INTCONbits.GIE=1;
    while(!PIR2bits.EEIF);
    PIR2bits.EEIF=0;
    EECON1bits.WREN=0;
}

uint8_t EEPROM_R(uint8_t dir) {
    EEADR=dir;
    EECON1bits.EEPGD=0;
    EECON1bits.CFGS=0;
    EECON1bits.RD=1;
    return EEDATA;    
}
