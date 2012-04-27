//
//  Hero.h
//  TJR_Final
//
//  Created by default on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bullet.h"

@interface Hero : UIView
{
        CGRect bulletFrame;
}

-(void) doLayout;
-(Bullet*) fireBullet: (NSSet*) touch;
-(CGPoint) createVector: (NSSet*) touch;
-(void) updateBarrel: (NSSet*) touch;


@end
