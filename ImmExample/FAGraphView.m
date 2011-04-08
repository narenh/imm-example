//
//  FAGraphView.m
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

#import "FAGraphView.h"

#define VALUE_MIN	-100.0
#define VALUE_MAX	100.0
#define VALUE_RANGE	(VALUE_MAX - VALUE_MIN)
#define VALUE_MID	((VALUE_MAX + VALUE_MIN) / 2.0)

@implementation FAGraphView

@synthesize delegate, pixelsPerIteration;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		pixelsPerIteration = 1.0;
    }
    return self;
}

- (void) awakeFromNib
{
	pixelsPerIteration = 1.0;
}

- (void) setPixelsPerIteration: (double) newPixelsPerIteration
{
	if (newPixelsPerIteration != pixelsPerIteration) {
		pixelsPerIteration = newPixelsPerIteration;
		[self setNeedsDisplay];
	}
}

- (void) drawRect: (CGRect) rect
{
	//	Reset the delegate's clock for iteration.
	[self.delegate resetIterationForGraph: self];
	
	CGContextRef	context = UIGraphicsGetCurrentContext();
	CGRect			bounds = self.bounds;
	
	//	Fill my rect with white
	[[UIColor whiteColor] setFill];
	CGContextFillRect(context, bounds);
	
	CGContextTranslateCTM(context, 0.0, CGRectGetMidY(bounds));
	CGContextScaleCTM(context, 1.0, -VALUE_RANGE / bounds.size.height);
	
	//	Across my width (stepping by pixelsPerIteration...
	BOOL			firstPass = YES;
	NSUInteger		steps = round(bounds.size.width / self.pixelsPerIteration);
	for (NSUInteger index = 0; index < steps; index++) {
		//	x = the index'th step
		CGFloat		abscissa = CGRectGetMinX(bounds) + index * self.pixelsPerIteration;
		//	y = the value for the next tick from the delegate
		CGFloat		ordinate = [self.delegate nextValueForGraph: self];
				
		//	Pin it to the value range
		if (ordinate > VALUE_MAX)
			ordinate = VALUE_MAX;
		if (ordinate < VALUE_MIN)
			ordinate = VALUE_MIN;
				
		//	At the first pass, set the "pen" down at the first value;
		//	at subsequent passes, move the "pen" to the next point.
		if (firstPass)
			CGContextMoveToPoint(context, abscissa, ordinate);
		else
			CGContextAddLineToPoint(context, abscissa, ordinate);
		firstPass = NO;
	}
	//	Stroke the graph in black.
	[[UIColor blackColor] setStroke];
	CGContextStrokePath(context);
}

- (void) dealloc
{
    [super dealloc];
}

@end
