//
//  Card.swift
//  memo
//
//  Created by Artsiom Sadyryn on 1/8/18.
//  Copyright © 2018 Artsiom Sadyryn. All rights reserved.
//

import Foundation

struct Card: Equatable {
    
    var isFlipped = false
    var imageName: String
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.imageName == rhs.imageName
    }
    
    mutating func getFaceCard() -> String {
        imageName = "card\(UInt32(arc4random_uniform(18) + 1))"
        return imageName
    }

    mutating func getBackCard() -> String {
        imageName = "card_back"
        return imageName
    }
}
