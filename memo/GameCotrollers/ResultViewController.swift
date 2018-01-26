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
    static let cellIdentifier = "ResultCell"
    
    var table: UITableView!
    var results: [GameResult]?
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table = UITableView()
        view.addSubviewMargin(table)
        table.dataSource = self
        //table.register(ResultTableViewCell.self, forCellReuseIdentifier: ResultViewController.cellIdentifier)
        table.register(UINib.init(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: ResultViewController.cellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        results = gameService.getResults()
        let result = results?.first
        resultLabel.text = "Last game stats: \(String(describing: result?.pairs)) \(String(describing: result?.steps)) \(String(describing: result?.time))"
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultViewController.cellIdentifier)!
        let result = results?[indexPath.row]
        cell.textLabel?.text = "game stats: \(result!.pairs) \(result!.steps) \(result!.time)"
        return cell
    }
}
