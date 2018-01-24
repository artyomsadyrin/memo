//
//  AddSubviewMargins.swift
//  memo
//
//  Created by Artsiom Sadyryn on 1/15/18.
//  Copyright © 2018 Artsiom Sadyryn. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubviewMargin(_ view: UIView, margins: UIEdgeInsets = UIEdgeInsets.zero) {
        
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    }
}
