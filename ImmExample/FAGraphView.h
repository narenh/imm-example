//
//  FAGraphView.h
//  ImmExample
//
//  Created by Fritz Anderson on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FAGraphViewDelegate;

@interface FAGraphView : UIView {
    
}

@property(nonatomic, assign) id <FAGraphViewDelegate>	delegate;
@property(nonatomic, assign) double						pixelsPerIteration;

@end

@protocol FAGraphViewDelegate <NSObject>

- (void) resetIterationForGraph: (FAGraphView *) graph;
- (double) nextValueForGraph: (FAGraphView *) graph;

@end


