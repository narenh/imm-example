//
//  ImmExampleViewController.h
//  ImmExample
//
//  Created by Fritz Anderson on 4/7/11.
//  Copyright 2011 Trustees of the University of Chicago. All rights reserved.
//

#import <UIKit/UIKit.h>

/**	The principal view controller of the ImmExample application.
 
 It manages a scroll view and a toolbar. When it is loaded, ImmExampleViewController
 iterates through gExampleControllerNames, and instantiates objects of the classes
 named there; these are assumed to be subclasses of ImExController. Their views
 are inserted into the scroll view.
 */

@interface ImmExampleViewController : UIViewController {
    
	UIScrollView *scrollView;
	UIToolbar *toolbar;
}

///	The scroll view, instantiated in ImmExampleViewController.nib
@property(nonatomic, retain) IBOutlet UIScrollView *	scrollView;
///	The toolbar, instantiated in ImmExampleViewController.nib
@property(nonatomic, retain) IBOutlet UIToolbar *		toolbar;


@end
