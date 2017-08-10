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
    var malePercentage: CGFloat = 0
    var femalePercentage: CGFloat = 0
    var graphSizes = [CGFloat]()
    var audienceValues: AudienceSizeValues?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getData()
    }

    func getData() {
        showLoader()
        APIRequests.getGraphValues { (success, errorString, dataArray) in
            if success {
                self.hideLoader()
                self.chartsData = dataArray!
                self.tableView.reloadData()
            }
        }

        APIRequests.getGenderValues { (success, male, female) in
            self.malePercentage = male
            self.femalePercentage = female
            self.tableView.reloadData()
        }

        APIRequests.getAudienceSizeGraphData { (success, audienceSizeGrowthArray) in
            if success {
                for i in audienceSizeGrowthArray! {
                    self.graphSizes.append(i.size!)
                    self.tableView.reloadData()
                }
            }
        }

        APIRequests.getAudienceSizeValues { (success, result) in
            if success {
                self.audienceValues = result
                self.tableView.reloadData()
            }
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
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.statCell) as! AudienceValuesTableViewCell
            cell.setCell(sizes: graphSizes)
            cell.updateLabels(size: audienceValues?.size, percentage: audienceValues?.percentage)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.graphCell) as! ChartTableViewCell
            cell.setCell(data: chartsData)
            cell.updateGender(male: malePercentage, female: femalePercentage)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 250
        }
        return 100
    }
}
