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
    override func awakeFromNib() {
        super.awakeFromNib()
        setupPieChart()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
//      if(computerPart == "Storage") {
          entries.append(PieChartDataEntry(value: 35.0, label: "Seagate"))
          entries.append(PieChartDataEntry(value: 20.0, label: "Toshiba"))
          entries.append(PieChartDataEntry(value: 45.0, label: "Samsung"))
//      } else {
//          entries.append(PieChartDataEntry(value: 80.0, label: "Intel"))
//          entries.append(PieChartDataEntry(value: 20.0, label: "AMD"))
//      }
      
      let dataSet = PieChartDataSet(entries:entries, label: "")
      dataSet.colors = [UIColor.systemTeal, UIColor.blue, UIColor.systemIndigo]
      dataSet.drawValuesEnabled = false
      
      pchart.data = PieChartData(dataSet: dataSet)
     }
}
