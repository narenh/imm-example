//
//  FAModel.h
//  ImmExample
//
//  Created by Fritz Anderson on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FAModel : NSObject {
    
}

@property(nonatomic, assign) double		sZero;
@property(nonatomic, assign) double		sDotZero;

@property(nonatomic, readonly) double	s;
@property(nonatomic, readonly) double	sDot;

@property(nonatomic, assign) double		tension;
@property(nonatomic, assign) double		drag;

@property(nonatomic, assign) double		increment;
@property(nonatomic, readonly) double	t;

- (double) tick;
- (void) reset;
- (void) zeroOut;

@end
