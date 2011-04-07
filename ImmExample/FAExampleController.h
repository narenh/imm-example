//
//  FAExampleController.h
//  ImmExample
//
//  Created by Fritz Anderson on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImExController.h"
#import "FAGraphView.h"

@class FAModel;

@interface FAExampleController : ImExController <FAGraphViewDelegate>
{
	UISlider *tensionSlider;
	UISlider *dragSlider;
	UISlider *positionSlider;
	UISlider *speedSlider;
	FAGraphView *graphView;
}
@property (nonatomic, retain) IBOutlet UISlider *tensionSlider;
@property (nonatomic, retain) IBOutlet UISlider *dragSlider;
@property (nonatomic, retain) IBOutlet UISlider *positionSlider;
@property (nonatomic, retain) IBOutlet UISlider *speedSlider;
@property (nonatomic, retain) IBOutlet FAGraphView *graphView;

@property(nonatomic, retain) IBOutlet FAModel *		model;


- (IBAction)changeTension:(id)sender;
- (IBAction)changeDrag:(id)sender;
- (IBAction)changeInitialPosition:(id)sender;
- (IBAction)changeInitialSpeed:(id)sender;
- (IBAction)doReset:(id)sender;

@end
