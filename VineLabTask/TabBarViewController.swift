//
//  TabBarViewController.swift
//  VineLabTask
//
//  Created by Administrator on 8/9/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setTitle(title: "Scores", index: 0)
        setTitle(title: "Audience", index: 1)
    }

    //MARK: - Setups
    func setupTabBar() {
        tabBar.barTintColor = UIColor.appBlue
        tabBar.tintColor = UIColor.white
        tabBar.isTranslucent = false
    }

    //MARK: - Private Methods

    fileprivate func setTitle(title: String!, index: Int!) {
        let item = tabBar.items?[index]
        item?.title = title
    }
}
