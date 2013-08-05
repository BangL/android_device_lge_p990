$(call inherit-product, device/lge/star-common/star.mk)

# Inherit non-open-source blobs.
$(call inherit-product-if-exists, vendor/lge/p990/p990-vendor.mk)


### SETTINGS

PRODUCT_NAME := full_p990
PRODUCT_DEVICE := p990
PRODUCT_MODEL := LG-P990

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Try to get "temasek version" from global var
ifeq ($(TEMASEK_VERSION),)
  TEMASEK_VERSION := Unknown
endif
ADDITIONAL_BUILD_PROPERTIES += ro.temasek.version=$(TEMASEK_VERSION)


### CONFIGS

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:/system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps_brcm_conf.xml:system/etc/gps_brcm_conf.xml

# mount sd cards
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab

# vsnet stuffs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.vsnet:system/bin/init.vsnet \
    $(LOCAL_PATH)/configs/init.vsnet-down:system/bin/init.vsnet-down


### ROOTDIR

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.p990.rc:root/init.star.rc \
    $(LOCAL_PATH)/rootdir/ueventd.tegra.rc:root/ueventd.star.rc \
    $(LOCAL_PATH)/rootdir/fstab.p990:root/fstab.p990

# Decive off charger fix for new bl by pengus77
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/charger:root/charger \
    $(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/res/images/charger/*),$(f):root/res/images/charger/$(notdir $(f))) \
    $(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/res/images/security/*),$(f):root/res/images/security/$(notdir $(f)))


### PREBUILT

# lgdrm / sanity check stuff by pengus77
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/check_sdcard.sh:system/bin/check_sdcard.sh \
    $(LOCAL_PATH)/prebuilt/lgdrm.img:system/bin/lgdrm.img

# include prebuilt Kowalski kernel exp126 by pengus77
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/kernel/zImage:kernel \
    $(LOCAL_PATH)/prebuilt/kernel/bthid.ko:system/lib/modules/bthid.ko \
    $(LOCAL_PATH)/prebuilt/kernel/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    $(LOCAL_PATH)/prebuilt/kernel/wireless.ko:system/lib/modules/wireless.ko \
    $(LOCAL_PATH)/prebuilt/kernel/zram.ko:system/lib/modules/zram.ko \
    $(LOCAL_PATH)/prebuilt/kernel/alsa_amixer:system/xbin/alsa_amixer \
    $(LOCAL_PATH)/prebuilt/kernel/95kowalski:system/etc/init.d/95kowalski \
    $(LOCAL_PATH)/prebuilt/kernel/power.tegra.so:system/lib/hw/power.tegra.so \
    $(LOCAL_PATH)/prebuilt/kernel/KowalskiManager.apk:system/app/KowalskiManager.apk


### BUILD

# bb version
PRODUCT_PACKAGES += \
    lgcpversion
