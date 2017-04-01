//
//  AppDelegate.m
//  CCSugarOSX
//
//  Created by dengyouhua on 17/4/1.
//  Copyright © 2017年 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "AppDelegate.h"
#import "CCSugarTest.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [CCSugarTest allTest];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
