//
//  UINavigationController+Initialize.m
//  Pods
//
//  Created by Ryan Wang on 15/5/10.
//
//

#import "UINavigationController+Initialize.h"

@implementation UINavigationController (Initialize)

+ (instancetype)navigationControllerWithRootViewControllerClass:(Class)aClass{
    UIViewController *viewController = [[aClass alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];

    return navigationController;
}


@end
