//
//  AppDelegate.swift
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard
            let splitViewController = window?.rootViewController as? UISplitViewController,
            let leftNavController = splitViewController.viewControllers.first as? UINavigationController,
            let masterViewController = leftNavController.topViewController as? MasterViewController,
            let rightNavController = splitViewController.viewControllers.last as? UINavigationController,
            let detailViewController = rightNavController.topViewController as? DetailViewController
            else { return true }
        masterViewController.detailVC = detailViewController
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        
        return true
    }
}
