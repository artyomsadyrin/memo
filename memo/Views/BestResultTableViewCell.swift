//
//  BestResultTableViewCell.swift
//  memo
//
//  Created by Artsiom Sadyryn on 1/29/18.
//  Copyright © 2018 Artsiom Sadyryn. All rights reserved.
//

import Foundation
import UIKit

class BestResultTableViewCell: UITableViewCell {
    let bestLabel = UILabel()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviewMargin(bestLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentView.addSubviewMargin(bestLabel)
    }
}
