//
//  AppDelegate.m
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 15/04/2019.
//  Copyright © 2019 Carlos Neto. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "DetailViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *leftNavController = [[(UINavigationController *)splitViewController viewControllers] firstObject];
    MainViewController *mainViewController = (MainViewController *)leftNavController.topViewController;
    UINavigationController *rightNavController = [[(UINavigationController *)splitViewController viewControllers] lastObject];
    DetailViewController *detailViewController = (DetailViewController*)rightNavController.topViewController;
    mainViewController.detailVC = detailViewController;
    detailViewController.navigationItem.leftItemsSupplementBackButton = YES;
    detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    
    return YES;
}

@end
