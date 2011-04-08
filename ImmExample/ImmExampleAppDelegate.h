//
//  ImmExampleAppDelegate.h
//  ImmExample
//
//  Created by Fritz Anderson on 4/7/11.
//  Copyright 2011 Trustees of the University of Chicago. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImmExampleViewController;

@interface ImmExampleAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ImmExampleViewController *viewController;

@end
