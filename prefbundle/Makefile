include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = rotaty

rotaty_FILES = XXXRootListController.m
rotaty_INSTALL_PATH = /Library/PreferenceBundles
rotaty_FRAMEWORKS = UIKit
rotaty_PRIVATE_FRAMEWORKS = Preferences
rotaty_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/prefbundle.plist$(ECHO_END)
