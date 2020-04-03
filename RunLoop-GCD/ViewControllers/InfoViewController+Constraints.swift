//
//  InfoViewController+Constraints.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/14/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

extension InfoViewController {
    
    func setAboutTextViewConstraints() {
        
        // MARK: - aboutTextView constarints:
        
        // Top constraint.
        NSLayoutConstraint(
            item: self.aboutTextView,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
            toItem: self.view,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: 20
        ).isActive = true
        
        // Left constraint.
        NSLayoutConstraint(
            item: self.aboutTextView,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual,
            toItem: self.view,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: 10
        ).isActive = true
        
        // Right constraint.
        NSLayoutConstraint(
            item: self.aboutTextView,
            attribute: NSLayoutConstraint.Attribute.right,
            relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual,
            toItem: self.view,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: 10
        ).isActive = true
    }
}
