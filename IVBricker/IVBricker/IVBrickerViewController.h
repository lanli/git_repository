//
//  IVBrickerViewController.h
//  IVBricker
//
//  Created by Lanli on 2011/3/4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IVBrickerViewController : UIViewController {
//@interface IVBrickerViewController : UIViewController <UIAccelerometerDelegate> {
    //@add
    int score;
    float touchOffset;
    UILabel *scoreLabel;
    UIImageView *ball;
    UIImageView *paddle;
    CGPoint ballMovement;
    

}

//@add
@property (nonatomic, retain) IBOutlet UILabel *scoreLabel;
@property (nonatomic, retain) IBOutlet UIImageView *ball;
@property (nonatomic, retain) IBOutlet UIImageView *paddle;

- (void)initializeTimer;
- (void)animateBall:(NSTimer *) theTimer;

@end
