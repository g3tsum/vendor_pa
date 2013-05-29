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
ifeq (pa_geeb,$(TARGET_PRODUCT))

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# geeb Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/geeb

# Define PA bootanimation size
PARANOID_BOOTANIMATION_NAME := XHDPI

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi

# Include ParanoidAndroid common configuration
include vendor/pa/config/pa_common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/lge/geeb/full_geeb.mk)

# Product Package Extras - Repos can be added manually or via addprojects.py
-include vendor/pa/packages/geeb.mk

# CM Package Extras
# -include vendor/pa/packages/cm.mk

# Include my extra sounds package
include vendor/pa/config/hn_sounds.mk

# Override AOSP build properties
PRODUCT_NAME := pa_geeb
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG Optimus G
PRODUCT_MANUFACTURER := LGE
PRODUCT_LOCALES += xhdpi
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=lge_gee BUILD_FINGERPRINT="lge/gee/geeb:4.2/JOP40C/527662:user/release-keys" PRIVATE_BUILD_DESC="geeb-user 4.2 JOP40C 527662 release-keys"

# Update local_manifest.xml
# GET_VENDOR_PROPS := $(shell vendor/pa/tools/getvendorprops.py $(PRODUCT_NAME))
# GET_PROJECT_RMS := $(shell vendor/pa/tools/removeprojects.py $(PRODUCT_NAME))
# GET_PROJECT_ADDS := $(shell vendor/pa/tools/addprojects.py $(PRODUCT_NAME))

endif
