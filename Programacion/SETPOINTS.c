/*
 * File:   SETPOINTS.c
 * Author: Usuario
 *
 * Created on 18 de noviembre de 2019, 06:07 PM
 */


#include <xc.h>
#include <stdint.h>
#include "EEPROM.h"
#include "SETPOINTS.h"

void GuardarsetN(uint8_t dir, uint8_t dato[4]) {
    for(uint8_t i=0; i<=3; i++) {
        EEPROM_W((dir+i), dato[i]);
    }
}

void GuardarsetX(uint8_t dir, uint16_t X) {
    uint8_t XH=(uint8_t)((X>>8)&(0xFF));
    uint8_t XL=(uint8_t)(X&0xFF);
    EEPROM_W(dir, XL);
    EEPROM_W(dir+1, XH);
}

void GuardarsetY(uint8_t dir, uint16_t Y) {
    uint8_t YH=(uint8_t)((Y>>8)&(0xFF));
    uint8_t YL=(uint8_t)(Y&0xFF);
    EEPROM_W(dir, YL);
    EEPROM_W(dir+1, YH);
}