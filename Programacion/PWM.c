/*
 * File:   PWM.c
 * Author: Usuario
 *
 * Created on 11 de noviembre de 2019, 03:24 PM
 */


#include <xc.h>
#include <stdint.h>
#include "PWM4550.h"

void PWMconfi(void) {
    //PWM Period = (PR2) + 1] ? 4 ? TOSC ?(TMR2 Prescale Value)
    //1/250Hz = (PR2) + 1] ? 4 ? 1/4MHz ?(16)
    //PR2=249=249
    //PWM Duty Cycle = (ECCPR1L:ECCP1CON<5:4>) ?TOSC ? (TMR2 Prescale Value)
    //(ECCPR1L:ECCP1CON<5:4>)=(1/250Hz)/((1/4MHz)*16)
    //(ECCPR1L:ECCP1CON<5:4>)=1250
    //1000=100%
    //500=50%
    PR2 = 249;
    CCPR1L = 0x00;
    CCPR2L = 0x00;
    TRISCbits.RC2 = 0;
    TRISCbits.RC1 = 0;
    T2CON = 0x03;      //Prescaler 16
    CCP1CON = 0x0C;      //PWM mode
    CCP2CON = 0x0C;      //PWM mode
    TMR2=0;
    T2CONbits.TMR2ON=1;
}
