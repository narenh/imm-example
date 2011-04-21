//
//  MZNHController.m
//  ImmExample
//
//  Created by Naren Hazareesingh on 4/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MZNHController.h"


@implementation MZNHController

-(void)viewDidLoad {
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc]
												   initWithTarget:self action:@selector(hideInfo)];
	[singleTapRecognizer setNumberOfTapsRequired:1];
	[singleTapRecognizer setDelegate:self];
	[infoView addGestureRecognizer:singleTapRecognizer];
	[singleTapRecognizer release];
    
    bodies = [[MZNHCelestialBody celestialBodiesFromPlist:@"CelestialBodyData"] retain];
    bodyViews = [[NSMutableArray alloc] init];
    //MZNHCelestialBody *body;
    for (int i=0;i<[bodies count];i++) {
        MZNHCelestialBody *body = [bodies objectAtIndex:i];
        UIButton *theView = [[UIButton alloc] initWithFrame:CGRectMake(body.origin.x, body.origin.y, body.radius, body.radius)];
        //[theView setImage:[UIImage imageNamed:@"planet.png"] forState:UIControlStateNormal];
        [theView setImage:body.image forState:UIControlStateNormal];
        theView.adjustsImageWhenHighlighted = NO;
        [theView addTarget:self action:@selector(displayInfo:) forControlEvents:UIControlEventTouchUpInside];
        theView.tag = i;
        
        [self.view addSubview:theView];
        [bodyViews addObject:theView];
        [theView release];
    }
    
}

- (void)dealloc {
    [infoView release];
    [timeScale release];
    [startButton release];
    [nameLabel release];
    [tempLabel release];
    [bodies release];
    [bodyViews release];
    [super dealloc];
}

- (IBAction)animate:(id)sender {
}

- (void)displayInfo:(id)sender {
    UIButton* button = (UIButton *)sender;
    if (infoView.tag==button.tag && !infoView.hidden) infoView.hidden=YES;
    else {
        float maxX = 320-infoView.frame.size.width;
        float maxY = 480-infoView.frame.size.height;
        MZNHCelestialBody *body = [bodies objectAtIndex:button.tag];
        [infoView setFrame:CGRectMake(MIN(button.frame.origin.x + body.radius*.8 + 2,maxX),
                                      MIN(button.frame.origin.y + body.radius*.8 + 2,maxY),
                                      infoView.frame.size.width,
                                      infoView.frame.size.height)];
        infoView.tag = button.tag;
        nameLabel.text = body.name;
        tempLabel.text = [NSString stringWithFormat:@"%.1f", body.surface_temp];
        
        [self.view bringSubviewToFront:infoView];
        infoView.hidden=NO;
    }
}
- (void)hideInfo {
    infoView.hidden=YES;
}
@end
