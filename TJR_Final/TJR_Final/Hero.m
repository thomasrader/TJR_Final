//
//  Hero.m
//  TJR_Final
//
//  Created by default on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Hero.h"
#import "Bullet.h"

@implementation Hero

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self doLayout];
    }
    return self;
}



-(void) doLayout
{
    self.backgroundColor = [UIColor grayColor];
    bulletFrame = CGRectMake(0.0,0.0,10.0,10.0);
    CGRect barrelFrame = CGRectMake(self.frame.origin.x+(self.frame.size.width/2)-7.5, self.frame.origin.y-20, 15.0, 50.0);
    myBarrel = [[HeroBarrel alloc] initWithFrame: barrelFrame];
    
    
}

-(Bullet* ) fireBullet:(CGPoint) tappedPoint
{
    //touch has where the touch was, this will come from touchesEnded
    CGPoint bulletOrigin = CGPointMake(self.frame.origin.x+40, self.frame.origin.y-20);
    Bullet *newBullet = [[Bullet alloc] initWithFrame:bulletFrame WithOrigin: bulletOrigin WithVector:tappedPoint ];
    [self addSubview: newBullet];
    //NSLog(@"Fire!!");
    return newBullet;
}



-(void) updateBarrel: (CGPoint) tappedPoint
{

    CGFloat opposite =  fabsf(tappedPoint.y - myBarrel.frame.origin.y);
    CGFloat adjacent = fabsf(tappedPoint.x - myBarrel.frame.origin.x);
    if(tappedPoint.x >=myBarrel.frame.origin.x)

    CGFloat myAngle = atanf(opposite/adjacent);
  //  NSLog(@"%f",myAngle);
    
    //reset barrel
    myBarrel.frame = CGRectMake(self.frame.origin.x+(self.frame.size.width/2)-7.5,
                                self.frame.origin.y-20, 15.0, 50.0);

    
}
-(HeroBarrel*) getBarrel{
    return myBarrel;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
