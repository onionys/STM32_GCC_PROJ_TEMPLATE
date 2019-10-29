
FreeRTOS_PATH = Middlewares/Third_Party/FreeRTOS/Source
INC  += -I$(STM32SDK)/$(FreeRTOS_PATH)/include
INC  += -I$(STM32SDK)/$(FreeRTOS_PATH)/CMSIS_RTOS
INC  += -I$(STM32SDK)/$(FreeRTOS_PATH)/portable/GCC/ARM_CM7/r0p1
FREERTOS_LIB_SRC = $(addprefix $(FreeRTOS_PATH)/, \
				   tasks.c \
				   queue.c \
				   list.c \
				   croutine.c \
				   timers.c \
				   portable/MemMang/heap_1.c)
#				   portable/MemMang/heap_2.c)
#				   portable/MemMang/heap_3.c)
#				   portable/MemMang/heap_4.c)
#				   portable/MemMang/heap_5.c)
#				   portable/GCC/ARM_CM7/r0p1/port.c \
