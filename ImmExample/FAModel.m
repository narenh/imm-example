//
//  FAModel.m
//  ImmExample
//
//  Created by Fritz Anderson on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FAModel.h"

@interface FAModel ()
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
