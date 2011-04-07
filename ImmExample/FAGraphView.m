//
//  FAGraphView.m
//  ImmExample
//
//  Created by Fritz Anderson on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FAGraphView.h"


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

- (void) setPixelsPerIteration: (double) newPixelsPerIteration
{
	if (newPixelsPerIteration != pixelsPerIteration) {
		pixelsPerIteration = newPixelsPerIteration;
		[self setNeedsDisplay];
	}
}

- (void) drawRect: (CGRect) rect
{
	[self.delegate resetIterationForGraph: self];
	
	CGContextRef	context = UIGraphicsGetCurrentContext();
	CGRect			bounds = self.bounds;
	
	[[UIColor whiteColor] setFill];
	CGContextFillRect(context, bounds);
	
	BOOL			firstPass = YES;
	NSUInteger		steps = round(bounds.size.width / self.pixelsPerIteration);
	for (NSUInteger index = 0; index < steps; index++) {
		CGFloat		abscissa = CGRectGetMinX(bounds) + index * self.pixelsPerIteration;
		CGFloat		ordinate = [self.delegate nextValueForGraph: self];
		if (firstPass)
			CGContextMoveToPoint(context, abscissa, ordinate);
		else
			CGContextAddLineToPoint(context, abscissa, ordinate);
		firstPass = NO;
	}
	[[UIColor blackColor] setStroke];
	CGContextStrokePath(context);
}

- (void) dealloc
{
    [super dealloc];
}

@end
