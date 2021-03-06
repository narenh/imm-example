//
//  ImmExampleAppDelegate.h
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

@class ImmExampleViewController;

///	A bone-stock application delegate for a view-based iPhone application.
@interface ImmExampleAppDelegate : NSObject <UIApplicationDelegate> {

}

///	The application window, instantiated in \c MainWindow.xib.
@property (nonatomic, retain) IBOutlet UIWindow *window;

///	The main view controller, instantated in \c MainWindow.xib.
@property (nonatomic, retain) IBOutlet ImmExampleViewController *viewController;

@end
