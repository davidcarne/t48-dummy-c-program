#include "ch32v30x.h"
#include "debug.h"

int main(void)
{
	GPIO_InitTypeDef blinkPinInit = {
		.GPIO_Pin = GPIO_Pin_1,
		.GPIO_Mode = GPIO_Mode_Out_PP,
		.GPIO_Speed = GPIO_Speed_2MHz
	};
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);
	GPIO_Init(GPIOC, &blinkPinInit);

	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	Delay_Init();

	while(1)
	{
		GPIO_SetBits(GPIOC, GPIO_Pin_1);
		Delay_Ms(1000);
		GPIO_ResetBits(GPIOC, GPIO_Pin_1);
		Delay_Ms(1000);

	}
}

