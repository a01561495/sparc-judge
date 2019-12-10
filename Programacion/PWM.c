/*
 * File:   PWM.c
 * Author: Usuario
 *
 * Created on 11 de noviembre de 2019, 03:24 PM
 */


#include <xc.h>
#include <stdint.h>
#include "PWM4550.h"
#include "DEFINES_4550_4MHZ.h"

void PWMconfi(void) {
    //PWM Period = (PR2) + 1] ? 4 ? TOSC ?(TMR2 Prescale Value)
    //1/500Hz = (PR2) + 1] ? 4 ? 1/4MHz ?(16)
    //PR2=124=124
    //PWM Duty Cycle = (ECCPR1L:ECCP1CON<5:4>) ?TOSC ? (TMR2 Prescale Value)
    //(ECCPR1L:ECCP1CON<5:4>)=(1/500Hz)/((1/4MHz)*16)
    //(ECCPR1L:ECCP1CON<5:4>)=1250
    //500=100%
    //250=50%
    PR2 = 124;
    CCPR1L = 0x00;
    CCPR2L = 0x00;
    TRPWMMOTORA = 0;
    TRPWMMOTORB = 0;
    T2CON = 0x03;      //Prescaler 16
    CCP1CON = 0x0C;      //PWM mode
    CCP2CON = 0x0C;      //PWM mode
    TMR2=0;
    INITTMR2=1;
}

void PWMDutyCycle1(uint8_t DUTY) {
    uint16_t PERCENT;
    PERCENT=DUTY*5;
    CCPR1L=(PERCENT>>2)&0xFF;
}

void PWMDutyCycle2(uint8_t DUTY) {
    uint16_t PERCENT;
    PERCENT=DUTY*5;
    CCPR2L=(PERCENT>>2)&0xFF;
}

void CONTADOR(int16_t DifA, int16_t DifB) {
    uint8_t A=0;
    uint8_t B=0;
    uint8_t ZA=0;
    uint8_t ZB=0;
    uint16_t ContadorA=0;
    uint16_t ContadorB=0;
    PA=&A;
    PB=&B;
    PWMDutyCycle1(50);
    PWMDutyCycle2(50);
    while(A==0||B==0) {
        if((PWMMOTORA==1)&&ZA==0) {
            ZA=1;
            ContadorA++;
        } else if(PWMMOTORA==0) {
            ZA=0;
        }
        if((PWMMOTORB==1)&&ZB==0) {
            ZB=1;
            ContadorB++;
        } else if(PWMMOTORB==0) {
            ZB=0;
        }
        if(ContadorA>=(abs(DifA))) {
            A=1;           
            PWMDutyCycle1(0);
            ENABLE_A(0);
        }        
        if(ContadorB>=(abs(DifB))) {
            B=1;
            PWMDutyCycle2(0);
            ENABLE_B(0);
        }
    }
}
