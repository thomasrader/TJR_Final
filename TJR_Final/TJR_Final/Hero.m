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
    self.backgroundColor = [UIColor clearColor];
    myColor = [UIColor greenColor];
    bulletFrame = CGRectMake(0.0,0.0,10.0,10.0);
    CGRect barrelFrame = CGRectMake(self.frame.origin.x+(self.frame.size.width/2)-7.5, self.frame.origin.y-20, 15.0, 50.0);
    myBarrel = [[HeroBarrel alloc] initWithFrame: barrelFrame];
    myBarrel.backgroundColor = [UIColor clearColor];
   // [self addSubview: myBarrel];
    
    
}

-(Bullet* ) fireBullet:(CGPoint) tappedPoint
{
    //touch has where the touch was, this will come from touchesEnded
    CGPoint bulletOrigin;
    if(left)
    {
        bulletOrigin = CGPointMake(myBarrel.frame.origin.x - fabsf(cosf(myAngle)),
                                           myBarrel.frame.origin.y-10*sinf(myAngle));
    }else{
         bulletOrigin = CGPointMake(myBarrel.frame.origin.x + 50*cosf(myAngle),
                                           myBarrel.frame.origin.y - 10* sinf(myAngle));
    }
    

    Bullet *newBullet = [[Bullet alloc] initWithFrame:bulletFrame WithOrigin: bulletOrigin WithVector:tappedPoint ];
    [self addSubview: newBullet];

    return newBullet;
}



-(void) updateBarrel: (CGPoint) tappedPoint
{

    CGFloat opposite =  fabsf(tappedPoint.y - myBarrel.frame.origin.y);
    CGFloat adjacent = fabsf(tappedPoint.x - myBarrel.frame.origin.x);
    if(tappedPoint.x >=myBarrel.frame.origin.x)
    {
        left = FALSE;
    }else{
        left = TRUE;
    }

    myAngle = atanf(opposite/adjacent);
  //  NSLog(@"%f",myAngle);
    
    //reset barrel
    if(left)
    {
            myBarrel.transform = CGAffineTransformMakeRotation(myAngle-M_PI_2);
    }else{
            myBarrel.transform = CGAffineTransformMakeRotation(M_PI_2 - myAngle);
    }


    
}
-(HeroBarrel*) getBarrel{
    return myBarrel;
}

-(void) setColor:(UIColor*) newColor
{
    myColor = newColor;
    [myBarrel setColor: newColor];
}

-(void) reDraw
{
    [self drawRect:self.bounds];
    [myBarrel reDraw];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [[UIColor blackColor] setStroke];
    [myColor setFill];
    CGRect myRect = CGRectMake(0, 0, 50, 75);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath* aPath = [UIBezierPath bezierPathWithRoundedRect:myRect cornerRadius:10];
 
    aPath.lineWidth = 5;
    [aPath fill];
    [aPath stroke];
    [self setNeedsDisplay];
}


@end
