################################
## Makefile for STM32F7 Series
################################
STM32SDK = ../STM32Cube_FW_F7_V1.15.0
PROJ_DIR = .
BUILD_DIR = $(PROJ_DIR)/build

# Driver/CMSIS/Device/ST/STM32F7xx/Include/stm32f7xx.h require MCU series defined
CMSIS_MCU = STM32F746xx

# linker script file defined 
LD_FILE = ./STM32F746ZGTx_FLASH_AXIM.ld

###############################
# GCC Tool Chain Prefix Setup #
###############################
ARM_GCC_PATH= ../gcc-arm-none-eabi-4_8-2014q3/bin
CC = $(ARM_GCC_PATH)/arm-none-eabi-gcc
OBJDUMP = $(ARM_GCC_PATH)/arm-none-eabi-objdump
OBJCOPY = $(ARM_GCC_PATH)/arm-none-eabi-objcopy
GDB = $(ARM_GCC_PATH)/arm-none-eabi-gdb

##########################
# stlink tool path setup #
##########################
ST_LINK_PATH = ../stlink/build/Release

##########
# DEFINE #
##########
DEFS = -DUSE_STDPERIPH_DRIVER
DEFS += -DUSE_USB_OTG_FS=1
DEFS += -D$(CMSIS_MCU)


#################
# Common CFLAGS #
#################
# ARCH_FLAGS
ARCH_FLAGS += -mcpu=cortex-m7
ARCH_FLAGS += -mfpu=fpv5-sp-d16
ARCH_FLAGS += -ffast-math

CFLAGS += $(ARCH_FLAGS)
CFLAGS += -ggdb
CFLAGS += -O0
CFLAGS += -Wall -Wextra -Warray-bounds -Wno-unused-parameter
CFLAGS += -mlittle-endian -mthumb  -mthumb-interwork

CFLAGS += -mfloat-abi=hard
CFLAGS += -ffreestanding
CFLAGS += -ffunction-sections
CFLAGS += -fdata-sections
CFLAGS += -Wpointer-arith
CFLAGS += -std=gnu99


# --- Other
# CFLAGS += -nostdlibs
# --
# CFLAGS += -fno-tree-scev-cprop



###################
# Common LD FLAGS #
###################
# LD FILES
LD_FLAGS = -Wl,-T$(LD_FILE)
# LD_FLAGS += --specs=nosys.specs
LD_FLAGS += --specs=nano.specs
LD_FLAGS += -lnosys
LD_FLAGS += -nostartfiles
LD_FLAGS += -Wl,--gc-sections
# LD_FLAGS += -Wl,-wrap=malloc
# LD_FLAGS += -Wl,-wrap=calloc
# LD_FLAGS += -Wl,-wrap=realloc
# LD_FLAGS += -Wl,-wrap=free


#######################
# Project Source Code #
#######################
SRCS += $(PROJ_DIR)/main.c
SRCS += $(PROJ_DIR)/stm32f7xx_hal_msp.c
SRCS += $(PROJ_DIR)/stm32f7xx_it.c
SRCS += $(PROJ_DIR)/system_stm32f7xx.c
S_FILES = $(PROJ_DIR)/startup_stm32f746xx.s
SRCS_O = $(SRCS:$(PROJ_DIR)/%.c=$(PROJ_DIR)/build/%.o)
S_FILES_O = $(S_FILES:$(PROJ_DIR)/%.s=$(PROJ_DIR)/build/%.o)
OBJS += $(SRCS_O)
OBJS += $(S_FILES_O)

# --- UNKNOWN file 
# SRCS += $(PROJ_DIR)/stm32f7xx_hal_msp.c
# SRCS += $(PROJ_DIR)/stm32f7xx_it.c
# SRCS += $(PROJ_DIR)/syscalls.c

INC += -I$(PROJ_DIR)
INC += -I$(PROJ_DIR)/config

####### CMSIS Core Part Include ############
include ./mk/CMSIS.mk

###############
# CMSIS Layer #
###############
# Requirement: STM32SDK
# Append : INC CFLAGS DEFS
# Generate : DSP_LIB_SRC CMSIS_MATH_LIB
include ./mk/CMSIS_DSP.mk
DSP_LIB_SRC_O = $(DSP_LIB_SRC:%.c=$(PROJ_DIR)/build/%.o)
OBJS += $(DSP_LIB_SRC_O)



