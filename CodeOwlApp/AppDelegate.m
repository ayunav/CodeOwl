//
//  AppDelegate.m
//  CodeOwlApp
//
//  Created by Ayuna Vogel on 10/31/15.
//  Copyright © 2015 Ayuna Vogel. All rights reserved.
//
#import <Parse/Parse.h>
#import <ParseFacebookUtilsV4/ParseFacebookUtilsV4.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <ChameleonFramework/Chameleon.h>

#import "COUser.h"
#import "AppDelegate.h"

#define parseAppId @"YOUR-PARSE-APP-ID"
#define parseClientKey @"YOUR-PARSE-CLIENT-KEY"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS 
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId: parseAppId
                  clientKey: parseClientKey];
    
    
    [COUser registerSubclass];
    
    [PFFacebookUtils initializeFacebookWithApplicationLaunchOptions:launchOptions];
    
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    //[Chameleon setGlobalThemeUsingPrimaryColor:[UIColor flatGreenColor] withContentStyle:UIContentStyleLight];
    
    // green color. RGB values:
    //  73 G: 169 B: 66
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:73.00/255.0 green:169.00/255.0 blue:66.00/255.0 alpha:1.0]];

    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:83.00/255.0 green:123.00/255.0 blue:53.00/255.0 alpha:1.0]];

    UITabBarController *tabBarController = (UITabBarController *) self.window.rootViewController;
    tabBarController.view.tintColor = [UIColor colorWithRed:73.00/255.0 green:169.00/255.0 blue:66.00/255.0 alpha:1.0];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation
            ];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
