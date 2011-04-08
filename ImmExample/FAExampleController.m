//
//  FAExampleController.m
//  ImmExample
//
//  Created by Fritz Anderson on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FAExampleController.h"
#import "FAModel.h"

#define TENSION_MIN		0.0
#define TENSION_MAX		100.0

#define DRAG_MIN		0.0
#define DRAG_MAX		10.0

#define POSITION_MIN	-100.0
#define POSITION_MAX	100.0

#define SPEED_MIN		-50.0
#define SPEED_MAX		50.0

@implementation FAExampleController

@synthesize tensionSlider;
@synthesize dragSlider;
@synthesize positionSlider;
@synthesize speedSlider;
@synthesize graphView;
@synthesize model;

- (void) dealloc
{
	[model release];
    [tensionSlider release];
    [dragSlider release];
    [positionSlider release];
    [speedSlider release];
	[graphView release];
	[super dealloc];
}

#pragma mark -
#pragma mark FAGraphViewDelegate

- (void) resetIterationForGraph: (FAGraphView *) graph
{
	[self.model reset];
}

- (double) nextValueForGraph: (FAGraphView *) graph
{
	return [self.model tick];
}

- (void) viewDidLoad
{
	double		val;
	
#define SET_SLIDER(min, max, control, property) \
	val = self.model.property; \
	val = (val - min) / (max - min); \
	self.control.value = val;
	
	SET_SLIDER(TENSION_MIN, TENSION_MAX, tensionSlider, tension);
	SET_SLIDER(DRAG_MIN, DRAG_MAX, dragSlider, drag);
	SET_SLIDER(POSITION_MIN, POSITION_MAX, positionSlider, sZero);
	SET_SLIDER(SPEED_MIN, SPEED_MAX, speedSlider, sDotZero);
}

#pragma mark -
#pragma mark IBAction

#define CHANGE_BODY(min, max, control, property) \
	double	value = min + [[self control] value] * (max - min); \
	self.model.property = value;

- (IBAction) changeTension: (id) sender {
	CHANGE_BODY(TENSION_MIN, TENSION_MAX, tensionSlider, tension);
}

- (IBAction) changeDrag: (id) sender {
	CHANGE_BODY(DRAG_MIN, DRAG_MAX, dragSlider, drag);
}

- (IBAction) changeInitialPosition: (id) sender {
	CHANGE_BODY(POSITION_MIN, POSITION_MAX, positionSlider, sZero);
}

- (IBAction) changeInitialSpeed: (id) sender {
	CHANGE_BODY(SPEED_MIN, SPEED_MAX, speedSlider, sDotZero);
}


- (IBAction) doReset: (id) sender 
{
	[self.graphView setNeedsDisplay];
}

@end
