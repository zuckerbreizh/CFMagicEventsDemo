//
//  CFAppDelegate.h
//  Copyright (c) 2013 Cédric Floury

#import <UIKit/UIKit.h>
#import "CFMagicEvents.h"

@class CFViewController;

@interface CFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CFViewController *viewController;
@property (strong, nonatomic) CFMagicEvents *cfMagicEvents;

@end
