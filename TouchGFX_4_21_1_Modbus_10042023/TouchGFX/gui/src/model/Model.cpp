#include <gui/model/Model.hpp>
#include <gui/model/ModelListener.hpp>
#include "main.h"						//KOM
#include "Modbus.h"						//KOM
#include "cmsis_os.h"					//KOM
#include "semphr.h"						//KOM
Model::Model() : modelListener(0)
{
	counter = 0; 	//KOM
	reg		= 0;	//KOM
}

void Model::tick()
{
	if(counter >= 10)
	{
		counter = 0;
		if(xSemaphoreTake((QueueHandle_t)ModbusH.ModBusSphrHandle,300)==pdTRUE)
		{
			modbus_t telegram[1];
			telegram[0].u8id 		= 1;
			telegram[0].u8fct 		= MB_FC_READ_REGISTERS;
			telegram[0].u16RegAdd 	= 0x01;
			telegram[0].u16CoilsNo 	= 1;
			telegram[0].u16reg 		= ModbusDATARX;
			ModbusQuery(&ModbusH, telegram[0]);
			modelListener->registerUpdate(ModbusDATARX[0]);
			reg = ModbusDATARX[0];
			xSemaphoreGive((QueueHandle_t)ModbusH.ModBusSphrHandle);
		}
	}
	counter++;
}

void Model::RegisterUpDown(int value)
{
	modbus_t telegram[1];
	if(xSemaphoreTake((QueueHandle_t)ModbusH.ModBusSphrHandle,300)==pdTRUE)
	{
		reg = reg + value;
		ModbusDATATX[0] = reg;
		telegram[0].u8id 		= 1;
		telegram[0].u8fct 		= MB_FC_WRITE_REGISTER;
		telegram[0].u16RegAdd 	= 0x01;
		telegram[0].u16CoilsNo 	= 1;
		telegram[0].u16reg 		= ModbusDATATX;
		ModbusQuery(&ModbusH, telegram[0]);
		xSemaphoreGive((QueueHandle_t)ModbusH.ModBusSphrHandle);
	}
}
void Model::LedToggleRequested(bool value)
{
	modbus_t telegram[1];
	ModbusDATARX[0] 		= value;
	telegram[0].u8id 		= 1;
	telegram[0].u8fct 		= MB_FC_WRITE_COIL;
	telegram[0].u16RegAdd 	= 0x01;
	telegram[0].u16CoilsNo 	= 1;
	telegram[0].u16reg 		= ModbusDATATX;
	ModbusQueryInject(&ModbusH, telegram[0]);
}
