# Release name
PRODUCT_RELEASE_NAME := K1

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit device configuration
$(call inherit-product, device/lenovo/k1/full_k1.mk)

#
# Setup device specific product configuration.
#
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_DEVICE		:= k1
PRODUCT_NAME		:= cm_k1
PRODUCT_BRAND		:= Lenovo
PRODUCT_MODEL		:= Ideapad K1
PRODUCT_MANUFACTURER := Lenovo
PRODUCT_BOARD        := ventana

#Set build fingerprint / ID / Product Name ect.
# PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=tervigon BUILD_ID=IML77 BUILD_DISPLAY_ID=IML77 BUILD_FINGERPRINT="motorola/tervigon/wingray:4.0.3/IML77/239789:user/release-keys" PRIVATE_BUILD_DESC="tervigon-user 4.0.3 IML77 239789 release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_DEVICE=K1
