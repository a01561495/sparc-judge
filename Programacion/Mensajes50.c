/*
 * File:   Mensajes50.c
 * Author: Usuario
 *
 * Created on 12 de noviembre de 2019, 12:00 PM
 */

#include <xc.h>
#include <stdint.h>
#include "UART50.h"
#include "Mensajes50.h"
#include "EEPROM.h"
#include "SETPOINTS.h"



uint16_t ObtX(void) {
    uint8_t Xvalor[3];
    uint8_t Send;
    uint16_t valor=0;
    UARTWrite('X');
    UARTWrite('=');
    Xvalor[0]=UARTRead();
    while(Xvalor[0]<48&&Xvalor[0]>51) {
        Xvalor[0]=UARTRead();
    }
    Send=Xvalor[0];
    UARTWrite(Send);
    if(Xvalor[0]!='3') {
        Xvalor[1]=UARTRead();
        while(Xvalor[1]<48&&Xvalor[1]>57) {
            Xvalor[1]=UARTRead();
        }
        Send=Xvalor[1];
        UARTWrite(Send);
    } else {
        Xvalor[1]='0';
        Send=Xvalor[1];
        UARTWrite(Send);
    }
    if(Xvalor[0]!='3') {
        Xvalor[2]=UARTRead();
        while(Xvalor[2]<48&&Xvalor[2]>57) {
            Xvalor[2]=UARTRead();
        }
        Send=Xvalor[2];
        UARTWrite(Send);
    } else {
        Xvalor[2]='0';
        Send=Xvalor[2];
        UARTWrite(Send);
    }
    valor=((Xvalor[0]-48)*100)+((Xvalor[1]-48)*10)+(Xvalor[2]-48);
    return valor;
}

uint16_t ObtY(void) {
    uint8_t Xvalor[3];
    uint8_t Send;
    uint16_t valor=0;
    UARTWrite('Y');
    UARTWrite('=');
    Xvalor[0]=UARTRead();
    while(Xvalor[0]<48&&Xvalor[0]>51) {
        Xvalor[0]=UARTRead();
    }
    Send=Xvalor[0];
    UARTWrite(Send);
    if(Xvalor[0]!=0) {
        Xvalor[1]=UARTRead();
        while(Xvalor[1]<48&&Xvalor[1]>57) {
            Xvalor[0]=UARTRead();
        }
        Send=Xvalor[1];
        UARTWrite(Send);
    } else {
        Xvalor[1]='0';
        Send=Xvalor[1];
        UARTWrite(Send);
    }
    if(Xvalor[0]!=0) {
        Xvalor[2]=UARTRead();
        while(Xvalor[2]<48&&Xvalor[2]>57) {
            Xvalor[2]=UARTRead();
        }
        Send=Xvalor[1];
        UARTWrite(Send);
    } else {
        Xvalor[2]='0';
        Send=Xvalor[2];
        UARTWrite(Send);
    }
    valor=((Xvalor[0]-48)*100)+((Xvalor[1]-48)*10)+(Xvalor[0]-48);
    return valor;
}

void Menimp (uint16_t Xvalora,uint16_t Yvalora) {
    uint8_t Send;
    uint8_t Pos[]="X=000 Y=000\n";
    Pos[2]=(Xvalora/100)+'0';
    Pos[3]=(Xvalora % 100) / 10 + '0';
    Pos[4]=(Xvalora % 100) % 10 + '0';
    Pos[8]=(Yvalora/100)+'0';
    Pos[9]=(Yvalora % 100) / 10 + '0';
    Pos[10]=(Yvalora % 100) % 10 + '0';
    for(uint8_t i=0; i<=((sizeof(Pos))-1); i++) {
                Send=Pos[i];
                UARTWrite(Send);
    }
    uint8_t comandos[]="M=mov A=acci G=guardar S=movaS E=editar\n"; 
    for(uint8_t i=0; i<=((sizeof(comandos))-1); i++) {
                Send=comandos[i];
                UARTWrite(Send);
    }
}

void imprimirSet(void) {
    uint8_t XH=0;
    uint8_t XL=0;
    uint16_t X=0;
    
    uint8_t YH=0;
    uint8_t YL=0;
    uint16_t Y=0;
    uint8_t i=0;
    
    uint8_t Pos[]="X=000 Y=000\n";
    uint8_t Send;
    
    while(i<=20) {
        for(uint8_t R=0; R<=3; R++) {
            UARTWrite(EEPROM_R((R+i)));
        }
        UARTWrite(' ');
        i=i+4;
        XL=EEPROM_R(i);
        XH=EEPROM_R((i+1));
        X=(uint16_t)XH;
        X=X<<8;
        X=X+XL;
        i=i+2;
        YL=EEPROM_R(i);
        YH=EEPROM_R((i+1));
        Y=(uint16_t)YH;
        Y=Y<<8;
        Y=Y+YL;
        
        Pos[2]=(X/100)+'0';
        Pos[3]=(X % 100) / 10 + '0';
        Pos[4]=(X % 100) % 10 + '0';
        Pos[8]=(Y/100)+'0';
        Pos[9]=(Y % 100) / 10 + '0';
        Pos[10]=(Y % 100) % 10 + '0';
        for(uint8_t i=0; i<=((sizeof(Pos))-1); i++) {
                Send=Pos[i];
                UARTWrite(Send);
        }
        i=i+2;
    }
}