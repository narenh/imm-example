//
//  FAGraphView.h
//  ImmExample
//
//  Created by Fritz Anderson on 4/7/11.
//  Copyright 2011 Trustees of the University of Chicago. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FAGraphViewDelegate;

@interface FAGraphView : UIView {
    
}

@property(nonatomic, assign) IBOutlet id <FAGraphViewDelegate>	delegate;
@property(nonatomic, assign) double						pixelsPerIteration;

@end

@protocol FAGraphViewDelegate <NSObject>

- (void) resetIterationForGraph: (FAGraphView *) graph;
- (double) nextValueForGraph: (FAGraphView *) graph;

@end


