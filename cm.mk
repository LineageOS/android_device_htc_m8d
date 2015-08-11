#
# Copyright (C) 2015 The CyanogenMod Project
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

$(call inherit-product, device/htc/m8dug/full_m8dug.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := cm_m8dug

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="htc_m8dug" \
    TARGET_DEVICE="htc_m8dug" \
    BUILD_FINGERPRINT="htc/htc_europe/htc_m8dug:5.0.2/LRX22G/499095.15:user/release-keys" \
    PRIVATE_BUILD_DESC="4.30.401.15 CL499095 release-keys"
