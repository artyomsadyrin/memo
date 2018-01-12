//
//  CardsContainer.swift
//  memo
//
//  Created by Artsiom Sadyryn on 1/12/18.
//  Copyright © 2018 Artsiom Sadyryn. All rights reserved.
//


import Foundation
import UIKit

class CardsContainer: UIView {
    func layout(views: [UIView]) {
        var inRow = 6
        let count = views.count
        if count <= 4 {
            inRow = 2
        }
        else if count <= 6 {
            inRow = 3
        }
        else if count <= 20 {
            inRow = 4
        }
        
        let margin = 16
        let size = (UIScreen.main.bounds.size.width - CGFloat(margin*(inRow+1)))  / CGFloat(inRow)
        
        for (index, view) in views.enumerated() {
            if index == 0 {
                view.topAnchor.constraint(equalTo: self.topAnchor)
                view.leftAnchor.constraint(equalTo: self.leftAnchor)
            }
            else {
                if (index - inRow) < 0 {
                    view.topAnchor.constraint(equalTo: self.topAnchor)
                }
                else {
                    view.topAnchor.constraint(equalTo: views[index - inRow].bottomAnchor)
                }
                if index % inRow == 0 {
                    //newline
                    view.leftAnchor.constraint(equalTo: self.leftAnchor)
                }
                else {
                    view.leftAnchor.constraint(equalTo: views[index-1].rightAnchor)
                }
            }
            
        }
    }
}

