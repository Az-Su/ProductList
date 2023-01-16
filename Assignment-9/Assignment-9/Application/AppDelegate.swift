//
//  AppDelegate.swift
//  Assignment-9
//
//  Created by Sailau Almaz Maratuly on 15.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ProductsViewController ()
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }


}

