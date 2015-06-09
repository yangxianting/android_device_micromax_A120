$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/wiko/rainbow/rainbow-vendor.mk)

PRODUCT_CHARACTERISTICS := nosdcard

DEVICE_PACKAGE_OVERLAYS += device/wiko/rainbow/overlay

LOCAL_PATH := device/wiko/rainbow
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif


PRODUCT_PACKAGES += \
    Torch

PRODUCT_PACKAGES += \
    libxlog

PRODUCT_PACKAGES += \
    lights.mt6582

PRODUCT_PACKAGES += \
    audio.r_submix.default

PRODUCT_PACKAGES += \
    audio.primary.mt6582

PRODUCT_PACKAGES += \
    audio_policy.default

PRODUCT_PACKAGES += \
    libbt-vendor

PRODUCT_PACKAGES += \
    gsm0710muxd

# KEYLAYOUT
PRODUCT_COPY_FILES += \
    device/wiko/rainbow/rootdir/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

# RAMDISK
PRODUCT_COPY_FILES += \
    device/wiko/rainbow/rootdir/root/fstab.mt6582:root/fstab.mt6582 \
    device/wiko/rainbow/rootdir/root/init.mt6582.rc:root/init.mt6582.rc \
    device/wiko/rainbow/rootdir/root/init.modem.rc:root/init.modem.rc \
    device/wiko/rainbow/rootdir/root/init.mt6582.usb.rc:root/init.mt6582.usb.rc \
    device/wiko/rainbow/rootdir/root/init.recovery.mt6582.rc:root/init.recovery.mt6582.rc \
    device/wiko/rainbow/rootdir/root/init.xlog.rc:root/init.xlog.rc \
    device/wiko/rainbow/rootdir/root/ueventd.mt6582.rc:root/ueventd.mt6582.rc \
    $(LOCAL_KERNEL):kernel

# PERMISSIONS
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# AUDIO
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/rootdir/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/rootdir/configs/audio_policy.conf:system/etc/audio_policy.conf

$(call inherit-product, build/target/product/full.mk)

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
	ro.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	ro.zygote=zygote32 \
	persist.sys.usb.config=adb

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_rainbow
PRODUCT_DEVICE := rainbow

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
