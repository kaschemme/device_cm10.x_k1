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

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers \
        librs_jni

PRODUCT_PROPERTY_OVERRIDES := \
        net.dns1=8.8.8.8 \
        net.dns2=8.8.4.4

# Camera
PRODUCT_PACKAGES += \
    Camera

# A few more packages that aren't quite used on all builds
PRODUCT_PACKAGES += \
  Mms

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)

# This is where we'd set a backup provider if we had one
$(call inherit-product, device/lenovo/k1/device_k1.mk)

# Enable xhdpi drawables while keeping mdpi as primary source
PRODUCT_AAPT_CONFIG := xlarge mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcm4329/Android.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_k1
PRODUCT_DEVICE := k1
PRODUCT_BRAND := Android
PRODUCT_MODEL := Full Android on K1
