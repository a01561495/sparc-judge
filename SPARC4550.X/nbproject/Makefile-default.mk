#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SPARC4550.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SPARC4550.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../Proyectoa4550.X/BITSCONF50.c ../Proyectoa4550.X/MOTOR.c ../Proyectoa4550.X/Mensajes50.c ../Proyectoa4550.X/PWM.c ../Proyectoa4550.X/UART50.c SPARC.c interrupcciones.c EEPROM.c SETPOINTS.c ../Proyectoa4550.X/GPIO.c ../Proyectoa4550.X/DEFINES_4550_4MHZ.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/924687277/BITSCONF50.p1 ${OBJECTDIR}/_ext/924687277/MOTOR.p1 ${OBJECTDIR}/_ext/924687277/Mensajes50.p1 ${OBJECTDIR}/_ext/924687277/PWM.p1 ${OBJECTDIR}/_ext/924687277/UART50.p1 ${OBJECTDIR}/SPARC.p1 ${OBJECTDIR}/interrupcciones.p1 ${OBJECTDIR}/EEPROM.p1 ${OBJECTDIR}/SETPOINTS.p1 ${OBJECTDIR}/_ext/924687277/GPIO.p1 ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/924687277/BITSCONF50.p1.d ${OBJECTDIR}/_ext/924687277/MOTOR.p1.d ${OBJECTDIR}/_ext/924687277/Mensajes50.p1.d ${OBJECTDIR}/_ext/924687277/PWM.p1.d ${OBJECTDIR}/_ext/924687277/UART50.p1.d ${OBJECTDIR}/SPARC.p1.d ${OBJECTDIR}/interrupcciones.p1.d ${OBJECTDIR}/EEPROM.p1.d ${OBJECTDIR}/SETPOINTS.p1.d ${OBJECTDIR}/_ext/924687277/GPIO.p1.d ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/924687277/BITSCONF50.p1 ${OBJECTDIR}/_ext/924687277/MOTOR.p1 ${OBJECTDIR}/_ext/924687277/Mensajes50.p1 ${OBJECTDIR}/_ext/924687277/PWM.p1 ${OBJECTDIR}/_ext/924687277/UART50.p1 ${OBJECTDIR}/SPARC.p1 ${OBJECTDIR}/interrupcciones.p1 ${OBJECTDIR}/EEPROM.p1 ${OBJECTDIR}/SETPOINTS.p1 ${OBJECTDIR}/_ext/924687277/GPIO.p1 ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1

