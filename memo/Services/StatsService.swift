//
//  StatsService.swift
//  memo
//
//  Created by Artsiom Sadyryn on 1/22/18.
//  Copyright © 2018 Artsiom Sadyryn. All rights reserved.
//

import Foundation

class StatsService {
    
    /*
    private func save(value: Codable, for key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            UserDefaults.standard.setValue(encoded, forKey: key)
        }
    }
 */
    
    func save(results: GameResult) {
        let saved = results.getDictionary()
        //save(value: results as! Codable, for: "gameResults")
        UserDefaults.standard.setValue(saved, forKey: "gameResult")
    }
    
    func getlastResult() -> GameResult? {
        let result = UserDefaults.standard.object(forKey: "gameResult")
        if let gameResult = GameResult(dictionary: result as! [String : String]) {
            return gameResult
        }
        return nil
    }
}
