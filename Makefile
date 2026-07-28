ARCHS = arm64 arm64e
TARGET = iphone:clang:15.0:15.0
INSTALL_TARGET_PROCESSES = 填写你的APP进程名

include $(THEOS)/makefiles/common.mk
TWEAK_NAME = PopNotice
PopNotice_FILES = Tweak.x
PopNotice_CFLAGS = -fobjc-arc
include $(THEOS_MAKE_PATH)/tweak.mk
