//
//  Bullet.m
//  TJR_Final
//
//  Created by default on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Bullet.h"
#import "math.h"



@implementation Bullet

- (id)initWithFrame:(CGRect)frame WithOrigin:(CGPoint) bulletOrigin WithVector: (CGPoint) bulletVector;
{
    CGRect oldFrame = frame;
    oldFrame.origin.x = bulletOrigin.x;
    oldFrame.origin.y = bulletOrigin.y;
    frame = oldFrame;
    self = [super initWithFrame:frame];
    if (self) {
        [self doLayout];
        myVector = bulletVector;
        myOrigin = bulletOrigin;
        [self getAngle];
        [self startMoving];
        
        CGRect myRect = CGRectMake(0, 0, 10, 10);
        aPath = [UIBezierPath bezierPathWithOvalInRect:myRect];
        aPath.lineWidth = 2;
    }
    return self;
}

-(void) doLayout
{
    self.backgroundColor = [UIColor clearColor];

}

-(void) getAngle
{
    CGFloat opposite =  fabsf(myVector.y - myOrigin.y);
    CGFloat adjacent = fabsf(myVector.x - myOrigin.x);
    if(myVector.x >=myOrigin.x)
    {
        left = FALSE;
    }else{
        left = TRUE;
    }
    myAngle = atanf(opposite/adjacent);
    
    
}

-(void) update
{
    CGFloat speed = 1.0;
    CGRect newFrame;
    
    newFrame = self.frame;
    if(left){
        newFrame.origin.x = newFrame.origin.x - fabsf(speed*cos(myAngle));
    }else{
        newFrame.origin.x = newFrame.origin.x + fabsf(speed*cos(myAngle));
    }
    
    newFrame.origin.y = newFrame.origin.y - fabsf(speed*sin(myAngle));
    self.frame = newFrame;
    


        
    
    
    
}

-(void) startMoving
{
    [NSTimer scheduledTimerWithTimeInterval:0.020 target:self
                                selector:@selector(update) userInfo:nil repeats:YES];
    
}





// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [[UIColor redColor] set];
    [aPath stroke];
    [[UIColor orangeColor] set];   
    [aPath fill];
}

@end
