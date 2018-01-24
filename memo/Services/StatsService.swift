//
//  StatsService.swift
//  memo
//
//  Created by Artsiom Sadyryn on 1/22/18.
//  Copyright © 2018 Artsiom Sadyryn. All rights reserved.
//

import Foundation

class StatsService {
    
    func save(results: GameResult) {
        UserDefaults.standard.save(value: results, for: "gameResults")
    }
    
    func getLastResult() -> GameResult? {
        return UserDefaults.standard.load(for: "gameResults")
    }
}
