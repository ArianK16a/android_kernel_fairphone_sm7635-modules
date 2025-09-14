#############################################################################################
## Includes NFC Packages
#############################################################################################

$(warning "Inluding S.LSI SEC NFC bins for all chips...")
# HAL
PRODUCT_COPY_FILES += \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nrn81_firmware.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/sec_s3nrn81_firmware.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nrn81_rfreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nrn81_rfreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nrn82_firmware.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/sec_s3nrn82_firmware.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nrn82_rfreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nrn82_rfreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nrn74_firmware.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/sec_s3nrn74_firmware.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nrn74_hwreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nrn74_hwreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nrn74_swreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nrn74_swreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nrn4v_firmware.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/sec_s3nrn4v_firmware.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nrn4v_hwreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nrn4v_hwreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nrn4v_swreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nrn4v_swreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nsn4v_firmware.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/sec_s3nsn4v_firmware.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nsn4v_hwreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nsn4v_hwreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nsn4v_swreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nsn4v_swreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nsen6_firmware.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/sec_s3nsen6_firmware.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nsen6_hwreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nsen6_hwreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nsen6_swreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nsen6_swreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nsn6v_firmware.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/sec_s3nsn6v_firmware.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nsn6v_hwreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nsn6v_hwreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nsn6v_swreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nsn6v_swreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nrn6h_firmware.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/sec_s3nrn6h_firmware.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nrn6h_hwreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nrn6h_hwreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nrn6h_swreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nrn6h_swreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nsn6h_firmware.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/sec_s3nsn6h_firmware.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nsn6h_hwreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nsn6h_hwreg.bin \
    $(BRINGUP_NFC_PATH)/bin/sec_s3nsn6h_swreg.bin:$(TARGET_COPY_OUT_VENDOR)/etc/sec_s3nsn6h_swreg.bin

# Feature files + configuration
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_debug_rn81.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_rn81.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_debug_rn82.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_rn82.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_debug_rn74.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_rn74.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_debug_rn4v.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_rn4v.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_debug_sn4v.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_sn4v.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_debug_sen6.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_sen6.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_debug_sn6v.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_sn6v.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_debug_rn6h.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_rn6h.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_debug_sn6h.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_sn6h.conf

else
PRODUCT_COPY_FILES += \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_rn81.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_rn81.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_rn82.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_rn82.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_rn74.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_rn74.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_rn4v.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_rn4v.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_sn4v.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_sn4v.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_sen6.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_sen6.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_sn6v.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_sn6v.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_rn6h.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_rn6h.conf \
    $(BRINGUP_NFC_PATH)/configs/libnfc-sec-vendor_sn6h.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor_sn6h.conf

endif