//
//  Bullet.h
//  TJR_Final
//
//  Created by default on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Bullet : UIView
{
    CGPoint myVector;
    CGPoint myOrigin;
    CGFloat myAngle;
    BOOL left;
    NSNotification *myNotification;

    UIBezierPath *aPath;
}
-(id)initWithFrame:(CGRect)frame WithOrigin:(CGPoint) bulletOrigin WithVector: (CGPoint)bulletVector;
-(void) doLayout;
-(void) getAngle;
-(void) update;
-(void) startMoving;


@end
