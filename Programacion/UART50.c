/*
 * File:   UART50.c
 * Author: Usuario
 *
 * Created on 27 de octubre de 2019, 12:33 PM
 */


#include <xc.h>
#include <stdint.h>
#include "UART50.h"
#include "DEFINES_4550_4MHZ.h"


void UARTconfi (void) { 
    ADCON1 = 0x0F; //COnfigurar los pin a digitales
    
    CTX = 1; //  Pin RC6 como salida digital para TX.
    CRX = 1; //  Pin RC7 como entrada digital para RX.
    
    TXSTAbits.TX9 = 0; // Transmision de 8 bits
    TXSTAbits.TXEN = 1; //  Habilita Transmisión.
    TXSTAbits.SYNC = 0; //  Modo-Asíncrono.
    TXSTAbits.BRGH = 1; //  Modo-Alta Velocidad de Baudios.
    BAUDCONbits.BRG16 = 1; //  Baudios modo-16bits.
    RCSTAbits.RX9 = 0; //Recepcion a 8 bits 
    RCSTAbits.SPEN = 1; //  Hbilita el Módulo SSP como UART.
    RCSTAbits.CREN = 1; //Habilita recibir
    //  Escribe el valor necesario para configurar los Baudios a 9600.
    SPBRGH1:SPBRG1 = 103; //valor de la datsheet
}

void UARTWrite(uint8_t txData) {
    while (!RegistroTX) {
    } //  espera a que el registro de transmisión este disponible o vacio.            
    TXREG = txData;//  escribe el dato que se enviará a través de TX.
}


uint8_t UARTRead(void) {
    PROBLEMA();
    uint8_t X=0;
    uint32_t Y=0;
    while (RegistroRX == 0){ // Espera hasta que el registro de RX este lleno
        if(Y>=500000) {
            return NULL;
        }
        Y++;
    }
    X = RCREG1; // se guarda lo que llego de RCREG1 en la variable de inicio
    RCREG1 = 0; //Se resetea el registro recibidor

    return X;
}
/////////////////////////////////////////////////////////////////////////////////////
void PROBLEMA(void) {
    uint8_t temp;
    if(OERR) {//¿hubo desborde?
    
        do
        {
            temp = RCREG;//limpia pila
            temp = RCREG;//limpia pila
            temp = RCREG;//limpia pila
            CREN = 0;//deshabilita la recepcion
            CREN = 1;//habilita la recepcion

        } while(OERR);
    }

    if(FERR)
    {
        temp = RCREG;
        TXEN = 0;
        TXEN = 1;
    }
}
////////////////////////////////////////////////////////////////////////////
/*Codigo obtenido el dia 2 de diciembre del 2019 de la pagnia
 https://investigatronica.wordpress.com/2016/03/10/uso-de-la-uart-en-microcontroladores-se-cuelga-el-micro-o-deja-de-recibir/ */
