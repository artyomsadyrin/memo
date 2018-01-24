//
//  GameResult.swift
//  memo
//
//  Created by Artsiom Sadyryn on 1/22/18.
//  Copyright © 2018 Artsiom Sadyryn. All rights reserved.
//

import Foundation

struct GameResult: Codable {
    let pairs: Int
    let steps: Int
    let time: TimeInterval
    
    func score() -> Double {
        return (1 / ((Double(steps)*Double(pairs)) / Double(time))) * 100_000
    }
}
