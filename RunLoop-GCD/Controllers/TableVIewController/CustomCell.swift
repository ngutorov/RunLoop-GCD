//
//  CustomCell.swift
//  RunLoop-GCD
//
//  Created by Nikolay Gutorov on 3/12/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

class CustomCell : UITableViewCell {
    
    let titleLabel : UILabel = {
        let title = UILabel()
        
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 16)
        title.textAlignment = .left
        
        return title
    }()
    
    let thumbnailImage : UIImageView = {
        let thumbnail = UIImageView()
        
        thumbnail.contentMode = .scaleAspectFill
        thumbnail.clipsToBounds = true
        
        return thumbnail
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        
        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(thumbnailImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
