//
//  ViewController.swift
//  System Design Advisor
//
//  Created by Dylan Telson on 2/8/20.
//  Copyright © 2020 Dylan Telson. All rights reserved.
//

import UIKit

class FirstQuestion: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var errorAlert: UIView!
    @IBOutlet weak var TextField1: UITextField!
    
    var picker1Type = ["CPU Processors", "Motherboards", "Power Supplies", "Storage"]
    var picker2Type = ["2test1", "2test2", "2test3"]
    
    var currentTextField = UITextField()

    
    @IBAction func submitButtonClicked(_ sender: Any) {
        print("w")
        if(TextField1.text == "") {
            UIView.animate(withDuration: 0.4, animations: {
                self.errorAlert.frame.origin.y = 0
            })
            UIView.animate(withDuration: 0.4, delay: 5, animations: {
                self.errorAlert.frame.origin.y = -1 * self.errorAlert.frame.size.height
            })
            TextField1.becomeFirstResponder()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        TextField1.becomeFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        errorAlert.frame.origin.y = -1 * errorAlert.frame.size.height
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(currentTextField == TextField1) {
            return picker1Type[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(currentTextField == TextField1) {
            return picker1Type.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(currentTextField == TextField1) {
            TextField1.text = picker1Type[row]
        }
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        currentTextField = textField
        currentTextField.inputView = pickerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
