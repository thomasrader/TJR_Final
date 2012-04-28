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
    NSMutableArray *bulletList;
    Hero *myHero;
    BOOL fired;
    BOOL p1turn;
    BOOL vsP;
    NSInteger p1Score;
    NSInteger p2Score;
    NSNotificationCenter * myNotificationCenter;
}

-(CGPoint) getAngle:(NSSet*)touches;
-(void) bulletHit;
-(BOOL) hitTest: (UIView*) one with: (UIView*) two;
-(void) swapPlayers;
-(void) fireBullet: (CGPoint) tappedPoint;
-(void) moveTank;

@property (nonatomic, weak) IBOutlet UILabel *turnLabel;
@property (nonatomic, weak) IBOutlet UILabel *p1Label;
@property (nonatomic, weak) IBOutlet UILabel *p2Label;
@property (nonatomic, weak) IBOutlet UISwitch *pvpSwitch;




@end
