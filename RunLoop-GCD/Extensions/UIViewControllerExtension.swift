//
//  UIViewControllerExtension.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/14/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public var statusBarHeight: CGFloat {
        
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.first 
            return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? CGFloat.zero
            
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
    
    func setStatusBarColor(_ color: UIColor) {
        if #available(iOS 13.0, *) {
            
            let window = UIApplication.shared.windows.first
            let statusBar = UIView(frame: window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
            statusBar.backgroundColor = color
            window?.addSubview(statusBar)
            
        } else {
            
            (UIApplication.shared.value(forKey: "statusBar") as? UIView)?.backgroundColor = color
        }
    }
}
