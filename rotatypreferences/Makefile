ARCHS = arm64 arm64e
TARGET = iphone:13.1:13.1

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = RotatyPreferences

RotatyPreferences_FILES = SRPLGRootListController.m
RotatyPreferences_INSTALL_PATH = /Library/PreferenceBundles
RotatyPreferences_FRAMEWORKS = UIKit
RotatyPreferences_PRIVATE_FRAMEWORKS = Preferences
RotatyPreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/RotatyPreferences.plist$(ECHO_END)
