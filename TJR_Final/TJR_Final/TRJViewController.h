//
//  TRJViewController.h
//  TJR_Final
//
//  Created by default on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Hero;


@interface TRJViewController : UIViewController{
    NSMutableArray *tankList;
    Hero *myHero;
    BOOL fired;
}

-(CGPoint) getAngle:(NSSet*)touches;

/*
Todo List:
 Multiplayer
 AI
 Shooting
 Target Moving
 Animations
 Notification center for bullet hitting
 
*/


@end
