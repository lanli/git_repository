//
//  IVBrickerViewController.h
//  IVBricker
//
//  Created by Lanli on 2011/3/4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IVBrickerViewController : UIViewController {
    //@add
    UILabel *scoreLabel;
    int score;
    
}

//@add
@property (nonatomic, retain) IBOutlet UILabel *scoreLabel;


@end
