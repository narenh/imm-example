//
//  ImExController.m
//  ImmExample
//
//  Created by Fritz Anderson on 4/7/11.
//  Copyright 2011 Trustees of the University of Chicago. All rights reserved.
//

//	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported license.
//	If you use this work (use must be consistent with the license), include the following language
//	in a user-accessible view, either in the application itself; in a panel in a Settings bundle identified
//	with your work; or in distribution labeling (such as package copy or App Store descriptions) that must
//	inevitably be seen by the end user:
///////////////////////////////////////////
//	Portions are copyright by the University of Chicago, and licensed under the Creative Commons
//	Attribution-NonCommercial-ShareAlike 3.0 Unported license. For details, see 
//	http://creativecommons.org/licenses/by-nc-sa/3.0/ and links therefrom.
//	The University of Chicago has provided its work on an "AS-IS" basis, and its work comes with
//	ABSOLUTELY NO WARRANTY, INCLUDING THOSE OF MERCHANTABILITY OR FITNESS FOR ANY PURPOSE.

#import "ImExController.h"


@implementation ImExController

@synthesize view;

- (id) init
{
	self = [super init];
	if (self) {
		//	Load a NIB with the same base name as self's class.
		//	Note well that [self class] will almost certainly not be ImExController.
		NSString *		className = NSStringFromClass([self class]);
		NSArray *		views = [[NSBundle mainBundle] loadNibNamed: className
														 owner: self
													   options: nil];
		NSAssert2(views, @"%s: could not load the nib %@",
				  __PRETTY_FUNCTION__, className);
		
		[self viewDidLoad];
	}
	return self;
}

- (void) viewDidLoad
{
	//	FIXME: Assert calling an abstract method?
}

- (void) dealloc
{
	[view release];
	[super dealloc];
}

@end
