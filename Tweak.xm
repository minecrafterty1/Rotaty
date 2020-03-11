#import "Rotaty.h"

float rotateDegree = -15;

%hook SBIconView
-(void)setIcon:(SBIcon *)arg1 {
    %orig;

    //because CGAffineTransformRotate need input by radian, you need to convert from radian to degree:
    CGFloat rotateBy = rotateDegree * pi / 180 ;

    //with animation (causes safe boot when closing/opening apps/folders):
    /*[UIView animateWithDuration:0.5 animations:^{
		self.transform = CGAffineTransformRotate(CGAffineTransformIdentity,rotateBy);
	}
	completion:nil];*/

    //without animation (you might want to do that as well in a different way so it would aply system wide, as well as better animations support. you may need to write a new function that get each icon as a UIimage, transform it, and send it back as the icon itself.):
    [self setTransform:(CGAffineTransformRotate(CGAffineTransformIdentity,rotateBy))];
}
%end