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
        var savedResults = getResults() ?? [GameResult]()
        savedResults.append(results)
        UserDefaults.standard.save(value: savedResults, for: "gameResults")
    }
    
    func getResults() -> [GameResult]? {
        return UserDefaults.standard.load(for: "gameResults")
    }
    
    func totalTime(games: [GameResult]) -> TimeInterval {
        return games.reduce(0, { (result, item) -> TimeInterval in
            return result + item.time
        })
    }
    
    func scores(games: [GameResult]) -> [Double] {
        let result = games.map({ (game) -> Double in
            return game.score()
        })
        return result
    }
    
    func bestGame(games: [GameResult]) -> GameResult {
        return games.reduce(games[0], { (result, nextGame) -> GameResult in
            if nextGame.score() > result.score() {
                return nextGame
            }
         
            return result
        })
        }
    
}


