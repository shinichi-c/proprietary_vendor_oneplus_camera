#
# Copyright (C) 2025 crDroid Android Project
# SPDX-License-Identifier: Apache-2.0
#

# BoardConfig variables
include vendor/oneplus/camera/BoardConfigVendor.mk

# Camera Packages
PRODUCT_PACKAGES += \
    OnePlusCamera \
    OnePlusCameraService \
    OnePlusGallery

# Permissions/Sysconfig
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-com.oneplus.camera.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-com.oneplus.camera.xml \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-com.oneplus.camera.service.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.oneplus.camera.service.xml \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-com.oneplus.gallery.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-com.oneplus.gallery.xml \
    $(LOCAL_PATH)/configs/permissions/default-permissions-oneplus.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/default-permissions-oneplus.xml \
    $(LOCAL_PATH)/configs/sysconfig/hiddenapi-allowlist-oneplus.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hiddenapi-allowlist-oneplus.xml \
    $(LOCAL_PATH)/configs/sysconfig/oneplus_google_lens_config.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/oneplus_google_lens_config.xml

# Properties
## See BoardConfigVendor.mk

# Soong
PRODUCT_SOONG_NAMESPACES += \
    vendor/oneplus/camera
