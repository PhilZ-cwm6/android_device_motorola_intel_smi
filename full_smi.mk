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

# Prebuilt configuration files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
	$(LOCAL_PATH)/prebuilt/etc/asound.conf:system/etc/asound.conf \
	$(LOCAL_PATH)/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf \
	$(LOCAL_PATH)/prebuilt/etc/powervr.ini:system/etc/powervr.ini \
	$(LOCAL_PATH)/prebuilt/etc/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/prebuilt/etc/powervr.ini:system/etc/powervr.ini \
	$(LOCAL_PATH)/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/prebuilt/etc/thermal_sensor_config.xml:system/etc/thermal_sensor_config.xml \
	$(LOCAL_PATH)/prebuilt/etc/thermal_throttle_config.xml:system/etc/thermal_throttle_config.xml \

# Files needed for compilation time
PRODUCT_COPY_FILES += \

# Extra blobs required
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/blobs/bin/kexec:system/bin/kexec \
	$(LOCAL_PATH)/blobs/bin/fmradioserver:system/bin/fmradioserver \
	$(LOCAL_PATH)/blobs/lib/libFMRadio.so:system/lib/libFMRadio.so \
	$(LOCAL_PATH)/blobs/lib/libfmradio_jni.so:system/lib/libfmradio_jni.so \
	$(LOCAL_PATH)/blobs/lib/libfmradioplayer.so:system/lib/libfmradioplayer.so \

# Houdini related files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/blobs/bin/houdini:system/bin/houdini \
	$(LOCAL_PATH)/blobs/lib/libhoudini.so:system/lib/libhoudini.so \
	$(LOCAL_PATH)/blobs/bin/disable_houdini:system/bin/disable_houdini \
	$(LOCAL_PATH)/blobs/bin/enable_houdini:system/bin/enable_houdini \
	$(LOCAL_PATH)/blobs/lib/arm/check.xml:system/lib/arm/check.xml \
	$(LOCAL_PATH)/blobs/lib/arm/cpuinfo:system/lib/arm/cpuinfo \
	$(LOCAL_PATH)/blobs/lib/arm/cpuinfo.neon:system/lib/arm/cpuinfo.neon \
	$(LOCAL_PATH)/blobs/lib/arm/linker:system/lib/arm/linker \

PRODUCT_COPY_FILES += \
	#$(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
	#$(LOCAL_PATH)/blobs/watchdogd:recovery/root/sbin/watchdogd \
	#?$(LOCAL_PATH)/blobs/atmxt-r2.tdat:recovery/root/vendor/firmware/atmxt-r2.tdat \

# Inherit dalvik configuration and the rest of the platform
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_NAME := full_smi
PRODUCT_DEVICE := smi
PRODUCT_BRAND := Motorola
PRODUCT_MANUFACTURER := Motorola
PRODUCT_MODEL := RAZR i

