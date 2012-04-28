//
//  tank.m
//  TJR_Final
//
//  Created by default on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "tank.h"
#import "Bullet.h"

@implementation tank{
    CGFloat mySpeed;
    BOOL left;
}

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
    //change color based on how far back it is
    self.backgroundColor = [UIColor clearColor];
    mySpeed = 2.0;
    left = FALSE;

}

-(void) changeColor: (NSInteger) tanksMade
{
    CGFloat newAlpha = .1 + .5/tanksMade;
   // self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:newAlpha];

}

-(void) update
{
    if((self.frame.origin.x >= 10) &&
       (self.frame.origin.x <= 300) &&  left){
        CGRect newFrame = self.frame;
        newFrame.origin.x -= mySpeed;
        self.frame = newFrame;
        
    }else if((self.frame.origin.x >= 10) &&
           (self.frame.origin.x <= 300) &&  !left){
            CGRect newFrame = self.frame;
            newFrame.origin.x += mySpeed;
            self.frame = newFrame;
        
    }
    
    if(self.frame.origin.x <=20){
        left = false;
        [self newSpeed];
    }else if (self.frame.origin.x >=(300-self.frame.size.width)){
        left = true;
        [self newSpeed];
    }
}

-(void) newSpeed
{
    srand(time(NULL));
    mySpeed = arc4random()%5 * 2;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [[UIColor blackColor] setStroke];
    [[UIColor grayColor] setFill];
    CGRect myRect = CGRectMake(0, 0, 50, 50);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:myRect ];
    
    aPath.lineWidth = 10;
    [aPath fill];
    [aPath stroke];
    [self setNeedsDisplay];
}


@end
