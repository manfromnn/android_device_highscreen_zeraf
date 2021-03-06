# Full base
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Needed stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Call device specific makefile
$(call inherit-product, device/alps/alps.mk)

LOCAL_PATH := device/alps

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=6.0.1/MMB29M/2419427:user/release-keys PRIVATE_BUILD_DESC="alps-user 6.0.1 MMB29M 2419427 release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="alps"

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq    
       
PRODUCT_NAME := full_alps
PRODUCT_DEVICE :=alps
PRODUCT_BRAND := highscreen
PRODUCT_MANUFACTURER := mediatek
PRODUCT_MODEL := Zera_F

# Correct bootanimation size for the screen
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# set locales & aapt config.
PRODUCT_LOCALES := ru_RU en_US uk_UA
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Inherit some common CM stuff.

CM_BUILD :=alps

ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp
	
PRODUCT_PROPERTY_OVERRIDES += \
  persist.service.adb.enable=1 \
  persist.service.debuggable=1 \
  persist.sys.usb.config=mtp,adb

$(call inherit-product, vendor/cm/config/common_full_phone.mk)
