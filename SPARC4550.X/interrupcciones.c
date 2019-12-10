/*
 * File:   interrupcciones.c
 * Author: Usuario
 *
 * Created on 17 de noviembre de 2019, 08:12 PM
 */


#include <xc.h>
#include <stdint.h>
#include "interrupcciones.h"
#include "MOTOR.h"
#include "GPIO.h"
#include "DEFINES_4550_4MHZ.h"


void interrupcionX(void) {
    ENABLE_A(0);
    ENABLE_B(0);
    PWMDutyCycle1(0);
    PWMDutyCycle2(0);
    *PA=1;
    *PB=1;
    LIMITEX();
}

void interrupcionY(void) {
    ENABLE_A(0);
    ENABLE_B(0);
    PWMDutyCycle1(0);
    PWMDutyCycle2(0);
    *PA=1;
    *PB=1;
    LIMITEY();
 
}

void PARO2aden(void) {
    PARO2();
    ENABLE_A(0);
    ENABLE_B(0);
}
void PARO2out(void) {
    ENABLE_A(1);
    ENABLE_B(1);
}
