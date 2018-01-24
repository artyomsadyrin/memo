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
    
    func getDictionary() -> [String : String] {
        var dictionary = [String : String]()
        dictionary["pairs"] = String(pairs)
        dictionary["steps"] = String(steps)
        dictionary["time"] = String(time)
        return dictionary
    }
    
    init?(dictionary: [String: String]) {
        guard let pairs = dictionary["pairs"], let steps = dictionary["steps"], let time = dictionary["time"] else {
            fatalError()
        }
        self.pairs = Int(pairs)!
        self.steps = Int(steps)!
        self.time = TimeInterval(time)!
    }
    
    init(pairs: Int, steps: Int, time: TimeInterval) {
        self.pairs = pairs
        self.steps = steps
        self.time = time
    }
}
