//
//  RunLoopController.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/11/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

class RunLoopController: TableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cellImageAssignMode = .RunLoop
    }
}
