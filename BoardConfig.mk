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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# Inherit from common m8-common
-include device/htc/m8-common/BoardConfigCommon.mk

# Model Ids (Dual SIM variants)
# 0P6B41000 - Chinese (China Telecom) LTE/EV-DO/CDMA + GSM version
# 0P6B61000 - Chinese (China Unicom) LTE/WCDMA/GSM + GSM version
# 0P6B64000 / 0P6B68000 - International LTE/WCDMA/GSM + GSM version

# Assert
TARGET_OTA_ASSERT_DEVICE := htc_m8dug,htc_m8dwg,m8dugl,m8dwgl

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/htc/m8d/mkbootimg.mk
TARGET_KERNEL_CONFIG := cm_m8dug_defconfig

# Audio
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_HTC_DUAL_SIM := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/m8d/bluetooth

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/htc/m8d/init/init_m8d.cpp
TARGET_UNIFIED_DEVICE := true

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3087007744
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11140071424

# Inherit from the proprietary version
-include vendor/htc/m8d/BoardConfigVendor.mk
