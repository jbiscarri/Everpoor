//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Joan on 08/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

- (UINavigationController*)wrappedInNavigation{
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:self];
    return nv;
}

@end
