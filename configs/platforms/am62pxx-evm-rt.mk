#platform
SOC=am62p

#add platform for scripts
PLATFORM?=am62pxx-evm

#defconfig
DEFCONFIG=tisdk_am62pxx-evm_defconfig

#Architecture
ARCH=arm64

#ARM Toolchains
export CROSS_COMPILE=$(TI_SDK_PATH)/external-toolchain-dir/arm-gnu-toolchain-11.3.rel1-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-
export CROSS_COMPILE_ARMV7=$(TI_SDK_PATH)/external-toolchain-dir/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-

#Default CC value to be used when cross compiling.  This is so that the
#GNU Make default of "cc" is not used to point to the host compiler
export CC=$(CROSS_COMPILE)gcc --sysroot=$(SDK_PATH_TARGET)

# rt fragment
RT_FRAGMENT=ti_rt.config

# u-boot machine configs for A53 and R5
UBOOT_MACHINE=am62px_evm_a53_defconfig
UBOOT_MACHINE_R5=am62px_evm_r5_defconfig
MKIMAGE_DTB_FILE=a53/arch/arm/dts/k3-am62p5-sk.dtb

KERNEL_DEVICETREE_PREFIX=ti/k3-am62p5

TI_LINUX_FIRMWARE=$(TI_SDK_PATH)/board-support/prebuilt-images/$(PLATFORM)
UBOOT_ATF=$(TI_SDK_PATH)/board-support/prebuilt-images/$(PLATFORM)/bl31.bin
UBOOT_TEE=$(TI_SDK_PATH)/board-support/prebuilt-images/$(PLATFORM)/bl32.bin

# Add configs for ti-img-rogue-driver
PVR_BUILD_DIR=am62p_linux
RGX_BVNC="33.15.11.3"
WINDOW_SYSTEM=wayland

MAKE_ALL_TARGETS?= arm-benchmarks oprofile-example pru-icss matrix-gui cryptodev u-boot linux linux-dtbs ti-img-rogue-driver