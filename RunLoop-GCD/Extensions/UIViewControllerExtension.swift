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
    
    // Show alert message.
    func showAlert(title: String, message: String, showCancel: Bool, okLabel: String, okActionClosure: @escaping () -> Void) {
        
        DispatchQueue.main.async {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: okLabel, style: .default, handler: {(action) -> Void in okActionClosure() }))
            
            if showCancel {
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            }
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
