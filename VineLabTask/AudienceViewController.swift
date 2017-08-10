//
//  AudienceViewController.swift
//  VineLabTask
//
//  Created by Administrator on 8/10/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

import UIKit

class AudienceViewController: BaseViewController {

    enum TableCells {
        static let graphCell = "GraphCell"
        static let statCell = "StatCell"
    }

    @IBOutlet weak var tableView: UITableView!
    var chartsData = [GraphItem]()
    var malePer: CGFloat = 0
    var femalePer: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        showLoader()
        APIRequests.getGraphValues { (success, errorString, dataArray) in
            self.hideLoader()
            self.chartsData = dataArray!
            self.tableView.reloadData()
        }

        APIRequests.getGenderValues { (succes, male, female) in
            self.malePer = male
            self.femalePer = female
            self.tableView.reloadData()
        }
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
        tableView.allowsSelection = false
    }

}


extension AudienceViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.statCell)
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.graphCell) as! ChartTableViewCell
            cell.setCell(data: chartsData)
            cell.updateGender(male: malePer, female: femalePer)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 250
        }
        return 60
    }
}
