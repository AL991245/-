ARCHS = arm64
TARGET = iphone:clang:16.5:15.0
INSTALL_TARGET_PROCESSES = App

TWEAK_NAME = PopPlugin

PopPlugin_FILES = Tweak.x
PopPlugin_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/common.mk
include $(THEOS)/makefiles/tweak.mk
