# Copyright (C) 2013 ParanoidAndroid Project
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

# Check for target product
ifeq (pa_m7,$(TARGET_PRODUCT))

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# M7 Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/m7

# Define PA bootanimation size
PARANOID_BOOTANIMATION_NAME := XHDPI

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xxhdpi

# Include ParanoidAndroid common configuration
include vendor/pa/config/pa_common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/htc/m7/device_m7.mk)

# Product Package Extras - Repos can be added manually or via addprojects.py
-include vendor/pa/packages/m7.mk

# CM Package Extras
# -include vendor/pa/packages/cm.mk

# Include my extra sounds package
include vendor/pa/config/hn_sounds.mk

# Override AOSP build properties
PRODUCT_NAME := pa_m7
PRODUCT_BRAND := HTC
PRODUCT_MODEL := HTC One
PRODUCT_MANUFACTURER := HTC
PRODUCT_LOCALES += xxhdpi
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_m7 BUILD_FINGERPRINT="htc/m7/m7:4.2/JOP40C/527662:user/release-keys" PRIVATE_BUILD_DESC="m7-user 4.2 JOP40C 527662 release-keys"

# Update local_manifest.xml
# GET_VENDOR_PROPS := $(shell vendor/pa/tools/getvendorprops.py $(PRODUCT_NAME))
# GET_PROJECT_RMS := $(shell vendor/pa/tools/removeprojects.py $(PRODUCT_NAME))
# GET_PROJECT_ADDS := $(shell vendor/pa/tools/addprojects.py $(PRODUCT_NAME))

endif
