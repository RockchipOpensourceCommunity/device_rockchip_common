CUR_PATH := device/rockchip/common/app
PRODUCT_PACKAGES += \
    Rtk \
    librtk.so
PRODUCT_COPY_FILES += \
	$(CUR_PATH)/rtk/cifsmount:system/bin/cifsmount \
    $(CUR_PATH)/rtk/rtkhelper:system/bin/rtkhelper \
    $(CUR_PATH)/rtk/librtk.so:system/lib/librtk.so
