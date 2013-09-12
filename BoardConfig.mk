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

LOCAL_PATH := device/motorola/smi

TARGET_BOOTLOADER_BOARD_NAME := smi
TARGET_BOARD_PLATFORM := atom
TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86-atom
TARGET_CPU_ABI := x86
TARGET_CPU_SMP := true

# Used throughout build system to turn on/off custom stuff for x86:
# It is needed, at the very least, to prevent libffi build
TARGET_ARCH := x86

# Atom optimizations specified
TARGET_GLOBAL_CFLAGS += \
                        -O2 \
                        -march=atom \
                        -mmmx \
                        -msse \
                        -msse2 \
                        -msse3 \
                        -mssse3 \
                        -mpclmul \
                        -mcx16 \
                        -msahf \
                        -mmovbe \
                        -ftree-vectorize \
                        -fomit-frame-pointer \
                        -finline-functions \
                        -fpredictive-commoning \
                        -fgcse-after-reload \
                        -fforce-addr \
                        -fsingle-precision-constant \
                        -falign-functions=4 \
                        -floop-parallelize-all \
                        -floop-block \
                        -ftree-parallelize-loops=2 \
                        -ftree-loop-if-convert \
                        -ftree-loop-if-convert-stores \
                        -foptimize-register-move \
                        -fmodulo-sched \
                        -fmodulo-sched-allow-regmoves \

# The following are very specific to our z2480 Atom
TARGET_GLOBAL_CFLAGS += \
                        --param l1-cache-line-size=64 \
                        --param l1-cache-size=24 \
                        --param l2-cache-size=512 \

#TARGET_GLOBAL_CFLAGS += -DUSE_SSSE3 -DUSE_SSE2

TARGET_GLOBAL_CPPFLAGS += -fno-exceptions -DUSE_SSSE3 -DUSE_SSE2

TARGET_GLOBAL_LDFLAGS := -Wl,-O1

# Make settings
TARGET_NO_KERNEL := true
TARGET_NO_BOOTIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
#TARGET_NO_RECOVERY := true
#TARGET_NO_RECOVERYIMAGE := true

BOARD_BOOTIMAGE_PARTITION_SIZE   :=  11534336 # 0x00b00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912 # 0x20000000
BOARD_FLASH_BLOCK_SIZE := 2048

# Recovery configuration
BOARD_TOUCH_RECOVERY := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
DEVICE_BASE_RECOVERY_IMAGE := $(LOCAL_PATH)/prebuilt/recovery.img
BOARD_CUSTOM_RECOVERY_KEYMAPPING := $(LOCAL_PATH)/recovery/recovery_keys.c

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true

# Enabling Houdini by default
INTEL_HOUDINI := true
ADDITIONAL_BUILD_PROPERTIES += ro.product.cpu.abi2=armeabi-v7a
ADDITIONAL_BUILD_PROPERTIES += ro.product.cpu.upgradeabi=armeabi-v7a
ADDITIONAL_BUILD_PROPERTIES += dalvik.vm.houdini=on

# Customize the malloced address to be 16-byte aligned
BOARD_MALLOC_ALIGNMENT := 16

# Custom EGL files, SW rendering for now...
BOARD_USE_MESA := false
BOARD_GPU_DRIVERS :=
USE_OPENGL_RENDERER := false
#USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/prebuilt/egl.cfg

# Some framework code requires this to enable BT
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/generic/common/bluetooth

# Kernel Mmap memory bottom-up
ADDITIONAL_BUILD_PROPERTIES += ro.config.personality=compat_layout

BUILD_WITH_FULL_STAGEFRIGHT := true

