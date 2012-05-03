//
//  tank.h
//  TJR_Final
//
//  Created by default on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tank : UIView
{
    UIBezierPath *aPath;
}

-(void) doLayout;
-(void) changeColor:(NSInteger)tanksMade;
-(void) update;
-(void) newSpeed;


@end
