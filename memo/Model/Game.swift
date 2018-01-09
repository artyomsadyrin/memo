//
//  Game.swift
//  memo
//
//  Created by Artsiom Sadyryn on 1/8/18.
//  Copyright © 2018 Artsiom Sadyryn. All rights reserved.
//

import Foundation

class Game {
    
    private let cardNames = (1...19).map { "card\($0)" }
    var isFinished = false
    var cardPairs: Int
    var flippedCard: Int?
    var cards: [Card]
    
    init(cardPairs: Int) {
        self.cardPairs = cardPairs
        
        var names = [String]()
        cards = [Card]()
        for _ in 0..<cardPairs {
            let index = arc4random_uniform(UInt32(cardNames.count))
            names.append(cardNames[Int(index)])
        }
        
        for name in names {
            let card = Card(isFlipped: false, imageName: name)
            let card2 = Card(isFlipped: false, imageName: name)
            cards.append(card)
            cards.append(card2)
        }

        cards = cards.shuffle()
    }
    
    func cardFlipped(at index: Int) {
        if let flipped = flippedCard {
            twoCardsFlipped(cardOne: flipped, cardTwo: index)
            flippedCard = nil
        }
        else {
            flippedCard = index
        }
    }
    
    func twoCardsFlipped(cardOne: Int, cardTwo: Int) -> Bool {
        if cards[cardOne] == cards[cardTwo] {
            cards[cardOne].isFlipped = true
            cards[cardTwo].isFlipped = true
            let cardsRemained = cards.filter { !($0.isFlipped) }.count
            if cardsRemained == 0 {
                isFinished = true
                print("Game finished")
            }
            return true
        }
        else {
            return false
        }
    }

}
