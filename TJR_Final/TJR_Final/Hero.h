//
//  Hero.h
//  TJR_Final
//
//  Created by default on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bullet.h"
#import "HeroBarrel.h"

@interface Hero : UIView
{
        CGRect bulletFrame;
        HeroBarrel *myBarrel;
        BOOL left;
}

-(void) doLayout;
-(Bullet*) fireBullet: (CGPoint) tappedPoint;
-(void) updateBarrel: (CGPoint) tappedPoint;
-(HeroBarrel*) getBarrel;


@end
