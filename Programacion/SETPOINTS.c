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
#include "UART50.h"
#include "Mensajes50.h"
#include "MOTOR.h"

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

void EditseT(void) {
    uint8_t dato[4];
    uint8_t send;
    for(uint8_t b=0; b<4; b++) {
        dato[b]=UARTRead();
        Nop();
        send=dato[b];
        Nop();
        UARTWrite(send);
    }
    UARTWrite('\n');
    UARTWrite('\r');
    uint8_t i=0;
    uint8_t d=0;
    i=SETPOINTBUSCAR(dato);
    
    uint16_t X;
    uint16_t Y;
    
    if(i<160) {
        for(uint8_t C=0; C<4; C++) {
            dato[C]=UARTRead();
            Nop();
            UARTWrite(dato[C]); 
        }
        d=SETPOINTBUSCAR(dato);
        if(d>=160||d==i) {
            UARTWrite(' ');
            X=ObtX();
            UARTWrite(' ');
            Y=ObtY();
            UARTWrite('\n');
            UARTWrite('\r');
            GuardarsetN(i, dato);
            i=i+4;
            GuardarsetX(i, X);
            i=i+2;
            GuardarsetY(i, Y);
        } else {
            SETPOINEXIST();
        }
        
    } else {
        SETNOEX();
    }
    
}

uint8_t SETPOINTBUSCAR(uint8_t dato[4]) {
    uint8_t i=0;
    uint8_t T=0;
    while((T==0)&&(i<248)) {
        if(dato[0]==EEPROM_R(i)) {
            if(dato[1]==EEPROM_R(i+1)) {
                if(dato[2]==EEPROM_R(i+2)) {
                    if(dato[3]==EEPROM_R(i+3)) {
                        T=1;
                    } else {
                        i=i+8; 
                    } 
                } else {
                    i=i+8; 
                }
            }else {
                i=i+8; 
            }  
        } else {
            i=i+8; 
        }
        
    }
    return i;
}


void CHECK(void) {
    for(uint8_t i=0; i<255; i++) {
        uint8_t T=EEPROM_R(i);
        if(T==0xFF) {
            EEPROM_W(i,90);
        }
    }
}

uint16_t MOVASETPOINT(uint16_t XR, uint16_t YR) {
    uint8_t dato[4];
    uint8_t send;
    for(uint8_t b=0; b<4; b++) {
        dato[b]=UARTRead();
        Nop();
        send=dato[b];
        Nop();
        UARTWrite(send);
    }
    UARTWrite('\n');
    UARTWrite('\r');
    uint16_t XN;
    uint16_t YN;
    uint8_t i=0;
    i=SETPOINTBUSCAR(dato);
    if(i<160) {
        XN=ExtraerDato(i+4);
        YN=ExtraerDato(i+6);
        motoresmov((XN-XR), (YN-YR));
    }else {
        SETNOEX();
    }
    return i;
}

uint16_t ExtraerDato(uint8_t Dir) {
    uint8_t DH;
    uint8_t DL;
    uint16_t DT;
    DL=EEPROM_R(Dir);
    DH=EEPROM_R(Dir+1);
    DT=(DH<<8)+DL;    
    return DT;
}

void BORRARINSTRUCCION(void) {
    for(uint8_t i=160; i<255; i++) {
        EEPROM_W(i, 0);
    }
}
uint8_t ESCRIBIRINSTRUCCION(uint8_t dir) {
    uint8_t dato[4];
    uint8_t send;
    for(uint8_t b=0; b<4; b++) {
        dato[b]=UARTRead();
        Nop();
        send=dato[b];
        Nop();
        UARTWrite(send);
    }
    UARTWrite('\n');
    UARTWrite('\r');
    uint8_t i=0;
    i=SETPOINTBUSCAR(dato);
    if(i<160) {
        GuardarsetN(dir,dato);
        dir=dir+4;
        return dir;        
    } else {
        SETNOEX();
        return dir;
    }
        
}

void INSTRUCCION(void) {
    uint8_t dir=160;
    uint8_t Menumov=0;
    while(Menumov!='3') {
        MENUINS();
        Menumov=UARTRead();
        if(Menumov=='1'&&dir<251) {
            dir=ESCRIBIRINSTRUCCION(dir);    
        } else if(Menumov=='2'&&dir<251) {
            EEPROM_W(dir,20);
            dir++;
        } else  if(dir>252) {
            NOHAYESPACIO();
        }
    }
}

uint8_t EJECUTARINS(uint16_t XR, uint16_t YR) {
    if(PORTDbits.RD4==1) {
        Accion();
    }
    uint8_t dir=0xA0;
    uint8_t dato=3;
    uint8_t INSTRNAME[4];
    uint8_t i=0;
    uint16_t XN;
    uint16_t YN;
    while(dato!=0&&dir<255) {
        dato=EEPROM_R(dir);
        if(dato>20&&dato<253) {
            for(uint8_t E=0; E<4; E++) {
                INSTRNAME[E]=EEPROM_R(E+dir);
            }
            
            i=SETPOINTBUSCAR(INSTRNAME);
            UARTWrite(INSTRNAME[0]);
            UARTWrite(INSTRNAME[1]);
            UARTWrite(INSTRNAME[2]);
            UARTWrite(INSTRNAME[3]);
            if(i<160) {
                XN=ExtraerDato(i+4);
                YN=ExtraerDato(i+6);
                motoresmov((XN-XR), (YN-YR));
                XR=XN;
                YR=YN;
                dir=dir+4;
            }else {
                SETNOEX();
                dir=dir+4;
            }        
        } else if(dato==20) {
            Accion();
            dir++;
        }
    }
    return i;
}

void CREARINS(void) {
    uint8_t elecc=0;
    PREGUNTA();
    while(elecc!='1'&&elecc!='2') {
        elecc=UARTRead();
    }
    if(elecc=='1') {
        BORRARINSTRUCCION();
        INSTRUCCION();
    }
}

uint8_t PREEJECUTAR(uint16_t XR, uint16_t YR) {
    uint8_t elecc=0;
    uint8_t i=0;
    PREGUNTA2();
    while(elecc!='1'&&elecc!='2') {
        elecc=UARTRead();
    }
    if(elecc=='1') {
        i=EJECUTARINS(XR, YR);
    }
    return i;
}