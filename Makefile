ARCHS = arm64
TARGET = iphone:clang:13.1:13.1
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Rotaty

Rotaty_FILES = Tweak.x
Rotaty_CFLAGS = -fobjc-arc
Rotaty_Framworks = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