# Source Files
SOURCEFILES=../Proyectoa4550.X/BITSCONF50.c ../Proyectoa4550.X/MOTOR.c ../Proyectoa4550.X/Mensajes50.c ../Proyectoa4550.X/PWM.c ../Proyectoa4550.X/UART50.c SPARC.c interrupcciones.c EEPROM.c SETPOINTS.c ../Proyectoa4550.X/GPIO.c ../Proyectoa4550.X/DEFINES_4550_4MHZ.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/SPARC4550.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F4550
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/924687277/BITSCONF50.p1: ../Proyectoa4550.X/BITSCONF50.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/BITSCONF50.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/BITSCONF50.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/BITSCONF50.p1 ../Proyectoa4550.X/BITSCONF50.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/BITSCONF50.d ${OBJECTDIR}/_ext/924687277/BITSCONF50.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/BITSCONF50.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/924687277/MOTOR.p1: ../Proyectoa4550.X/MOTOR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/MOTOR.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/MOTOR.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/MOTOR.p1 ../Proyectoa4550.X/MOTOR.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/MOTOR.d ${OBJECTDIR}/_ext/924687277/MOTOR.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/MOTOR.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/924687277/Mensajes50.p1: ../Proyectoa4550.X/Mensajes50.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/Mensajes50.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/Mensajes50.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/Mensajes50.p1 ../Proyectoa4550.X/Mensajes50.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/Mensajes50.d ${OBJECTDIR}/_ext/924687277/Mensajes50.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/Mensajes50.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/924687277/PWM.p1: ../Proyectoa4550.X/PWM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/PWM.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/PWM.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/PWM.p1 ../Proyectoa4550.X/PWM.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/PWM.d ${OBJECTDIR}/_ext/924687277/PWM.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/PWM.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/924687277/UART50.p1: ../Proyectoa4550.X/UART50.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/UART50.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/UART50.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/UART50.p1 ../Proyectoa4550.X/UART50.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/UART50.d ${OBJECTDIR}/_ext/924687277/UART50.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/UART50.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/SPARC.p1: SPARC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPARC.p1.d 
	@${RM} ${OBJECTDIR}/SPARC.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/SPARC.p1 SPARC.c 
	@-${MV} ${OBJECTDIR}/SPARC.d ${OBJECTDIR}/SPARC.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/SPARC.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/interrupcciones.p1: interrupcciones.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupcciones.p1.d 
	@${RM} ${OBJECTDIR}/interrupcciones.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/interrupcciones.p1 interrupcciones.c 
	@-${MV} ${OBJECTDIR}/interrupcciones.d ${OBJECTDIR}/interrupcciones.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/interrupcciones.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/EEPROM.p1: EEPROM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/EEPROM.p1.d 
	@${RM} ${OBJECTDIR}/EEPROM.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/EEPROM.p1 EEPROM.c 
	@-${MV} ${OBJECTDIR}/EEPROM.d ${OBJECTDIR}/EEPROM.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/EEPROM.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/SETPOINTS.p1: SETPOINTS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SETPOINTS.p1.d 
	@${RM} ${OBJECTDIR}/SETPOINTS.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/SETPOINTS.p1 SETPOINTS.c 
	@-${MV} ${OBJECTDIR}/SETPOINTS.d ${OBJECTDIR}/SETPOINTS.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/SETPOINTS.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/924687277/GPIO.p1: ../Proyectoa4550.X/GPIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/GPIO.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/GPIO.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/GPIO.p1 ../Proyectoa4550.X/GPIO.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/GPIO.d ${OBJECTDIR}/_ext/924687277/GPIO.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/GPIO.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1: ../Proyectoa4550.X/DEFINES_4550_4MHZ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1 ../Proyectoa4550.X/DEFINES_4550_4MHZ.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.d ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/924687277/BITSCONF50.p1: ../Proyectoa4550.X/BITSCONF50.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/BITSCONF50.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/BITSCONF50.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/BITSCONF50.p1 ../Proyectoa4550.X/BITSCONF50.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/BITSCONF50.d ${OBJECTDIR}/_ext/924687277/BITSCONF50.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/BITSCONF50.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/924687277/MOTOR.p1: ../Proyectoa4550.X/MOTOR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/MOTOR.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/MOTOR.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/MOTOR.p1 ../Proyectoa4550.X/MOTOR.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/MOTOR.d ${OBJECTDIR}/_ext/924687277/MOTOR.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/MOTOR.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/924687277/Mensajes50.p1: ../Proyectoa4550.X/Mensajes50.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/Mensajes50.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/Mensajes50.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/Mensajes50.p1 ../Proyectoa4550.X/Mensajes50.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/Mensajes50.d ${OBJECTDIR}/_ext/924687277/Mensajes50.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/Mensajes50.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/924687277/PWM.p1: ../Proyectoa4550.X/PWM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/PWM.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/PWM.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/PWM.p1 ../Proyectoa4550.X/PWM.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/PWM.d ${OBJECTDIR}/_ext/924687277/PWM.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/PWM.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/924687277/UART50.p1: ../Proyectoa4550.X/UART50.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/UART50.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/UART50.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/UART50.p1 ../Proyectoa4550.X/UART50.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/UART50.d ${OBJECTDIR}/_ext/924687277/UART50.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/UART50.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/SPARC.p1: SPARC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPARC.p1.d 
	@${RM} ${OBJECTDIR}/SPARC.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/SPARC.p1 SPARC.c 
	@-${MV} ${OBJECTDIR}/SPARC.d ${OBJECTDIR}/SPARC.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/SPARC.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/interrupcciones.p1: interrupcciones.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupcciones.p1.d 
	@${RM} ${OBJECTDIR}/interrupcciones.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/interrupcciones.p1 interrupcciones.c 
	@-${MV} ${OBJECTDIR}/interrupcciones.d ${OBJECTDIR}/interrupcciones.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/interrupcciones.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/EEPROM.p1: EEPROM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/EEPROM.p1.d 
	@${RM} ${OBJECTDIR}/EEPROM.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/EEPROM.p1 EEPROM.c 
	@-${MV} ${OBJECTDIR}/EEPROM.d ${OBJECTDIR}/EEPROM.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/EEPROM.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/SETPOINTS.p1: SETPOINTS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SETPOINTS.p1.d 
	@${RM} ${OBJECTDIR}/SETPOINTS.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/SETPOINTS.p1 SETPOINTS.c 
	@-${MV} ${OBJECTDIR}/SETPOINTS.d ${OBJECTDIR}/SETPOINTS.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/SETPOINTS.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/924687277/GPIO.p1: ../Proyectoa4550.X/GPIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/GPIO.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/GPIO.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/GPIO.p1 ../Proyectoa4550.X/GPIO.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/GPIO.d ${OBJECTDIR}/_ext/924687277/GPIO.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/GPIO.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1: ../Proyectoa4550.X/DEFINES_4550_4MHZ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/924687277" 
	@${RM} ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1.d 
	@${RM} ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1 ../Proyectoa4550.X/DEFINES_4550_4MHZ.c 
	@-${MV} ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.d ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/924687277/DEFINES_4550_4MHZ.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/SPARC4550.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/SPARC4550.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -mrom=default,-7dc0-7fff -mram=default,-3f4-3ff,-f9c-f9c,-fd4-fd4,-fdb-fdf,-fe3-fe7,-feb-fef,-ffd-fff  $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/SPARC4550.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/SPARC4550.X.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/SPARC4550.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/SPARC4550.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../Proyectoa4550.X" -I"../Librerias.X" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/SPARC4550.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
