CUR_PATH := device/rockchip/common/bluetooth

ifeq ($(strip $(BLUETOOTH_USE_BPLUS)),true)
PRODUCT_PACKAGES += \
	libbt-client-api \
	com.broadcom.bt \
	com.broadcom.bt.xml \
	bplus_helper \
	libbt_cust

# Bluetooth bplus
PRODUCT_COPY_FILES += \
	system/bluetooth/data/main.nonsmartphone.le.conf:system/etc/bluetooth/main.conf \
	device/rockchip/common/bluetooth/lib/iop_bt.db:system/etc/bluetooth/iop_bt.db \
	device/rockchip/common/bluetooth/lib/bplus.default.so:system/lib/hw/bplus.default.so \
	external/bluetooth/bluedroid/conf/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
	external/bluetooth/bluedroid/conf/bt_did.conf:system/etc/bluetooth/bt_did.conf \
	external/bluetooth/bluedroid/conf/bt_stack_40.conf:system/etc/bluetooth/bt_stack.conf \
        external/bluetooth/bluedroid/conf/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
	device/rockchip/common/bluetooth/lib/libbluetooth_jni.bplus.so:system/lib/libbluetooth_jni.so
endif

ifeq ($(strip $(MT6622_BT_SUPPORT)),true)
#PRODUCT_COPY_FILES += \
    device/rockchip/common/bluetooth/mt6622/libbluetooth_mtk.so:system/lib/libbluetooth_mtk.so \
    device/rockchip/common/bluetooth/mt6622/libbt-vendor.so:system/lib/libbt-vendor.so
endif

ifeq ($(strip $(BOARD_CONNECTIVITY_MODULE)), rtl872x)
PRODUCT_COPY_FILES += \
    device/rockchip/common/bluetooth/realtek/bt/firmware/rtl8723as/rtl8723a_fw:system/etc/firmware/rtlbt/rtlbt_fw \
    device/rockchip/common/bluetooth/realtek/bt/firmware/rtl8723as/rtl8723a_config:system/etc/firmware/rtlbt/rtlbt_config
endif

ifeq ($(strip $(BOARD_CONNECTIVITY_MODULE)), rtl872xU)
PRODUCT_COPY_FILES += \
    device/rockchip/common/bluetooth/realtek/bt/firmware/rtl8723au/rtk8723a:system/etc/firmware/rtk8723a \
    device/rockchip/common/bluetooth/realtek/bt/firmware/rtl8723au/rtk8723_bt_config:system/etc/firmware/rtk8723_bt_config
endif

BT_FIRMWARE_FILES := $(shell ls $(CUR_PATH)/lib/firmware)
PRODUCT_COPY_FILES += \
    $(foreach file, $(BT_FIRMWARE_FILES), $(CUR_PATH)/lib/firmware/$(file):system/vendor/firmware/$(file))

include device/rockchip/common/bluetooth/console_start_bt/console_start_bt.mk