###############
# STM32F7 HAL #
###############
# Append : INC CFLAGS DEFS
# Generate : HAL_SRC
include ./mk/STM32F7_HAL.mk
HAL_SRC_O = $(HAL_SRC:%.c=$(PROJ_DIR)/build/%.o)
OBJS += $(HAL_SRC_O)



###################################
# Middlewares -- FatFs --
# Middlewares -- LibJPEG --
# Middlewares -- LwIP --
# Middlewares -- mbedTLS --
###################################

###################################
# Middlewares -- FreeRTOS Layer --
###################################
#  required : STM32SDK 
#  append : INC
#  generate FREERTOS_LIB_SRC
include ./mk/FreeRTOS.mk
FREERTOS_LIB_SRC_O = $(FREERTOS_LIB_SRC:%.c=$(PROJ_DIR)/build/%.o)
OBJS += $(FREERTOS_LIB_SRC_O)



###################
# Build Obj Rules #
###################
# -- Rule for STM32SDK
$(PROJ_DIR)/build/%.o: $(STM32SDK)/%.c
	mkdir -p $(dir $@)
	@echo build $@
	$(CC) $(INC) $(DEFS) $(CFLAGS) -c $< -o $@ 2>> $(PROJ_DIR)/build/error

# -- Rule for Proj
$(PROJ_DIR)/build/%.o: $(PROJ_DIR)/%.c
	mkdir -p $(dir $@)
	@echo build $@
	$(CC) $(INC) $(DEFS) $(CFLAGS) -c $< -o $@ 2>> $(PROJ_DIR)/build/error

$(PROJ_DIR)/build/%.o: $(PROJ_DIR)/%.s
	mkdir -p $(dir $@)
	@echo build $@
	$(CC) $(INC) $(DEFS) $(CFLAGS) -c $< -o $@ 2>> $(PROJ_DIR)/build/error

################
# Target Setup #
################

### projobjs: $(SRCS_O) $(S_FILES_O)
### 	@echo "--------------------------"
### 	@echo " PROJECT OBJ BUILD DONE "
### 	@echo "--------------------------"
### 
### 
### dspobjs: $(DSP_LIB_SRC_O)
### 	@echo "--------------------------"
### 	@echo " STM32 DSP OBJ BUILD DONE "
### 	@echo "--------------------------"
### 
### halobjs: $(HAL_SRC_O)
### 	@echo "--------------------------"
### 	@echo " STM32 HAL OBJ BUILD DONE "
### 	@echo "--------------------------"
### 
### rtosobjs: $(FREERTOS_LIB_SRC_O)
### 	@echo "--------------------------"
### 	@echo " FreeRTOS OBJ BUILD DONE "
### 	@echo "--------------------------"

firmware: $(OBJS)

all: $(OBJS)
	$(CC) $(CFLAGS) $(LD_FLAGS) $(OBJS) -o $(PROJ_DIR)/build/firmware.elf
	$(OBJDUMP) -D $(PROJ_DIR)/build/firmware.elf > $(PROJ_DIR)/build/firmware.dis
	$(OBJCOPY) -O ihex $(PROJ_DIR)/build/firmware.elf $(PROJ_DIR)/build/firmware.hex
	$(OBJCOPY) -O binary $(PROJ_DIR)/build/firmware.elf $(PROJ_DIR)/build/firmware.bin

# all:
# 	mkdir -p $(BUILD_DIR)
# 	$(CC) $(INC) $(DEFS) $(CFLAGS) $(LD_FLAGS) $(SRCS) $(S_FILES) -o $(BUILD_DIR)/firmware.elf 2> $(BUILD_DIR)/error
# 	$(OBJCOPY) -O ihex $(BUILD_DIR)/firmware.elf $(BUILD_DIR)/firmware.hex
# 	$(OBJCOPY) -O binary $(BUILD_DIR)/firmware.elf $(BUILD_DIR)/firmware.bin

flash:
	$(ST_LINK_PATH)/st-flash write ./build/firmware.bin 0x8000000

clean: 
	rm -fr $(BUILD_DIR)

p-%:
	@echo $* = $($*)
