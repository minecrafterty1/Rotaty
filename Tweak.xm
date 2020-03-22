#import "Rotaty.h"

static BOOL isEnabled = NO;
static BOOL shouldAnimate;

static float animDuration;
static float rotateDegree;

static void loadPrefs();

%group enableTweak
%hook SBIconView
-(void)setIcon:(SBIcon *)arg1 {
    %orig;

    //because CGAffineTransformRotate need input by radian, you need to convert from radian to degree:
    CGFloat rotateBy = -1 * ( rotateDegree * pi / 180 ) ;

    if (shouldAnimate == YES) {
        //with animation (causes safe boot when closing/opening apps/folders):
        [UIView animateWithDuration:animDuration animations:^{
            self.transform = CGAffineTransformRotate(CGAffineTransformIdentity,rotateBy);
        }
        completion:nil];
    } else {
        //without animation (you might want to do that as well in a different way so it would aply system wide, as well as better animations support. you may need to write a new function that get each icon as a UIimage, transform it, and send it back as the icon itself.):
        [self setTransform:(CGAffineTransformRotate(CGAffineTransformIdentity,rotateBy))];
    }
}
%end
%end

static void loadPrefs() {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.stoinks.rotatyprefs.plist"];
    if ( [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : isEnabled ) {
        %init(enableTweak);
        shouldAnimate = [[prefs objectForKey:@"shouldAnimate"] boolValue];
        rotateDegree = [[prefs objectForKey:@"rotateDegree"] floatValue];
        animDuration = [[prefs objectForKey:@"animDuration"] floatValue];
    }
}

%ctor {
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.stoinks.rotatyprefs/prefschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}