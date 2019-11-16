# STM32 MCU Project Template Based on ARM GCC

The project templates of STM32 MCU based on ARM GCC compiler.

These templates are based on the templates in the STM32Cube SDK.

# Requirements : Linux (ubuntu 64bit version)

## install makefile toolchain and add support of 32bit

    sudo dpkg --add-architecture i386
    sudo update 
    sudo apt-get install git build-essential cmake libc6:i386 libncurses5:i386 libstdc++6:i386 wget unzip

## git clone project

    git clone https://github.com/onionys/STM32_GCC_PROJ_TEMPLATE.git stm32dev
    cd stm32dev

## install ARM gcc compiler

Where you can find it:

[office link](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm)

[ver 4.8 series](https://launchpad.net/gcc-arm-embedded/4.8)

[ver 4.8 2014 q3](https://launchpad.net/gcc-arm-embedded/+milestone/4.8-2014-q3-update)

I use the following version in these projects:

```
    arm-none-eabi-gcc (GNU Tools for ARM Embedded Processors) 
    4.8.4 20140725 (release) 
    [ARM/embedded-4_8-branch revision 213147]
```

Download it and extract it from the downloaded file, you can try to use `wget` and `tar` in the command line interface, 
or any other alternative way as you can.

    wget https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2
    tar jxvf gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2

## STM32Cube SDK 

The SDK can be download from the ST official web site:

[STM32Cube FW F7 V1.15.0](https://www.st.com/en/embedded-software/stm32cubef7.html)

The downloaded file name should be `en.STM32Cube_FW_F7_V1.15.0.zip`. Put it under the current directory and then use extract it. 
You can try to use the `unzip` command to do it.

    unzip en.STM32Cube_FW_F7_V1.15.0.zip


## stlink tools

[https://github.com/texane/stlink.git](https://github.com/texane/stlink.git)

    sudo apt-get install libusb-1.0-0-dev
    git clone https://github.com/texane/stlink.git
    cd stlink
    make
    cd ..

## Try To Compile it 

    cd stm32f7
    make all

If building is successful, the `firmware.bin` bin file should be found in the `build/firmware.bin`.

Try to flash it

    make flash

