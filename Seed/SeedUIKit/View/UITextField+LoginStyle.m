//
//  UITextField+LoginStyle.m
//  Pods
//
//  Created by Ryan Wang on 15/5/11.
//
//

#import "UITextField+LoginStyle.h"
#import "UIView-Geometry.h"

@implementation UITextField (LoginStyle)

- (void)applyLoginStyleWithLeftImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *leftView = [[UIImageView alloc] initWithImage:image];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
    [self drawBottomLine];
}

- (void)drawBottomLine {
    UIView *bottomLine = [[UIView alloc] initWithFrame:self.bounds];
    bottomLine.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    bottomLine.backgroundColor = [UIColor lightGrayColor];
    bottomLine.frame = self.bounds;
    bottomLine.height = 1;
    bottomLine.bottom = self.height;
    [self addSubview:bottomLine];
}

@end
