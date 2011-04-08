//
//  FAExampleController.h
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
#import "ImExController.h"
#import "FAGraphView.h"

@class FAModel;

/**	An example controller object mediating the UI and model for a simulation of a damped harmonic oscillator.
 
 FAExampleController watches four sliders that set the constants and initial conditions
 for the oscillator, updates the simulation, and tells its graph view to refresh.
 In the course of redrawing, the graph view pulls position data from the simulator
 through the controller.
 */
@interface FAExampleController : ImExController <FAGraphViewDelegate>
{
	UISlider *tensionSlider;
	UISlider *dragSlider;
	UISlider *positionSlider;
	UISlider *speedSlider;
	FAGraphView *graphView;
}

///	\name IBOutlets
//@{
@property (nonatomic, retain) IBOutlet UISlider *tensionSlider;	///< Slider to set tension.
																///
@property (nonatomic, retain) IBOutlet UISlider *dragSlider;	///< Slider to set drag.
																///
@property (nonatomic, retain) IBOutlet UISlider *positionSlider;	///< Slider to set the oscillator's initial position.
																	///
@property (nonatomic, retain) IBOutlet UISlider *speedSlider;	///< Slider to set the oscillator's initial velocity.
																///
@property (nonatomic, retain) IBOutlet FAGraphView *graphView;	///< The output graph.
																///

///	The simulation engine.
///	This is an IBOutlet so it can be instantiated in \c FAExampleController.nib.
@property(nonatomic, retain) IBOutlet FAModel *		model;
//@}


///	\name IBActions
//@{
- (IBAction)changeTension:(id)sender;	///<	Respond to the tension slider.
- (IBAction)changeDrag:(id)sender;		///<	Respond to the drag slider.
- (IBAction)changeInitialPosition:(id)sender;	///<	Respond to the initial-position slider.
- (IBAction)changeInitialSpeed:(id)sender;	///<	Respond to the initial-velocity slider.
- (IBAction)doReset:(id)sender;			///<	Respond to a button by zeroing-out the simulator.
//@}

@end
