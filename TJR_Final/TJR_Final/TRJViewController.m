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
    
	//create array of tanks
    tankList = [[NSMutableArray alloc] init];

    CGRect frame = CGRectMake(0.,0.,100.,100.);
    for(int i=0; i<6; i++)
    {

        tank *newTank = [[tank alloc] initWithFrame:frame];
        [tankList addObject: newTank];
        
        //update tank's color (well alpha?)
       [newTank changeColor:(NSInteger) [tankList count]];
        NSLog(@"tank count = %d", (NSInteger) [tankList count]);
        [self.view addSubview:newTank];
    
        
        // update frame
        CGRect oldFrame = frame;
        oldFrame.origin.x += 25*i;
        oldFrame.origin.y += 25*i;
        frame = oldFrame;
    }
    
    //create and add Hero
    CGRect heroFrame = CGRectMake(125, 370, 100,100);
    Hero *myHero = [[Hero alloc] initWithFrame:heroFrame];
    [self.view addSubview:myHero];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touchesBegan");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touchesMoved");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touchesEnded");
}

@end
