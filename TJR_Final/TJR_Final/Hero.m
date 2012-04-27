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
    bulletFrame = CGRectMake(0.0,0.0,20.0,20.0);
}

-(Bullet* ) fireBullet:(NSSet*) touch
{
    //touch has where the touch was, this will come from touchesEnded
    CGPoint bulletOrigin = CGPointMake(self.frame.origin.x+40, self.frame.origin.y-20);
    CGPoint bulletVector = [self createVector: touch];
    Bullet *newBullet = [[Bullet alloc] initWithFrame:bulletFrame WithOrigin: bulletOrigin WithVector:bulletVector ];
    [self addSubview: newBullet];
    //NSLog(@"Fire!!");
    return newBullet;
}

-(CGPoint) createVector: (NSSet*) touch
{
    CGPoint tappedPoint = [[touch anyObject] locationInView: self];
    return tappedPoint;

    
}

-(void) updateBarrel: (NSSet *) touch
{
    CGPoint tappedPoint = [self createVector:touch];
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
