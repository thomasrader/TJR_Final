//
//  TRJViewController.m
//  TJR_Final
//
//  Created by default on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TRJViewController.h"
#import "tank.h"
#import "Hero.h"
#import "Bullet.h"


@implementation TRJViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    fired = FALSE;

    
	//create array of tanks and bullets
    tankList = [[NSMutableArray alloc] init];
    bulletList = [[NSMutableArray alloc] init];

    CGRect frame = CGRectMake(120.0,200.0,100.0,100.0);
    for(int i=0; i<1; i++)
    {

        tank *newTank = [[tank alloc] initWithFrame:frame];
        [tankList addObject: newTank];
        
        //update tank's color (well alpha?)
       [newTank changeColor:(NSInteger) [tankList count]];
       // NSLog(@"tank count = %d", (NSInteger) [tankList count]);
        [self.view addSubview:newTank];

    
        
        // update frame
        CGRect oldFrame = frame;
        oldFrame.origin.x += 25*i;
        oldFrame.origin.y += 25*i;
        frame = oldFrame;
    }
    
    //create and add Hero
    CGRect heroFrame = CGRectMake(125, 370, 100,100);
    myHero = [[Hero alloc] initWithFrame:heroFrame];
    [self.view addSubview:myHero];
    [self.view addSubview:[myHero getBarrel]];
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(CGPoint) getAngle:(NSSet*)touches{
    CGPoint tappedPoint = [[touches anyObject] locationInView: self.view];
    return tappedPoint;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	//NSLog(@"touchesBegan");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	//NSLog(@"touchesMoved");

    [myHero updateBarrel:[self getAngle: touches]];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	//NSLog(@"touchesEnded");
    if(!fired){
      //  fired = TRUE;
        Bullet *newBullet = [myHero fireBullet:[self getAngle: touches]];
        [bulletList addObject: newBullet];
        [self.view addSubview: newBullet ];
        [newBullet update];
        
        //start hittesting
        [NSTimer scheduledTimerWithTimeInterval:0.06 target:self
                                       selector:@selector(bulletHit) userInfo:nil repeats:YES];
        
    }
}

-(void)handleNotification:(NSNotification *) newNotification
{
    
}

-(void) bulletHit
{
    for(tank *myTank in tankList)
    {
       // NSLog(@"%f, %f", myTank.frame.origin.x, myTank.frame.origin.y);
       for(Bullet *myBullet in bulletList)
       {
         //  NSLog(@"%f,%f",myBullet.frame.origin.x, myBullet.frame.origin.y);
           if([self hitTest: myTank with: myBullet]){
                NSLog(@"Hit!"); 
               [myBullet removeFromSuperview];
               [bulletList removeObject:myBullet];
           } else if(myBullet.frame.origin.y <1 || myBullet.frame.origin.x <1 || myBullet.frame.origin.x >self.view.frame.size.width){
               [myBullet removeFromSuperview];
               [bulletList removeObject:myBullet];
               
           //    [[Bullet dealloc] myBullet];
           }

       }
    }
    
}

-(BOOL) hitTest: (UIView*) tank with: (UIView*) bullet {
    
    //one will be tank and two will be bullet
    /*if(one.frame.origin.x >= two.frame.origin.x &&
       one.frame.origin.x <= (two.frame.origin.x+two.frame.size.width) &&
       one.frame.origin.y >= two.frame.origin.y &&
       one.frame.origin.y <= (two.frame.origin.y+two.frame.size.height))
       {
           return TRUE;
       }else{
           return FALSE;
       }
     */
    if((bullet.frame.origin.y >= tank.frame.origin.y)
    && (bullet.frame.origin.x >=tank.frame.origin.x)
    && (bullet.frame.origin.x <=(tank.frame.origin.x+tank.frame.size.width))
    && (bullet.frame.origin.y <=(tank.frame.origin.y+tank.frame.size.height)))
    {
        return TRUE;
    } else{
        return FALSE;
    }

}

@end
