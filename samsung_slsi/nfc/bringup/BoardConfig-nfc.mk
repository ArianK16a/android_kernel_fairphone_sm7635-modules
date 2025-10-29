
###########################################################################################
## Includes SEPolicy and device manifest
###########################################################################################

# Modify it to project environment
BRINGUP_NFC_PATH  := vendor/samsung_slsi/nfc/bringup

ifeq (, $(findstring $(BRINGUP_NFC_PATH), $(BOARD_VENDOR_SEPOLICY_DIRS)))
$(warning "Include SEC NFC vendor sepolicy...")
BOARD_VENDOR_SEPOLICY_DIRS       += $(BRINGUP_NFC_PATH)/sepolicy/vendor
SYSTEM_EXT_PLAT_PRIVATE_SEPOLICY_DIRS  += $(BRINGUP_NFC_PATH)/sepolicy/private
endif

BOARD_USES_NFC_HIDL_HAL  := false
#device manifest is moved to HAL and integrated by vintf_fragments in Android.bp
$(warning "Uses BOARD_USES_SAMSUNG_NFC in BoardConfig")

ifeq ($(BOARD_USES_NFC_HIDL_HAL),true)
ifeq (, $(findstring $(BRINGUP_NFC_PATH), $(DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE)))
$(warning "Include SEC NFC device framework compatibility matrix...")
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(BRINGUP_NFC_PATH)/../hardware/sec/nfc/1.2/device_framework_compatibility_matrix.xml
endif
endif

# Build NFC kernel driver
BOARD_VENDOR_KERNEL_MODULES += $(KERNEL_MODULES_OUT)/sec_nfc.ko