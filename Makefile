ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:latest
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Rotaty

Rotaty_FILES = Tweak.xm
Rotaty_CFLAGS = -fobjc-arc
Rotaty_Framworks = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += rotaty
include $(THEOS_MAKE_PATH)/aggregate.mk
