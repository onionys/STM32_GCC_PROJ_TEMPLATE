# STM32 MCU Project Template Based on ARM GCC

The project templates of STM32 MCU based on ARM GCC compiler.

These templates are based on the templates in the STM32Cube SDK.


# Requirements

## ARM gcc compiler

[office link](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm)

    The version information used in these projects is 

    arm-none-eabi-gcc (GNU Tools for ARM Embedded Processors) 
    4.8.4 20140725 (release) 
    [ARM/embedded-4_8-branch revision 213147]

## STM32Cube SDK 

[STM32Cube FW F7 V1.15.0](https://www.st.com/en/embedded-software/stm32cubef7.html)


## makefile toolchain


## stlink tools

[https://github.com/texane/stlink.git](https://github.com/texane/stlink.git)


# Files

[./stm32f7](stm32f7/)

# Example

```
    git clone https://github.com/onionys/STM32_GCC_PROJ_TEMPLATE.git stm32_proj
    cd stm32_proj
```

modify `Makefile` as follow...

```
    ...
    STM32SDK = <absolute path of STM32Cube SDK>
    ...
```

for example 

```
    ################################
    ## Makefile for STM32F7 Series
    ################################
    STM32SDK = /home/user/STM32Cube_FW_F7_V1.15.0
    ...
```

and then make all

```
    make all
```

if build ok, you could find the `firmware.bin` 
and be able to flash it to MCU by follwing command:

this procedure requires the `st-link` tools installed.

```
    make flash
```



