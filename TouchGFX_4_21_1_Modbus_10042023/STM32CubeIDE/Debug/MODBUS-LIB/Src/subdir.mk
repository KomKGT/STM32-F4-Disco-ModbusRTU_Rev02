################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MODBUS-LIB/Src/Modbus.c \
../MODBUS-LIB/Src/UARTCallback.c 

C_DEPS += \
./MODBUS-LIB/Src/Modbus.d \
./MODBUS-LIB/Src/UARTCallback.d 

OBJS += \
./MODBUS-LIB/Src/Modbus.o \
./MODBUS-LIB/Src/UARTCallback.o 


# Each subdirectory must supply rules for building sources it contributes
MODBUS-LIB/Src/%.o MODBUS-LIB/Src/%.su MODBUS-LIB/Src/%.cyclo: ../MODBUS-LIB/Src/%.c MODBUS-LIB/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F429xx -c -I../../Core/Inc -I../../Drivers/CMSIS/Include -I../../Drivers/BSP -I../../TouchGFX/target -I../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../TouchGFX/App -I../../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../../TouchGFX/target/generated -I../../Middlewares/Third_Party/FreeRTOS/Source/include -I../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../Middlewares/ST/touchgfx/framework/include -I../../TouchGFX/generated/fonts/include -I../../TouchGFX/generated/gui_generated/include -I../../TouchGFX/generated/images/include -I../../TouchGFX/generated/texts/include -I../../TouchGFX/gui/include -I../../TouchGFX/generated/videos/include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-MODBUS-2d-LIB-2f-Src

clean-MODBUS-2d-LIB-2f-Src:
	-$(RM) ./MODBUS-LIB/Src/Modbus.cyclo ./MODBUS-LIB/Src/Modbus.d ./MODBUS-LIB/Src/Modbus.o ./MODBUS-LIB/Src/Modbus.su ./MODBUS-LIB/Src/UARTCallback.cyclo ./MODBUS-LIB/Src/UARTCallback.d ./MODBUS-LIB/Src/UARTCallback.o ./MODBUS-LIB/Src/UARTCallback.su

.PHONY: clean-MODBUS-2d-LIB-2f-Src

