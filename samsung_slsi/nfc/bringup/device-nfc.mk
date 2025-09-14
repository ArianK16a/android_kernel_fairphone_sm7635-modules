#############################################################################################
## Includes NFC Packages
#############################################################################################

# Modify it to project environment
BRINGUP_NFC_PATH  := vendor/samsung_slsi/nfc/bringup
BOARD_USES_SAMSUNG_NFC_CHIP    := rn4v
NFC_CHIP_SUPPORT_ESE    := false
MULTIPLE_CHIPS_SUPPORT  := false

$(warning "Building S.LSI SEC NFC packages...")
# HAL
PRODUCT_COPY_FILES += \
    $(BRINGUP_NFC_PATH)/bin/sec_s3n$(BOARD_USES_SAMSUNG_NFC_CHIP)_firmware.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/sec_s3n$(BOARD_USES_SAMSUNG_NFC_CHIP)_firmware.bin
ifneq ($(filter $(BOARD_USES_SAMSUNG_NFC_CHIP), rn81 rn82),)
PRODUCT_COPY_FILES += \
    $(BRINGUP_NFC_PATH)/bin/sec_s3n$(BOARD_USES_SAMSUNG_NFC_CHIP)_rfreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3n$(BOARD_USES_SAMSUNG_NFC_CHIP)_rfreg.bin
else
PRODUCT_COPY_FILES += \
    $(BRINGUP_NFC_PATH)/bin/sec_s3n$(BOARD_USES_SAMSUNG_NFC_CHIP)_hwreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3n$(BOARD_USES_SAMSUNG_NFC_CHIP)_hwreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3n$(BOARD_USES_SAMSUNG_NFC_CHIP)_swreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3n$(BOARD_USES_SAMSUNG_NFC_CHIP)_swreg.bin
endif

# Feature files + configuration
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += \
    $(BRINGUP_NFC_PATH)/configs/libnfc-nci_debug.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_debug_$(BOARD_USES_SAMSUNG_NFC_CHIP).conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor.conf
else
PRODUCT_COPY_FILES += \
    $(BRINGUP_NFC_PATH)/configs/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_$(BOARD_USES_SAMSUNG_NFC_CHIP).conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor.conf
endif

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml

ifeq ($(NFC_CHIP_SUPPORT_ESE),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml
endif

# HAL service
PRODUCT_PACKAGES += \
    nfc_nci_sec \
    sec_nfc_test

ifeq ($(BOARD_USES_NFC_HIDL_HAL),true)
$(warning "Use HIDL NFC HAL...")
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service.sec
else
$(warning "Use AIDL NFC HAL...")
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.sec
endif

ifeq ($(MULTIPLE_CHIPS_SUPPORT),true)
$(call inherit-product-if-exists, $(BRINGUP_NFC_PATH)/device-nfc-extras.mk)
endif

# Build NFC kernel driver
PRODUCT_PACKAGES += sec_nfc.ko

ifneq ($(strip $(TARGET_BUILD_VARIANT)),user)
PRODUCT_VENDOR_PROPERTIES += persist.log.tag=V
PRODUCT_VENDOR_PROPERTIES += persist.nfc.vendor_debug_enabled=true
PRODUCT_VENDOR_PROPERTIES += persist.nfc.debug_enabled=true
endif