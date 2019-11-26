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


void interrupcionX(void) {
    APAGAR_DERECHO();
    APAGAR_IZQUIERDO();
    motoresmov(0, 1);
    INTCONbits.INT0IF=0;
}

void interrupcionY(void) {
    APAGAR_DERECHO();
    APAGAR_IZQUIERDO();
    motoresmov(1, 0);
    INTCON3bits.INT1F=0;
}
