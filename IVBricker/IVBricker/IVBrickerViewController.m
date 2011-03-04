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

- (void)dealloc
{
    //@add
    [scoreLabel release];
    
    [super dealloc];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    //@add
    self.scoreLabel = nil;
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
    //score = 7.0;
    scoreLabel.text = [NSString stringWithFormat:@"%5d", score];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
