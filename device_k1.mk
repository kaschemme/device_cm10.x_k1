#
# Copyright (C) 2012 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product-if-exists, vendor/lenovo/k1/k1-vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)

DEVICE_PACKAGE_OVERLAYS += device/lenovo/k1/overlay

# Prebuilt kernel location
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Files needed for boot image
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/ramdisk/init.goldfish.rc:root/init.goldfish.rc \
    $(LOCAL_PATH)/ramdisk/init.logging.rc:root/init.logging.rc \
    $(LOCAL_PATH)/ramdisk/init.nv_dev_board.usb.rc:root/init.nv_dev_board.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.ventana.rc:root/init.ventana.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.ventana.rc:root/ueventd.ventana.rc \
    $(LOCAL_PATH)/ramdisk/fstab.ventana:root/fstab.ventana

# include specific apps
PRODUCT_COPY_FILES += \
	device/lenovo/k1/apps/com.jrummy.root.browserfree-203-v2.0.3.apk:system/app/com.jrummy.root.browserfree-203-v2.0.3.apk \
	device/lenovo/k1/apps/com.nolanlawson.logcat-39-v1.4.2.apk:system/app/com.nolanlawson.logcat-39-v1.4.2.apk

#/system/bin
PRODUCT_COPY_FILES += \
    vendor/lenovo/k1/proprietary/misc_command:system/bin/misc_command \
    vendor/lenovo/k1/proprietary/nvcpud:system/bin/nvcpud \
    vendor/lenovo/k1/proprietary/rild:system/bin/rild \
    vendor/lenovo/k1/proprietary/tf_daemon:system/bin/tf_daemon \
    vendor/lenovo/k1/proprietary/glgps_nvidiaTegra2android:system/bin/glgps_nvidiaTegra2android

#/system/etc - GPS configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/prebuilt/SuplRootCert:system/etc/SuplRootCert

#/system/etc
PRODUCT_COPY_FILES += \
    device/lenovo/k1/vold.fstab:system/etc/vold.fstab \
    vendor/lenovo/k1/proprietary/nvcamera.conf:system/etc/nvcamera.conf \
    vendor/lenovo/k1/proprietary/nvram.txt:system/etc/nvram.txt \
    vendor/lenovo/k1/proprietary/nvram_4329.txt:system/etc/nvram_4329.txt \
    vendor/lenovo/k1/proprietary/nvram_4330.txt:system/etc/nvram_4330.txt \
    vendor/lenovo/k1/proprietary/asound.conf:system/etc/asound.conf \
    device/lenovo/k1/prebuilt/audio_policy.conf:system/etc/audio_policy.conf

#/system/etc/firmware
PRODUCT_COPY_FILES += \
    vendor/lenovo/k1/proprietary/etc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    vendor/lenovo/k1/proprietary/etc/firmware/bcm4330.hcd:system/etc/firmware/bcm4330.hcd \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_aacdec.axf:system/etc/firmware/nvmm_aacdec.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_adtsdec.axf:system/etc/firmware/nvmm_adtsdec.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_h264dec.axf:system/etc/firmware/nvmm_h264dec.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_jpegdec.axf:system/etc/firmware/nvmm_jpegdec.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_jpegenc.axf:system/etc/firmware/nvmm_jpegenc.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_manager.axf:system/etc/firmware/nvmm_manager.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_mp3dec.axf:system/etc/firmware/nvmm_mp3dec.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_mpeg4dec.axf:system/etc/firmware/nvmm_mpeg4dec.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_reference.axf:system/etc/firmware/nvmm_reference.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_service.axf:system/etc/firmware/nvmm_service.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_vc1dec.axf:system/etc/firmware/nvmm_vc1dec.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_wavdec.axf:system/etc/firmware/nvmm_wavdec.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_wmadec.axf:system/etc/firmware/nvmm_wmadec.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvmm_wmaprodec.axf:system/etc/firmware/nvmm_wmaprodec.axf \
    vendor/lenovo/k1/proprietary/etc/firmware/nvrm_avp.bin:system/etc/firmware/nvrm_avp.bin
    
#/system/etc/gps
PRODUCT_COPY_FILES += vendor/lenovo/k1/proprietary/etc/gps/gpsconfig.xml:system/etc/gps/gpsconfig.xml

# apns config file
PRODUCT_COPY_FILES += $(LOCAL_PATH)/apns/apns-conf.xml:system/etc/apns-conf.xml

# Boot Animation
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/bootanimation.zip:system/media/bootanimation.zip

#/system/etc/permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

#/system/etc/security
PRODUCT_COPY_FILES += \
    vendor/lenovo/k1/proprietary/otacerts.zip:system/etc/security/otacerts.zip

# Final fix for 3G SOD
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/init.d/50em820w:system/etc/init.d/50em820w \
    $(LOCAL_PATH)/prebuilt/xbin/em820w_tool:system/xbin/em820w_tool


