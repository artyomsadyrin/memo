//
//  GameViewController.swift
//  memo
//
//  Created by Artsiom Sadyryn on 12/27/17.
//  Copyright © 2017 Artsiom Sadyryn. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, CardViewDelegate {
    
    private var restartButton: UIButton!
    private var timePassed: TimeInterval = 0
    private var timerLabel: UILabel!
    private var cardsContainer: CardsContainer?
    var cardViews = [CardView]()
    var game: Game!
    let cardPairs = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = Game(cardPairs: cardPairs)
        createGame(cards: game.cards)
        
        timerLabel = UILabel()
        timerLabel.text = "0 : 00"
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(gameUpdated), name: NSNotification.Name(rawValue: "gameChanged"), object: nil)
        
        center.addObserver(self, selector: #selector(timerTick), name: NSNotification.Name(rawValue: "timePassed"), object: nil)
        
        restartButton = UIButton()
        restartButton.addTarget(self, action: #selector(restartGame), for: .touchUpInside)
        restartButton.setTitle("Restart", for: .normal)
        restartButton.isEnabled = false
        layoutElement()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func timerTick() {
        timePassed += 1
        let dateInterval = DateInterval(start: Date(), duration: timePassed)
        let intervalFormatter = DateIntervalFormatter()
        timerLabel.text = intervalFormatter.string(from: dateInterval)
    }
    
    @objc func gameUpdated() {
        for (index, card) in game.cards.enumerated() {
            if card.isOpened != cardViews[index].isOpened {
                cardViews[index].flipView()
            }
        }
        restartButton.isEnabled = game.isFinished
    }
    
    func createGame(cards: [Card]) {
        
        //clear existed game
        
        cardsContainer?.removeFromSuperview()
        cardViews = [CardView]()
        
        createContainer()
        
        for card in cards {
            let cardView = CardView(faceName: card.imageName, isOpened: card.isOpened)
            //cardView.flipView(sender: )
            cardViews.append(cardView)
            self.cardsContainer?.addSubview(cardView)
            cardView.delegate = self
            cardView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        cardsContainer?.layout()
    }
    
    @objc func restartGame() {
        game = Game(cardPairs: cardPairs)
        createGame(cards: game.cards)
    }
    
    private func layoutElement() {
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(restartButton)
        
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timerLabel)
        timerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        restartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        restartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        restartButton.heightAnchor.constraint(equalToConstant: 44)
        restartButton.backgroundColor = UIColor.purple
    }
    
    private func createContainer() {
        cardsContainer = CardsContainer()
        cardsContainer?.backgroundColor = UIColor.lightGray
        view.addSubview(cardsContainer!)
        cardsContainer?.translatesAutoresizingMaskIntoConstraints = false
        cardsContainer?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cardsContainer?.widthAnchor.constraint(equalTo: (cardsContainer?.heightAnchor)!).isActive = true
        cardsContainer?.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        cardsContainer?.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
    
    private func indexFor(card: CardView?) -> Int? {
        guard let card = card else {
            return nil
        }
        return cardViews.index(of: card)
    }
    
    func didFlipped(cardView: CardView) {
        if let tappedIndex = indexFor(card: cardView) {
            game.cardFlipped(at: tappedIndex)
        }
    }
    
}

