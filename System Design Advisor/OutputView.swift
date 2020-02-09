//
//  ViewController.swift
//  System Design Advisor
//
//  Created by Dylan Telson on 2/8/20.
//  Copyright © 2020 Dylan Telson. All rights reserved.
//

import UIKit
import Charts
class OutputView : UIViewController {
    
    var computerPart : String!
    var storageType = ["", "", ""]
    var nonStorageType = ""
    @IBOutlet var pchart: PieChartView!
    @IBOutlet weak var computerPartText: UILabel!
    @IBOutlet weak var comparisonLegend: UIView!
    
    var startpoint = 0
    let distance = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startpoint = Int(computerPartText.frame.origin.y + 30)
        comparisonLegend.frame.origin.y = CGFloat(distance) + CGFloat(startpoint) - comparisonLegend.frame.size.height / 2
        comparisonLegend.frame.origin.x = UIScreen.main.bounds.width * 0.95 - comparisonLegend.frame.size.width
        if(computerPart == "Storage") {
            computerPartText.text = storageType.joined(separator: " ")
        } else {
            computerPartText.text = nonStorageType
        }
        drawlines(lineNumber:1,old_val:100, new_val:115, percent:15, linename: "Performance - 15% Increase")
        drawlines(lineNumber:2,old_val:140, new_val:170, percent:25, linename:"Storage - 25% Increase")
        drawlines(lineNumber:3,old_val:200, new_val:240, percent:25, linename:"Reliability - 25% Increase")
        setupPieChart()
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
    if(computerPart == "Storage") {
        entries.append(PieChartDataEntry(value: 35.0, label: "Seagate"))
        entries.append(PieChartDataEntry(value: 20.0, label: "Toshiba"))
        entries.append(PieChartDataEntry(value: 45.0, label: "Samsung"))
    } else {
        entries.append(PieChartDataEntry(value: 80.0, label: "Intel"))
        entries.append(PieChartDataEntry(value: 20.0, label: "AMD"))
    }
    
    let dataSet = PieChartDataSet(entries:entries, label: "")
    dataSet.colors = [UIColor.systemTeal, UIColor.blue, UIColor.systemIndigo]
    dataSet.drawValuesEnabled = false
    
    pchart.data = PieChartData(dataSet: dataSet)
   }


   
   func drawlines (lineNumber num:Int ,old_val old:Int ,new_val new:Int , percent val:Double, linename name:String){
       
       let start = CGPoint(x:20,y:Int(num*distance)+Int(startpoint))
       let end = CGPoint(x:old+20,y:Int(num*distance)+Int(startpoint))
       
       //Factor
       let lbl = UILabel()
    lbl.frame = CGRect(x: start.x, y: start.y - 30, width: UIScreen.main.bounds.width * 0.8, height: 18)
       lbl.font = lbl.font.withSize(17)
       lbl.textColor = UIColor.black
       lbl.text = name
       view.addSubview(lbl)
       
       
       //old device
    drawLine(startpoint: start, endpint: end,linecolor: UIColor.systemTeal.cgColor,linewidth:11.0, textValue: String(val))
       
       //new device
       let start2 = CGPoint(x:20,y:Int(num*distance)+Int(startpoint+13))
       let end2 = CGPoint(x:new+20,y:Int(num*distance)+Int(startpoint+13))
    drawLine(startpoint: start2, endpint: end2, linecolor: UIColor.systemBlue.cgColor,linewidth:11.0, textValue: String(val))
   }
   
   
   // Main DrawLine Method
   func drawLine(startpoint start:CGPoint, endpint end:CGPoint, linecolor color: CGColor , linewidth widthline:CGFloat, textValue: String){

       let path = UIBezierPath()
       path.move(to: start)
       path.addLine(to: end)
       
       let shapeLayer = CAShapeLayer()
       shapeLayer.path = path.cgPath
       shapeLayer.strokeColor = color
       shapeLayer.lineWidth = widthline
       
       view.layer.addSublayer(shapeLayer)
       
       
   }
}
