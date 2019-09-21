//
//  TabBarController.swift
//  golfbuddy
//
//  Created by Michael Behrens on 8/13/19.
//  Copyright © 2019 Michael Behrens. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let browseViewController = BrowseViewController()
        let newScoreViewController = NewScoreViewController()
        
        let browseNavigationController = UINavigationController(rootViewController: browseViewController)
        let newScoreNavigationController = UINavigationController(rootViewController: newScoreViewController)
        
        
        viewControllers = [browseNavigationController, newScoreNavigationController]
    }

}
