//
//  TRJAppDelegate.h
//  TJR_Final
//
//  Created by default on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRJAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

/*
 Fun game. I like the random aspect of the tank's movement, and you used simple
 drawing methods effectively.
 
 I took the liberty of fixing some of your performance problems, which were
 caused by double-drawing (an extra setNeedsDisplay) and needless reallocation of
 memory in your drawRect functions. Preallocating the UIBezierPath actually saves
 a ton of CPU time, which allowed me to increase the frame rate, too. I noticed
 sometimes my touches would turn the turret but never fire, but I didn't take the
 time to track that bug down.
 
 Grade: 100%
 Course grade: 98% (A)
*/