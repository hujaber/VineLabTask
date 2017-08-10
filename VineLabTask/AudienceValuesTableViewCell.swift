//
//  AudienceValuesTableViewCell.swift
//  VineLabTask
//
//  Created by Administrator on 8/10/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

import UIKit
import Charts

class AudienceValuesTableViewCell: UITableViewCell {
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(sizes: [CGFloat]) {
        lineChartView.chartDescription?.text = ""
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<sizes.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: Double(sizes[i]))
            dataEntries.append(dataEntry)
        }
        let chartDataSet = LineChartDataSet(values: dataEntries, label: nil)
        chartDataSet.lineWidth = 2

        chartDataSet.circleRadius = 6
        chartDataSet.circleHoleRadius = 3
        chartDataSet.circleColors = [UIColor.black]
        chartDataSet.label = nil

        chartDataSet.drawValuesEnabled = false
        let chartdata = LineChartData(dataSet: chartDataSet)
        lineChartView.leftAxis.enabled = false
        lineChartView.rightAxis.enabled = false
        lineChartView.drawBordersEnabled = false
        lineChartView.legend.enabled = false
        lineChartView.drawGridBackgroundEnabled = false
        lineChartView.getAxis(.left).enabled = false
        lineChartView.getAxis(.right).enabled = false
        lineChartView.xAxis.enabled = false
        lineChartView.data = chartdata
    }

    func updateLabels(size: CGFloat?, percentage: CGFloat?) {
        sizeLabel.text = ""
        self.percentage.text = ""
        if size != nil {
            sizeLabel.text = "\(size!.roundTo(places: 2))"
        }
        if percentage != nil {
            self.percentage.text = "\(percentage!.roundTo(places: 2))"
        }
    }

}