#/system/lib/modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/cifs.ko:system/lib/modules/cifs.ko \
    $(LOCAL_PATH)/prebuilt/md4.ko:system/lib/modules/md4.ko \
    $(LOCAL_PATH)/prebuilt/tun.ko:system/lib/modules/tun.ko \
    $(LOCAL_PATH)/prebuilt/bcm4329.ko:system/lib/modules/bcm4329.ko \
    $(LOCAL_PATH)/prebuilt/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko

#/system/usr/idc
PRODUCT_COPY_FILES += \
    vendor/lenovo/k1/proprietary/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    vendor/lenovo/k1/proprietary/usr/idc/panjit_touch.idc:system/usr/idc/panjit_touch.idc \
    vendor/lenovo/k1/proprietary/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    vendor/lenovo/k1/proprietary/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc

#/system/usr/keychars
PRODUCT_COPY_FILES += \
    vendor/lenovo/k1/proprietary/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    vendor/lenovo/k1/proprietary/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    vendor/lenovo/k1/proprietary/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    vendor/lenovo/k1/proprietary/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm

#/system/usr/keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/avago-pt.kl:system/usr/keylayout/avago-pt.kl \
    $(LOCAL_PATH)/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/keylayout/Bluetooth_00_06_66_42.kl:system/usr/keylayout/Bluetooth_00_06_66_42.kl \
    $(LOCAL_PATH)/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(LOCAL_PATH)/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    $(LOCAL_PATH)/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    $(LOCAL_PATH)/keylayout/Vendor_044f_Product_d007.kl:system/usr/keylayout/Vendor_044f_Product_d007.kl \
    $(LOCAL_PATH)/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    $(LOCAL_PATH)/keylayout/Vendor_045e_Product_0719.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl \
    $(LOCAL_PATH)/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    $(LOCAL_PATH)/keylayout/Vendor_046d_Product_c21d.kl:system/usr/keylayout/Vendor_046d_Product_c21d.kl \
    $(LOCAL_PATH)/keylayout/Vendor_046d_Product_c21f.kl:system/usr/keylayout/Vendor_046d_Product_c21f.kl \
    $(LOCAL_PATH)/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    $(LOCAL_PATH)/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    $(LOCAL_PATH)/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    $(LOCAL_PATH)/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
    $(LOCAL_PATH)/keylayout/Vendor_057e_Product_0306.kl:system/usr/keylayout/Vendor_057e_Product_0306.kl \

#/system/vendor/firmware
PRODUCT_COPY_FILES += \
    vendor/lenovo/k1/proprietary/vendor/firmware/fw_bcm4329.bin:system/vendor/firmware/fw_bcm4329.bin \
    vendor/lenovo/k1/proprietary/vendor/firmware/fw_bcm4329_apsta.bin:system/vendor/firmware/fw_bcm4329_apsta.bin \
    vendor/lenovo/k1/proprietary/vendor/firmware/bcm4329/fw_bcmdhd_apsta.bin:system/vendor/firmware/bcm4329/fw_bcmdhd_apsta.bin \
    vendor/lenovo/k1/proprietary/vendor/firmware/bcm4329/fw_bcmdhd_p2p.bin:system/vendor/firmware/bcm4329/fw_bcmdhd_p2p.bin \
    vendor/lenovo/k1/proprietary/vendor/firmware/bcm4329/fw_bcmdhd.bin:system/vendor/firmware/bcm4329/fw_bcmdhd.bin \
    vendor/lenovo/k1/proprietary/vendor/firmware/bcm4330/fw_bcmdhd_apsta.bin:system/vendor/firmware/bcm4330/fw_bcmdhd_apsta.bin \
    vendor/lenovo/k1/proprietary/vendor/firmware/bcm4330/fw_bcmdhd_p2p.bin:system/vendor/firmware/bcm4330/fw_bcmdhd_p2p.bin \
    vendor/lenovo/k1/proprietary/vendor/firmware/bcm4330/fw_bcmdhd.bin:system/vendor/firmware/bcm4330/fw_bcmdhd.bin

# Extra packages to build for this device
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory \
    make_ext4fs \
    setup_fs \
    audio.a2dp.default \
    libaudioutils \
    libinvensense_mpl \
    libaudioutils \
    tinymix \
    tinyplay \
    tinyrec

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.secure=0
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    persist.sys.usb.config=mtp,adb \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=48m \
    dalvik.vm.heapsize=256m \
    net.bt.name=Android

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.strictmode.visual=0

# Propertys spacific for this device
PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    mobiledata.interfaces=ppp0,wlan0 \
    wifi.supplicant_scan_interval=15 \

# Build characteristics setting 
PRODUCT_CHARACTERISTICS := tablet

# This device has enough space for precise dalvik
PRODUCT_TAGS += dalvik.gc.type-precise

# Call the vendor to setup propiatory files
$(call inherit-product-if-exists, vendor/lenovo/k1/k1-vendor.mk)

# media config xml file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

#WIFI_BAND := 802_11_ABG
#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)
