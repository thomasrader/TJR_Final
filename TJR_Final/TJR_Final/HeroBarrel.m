//
//  HeroBarrel.m
//  TJR_Final
//
//  Created by default on 4/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HeroBarrel.h"

@implementation HeroBarrel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        myColor = [UIColor greenColor];
    }
    return self;
}
-(void) setColor:(UIColor *)newColor
{
    myColor = newColor;
}
-(void) reDraw{
    [self drawRect: self.bounds];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [[UIColor blackColor] setStroke];
    [myColor  setFill];
    CGRect myRect = CGRectMake(0, 0, 15, 50);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:myRect ];
    
    aPath.lineWidth = 5;
    [aPath fill];
    [aPath stroke];
    [self setNeedsDisplay];
}


@end
