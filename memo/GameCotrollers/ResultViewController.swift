//
//  ResultViewController.swift
//  memo
//
//  Created by Artsiom Sadyryn on 12/27/17.
//  Copyright © 2017 Artsiom Sadyryn. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController, UITableViewDataSource {
    
    let gameService = StatsService()
    static let cellIdentifier = "ResultTableViewCell"
    static let bestIdentifer = "BestResultTableViewCell"
    
    var table: UITableView!
    var results: [GameResult]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table = UITableView()
        view.addSubviewMargin(table)
        table.dataSource = self
        table.register(BestResultTableViewCell.self, forCellReuseIdentifier: ResultViewController.bestIdentifer)
        table.register(UINib.init(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: ResultViewController.cellIdentifier)
        
    }
    
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        results = gameService.getResults()
        prepareData()
        
        //let result = results?.first
        //resultLabel.text = "Last game stats: \(String(describing: result?.pairs)) \(String(describing: result?.steps)) \(String(describing: result?.time))"
        table.reloadData()
    }
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ResultViewController.bestIdentifer) as! BestResultTableViewCell
            let result = results?[indexPath.row]
            cell.bestLabel.text = "game stats: \(result!.score()) \(result!.steps) \(result!.time)"
            return cell
        }
        else {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultViewController.cellIdentifier) as! ResultTableViewCell
        let result = results?[indexPath.row]
        cell.resultLabel.text = "game stats: \(result!.score()) \(result!.steps) \(result!.time)"
        return cell
    }
}
    private func prepareData() {
        guard let result = results else {
            return
        }
        if result.count <= 3 {
        results = results?.sorted(by:  { $0.score() > $1.score() })
        }
        else {
            let topResults = results?.sorted(by:  { $0.score() > $1.score() })[0...2]
            results = Array(topResults!) + result
        }
        
    }
    
}
