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
    var expandedCells = Set<Int>()
    let tableData = ["Quality", "Consistency", "Discovery", "Consumption", "Stickiness", "Engagement", "Amplification"]
    
    enum TableCells {
        static let parent = "ParentCell"
        static let child = "ChildCell"
    }

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "Scores"
        getScoreData()
    }

    //MARK: - Setups

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
    }
    
    //MARK: - Requests
    
    func getScoreData() {
        showLoader()
        APIRequests.getScores { (success, error, errorMessage, scoresObject, responseDictionary) in
            self.hideLoader()
            if success {
                self.scoreData = scoresObject
                self.tableView.reloadData()
            }
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func canCollapseSection(tableView: UITableView, section: Int) -> Bool {
        if section >= 0 {
            return true
        }
        return false
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if expandedCells.contains(section) {
            return 2
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if canCollapseSection(tableView: tableView, section: indexPath.section) {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.parent) as! HeaderCell
                cell.selectionStyle = .none
                switch indexPath.section {
                case 0:
                    cell.setCell(title: tableData[indexPath.section], score: scoreData?.quality?.score, color: UIColor.scoreQuality)
                case 1:
                    cell.setCell(title: tableData[indexPath.section], score: scoreData?.consistency?.score, color: UIColor.appBlue)
                case 2:
                    cell.setCell(title: tableData[indexPath.section], score: scoreData?.discovery?.score, color: UIColor.scoreDiscovery)
                case 3:
                    cell.setCell(title: tableData[indexPath.section], score: scoreData?.consumption?.score, color: UIColor.scoreConsumption)
                case 4:
                    cell.setCell(title: tableData[indexPath.section], score: scoreData?.stickiness?.score, color: UIColor.scoreStickiness)
                case 5:
                    cell.setCell(title: tableData[indexPath.section], score: scoreData?.engagement?.score, color: UIColor.scoreEngagement)
                case 6:
                    cell.setCell(title: tableData[indexPath.section], score: scoreData?.amplification?.score, color: UIColor.scoreAmplification)
                default:
                    break
                }
                return cell

            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.child) as! DetailsCell
                cell.selectionStyle = .none
                switch indexPath.section {
                case 0:
                    cell.setCell(videoScore: scoreData?.quality?.video?.score, imageScore: scoreData?.quality?.photo?.score, linkScore: scoreData?.quality?.link?.score)
                case 1:
                    cell.setCell(videoScore: scoreData?.consistency?.video?.score, imageScore: scoreData?.consistency?.photo?.score, linkScore: scoreData?.consistency?.link?.score)
                case 2:
                    cell.setCell(videoScore: scoreData?.discovery?.video?.score, imageScore: scoreData?.discovery?.photo?.score, linkScore: scoreData?.discovery?.link?.score)
                case 3:
                    cell.setCell(videoScore: scoreData?.consumption?.video?.score, imageScore: scoreData?.consumption?.photo?.score, linkScore: scoreData?.consumption?.link?.score)
                case 4:
                    cell.setCell(videoScore: scoreData?.stickiness?.video?.score, imageScore: scoreData?.stickiness?.photo?.score, linkScore: scoreData?.stickiness?.link?.score)
                case 5:
                    cell.setCell(videoScore: scoreData?.engagement?.video?.score, imageScore: scoreData?.engagement?.photo?.score, linkScore: scoreData?.engagement?.link?.score)
                case 6:
                    cell.setCell(videoScore: scoreData?.amplification?.video?.score, imageScore: scoreData?.amplification?.photo?.score, linkScore: scoreData?.amplification?.link?.score)
                default: break

                }
                return cell
            }
        } else {
            return UITableViewCell.init()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if canCollapseSection(tableView: tableView, section: indexPath.section) {
            if indexPath.row == 0 {
                let section = indexPath.section
                let currentlyExpanded = expandedCells.contains(section)
                var rows = 0
                var tempArray = Array<IndexPath>()
                if currentlyExpanded {
                    rows = self.tableView(tableView, numberOfRowsInSection: section)
                    expandedCells.remove(section)
                } else {
                    expandedCells.insert(section)
                    rows = self.tableView(tableView, numberOfRowsInSection: section)
                }
                for i in 1..<rows {
                    let tmpIndexPath = IndexPath.init(row: i, section: section)
                    tempArray.append(tmpIndexPath)
                }
                if currentlyExpanded {
                    tableView.deleteRows(at: tempArray, with: .top)
                } else {
                    tableView.insertRows(at: tempArray, with: .top)
                    tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 40
        } else {
            return 65
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView.init()
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }

    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
}

class DetailsCell: UITableViewCell {

    @IBOutlet weak var linkScoreLabel: UILabel!
    @IBOutlet weak var imageScoreLabel: UILabel!
    @IBOutlet weak var videoScoreLabel: UILabel!

    func setCell(videoScore: CGFloat?, imageScore: CGFloat?, linkScore: CGFloat?) {
        if videoScore != nil {
            videoScoreLabel.text = "\(videoScore!.roundTo(places: 2))"
        } else {
            videoScoreLabel.text = "-"
        }

        if imageScore != nil {
            imageScoreLabel.text = "\(imageScore!.roundTo(places: 2))"
        } else {
            imageScoreLabel.text = "-"
        }

        if linkScore != nil {
            linkScoreLabel.text = "\(linkScore!.roundTo(places: 2))"
        } else {
            linkScoreLabel.text = "-"
        }
    }
}

class HeaderCell: UITableViewCell {
    @IBOutlet weak var bulletView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    func setCell(title: String!, score: CGFloat?, color: UIColor!) {
        bulletView.backgroundColor = color
        bulletView.layer.cornerRadius = 2
        titleLabel.text = title
        if score != nil {
            scoreLabel.text = "\(score!.roundTo(places: 2))"
        } else {
            scoreLabel.text = "-"
        }
    }
}
