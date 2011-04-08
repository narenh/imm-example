//
//  ImExController.m
//  ImmExample
//
//  Created by Fritz Anderson on 4/7/11.
//  Copyright 2011 Trustees of the University of Chicago. All rights reserved.
//

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
