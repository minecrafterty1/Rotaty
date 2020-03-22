ARCHS = arm64 arm64e
TARGET = iphone:13.1:13.1

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Rotaty

Rotaty_FILES = Tweak.xm
Rotaty_CFLAGS = -fobjc-arc
Rotaty_Framworks = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += rotatypreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
