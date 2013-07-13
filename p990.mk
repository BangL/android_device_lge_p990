# Inherit non-open-source blobs.
$(call inherit-product-if-exists, vendor/lge/p990/p990-vendor.mk)

# Settings
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, build/target/product/full_base_telephony.mk)
PRODUCT_LOCALES += hdpi
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_MANUFACTURER := LGE
PRODUCT_NAME := full_p990
PRODUCT_DEVICE := p990
PRODUCT_MODEL := LG-P990

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.p990.rc:root/init.star.rc \
    $(LOCAL_PATH)/rootdir/init.cm-star.rc:root/init.cm-star.rc \
    $(LOCAL_PATH)/rootdir/init.star.usb.rc:root/init.star.usb.rc \
    $(LOCAL_PATH)/rootdir/init_recovery.rc:root/init_recovery.rc \
    $(LOCAL_PATH)/rootdir/ueventd.tegra.rc:root/ueventd.star.rc \
    $(LOCAL_PATH)/rootdir/fstab.star:root/fstab.star

# Charger fix
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/charger/charger:root/charger \
    $(foreach f,$(wildcard $(LOCAL_PATH)/charger/res/images/charger/*),$(f):root/res/images/charger/$(notdir $(f))) \
    $(foreach f,$(wildcard $(LOCAL_PATH)/charger/res/images/security/*),$(f):root/res/images/security/$(notdir $(f)))

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/asound.conf:system/etc/asound.conf \
    $(LOCAL_PATH)/configs/egl.cfg:system/lib/egl/egl.cfg \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/configs/init.vsnet:system/bin/init.vsnet \
    $(LOCAL_PATH)/configs/init.vsnet-down:system/bin/init.vsnet-down \
    $(LOCAL_PATH)/configs/gps.conf:/system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps_brcm_conf.xml:system/etc/gps_brcm_conf.xml

# Prebuilts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/setup-recovery:system/bin/setup-recovery \
    $(LOCAL_PATH)/prebuilt/star_synaptics.idc:system/usr/idc/star_synaptics.idc \
    $(LOCAL_PATH)/prebuilt/star_synaptics.kl:system/usr/keylayout/star_synaptics.kl \
    $(LOCAL_PATH)/prebuilt/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/prebuilt/tegra-snd-wm8994.kl:system/usr/keylayout/tegra-snd-wm8994.kl \
    $(LOCAL_PATH)/prebuilt/usb_keyboard_102_en_us.kl:system/usr/keylayout/usb_keyboard_102_en_us.kl \
    $(LOCAL_PATH)/prebuilt/usb_keyboard_102_en_us.kcm.bin:system/usr/keychars/usb_keyboard_102_en_us.kcm.bin \
    $(LOCAL_PATH)/prebuilt/check_sdcard.sh:system/bin/check_sdcard.sh \
    $(LOCAL_PATH)/prebuilt/lgdrm.img:system/bin/lgdrm.img

# prebuilt kowalski exp126 kernel
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

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# Packages
PRODUCT_PACKAGES += \
    bridgeutil \
    lights.star \
    libbridge \
    libbridge_jni \
    screencap \
    audio.a2dp.default \
    hwcomposer.default \
    com.android.future.usb.accessory \
    Torch \
    lgcpversion

# Ugly space-saving hack
PRODUCT_PACKAGES += \
    srec-en
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/10-movestuff.sh:system/addon.d/10-movestuff.sh

# Force MTP/ADB to be availible on bootup
PRODUCT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1 \
    ro.adb.secure=0 \
    ro.secure=0 \
    persist.sys.usb.config=mtp,adb
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/20-mtp:system/etc/init.d/20-mtp

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=3000 \
    ro.telephony.call_ring.absent=true \
    ro.hardware.respect_als=true \
    ro.bt.bdaddr_path=/sys/devices/platform/bd_address/bdaddr_if \
    debug.sf.electron_frames=42 \
    nv-camera-disable-early-graph=1 \
    sys.mem.max_hidden_apps=4 \
    ro.lge.audio_soundexception=true \
    ro.bq.gpu_to_cpu_unsupported=1

# Enable ZRAM by default
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zram.default=18 \
    persist.service.zram=18

# Dexopt settings
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.dexopt-flags=m=y,u=n,v=n,o=v

# Disable sending usage data
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.nocheckin=1

# Enable AGPS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.def.agps.mode=1

# Enable purgeable assets
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.purgeable_assets=1

# Enable debugging
PRODUCT_PROPERTY_OVERRIDES += \
    ro.debuggable=1

# Enable root access
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1

# Try to get "temasek version" from global var
ifeq ($(TEMASEK_VERSION),)
  TEMASEK_VERSION := Unknown
endif
ADDITIONAL_BUILD_PROPERTIES += ro.temasek.version=$(TEMASEK_VERSION)
