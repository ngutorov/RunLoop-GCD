//
//  MainTabBarController.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/11/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    lazy public var infoTabVC: InfoViewController = {
        let infoTabVC = InfoViewController()
        let title = ""
        let defaultImage = UIImage(named: "main")
        infoTabVC.tabBarItem = UITabBarItem(title: title, image: defaultImage, tag: 0)
        return infoTabVC
    }()
    
    lazy public var runLoopTabVC: RunLoopViewController = {
        let runLoopTabVC = RunLoopViewController()
        let title = "RunLoop"
        let defaultImage = UIImage(named: "runloop")
        runLoopTabVC.tabBarItem = UITabBarItem(title: title, image: defaultImage, tag: 1)
        return runLoopTabVC
    }()
    
    lazy public var gcdTabVC: GCDViewController = {
        let gcdTabVC = GCDViewController()
        let title = "GCD"
        let defaultImage = UIImage(named: "gcd")
        gcdTabVC.tabBarItem = UITabBarItem(title: title, image: defaultImage, tag: 2)
        return gcdTabVC
    }()
    
    var myViewControllers: [UIViewController]!
    
    var freshLaunch = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.gray], for: .selected)
        UITabBar.appearance().tintColor = UIColor.darkGray
        
        myViewControllers = [runLoopTabVC, infoTabVC, gcdTabVC]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewControllers = myViewControllers
        
        if freshLaunch == true {
            freshLaunch = false
            self.selectedIndex = 1
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}
