//
//  ImmExampleViewController.m
//  ImmExample
//
//  Created by Fritz Anderson on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImmExampleViewController.h"
#import "ImExController.h"

NSArray *		gExampleControllerNames	= nil;

@interface ImmExampleViewController ()
///	An array of ImExController objects.
@property(nonatomic, retain) NSMutableArray *			controllers;
@end


@implementation ImmExampleViewController
@synthesize scrollView, toolbar;
@synthesize controllers;

+ (void) initialize
{
	//	On first reference to this class, fill the global array of controller class names.
	if (! gExampleControllerNames) {
		gExampleControllerNames = [[NSArray alloc] initWithObjects:
							   @"FAExampleController",
							   nil];
	}
}

- (void) dealloc
{
	[scrollView release];
	[toolbar release];
	[controllers release];
    [super dealloc];
}

- (void) didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void) viewDidLoad
{
    [super viewDidLoad];
	
	self.controllers = [NSMutableArray array];
	
	CGRect			totalContentRect = self.scrollView.bounds;
	totalContentRect.size.height = 0;
	
	for (NSString * name in gExampleControllerNames) {
		//	Instantiate each controller from its name.
		Class				controllerClass = NSClassFromString(name);
		NSAssert2(controllerClass, @"%s: Can't get class %@", __PRETTY_FUNCTION__, name);
		ImExController *	controller = [[controllerClass alloc] init];
		
		//	Calculate the view's size and position in the scroller.
		CGRect				viewFrame = controller.view.frame;
		viewFrame.origin.x = CGRectGetMinX(totalContentRect);
		viewFrame.origin.y = CGRectGetMaxY(totalContentRect);
		viewFrame.size.width = totalContentRect.size.width;
		
		//	Set the size and position and add the view to the scroller.
		controller.view.frame = viewFrame;
		[self.scrollView addSubview: controller.view];
		
		//	Increment the bounding rectangle.
		totalContentRect.size.height = CGRectGetMaxY(viewFrame);
		[self.controllers addObject: controller];
		[controller release];
	}
	//	Make the scrolling area correspond to the bounding rect.
	self.scrollView.contentSize = totalContentRect.size;
}

- (void) viewDidUnload
{
	self.controllers = nil;
	[self setScrollView:nil];
	[self setToolbar:nil];
    [super viewDidUnload];
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
