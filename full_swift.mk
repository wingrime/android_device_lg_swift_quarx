#Adding ALL Languages

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

include frameworks/base/data/sounds/AudioPackage4.mk

DEVICE_PACKAGE_OVERLAYS += device/lg/swift/overlay
    
PRODUCT_PACKAGES += \
    VoiceDialer \
    LiveWallpapersPicker \
    Launcher2 \
    CMParts \
    CMPartsHelper \
    CMWallpapers \
    DSPManager \
    Provision \
    GoogleSearch \
    LatinIME \
    Stk \
    Superuser

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000 \
    ro.com.android.dataroaming=false \
    ro.setupwizard.enable_bypass=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.rommanager.developerid=cyanogenmod \
    ro.config.ringtone=DonMessWivIt.ogg

# Wifi and GSM
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    wifi.interface=wlan0

# Time between scans in seconds. Keep it high to minimize battery drain.
# This only affects the case in which there are remembered access points,
# but none are in range.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=15

# Enable Compcache by default on D/S
PRODUCT_PROPERTY_OVERRIDES += \
    ro.compcache.default=0

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# Default network type
# 0 => WCDMA Preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# Enable JIT by default
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.heapsize=24m
# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_swift
PRODUCT_DEVICE := swift
PRODUCT_MODEL := Full Android on LG GT540
