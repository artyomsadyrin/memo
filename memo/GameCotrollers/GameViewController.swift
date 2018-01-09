//
//  ViewController.swift
//  memo
//
//  Created by Artsiom Sadyryn on 12/27/17.
//  Copyright © 2017 Artsiom Sadyryn. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var cardViews = [UIView]()
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(cardPairs: 2)
        createGame(cardsNumber: 4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createGame(cardsNumber: Int) {
        for i in 0..<cardsNumber {
            let backView = UIImageView()
            let faceView = UIImageView()
            let cardView = UIView()
            add(subview: faceView, to: cardView)
            add(subview: backView, to: cardView)
            
            addTouchToVIew(view: backView)
            backView.contentMode = .scaleAspectFit
            faceView.contentMode = .scaleAspectFit
            backView.image = UIImage(named: "card_back")?.withRenderingMode(.alwaysTemplate)
            faceView.image = UIImage(named: game.cardNames[i])
            
            backView.backgroundColor = UIColor.white
            cardView.layer.borderWidth = 1
            cardView.layer.borderColor = UIColor.lightGray.cgColor
            cardViews.append(cardView)
            self.view.addSubview(cardView)
            cardView.translatesAutoresizingMaskIntoConstraints = false
            
            switch i {
            case 0:
                cardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
                cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
            case 1:
                cardView.leftAnchor.constraint(equalTo: cardViews[i-1].rightAnchor, constant: 16).isActive = true
                cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
            case 2:
                cardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
                cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
            case 3:
                cardView.leftAnchor.constraint(equalTo: cardViews[i-1].rightAnchor, constant: 16).isActive = true
                cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
            default:
                cardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
                cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
            }
            
            cardView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            cardView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        }
    }
    
    private func add(subview: UIView, to cardView: UIView) {
        cardView.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        subview.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
        subview.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
    }
    
    func addTouchToVIew(view: UIView) {
        let touchRecognizer = UITapGestureRecognizer(target: self, action: #selector(flipView(sender:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(touchRecognizer)
    }
    
    
    @objc func flipView(sender: UITapGestureRecognizer) {
        
        if let imageView = sender.view as? UIImageView {
            if let tappedIndex = indexFor(card: imageView.superview) {
                game.cardFlipped(at: tappedIndex)
            }
            let faceView = imageView.superview?.subviews.filter { $0 != imageView }.first
            if let face = faceView {
                UIView.transition(from: imageView,
                                  to: face,
                                  duration: 0.3,
                                  options: [.transitionFlipFromRight, .showHideTransitionViews],
                                  completion: nil)
            }
        }
        
    }
    
    private func indexFor(card: UIView?) -> Int? {
        guard let card = card else {
            return nil
        }
        return cardViews.index(of: card)
    }
    
}

