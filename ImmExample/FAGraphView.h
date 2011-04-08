//
//  FAGraphView.h
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

#import <UIKit/UIKit.h>

@protocol FAGraphViewDelegate;

/**	A view that draws a simpleminded graph.
 FAGraphView draws a black line from left to right, with the y value determined
 by repeatedly asking a delegate for a double value. The value is pinned to -100...100.
 Each cycle is determined by <code>self.bounds.size.width / self.pixelsPerIteration</code>;
 when the view runs out of pixels, iteration stops, not before and not after.
 
 The graph is scaled so that +100 is at the top of the view, and -100 at the bottom.
 \todo Make the y range of the graph configurable.
 
 When FAGraphView is drawn, it resets its data source to its "origin" state, and then
 iteratively pulls succeeding values from the data source. There is no concept of keeping
 the data; it's all done at \c drawRect: time.
 */
@interface FAGraphView : UIView {
    
}

///	The object that provides the values for each increment of the graph.
@property(nonatomic, assign) IBOutlet id <FAGraphViewDelegate>	delegate;
///	The number of pixels to advance the x axis at each increment of the graph.
@property(nonatomic, assign) double						pixelsPerIteration;

@end

/** A data source for data for FAGraphView.
 The data source is assumed to have a "zero" or "origin" state, and to generate new
 values each time it is asked for them. When FAGraphView is drawn, it resets the
 data source to its initial state, then repeatedly calls \c nextValueForGraph: to
 obtain succeeding values to be graphed.
 */
@protocol FAGraphViewDelegate <NSObject>

///	The receiver should restore itself to its initial condition.
- (void) resetIterationForGraph: (FAGraphView *) graph;

///	The receiver should advance its state.
///	\return The receiver's current value.
- (double) nextValueForGraph: (FAGraphView *) graph;

@end


