//
//  ChartTableViewCell.swift
//  VineLabTask
//
//  Created by Administrator on 8/10/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

import UIKit
import Charts

class ChartTableViewCell: UITableViewCell {
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var femalePercentageLabel: UILabel!
    @IBOutlet weak var malePercentageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(data: [GraphItem]) {
        var ages = [String]()
        var percentages = [CGFloat]()
        for gItem in data {
            ages.append(gItem.ageGroup!)
            percentages.append(gItem.value!)
        }
        barChartView.chartDescription?.enabled = false;
        barChartView.drawGridBackgroundEnabled = false;
        barChartView.dragEnabled = false
        barChartView.setScaleEnabled(true)
        barChartView.pinchZoomEnabled = false
        let xAxis = barChartView.xAxis
        xAxis.labelPosition = .bottom
        barChartView.rightAxis.enabled = false;
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: ages)
        xAxis.granularity = 1
        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<ages.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [Double(percentages[i])])
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Age Range")
        chartDataSet.colors = [UIColor.age_13_17, UIColor.age_18_24, UIColor.age_25_34, UIColor.age_35_44, UIColor.age_45_54, UIColor.age_55_64]

        let chartData = BarChartData(dataSet: chartDataSet)

        barChartView.data = chartData
    }

    func updateGender(male: CGFloat!, female: CGFloat!) {
        malePercentageLabel.text = "\(male!.roundTo(places: 2))"
        femalePercentageLabel.text = "\(female!.roundTo(places: 2))"
    }

}
