//
//  ImExController.h
//  ImmExample
//
//  Created by Fritz Anderson on 4/7/11.
//  Copyright 2011 Trustees of the University of Chicago. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**	Abstract superclass of the embedded view controllers.
 
 Note well that ImExController is \i not a subclass of UIViewController.
 UIKit does not like more than one UIViewController active in a window. This
 is okay, because other objects can link up with NIB objects.
 
 ImExController relies on there being a NIB file in the main bundle with
 a base name equal to the name of the ImExController being instantiated,
 and of course the suffix .nib. -init will assert if such a NIB cannot
 be loaded.
 */

@interface ImExController : NSObject {
    
}

///	The view this object controls.
@property(nonatomic, retain) IBOutlet UIView *	view;

- (void) viewDidLoad;	//	FIXME: Can this be done by subclass inits?

@end
