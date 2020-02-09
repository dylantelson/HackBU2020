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
    @IBOutlet var pchart: PieChartView!
    override func viewDidLoad()
   {
           super.viewDidLoad()
           drawlines(lineNumber:1,old_val:100, new_val:115, percent:15, linename:"Performance")
           drawlines(lineNumber:2,old_val:140, new_val:170, percent:25, linename:"Storage")
           drawlines(lineNumber:3,old_val:200, new_val:240, percent:25, linename:"Reliablity")
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
        entries.append(PieChartDataEntry(value: 60.0, label: "Seagate"))
        entries.append(PieChartDataEntry(value: 40.0, label: "Other"))
        
        let dataSet = PieChartDataSet(entries:entries, label: "")
        dataSet.colors = [UIColor.systemTeal, UIColor.blue]
        dataSet.drawValuesEnabled = false
        
        pchart.data = PieChartData(dataSet: dataSet)
       }
    
    
       
       func drawlines (lineNumber num:Int ,old_val old:Int ,new_val new:Int , percent val:Double, linename name:String){
           
           let startpoint=100
           let distance=70
           
           let start = CGPoint(x:20,y:Int(num*distance)+startpoint)
           let end = CGPoint(x:old+20,y:Int(num*distance)+startpoint)
           
           //Factor
           let lbl = UILabel()
           lbl.frame = CGRect(x: start.x, y: start.y - 30, width: 200, height: 18)
           lbl.font = lbl.font.withSize(17)
           lbl.textColor = UIColor.black
           lbl.text = name
           view.addSubview(lbl)
           
           
           //old device
        drawLine(startpoint: start, endpint: end,linecolor: UIColor.systemTeal.cgColor,linewidth:11.0, textValue: String(val))
           
           //new device
           let start2 = CGPoint(x:20,y:Int(num*distance)+startpoint+13)
           let end2 = CGPoint(x:new+20,y:Int(num*distance)+startpoint+13)
        drawLine(startpoint: start2, endpint: end2, linecolor: UIColor.systemBlue.cgColor,linewidth:11.0, textValue: String(val))
           
           if(name == "Reliablity")
           {
            let lbl2 = UILabel()
            lbl2.frame = CGRect(x: 20, y: start.y + 20, width: 400, height: 20)
            lbl2.font = lbl2.font.withSize(17)
            lbl2.textColor = UIColor.black
            lbl2.text = String(format: "%.0f %% more reliable than other products in market", val)
            view.addSubview(lbl2)
           }else{
           //Percentage label
           let lbl2 = UILabel()
           lbl2.frame = CGRect(x: end2.x + 15, y: start.y - 10, width: 300, height: 20)
           lbl2.font = lbl2.font.withSize(17)
           lbl2.textColor = UIColor.black
           lbl2.text = String(format: "%.0f %% increase in " + name, val)
           view.addSubview(lbl2)
        }
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
