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
PRODUCT_PACKAGES += \
    privapp-permissions-com.oneplus.camera.xml \
    privapp-permissions-com.oneplus.camera.service.xml \
    privapp-permissions-com.oneplus.gallery.xml \
    default-permissions-oneplus.xml \
    hiddenapi-allowlist-oneplus.xml \
    oneplus_google_lens_config.xml

# Properties
## See BoardConfigVendor.mk

# Soong
PRODUCT_SOONG_NAMESPACES += \
    vendor/oneplus/camera
