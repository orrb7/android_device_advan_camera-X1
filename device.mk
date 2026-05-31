# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from the proprietary version
$(call inherit-product, vendor/advan/X1/X1-vendor.mk)

# Privapp permissions untuk com.mediatek.camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-com.mediatek.camera.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-com.mediatek.camera.xml

# Hidden API allowlist
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/com.mediatek.camera-hiddenapi-package-allowlist.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.mediatek.camera-hiddenapi-package-allowlist.xml

# system_ext lib644
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries-system_ext-mtk.txt:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/public.libraries-mtk.txt

PRODUCT_COPY_FILES += \
       vendor/advan/advancamera-X1/proprietary/system/media/sticker:$(TARGET_COPY_OUT_SYSTEM)/media/sticker

TARGET_VENDOR_PROP += vendor/advan/advancamera-X1/vendor.prop
TARGET_SYSTEM_PROP += vendor/advan/advancamera-X1/system.prop

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
