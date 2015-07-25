## Specify phone tech before including full_phone

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/micromax/A120/device.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := A120
PRODUCT_NAME := cm_A120
PRODUCT_BRAND := Micromax
PRODUCT_MODEL := Micromax A120
PRODUCT_MANUFACTURER := Micromax

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Micromax/A120/A120:4.4.2/KOT49H/1401873027:user/release-keys \
    PRIVATE_BUILD_DESC="s5501-user 4.4.2 KOT49H eng.chenkangjiao.1402406641 release-keys"

