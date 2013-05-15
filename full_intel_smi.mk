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
# lines, full and intel_smi, hence its name.
#

LOCAL_PATH:= $(call my-dir)

DEVICE_PACKAGE_OVERLAYS := device/motorola/intel_smi/overlay

# Camera and Gallery
PRODUCT_PACKAGES := \
    Gallery

#if we do this after the full_base_telephony is included some of these don't get picked up..
ifeq ($(TARGET_PRODUCT),full_intel_smi)
PRODUCT_COPY_FILES += \
    device/motorola/intel_smi/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml
endif

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=intel_smi

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_intel_smi
PRODUCT_DEVICE := intel_smi
PRODUCT_BRAND := MOTO
PRODUCT_MANUFACTURER := MOTO
PRODUCT_MODEL := MOTOROLA RAZR i
