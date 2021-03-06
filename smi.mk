# Copyright (C) 2012 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for intel_smi hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and smi, hence its name.
#

LOCAL_PATH := device/motorola/smi

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# gralloc & mesa lib
PRODUCT_PACKAGES += \
	gralloc.$(TARGET_PRODUCT) \
	audio.primary.$(TARGET_PRODUCT) \
	sensors.$(TARGET_PRODUCT) \

# Binary blobs required
BIN_X86_FILES := $(wildcard $(LOCAL_PATH)/blobs/bin/*)
XBN_X86_FILES := $(wildcard $(LOCAL_PATH)/blobs/xbin/*)
LIB_X86_FILES := $(wildcard $(LOCAL_PATH)/blobs/lib/*.so)
LIB_ARM_FILES := $(wildcard $(LOCAL_PATH)/blobs/lib/arm/*.so)
LIB_XHW_FILES := $(wildcard $(LOCAL_PATH)/blobs/lib/hw/*.so)
# Vendor located blobs here
LIB_VND_FILES := $(wildcard $(LOCAL_PATH)/blobs/vendor/lib/*.so)
LIB_DRM_FILES := $(wildcard $(LOCAL_PATH)/blobs/vendor/lib/drm/*.so)
LIB_EGL_FILES := $(wildcard $(LOCAL_PATH)/blobs/vendor/lib/egl/*.so)
LIB_VHW_FILES := $(wildcard $(LOCAL_PATH)/blobs/vendor/lib/hw/*.so)

# Copying grouped files
PRODUCT_COPY_FILES += \
	$(foreach i, $(BIN_X86_FILES), $(i):system/bin/$(notdir $(i))) \
	$(foreach i, $(XBN_X86_FILES), $(i):system/xbin/$(notdir $(i))) \
	$(foreach i, $(LIB_X86_FILES), $(i):system/lib/$(notdir $(i))) \
	$(foreach i, $(LIB_ARM_FILES), $(i):system/lib/arm/$(notdir $(i))) \
	$(foreach i, $(LIB_XHW_FILES), $(i):system/lib/hw/$(notdir $(i))) \
	\
	$(foreach i, $(LIB_VND_FILES), $(i):system/vendor/lib/$(notdir $(i))) \
	$(foreach i, $(LIB_DRM_FILES), $(i):system/vendor/lib/drm/$(notdir $(i))) \
	$(foreach i, $(LIB_EGL_FILES), $(i):system/vendor/lib/egl/$(notdir $(i))) \
	$(foreach i, $(LIB_VHW_FILES), $(i):system/vendor/lib/hw/$(notdir $(i))) \

# Houdini related files
PRODUCT_COPY_FILES += \
	#$(LOCAL_PATH)/prebuilt/lib/arm/check.xml:system/lib/arm/check.xml \
	$(LOCAL_PATH)/prebuilt/lib/arm/cpuinfo:system/lib/arm/cpuinfo \
	$(LOCAL_PATH)/prebuilt/lib/arm/cpuinfo.neon:system/lib/arm/cpuinfo.neon \

# PVR blobs
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/blobs/vendor/bin/pvrsrvctl:system/vendor/bin/pvrsrvctl

# Extra ALSA files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/asound.conf:system/etc/asound.conf \
	$(LOCAL_PATH)/prebuilt/etc/asound_p1.conf:system/etc/asound_p1.conf \
	$(LOCAL_PATH)/prebuilt/etc/asound_p3.conf:system/etc/asound_p3.conf \
	$(LOCAL_PATH)/blobs/usr/lib/alsa-lib/libasound_module_ctl_voice.so:system/usr/lib/alsa-lib/libasound_module_ctl_voice.so \
	$(LOCAL_PATH)/blobs/usr/lib/alsa-lib/libasound_module_pcm_voice.so:system/usr/lib/alsa-lib/libasound_module_pcm_voice.so \
	$(LOCAL_PATH)/prebuilt/vendor/etc/audio_policy.conf:system/vendor/etc/audio_policy.conf \
	$(LOCAL_PATH)/prebuilt/etc/parameter-framework/Settings/Audio/AudioConfigurableDomains.xml:system/etc/parameter-framework/Settings/Audio/AudioConfigurableDomains.xml \
	$(LOCAL_PATH)/prebuilt/etc/parameter-framework/Settings/Vibrator/VibratorConfigurableDomains.xml:system/etc/parameter-framework/Settings/Vibrator/VibratorConfigurableDomains.xml \
	$(LOCAL_PATH)/prebuilt/etc/parameter-framework/ParameterFrameworkConfiguration.xml:system/etc/parameter-framework/ParameterFrameworkConfiguration.xml \
	$(LOCAL_PATH)/prebuilt/etc/parameter-framework/ParameterFrameworkConfigurationVibrator.xml:system/etc/parameter-framework/ParameterFrameworkConfigurationVibrator.xml \
	$(LOCAL_PATH)/prebuilt/etc/parameter-framework/Structure/Audio/AudioClass.xml:system/etc/parameter-framework/Structure/Audio/AudioClass.xml \
	$(LOCAL_PATH)/prebuilt/etc/parameter-framework/Structure/Audio/IMCSubsystem.xml:system/etc/parameter-framework/Structure/Audio/IMCSubsystem.xml \
	$(LOCAL_PATH)/prebuilt/etc/parameter-framework/Structure/Audio/LPESubsystem.xml:system/etc/parameter-framework/Structure/Audio/LPESubsystem.xml \
	$(LOCAL_PATH)/prebuilt/etc/parameter-framework/Structure/Audio/MSICSubsystem.xml:system/etc/parameter-framework/Structure/Audio/MSICSubsystem.xml \
	$(LOCAL_PATH)/prebuilt/etc/parameter-framework/Structure/Vibrator/AlsaVibratorClass.xml:system/etc/parameter-framework/Structure/Vibrator/AlsaVibratorClass.xml \
	$(LOCAL_PATH)/prebuilt/etc/parameter-framework/Structure/Vibrator/AlsaVibratorSubsystem.xml:system/etc/parameter-framework/Structure/Vibrator/AlsaVibratorSubsystem.xml \
	$(LOCAL_PATH)/prebuilt/usr/share/alsa/alsa.conf:system/usr/share/alsa/alsa.conf \
	$(LOCAL_PATH)/prebuilt/usr/share/alsa/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
	#$(LOCAL_PATH)/prebuilt/usr/share/alsa/pcm/*:system/usr/share/alsa/pcm/* \

# Input digitizers
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/usr/idc/atmxt-i2c.idc:system/usr/idc/atmxt-i2c.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/mxt224_touchscreen_0.idc:system/usr/idc/mxt224_touchscreen_0.idc \

# NFC blobs
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/blobs/vendor/firmware/libnfcpn544c3_fw.so:system/vendor/firmware/libnfcpn544c3_fw.so \
	$(LOCAL_PATH)/blobs/vendor/firmware/libpn544_fw.so:system/vendor/firmware/libpn544_fw.so \

# Wireless related stuff
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/blobs/etc/firmware/ti-connectivity/wl1271-nvs.bin:system/etc/firmware/ti-connectivity/wl1271-nvs.bin \

# Prebuilt configuration files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
	$(LOCAL_PATH)/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf \
	$(LOCAL_PATH)/prebuilt/etc/powervr.ini:system/etc/powervr.ini \
	$(LOCAL_PATH)/prebuilt/etc/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/prebuilt/etc/location.cfg:system/etc/location.cfg \
	$(LOCAL_PATH)/prebuilt/etc/powervr.ini:system/etc/powervr.ini \
	$(LOCAL_PATH)/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/prebuilt/etc/thermal_sensor_config.xml:system/etc/thermal_sensor_config.xml \
	$(LOCAL_PATH)/prebuilt/etc/thermal_throttle_config.xml:system/etc/thermal_throttle_config.xml \
	$(LOCAL_PATH)/prebuilt/etc/wrs_omxil_components.list:system/etc/wrs_omxil_components.list \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip \

# Recovery related stuff
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/kernel:kernel \
	$(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
	$(LOCAL_PATH)/blobs/watchdogd:recovery/root/sbin/watchdogd \
	$(LOCAL_PATH)/blobs/etc/firmware/atmxt-r1.tdat:recovery/root/vendor/firmware/atmxt-r1.tdat \
	$(LOCAL_PATH)/blobs/etc/firmware/atmxt-r2.tdat:recovery/root/vendor/firmware/atmxt-r2.tdat \

# Inherit dalvik configuration and the rest of the platform
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_NAME := smi
PRODUCT_DEVICE := smi
PRODUCT_BRAND := Motorola
PRODUCT_MANUFACTURER := Motorola
PRODUCT_MODEL := RAZR i

