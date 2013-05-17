# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

LOCAL_DIR = device/motorola/smi

TARGET_BOOTLOADER_BOARD_NAME := smi
TARGET_BOARD_PLATFORM := atom
TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86-atom
TARGET_ARCH_VARIANT_FPU := sse
TARGET_CPU_ABI := x86
TARGET_CPU_SMP := true

# Atom optimizations specified
TARGET_GLOBAL_CFLAGS += -O2 -march=atom -msse -msse2 -msse3 -mssse3 -mpclmul \
                        -mcx16 -msahf -mmovbe -mstackrealign -ftree-vectorize \
                        -finline-functions -ffast-math -fexcess-precision=fast \
                        -fomit-frame-pointer -floop-parallelize-all \
                        -ftree-parallelize-loops=2

# The following are very specific to out z2480 Atom
TARGET_GLOBAL_CFLAGS += --param l1-cache-line-size=64 \
                        --param l1-cache-size=24 \
                        --param l2-cache-size=512 \

TARGET_GLOBAL_CFLAGS += -DUSE_SSSE3 -DUSE_SSE2

TARGET_GLOBAL_CPPFLAGS += $(TARGET_GLOBAL_CFLAGS) -fno-exceptions -fno-rtti

# Make settings
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERYIMAGE := true
TARGET_NO_RECOVERY := true
TARGET_NO_BOOTIMAGE := true

BOARD_BOOTIMAGE_PARTITION_SIZE   :=  11534336 # 0x00b00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 402653184 # 0x18000000
BOARD_FLASH_BLOCK_SIZE := 2048

# Kernel build
BOARD_KERNEL_BASE := 0x1200000
BOARD_KERNEL_BASE := 0x000400
BOARD_KERNEL_PAGESIZE := 4096
TARGET_PREBUILT_KERNEL := $(LOCAL_DIR)/prebuilt/kernel
TARGET_KERNEL_SOURCE := $(LOCAL_DIR)/kernel/linux-3.0
TARGET_KERNEL_CONFIG := i386_mfld_oxavelar_defconfig
#BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_DIR)/tools/mkbootimg
BOARD_KERNEL_CMDLINE := init=/init pci=noearly console=logk0 vmalloc=272M \
earlyprintk=nologger hsu_dma=7 kmemleak=off androidboot.bootmedia=sdcard \
androidboot.hardware=sc1 emmc_ipanic.ipanic_part_number=6 loglevel=4

# Recovery configuration
#TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../$(LOCAL_DIR)/recovery/recovery_keys.c
#BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_TOUCH_RECOVERY := true
#DEVICE_BASE_RECOVERY_IMAGE := $(LOCAL_DIR)/prebuilt/recovery.img

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true

# Enabling Houdini by default
ADDITIONAL_BUILD_PROPERTIES += ro.product.cpu.abi2=armeabi-v7a

# Customize the malloced address to be 16-byte aligned
BOARD_MALLOC_ALIGNMENT := 16

# Custom EGL files
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_DIR)/prebuilt/egl.cfg

