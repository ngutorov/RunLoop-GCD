//
//  DemoCustomCell+Constraints.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/12/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

extension DemoCustomCell {
    
    func setCellConstraints() {
        
        // MARK: - thumbnailImage constarints:
        
        NSLayoutConstraint(
            item: thumbnailImage,
            attribute: NSLayoutConstraint.Attribute.leading,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: contentView,
            attribute: NSLayoutConstraint.Attribute.leading,
            multiplier: 1.0,
            constant: 10
        ).isActive = true
        
        NSLayoutConstraint(
            item: thumbnailImage,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: contentView,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1.0,
            constant: 5
        ).isActive = true
        
        NSLayoutConstraint(
            item: thumbnailImage,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: contentView,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 1.0,
            constant: -5
        ).isActive = true
        
        NSLayoutConstraint(
            item: thumbnailImage,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: contentView,
            attribute: NSLayoutConstraint.Attribute.height,
            multiplier: 1,
            constant: -5
        ).isActive = true
        
        // MARK: - titleLabel constarints:
        
        NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutConstraint.Attribute.leadingMargin,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: thumbnailImage,
            attribute: NSLayoutConstraint.Attribute.trailing,
            multiplier: 1.0,
            constant: 20
        ).isActive = true
        
        NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutConstraint.Attribute.trailing,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: contentView,
            attribute: NSLayoutConstraint.Attribute.trailing,
            multiplier: 1.0,
            constant: 0
        ).isActive = true
        
        NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: contentView,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1.0,
            constant: 0
        ).isActive = true
        
        NSLayoutConstraint(
            item: titleLabel,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: contentView,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 1.0,
            constant: 0
        ).isActive = true
    }
}
