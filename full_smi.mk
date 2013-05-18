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

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_DIR)/overlay

# gralloc & mesa lib
PRODUCT_PACKAGES += \
    libGLES_mesa    \
    gralloc.$(TARGET_PRODUCT) \
    camera.bigcore \

# tinyalsa utils
PRODUCT_PACKAGES += \
	tinymix \
	tinyplay \
	tinycap \


PRODUCT_COPY_FILES += \
#	$(LOCAL_DIR)/prebuilt/etc/*:system/etc/ \
#	$(LOCAL_DIR)/prebuilt/etc/*:system/etc/ \

PRODUCT_COPY_FILES += \
#	$(LOCAL_DIR)/blobs/bin/*:system/bin/ \
#	$(LOCAL_DIR)/blobs/etc/*:system/etc/ \
#	$(LOCAL_DIR)/blobs/lib/*:system/lib/ \
#	$(LOCAL_DIR)/blobs/vendor/*:system/vendor/ \
#	$(LOCAL_DIR)/blobs/xbin/*:system/xbin/ \

PRODUCT_COPY_FILES += \
	#$(LOCAL_DIR)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
	#$(LOCAL_DIR)/blobs/watchdogd:recovery/root/sbin/watchdogd \
	#?$(LOCAL_DIR)/blobs/atmxt-r2.tdat:recovery/root/vendor/firmware/atmxt-r2.tdat \

# Inherit dalvik configuration and the rest of the platform
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_NAME := full_smi
PRODUCT_DEVICE := smi
PRODUCT_BRAND := Motorola
PRODUCT_MANUFACTURER := Motorola
PRODUCT_MODEL := RAZR i

