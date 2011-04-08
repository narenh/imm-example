//
//  FAModel.m
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

#import "FAModel.h"

@interface FAModel ()
///	\private
@property(nonatomic, assign) NSUInteger		index;
@end

@implementation FAModel

@synthesize s, sDot, sZero, sDotZero, increment, index, tension, drag;

- (id) init
{
	self = [super init];
	if (self) {
		increment = 0.01;
		index = 0;
	}
	
	return self;
}

- (double) t { return index * self.increment; }

- (void) zeroOut
{
	self.sZero = 0.0;
	self.sDotZero = 0.0;
	self.tension = 0.0;
	self.drag = 0.0;
	[self reset];
}

- (void) reset
{
	self.index = 0;
	s = self.sZero;
	sDot = self.sDotZero;
}

- (double) tick
{
	double		acceleration = -self.s * self.tension - self.sDot * drag;
	sDot = self.sDot + self.increment * acceleration;
	s = self.s + self.increment * self.sDot;
	
	self.index++;
	
	return self.s;
}


@end
