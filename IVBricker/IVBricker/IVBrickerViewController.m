//
//  IVBrickerViewController.m
//  IVBricker
//
//  Created by Lanli on 2011/3/4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "IVBrickerViewController.h"

@implementation IVBrickerViewController

//@add
@synthesize scoreLabel;
@synthesize ball;
@synthesize paddle;

- (void)dealloc
{
    //@add
    [scoreLabel release];
    [ball release];
    [paddle release];
    
    [super dealloc];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    //@add
    self.scoreLabel = nil;
    self.ball = nil;
    self.paddle = nil;
}

//@add
/*
- (void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    float newX = paddle.center.x + (acceleration.x * 12);
    if (newX > 30 || newX < 290) {
        paddle.center = CGPointMake(newX, paddle.center.y);
    }
}
*/

//@add
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    touchOffset = paddle.center.x - [touch locationInView:touch.view].x;
}

//@add
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    float distanceMoved = ([touch locationInView:touch.view].x + touchOffset) - paddle.center.x;
    float newX = paddle.center.x +distanceMoved;
    
    if (newX > 30 && newX < 290) {
        paddle.center = CGPointMake(newX, paddle.center.y);
    }
    else if(newX > 290) {
        paddle.center = CGPointMake(290, paddle.center.y);
    }
    else if (newX < 30) {
        paddle.center = CGPointMake(30, paddle.center.y);
    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    //@add
    /*
    UIAccelerometer *theAccel = [UIAccelerometer sharedAccelerometer];
    theAccel.updateInterval = 1.0f / 30.0f;
    theAccel.delegate = self;
    */
    
    //@add
    ballMovement = CGPointMake(4, 4);
    [self initializeTimer];
    
    //score = 7.0;
    scoreLabel.text = [NSString stringWithFormat:@"%5d", score];
    
}

//@add
- (void)initializeTimer {
    float theInterval = 1.0 / 30.0;
    [NSTimer scheduledTimerWithTimeInterval:theInterval 
                                     target:self 
                                   selector:@selector(animateBall:) 
                                   userInfo:nil 
                                    repeats:YES];
}

//@add
-(void)animateBall:(NSTimer *)theTimer {
    ball.center = CGPointMake(ball.center.x + ballMovement.x, ball.center.y + ballMovement.y);
    
    BOOL paddleCollision = (ball.center.y >= paddle.center.y - 16 && 
                            ball.center.y <= paddle.center.y + 16 && 
                            ball.center.x > paddle.center.x -32 && 
                            ball.center.x < paddle.center.x + 32);
    
    if (paddleCollision) {
        ballMovement.y = -ballMovement.y;
        
        if (ball.center.y >= paddle.center.y - 16 && ballMovement.y < 0) {
            ball.center = CGPointMake(ball.center.x, paddle.center.y - 16);
        } else if (ball.center.y <= paddle.center.y + 16 && ballMovement.y > 0) {
            ball.center = CGPointMake(ball.center.x, paddle.center.y + 16);
        } else if (ball.center.x >= paddle.center.x - 32 && ballMovement.x < 0) {
            ball.center = CGPointMake(paddle.center.x -32, ball.center.y);
        } else if (ball.center.x <= paddle.center.x + 32 && ballMovement.x > 0) {
            ball.center = CGPointMake(paddle.center.x + 32, ball.center.y);
        }
        
        
        
        
    }
    
    
    if (ball.center.x > 300 || ball.center.x < 20) {
        ballMovement.x = -ballMovement.x;
    }
    
    if (ball.center.y > 440 || ball.center.y < 40) {
        ballMovement.y = -ballMovement.y;
    }    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
