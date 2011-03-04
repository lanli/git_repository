//
//  IVBrickerAppDelegate.h
//  IVBricker
//
//  Created by Lanli on 2011/3/4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IVBrickerViewController;

@interface IVBrickerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet IVBrickerViewController *viewController;

@end
