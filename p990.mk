$(call inherit-product, device/lge/star-common/star.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Inherit non-open-source blobs.
$(call inherit-product-if-exists, $(LOCAL_PATH)/p990-vendor.mk)

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.p990.rc:root/init.star.rc \
    $(LOCAL_PATH)/rootdir/ueventd.tegra.rc:root/ueventd.star.rc \
    $(LOCAL_PATH)/rootdir/fstab.p990:root/fstab.p990

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.vsnet:system/bin/init.vsnet \
    $(LOCAL_PATH)/init.vsnet-down:system/bin/init.vsnet-down

# Charger fix
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/charger:root/charger \
    $(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/res/images/charger/*),$(f):root/res/images/charger/$(notdir $(f))) \
    $(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/res/images/security/*),$(f):root/res/images/security/$(notdir $(f)))

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:/system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps_brcm_conf.xml:system/etc/gps_brcm_conf.xml

# prebuilt kowalski kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/kernel/zImage:kernel \
    $(LOCAL_PATH)/kernel/bthid.ko:system/lib/modules/bthid.ko \
    $(LOCAL_PATH)/kernel/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    $(LOCAL_PATH)/kernel/wireless.ko:system/lib/modules/wireless.ko \
    $(LOCAL_PATH)/kernel/zram.ko:system/lib/modules/zram.ko \
    $(LOCAL_PATH)/kernel/alsa_amixer:system/xbin/alsa_amixer \
    $(LOCAL_PATH)/kernel/95kowalski:system/etc/init.d/95kowalski \
    $(LOCAL_PATH)/kernel/power.tegra.so:system/lib/hw/power.tegra.so \
    $(LOCAL_PATH)/kernel/KowalskiManager.apk:system/app/KowalskiManager.apk

PRODUCT_PACKAGES += \
    lgcpversion

PRODUCT_NAME := full_p990
PRODUCT_DEVICE := p990
PRODUCT_MODEL := LG-P990
