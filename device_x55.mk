$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/shenzhou/x55/x55-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/shenzhou/x55/overlay

LOCAL_PATH := device/shenzhou/x55
LOCAL_RECOVERY_PATH := device/shenzhou/x55/recovery

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.mt6592:root/fstab.mt6592

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_x55
PRODUCT_DEVICE := x55
