//
//  MainController.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/11/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    let aboutTextView = UITextView()
    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(titleLabel)
        
        titleLabel.frame = CGRect(x: 10, y: 60, width: UIScreen.main.bounds.size.width-20, height: 60)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .systemBlue
        titleLabel.font = .systemFont(ofSize: 26)
        titleLabel.text = "RunLoop   VS   GCD"
        
        setTitleLabelConstraints()
        
        self.view.addSubview(aboutTextView)
        
        aboutTextView.frame = CGRect(x: 10, y: 140, width: UIScreen.main.bounds.size.width-20, height: UIScreen.main.bounds.size.height-270)
        aboutTextView.backgroundColor = .white
        aboutTextView.textColor = .darkGray
        aboutTextView.font = .systemFont(ofSize: 16)
        aboutTextView.text = """
        Demo app you can play with and see the difference between using GCD approach versus manual RunLoop block execution on a Main Thread.
        
        The trick is that manual approach with CFRunLoopPerformBlock gives us opportunity to choose RunLoop mode we want to use for our block. And in case of scrolling TableView it makes big difference since all scrolling happens with UITrackingRunLoopMode.
        
        Just scroll deep down to 3-4xxx cells and see how "GCD" tab cells are still being assigned with images after delay VS "RunLoop" tab cells are being assigned immediately without any visible UI lags!
        
        Same TableViews on a left and on a right. But left one updates image data with Core Foundation CFRunLoopPerformBlock using manually set UITrackingRunLoopMode. Right one updates image data using GCD to access Main Thread.
        
        * It's advisable to run the app on a real device.
        """
        
        setAboutTextViewConstraints()
    }
}
