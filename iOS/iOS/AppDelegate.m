//
//  AppDelegate.m
//  iOS
//
//  Created by 邱俊荣 on 2020/4/14.
//  Copyright © 2020 邱俊荣. All rights reserved.
//

#import "AppDelegate.h"
#import "UIViewControllerDemo.h"
#import "PlatformRouterImp.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    PlatformRouterImp *router = [[PlatformRouterImp alloc] init];
     [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:router
                                                         onStart:^(FlutterEngine *engine) {
                                                             
                                                         }];
     
     self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
     [self.window makeKeyAndVisible];
     
    
     UIViewControllerDemo *vc = [[UIViewControllerDemo alloc] initWithNibName:@"UIViewControllerDemo" bundle:[NSBundle mainBundle]];
     vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"hybrid" image:nil tag:0];
    
     
     FLBFlutterViewContainer *fvc = [[FLBFlutterViewContainer alloc] init];
     [fvc setName:@"tab" params:@{}];
     fvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"flutter_tab" image:nil tag:1];
     
     
     UITabBarController *tabVC = [[UITabBarController alloc] init];
     UINavigationController *rvc = [[UINavigationController alloc] initWithRootViewController:tabVC];
     router.navigationController = rvc;
     
     tabVC.viewControllers = @[vc,fvc];
     self.window.rootViewController = rvc;
    
    return YES;
}





@end
