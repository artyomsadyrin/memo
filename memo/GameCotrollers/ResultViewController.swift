//
//  ResultViewController.swift
//  memo
//
//  Created by Artsiom Sadyryn on 12/27/17.
//  Copyright © 2017 Artsiom Sadyryn. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var labelResult: UILabel!
    let gameService = StatsService()
    
    override func viewWillAppear(_ animated: Bool) {
        let result = gameService.getlastResult()
        labelResult.text = "Pairs: \(result?.pairs), Steps: \(result?.steps), Time: \(result?.time)"
    }
    
}
