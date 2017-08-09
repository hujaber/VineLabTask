//
//  ViewController.swift
//  VineLabTask
//
//  Created by Administrator on 8/9/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var scoreData: Scores? = nil
    let tableData = ["iScore", "Discovery", "Consumption"]
    
    enum TableCells {
       static let parent = "ParentCell"
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        showLoader()
        title = "Scores"

    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
    }
    
    //MARK: - Requests
    
    func getScoreData() {
        APIRequests.getScores { (success, error, errorMessage, scoresObject, responseDictionary) in
            self.hideLoader()
            if success {
                self.scoreData = scoresObject
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        let counter: Int = 0

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
