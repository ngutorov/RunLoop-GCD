//
//  RunLoopViewController.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/11/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

class RunLoopViewController: DemoTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cellImageAssignMode = .RunLoop
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setStatusBarColor(.lightGray)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
