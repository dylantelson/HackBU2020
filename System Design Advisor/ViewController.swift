//
//  ViewController.swift
//  System Design Advisor
//
//  Created by Dylan Telson on 2/8/20.
//  Copyright © 2020 Dylan Telson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    
    @IBOutlet var TextField1: UITextField!
    @IBOutlet var TextField2: UITextField!
    @IBOutlet var TextField3: UITextField!
    var textFields = [UITextField]()
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var CloudSupport: UIView!
    
    var picker1Type = ["CPU Processors", "Motherboards", "Power Supplies", "Storage"]
    var picker2Type = ["2test1", "2test2", "2test3"]
    
    var currentTextField = UITextField()
    
    @IBOutlet weak var errorAlert: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        TextField1.becomeFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields = [TextField1, TextField2, TextField3]
        errorAlert.frame.origin.y = -1 * errorAlert.frame.size.height
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(currentTextField == TextField1) {
            return picker1Type[row]
        } else if(currentTextField == TextField3) {
            return picker2Type[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(currentTextField == TextField1) {
            return picker1Type.count
        } else if(currentTextField == TextField3) {
            return picker2Type.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(currentTextField == TextField1) {
            TextField1.text = picker1Type[row]
            if(TextField1.text == "Storage") {
                CloudSupport.isHidden = false
            } else {
                CloudSupport.isHidden = true
            }
        } else if(currentTextField == TextField3) {
            TextField3.text = picker2Type[row]
        }
        if(currentTextField.tag < textFields.count - 1) {
            textFields[currentTextField.tag + 1].becomeFirstResponder()
        } else {
            self.view.endEditing(true)
        }
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
    
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        for n in 0 ..< textFields.count {
            if(textFields[n].text == "") {
                let errorAlert = UIAlertController(title: "Error", message: "You must fill in every text field.", preferredStyle: .alert)
                
                errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                //self.present(errorAlert, animated: true)
                UIView.animate(withDuration: 0.4, animations: {
                    self.errorAlert.frame.origin.y = 0
                })
                UIView.animate(withDuration: 0.4, delay: 5, animations: {
                    self.errorAlert.frame.origin.y = -1 * self.errorAlert.frame.size.height
                })
                textFields[n].becomeFirstResponder()
            } else {
                
            }
        }
    }
}

