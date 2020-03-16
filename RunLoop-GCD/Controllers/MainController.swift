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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        addTitleLabel()
        addAboutTextView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setStatusBarColor(.lightGray)
    }
    
    func addTitleLabel() {
        
        self.view.addSubview(titleLabel)
        
        titleLabel.frame = CGRect(x: 10, y: 70, width: UIScreen.main.bounds.size.width-20, height: 20)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .systemGray
        titleLabel.font = .systemFont(ofSize: 20)
        titleLabel.text = "CF RunLoop || GCD"
        
        setTitleLabelConstraints()
    }
    
    func addAboutTextView() {
        
        self.view.addSubview(aboutTextView)
        
        aboutTextView.frame = CGRect(x: 10, y: 100, width: UIScreen.main.bounds.size.width-20, height: UIScreen.main.bounds.size.height-180)
        aboutTextView.backgroundColor = .white
        aboutTextView.textColor = .systemGray
        aboutTextView.showsVerticalScrollIndicator = false
        aboutTextView.font = .systemFont(ofSize: 15)
        aboutTextView.text = """
        Demo app you can play with and see the difference between using GCD dispatch_async approach versus CF RunLoop block execution on a Main Thread.
        
        Two very different APIs but the trick is that Core Foundation approach with CFRunLoopPerformBlock gives us opportunity to choose certain RunLoop Mode we want to use for our block.
        
        Especially in case of scrolling TableView it makes big difference since all scrolling happens with UITrackingRunLoopMode.
        
        Just scroll fast deep down to 2-4XXX cells and stop scrolling to see how "GCD" tab cells are still being assigned with images blinking VS "RunLoop" tab cells are being assigned with minimum visible UI lags.
        
        Absolutely same simple and very long TableViews on the left and on the right loading data from a network.
        
        But left one updates image data with Core Foundation CFRunLoopPerformBlock using manually set UITrackingRunLoopMode.
        
        Right one updates image data using GCD API to access Main Thread, basically delegating RunLoop mode choice to Grand Central Dispatch.
        
        It's advisable to run the app on a real iPhone device.
        """
        
        setAboutTextViewConstraints()
    }
}
