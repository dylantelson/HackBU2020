//
//  TableViewCell.swift
//  HackBU
//
//  Created by Rosh Sugathan Thaivalappil on 2/9/20.
//  Copyright © 2020 Dylan Telson. All rights reserved.
//

import UIKit
import Charts
class TableViewCell: UITableViewCell {

    @IBOutlet var pchart: PieChartView!
    @IBOutlet var label1: UILabel!
    var sortby = "Pie Chart"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupPieChart()
        // Configure the view for the selected state
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupPieChart()
     {
      pchart.chartDescription?.enabled = false
      pchart.drawHoleEnabled = false
      pchart.rotationAngle = 0
      pchart.rotationEnabled = false
      pchart.isUserInteractionEnabled = false
      
      
      //put data
      var entries: [PieChartDataEntry] = Array()
      if(sortby == "Popular") {
          entries.append(PieChartDataEntry(value: 35.0, label: "Seagate"))
          entries.append(PieChartDataEntry(value: 20.0, label: "Toshiba"))
          entries.append(PieChartDataEntry(value: 35.0, label: "Seagate"))
        entries.append(PieChartDataEntry(value: 20.0, label: "Toshiba"))
          entries.append(PieChartDataEntry(value: 45.0, label: "Samsung"))
      } else if(sortby == "Durable") {
          entries.append(PieChartDataEntry(value: 45.0, label: "Seagate"))
          entries.append(PieChartDataEntry(value: 30.0, label: "Toshiba"))
          entries.append(PieChartDataEntry(value: 25.0, label: "Samsung"))
      } else if(sortby == "Cost-Effective") {
               entries.append(PieChartDataEntry(value: 25.0, label: "Seagate"))
               entries.append(PieChartDataEntry(value: 30.0, label: "Toshiba"))
               entries.append(PieChartDataEntry(value: 45.0, label: "Samsung"))
           }
      
      let dataSet = PieChartDataSet(entries:entries, label: "")
      dataSet.colors = [UIColor.systemTeal, UIColor.blue, UIColor.systemIndigo]
      dataSet.drawValuesEnabled = false
      
      pchart.data = PieChartData(dataSet: dataSet)
     }
    func set(name: String)
    {
        sortby = name
        label1.text = sortby
                setupPieChart()
    }
}
