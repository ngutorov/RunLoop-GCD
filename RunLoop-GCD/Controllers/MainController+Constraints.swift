//
//  MainController+Constraints.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/14/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

extension MainController {
    
    func setTitleLabelConstraints() {
        
        // MARK: titleLabel constarints:
        
        NSLayoutConstraint(
            item: self.titleLabel,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual,
            toItem: self.view,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: 60
        ).isActive = true
        
        NSLayoutConstraint(
            item: self.titleLabel,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual,
            toItem: self.view,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: 10
        ).isActive = true
        
        NSLayoutConstraint(
            item: self.titleLabel,
            attribute: NSLayoutConstraint.Attribute.right,
            relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual,
            toItem: self.view,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: 10
        ).isActive = true
    }
    
    func setAboutTextViewConstraints() {
        
        // MARK: aboutTextView constarints:
        
        NSLayoutConstraint(
            item: self.aboutTextView,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
            toItem: self.titleLabel,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: 20
        ).isActive = true
        
        NSLayoutConstraint(
            item: self.aboutTextView,
            attribute: NSLayoutConstraint.Attribute.left,
            relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual,
            toItem: self.view,
            attribute: NSLayoutConstraint.Attribute.left,
            multiplier: 1,
            constant: 10
        ).isActive = true
        
        NSLayoutConstraint(
            item: self.aboutTextView,
            attribute: NSLayoutConstraint.Attribute.right,
            relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual,
            toItem: self.view,
            attribute: NSLayoutConstraint.Attribute.right,
            multiplier: 1,
            constant: 10
        ).isActive = true
        
        NSLayoutConstraint(
            item: self.aboutTextView,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual,
            toItem: self.view,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 1,
            constant: 0
        ).isActive = true
    }
}
