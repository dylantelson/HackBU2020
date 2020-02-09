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
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var img1: UIImageView!
    @IBOutlet var img2: UIImageView!
    @IBOutlet var img3: UIImageView!
    @IBOutlet var img4: UIImageView!
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
          entries.append(PieChartDataEntry(value: 9.0, label: "Seagate"))
          entries.append(PieChartDataEntry(value: 25.0, label: "Toshiba"))
          entries.append(PieChartDataEntry(value: 15.0, label: "Azure"))
          entries.append(PieChartDataEntry(value: 40.0, label: "AWS"))
          entries.append(PieChartDataEntry(value: 11.0, label: "Samsung"))
          label2.text = "AWS"
          label3.text = "Toshiba"
          label4.text = "Azure"
          label5.text = "Samsung"
        img1.image = UIImage(named: "1")
          img2.image = UIImage(named: "2")
          img3.image = UIImage(named: "1")
          img4.image = UIImage(named: "2")
      } else if(sortby == "Durable") {
          entries.append(PieChartDataEntry(value: 25.0, label: "Azure"))
          entries.append(PieChartDataEntry(value: 35.0, label: "AWS"))
          entries.append(PieChartDataEntry(value: 12.0, label: "Seagate"))
          entries.append(PieChartDataEntry(value: 18.0, label: "Toshiba"))
          entries.append(PieChartDataEntry(value: 10.0, label: "Samsung"))
          label2.text = "AWS"
          label3.text = "Azure"
          label4.text = "Toshiba"
          label5.text = "Seagate"
        img1.image = UIImage(named: "1")
          img2.image = UIImage(named: "1")
          img3.image = UIImage(named: "1")
          img4.image = UIImage(named: "2")
      } else if(sortby == "Cost-Effective") {
               entries.append(PieChartDataEntry(value: 20.0, label: "Seagate"))
               entries.append(PieChartDataEntry(value: 30.0, label: "Toshiba"))
               entries.append(PieChartDataEntry(value: 35.0, label: "Samsung"))
               entries.append(PieChartDataEntry(value: 10.0, label: "Azure"))
               entries.append(PieChartDataEntry(value: 5.0, label: "AWS"))
          label2.text = "Samsung"
          label3.text = "Toshiba"
          label4.text = "Seagate"
          label5.text = "Seagate"
        img1.image = UIImage(named: "1")
          img2.image = UIImage(named: "")
          img3.image = UIImage(named: "2")
          img4.image = UIImage(named: "1")
           }
        else if(sortby == "Best-Service") {
                      entries.append(PieChartDataEntry(value: 26.0, label: "Seagate"))
                      entries.append(PieChartDataEntry(value: 14.0, label: "Toshiba"))
                      entries.append(PieChartDataEntry(value: 16.0, label: "Azure"))
                      entries.append(PieChartDataEntry(value: 24.0, label: "Samsung"))
                      entries.append(PieChartDataEntry(value: 20.0, label: "AWS"))
          label2.text = "Seagate"
          label3.text = "Samsung"
          label4.text = "AWS"
          label5.text = "Azure"
        img1.image = UIImage(named: "1")
          img2.image = UIImage(named: "1")
          img3.image = UIImage(named: "1")
          img4.image = UIImage(named: "2")
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
