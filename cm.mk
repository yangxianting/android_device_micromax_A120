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
