//
//  tank.m
//  TJR_Final
//
//  Created by default on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "tank.h"
#import "Bullet.h"

@implementation tank

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
    self.backgroundColor = [UIColor blackColor];

}

-(void) changeColor: (NSInteger) tanksMade
{
    CGFloat newAlpha = .1 + .5/tanksMade;
    self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:newAlpha];

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
