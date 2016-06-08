//
//  AppDelegate.m
//  NavigationBar
//
//  Created by MARIA FERNANDA REYES MOJICA on 27/04/16.
//  Copyright © 2016 Propio. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property UITabBarController * tabBarController;
@end

@implementation AppDelegate
@synthesize tabBarController = _tabBarController;

-(void)dealloc{


}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    UIStoryboard *mystoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * viewController1 = [mystoryboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
    
    UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    
    
    UIViewController * viewController2 = [mystoryboard instantiateViewControllerWithIdentifier:@"FirstViewController2"];
    UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    UIViewController * viewController3 = [mystoryboard instantiateViewControllerWithIdentifier:@"TercerViewController"];
    UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:viewController3];

    
    self.tabBarController = [[UITabBarController alloc]init];
//    self.tabBarController.tabBar.barTintColor = [UIColor redColor];
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor redColor]];

    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        NSForegroundColorAttributeName : [UIColor redColor]
                                                        } forState:UIControlStateSelected];


    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navigationController1, navigationController2, navigationController3, nil];
    self.window.rootViewController =self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;

    
        
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
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
