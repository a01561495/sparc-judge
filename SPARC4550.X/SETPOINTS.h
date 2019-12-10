#ifndef SETPOINTS_H_
#define SETPOINTS_H_

void GuardarsetN(uint8_t dir, uint8_t dato[4]);
void GuardarsetX(uint8_t dir, uint16_t X);
void GuardarsetY(uint8_t dir, uint16_t Y);
uint8_t SETPOINTBUSCAR(uint8_t dato[4]);
void EditseT(void);
void CHECK(void);
uint16_t MOVASETPOINT(uint16_t XR, uint16_t YR);
uint16_t ExtraerDato(uint8_t Dir);
void BORRARINSTRUCCION(void);
uint8_t ESCRIBIRINSTRUCCION(uint8_t dir);
void INSTRUCCION(void);
uint8_t EJECUTARINS(uint16_t XR, uint16_t YR);
void CREARINS(void);
uint8_t PREEJECUTAR(uint16_t XR, uint16_t YR);


#endif	/*SETPOINTS_H_*/  
