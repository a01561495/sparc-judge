#ifndef PWM4550_H_
#define PWM4550_H_

void PWMconfi(void);
void PWMDutyCycle1(uint8_t DUTY);
void PWMDutyCycle2(uint8_t DUTY);
void CONTADOR(int16_t DifA, int16_t DifB);
uint8_t *PA;
uint8_t *PB;
void PROBLEMA(void);
uint16_t Conversionin(uint16_t Dif);



#endif	/*PWM4550_H_*/  
