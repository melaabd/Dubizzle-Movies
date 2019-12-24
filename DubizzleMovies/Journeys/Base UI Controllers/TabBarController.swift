//
//  TabBarViewController.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import UIKit

public final class TabBarController: UITabBarController {

    // MARK: - UIViewController life cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        if let aboutItem = self.tabBar.items?[2] {
            aboutItem.selectedImage = #imageLiteral(resourceName: "About_Icon").withRenderingMode(.alwaysTemplate)
            aboutItem.image = #imageLiteral(resourceName: "About_Icon").withRenderingMode(.alwaysTemplate)
        }
    }
}
