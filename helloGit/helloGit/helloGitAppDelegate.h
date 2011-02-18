//
//  helloGitAppDelegate.h
//  helloGit
//
//  Created by Lanli on 2011/2/18.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class helloGitViewController;

@interface helloGitAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet helloGitViewController *viewController;

@end
