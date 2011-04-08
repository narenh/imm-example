//
//  FAModel.h
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

#import <Foundation/Foundation.h>

/** Sample class for a component's model.
 
 FAModel simulates a damped simple harmonic oscillator. It takes initial conditions
 (position, speed, tension, drag) and integrates speed and position as a "clock" 
 advances the simulation.
 
 All units are completely arbitrary.
 */

@interface FAModel : NSObject {
    
}

///	\name Initial conditions
//@{
///	Initial value of the oscillator's position.
@property(nonatomic, assign) double		sZero;
///	Initial value of the oscillator's speed.
@property(nonatomic, assign) double		sDotZero;
//@}

/// \name Simulation constants
//@{
///	The amount of force exerted on the oscillator.
///	It is a constant of proportionality, to be multiplied 
///	by the current position.
///	Tension is expressed as a positive number, even though the force
///	is in the opposite direction from position.
///	\todo Enforce tension >= 0
@property(nonatomic, assign) double		tension;
///	The damping constant, or drag on the oscillator's motion.
///	Drag is a force proportional, and opposite, to the current velocity.
///	It is expressed as a positive number.
///	\todo Enforce drag >= 0
@property(nonatomic, assign) double		drag;
///	The amount of time a "tick" advances the simulation.
///	\todo Enforce increment > 0
@property(nonatomic, assign) double		increment;
//@}

/// \name Simulation state
//@{
///	The derived position of the oscillator at the current time.
@property(nonatomic, readonly) double	s;
///	The derived speed of the oscillator at the current time.
@property(nonatomic, readonly) double	sDot;
///	The derived time of the simulation.
///	It advances from zero (upon reset), by increment steps, once per call to tick.
@property(nonatomic, readonly) double	t;
//@}

///	Reinitialize the model.
///	Sets all simulation constants and conditions to 0, then calls reset
///	to zero out t and and the simulation state.
- (void) zeroOut;

///	Restore the model to time zero.
///	\c t becomes 0.0, \c s becomes \c sZero, and \c sDot, \c sDotZero.
///	Simulation constants and initial conditions are not affected.
- (void) reset;

///	Advance the simulation.
///	Integrates the tension and drag into the next iteration of \c s and \c sDot,
///	over the period of time \c increment. \c t is incremented by \c increment.
- (double) tick;

@end
