//
//  TabBarController.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/11/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    lazy public var mainTabVC: MainController = {
        let mainTabVC = MainController()
        let title = ""
        let defaultImage = UIImage(named: "main")
        mainTabVC.tabBarItem = UITabBarItem(title: title, image: defaultImage, tag: 0)
        return mainTabVC
    }()
    
    lazy public var runLoopTabVC: RunLoopController = {
        let runLoopTabVC = RunLoopController()
        let title = "RunLoop"
        let defaultImage = UIImage(named: "runloop")
        runLoopTabVC.tabBarItem = UITabBarItem(title: title, image: defaultImage, tag: 1)
        return runLoopTabVC
    }()
    
    lazy public var gcdTabVC: GCDController = {
        let gcdTabVC = GCDController()
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
        
        myViewControllers = [runLoopTabVC, mainTabVC, gcdTabVC]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.viewControllers = myViewControllers
        
        if freshLaunch == true {
            freshLaunch = false
            self.selectedIndex = 1
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}
