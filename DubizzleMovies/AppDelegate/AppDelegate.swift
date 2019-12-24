//
//  AppDelegate.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder {
    
    // MARK: - Properties

    var window: UIWindow?
    fileprivate lazy var router = Router(tmdbAPI: TMDbAPI())
}

// MARK: -

extension AppDelegate: UIApplicationDelegate {
    
    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Settings.initializeServices()
        Settings.setupAppearance()
        router.setup(for: self, with: launchOptions)
        window?.makeKeyAndVisible()
        return true
    }
}

