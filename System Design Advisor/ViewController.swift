//
//  ViewController.swift
//  System Design Advisor
//
//  Created by Dylan Telson on 2/8/20.
//  Copyright © 2020 Dylan Telson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    //These are the parent views to move
    @IBOutlet weak var computerPartQuestion: UIView!
    @IBOutlet weak var budgetQuestion: UIView!
    @IBOutlet weak var upgradeQuestion: UIView!
    @IBOutlet weak var placeholderQuestion: UIView!
    
    @IBOutlet weak var cloudSupportSwitch: UISwitch!
    
    @IBOutlet weak var upgradeSwitch: UISwitch!
    
    @IBOutlet var computerPartTextField: UITextField!
    @IBOutlet var budgetTextField: UITextField!
    @IBOutlet var TextField3: UITextField!
    @IBOutlet weak var selectedPartTextField: UITextField!
    
    var textFields = [UITextField]()
    var hiddenViews = [UIView]()
    
    @IBOutlet weak var selectedPartText: UILabel!
    //default computer part is CPU Processor
    var computerPart = "CPU Processor"
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var CloudSupport: UIView!
    
    var computerPartList = ["CPU Processor", "Motherboard", "Power Supply", "Storage"]
    var processorTypes = ["Optional", "Intel i3", "Intel i5", "Intel i7"]
    var storageBrands = ["Seagate", "Toshiba", "Samsung"]
    var seagateTypes = ["Barracuda", "Ironwolf"]
    var toshibaTypes = ["X300", "XG5"]
    var samsungTypes = ["EVO", "T5", "970 EVO Plus"]
    var storageSize = ["256GB", "512GB", "1TB", "2TB", "5TB"]
    var picker2Type = ["2test1", "2test2", "2test3"]
    
    var cloudSupportOn = true
    
    var listOfBrandTypes : [[String]] = [[]]
    
    var currentStorageBrand = "Seagate"
    
    var currentTextField = UITextField()
    var currentQuestion = UIView()
    
    var screenSize = UIScreen.main.bounds
    
    @IBOutlet weak var errorAlert: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        computerPartTextField.becomeFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upgradeSwitch.backgroundColor = UIColor(red: 0.6, green: 0.756, blue: 0.85, alpha: 1);
        upgradeSwitch.layer.cornerRadius = 16;
        
        cloudSupportSwitch.backgroundColor = UIColor(red: 0.6, green: 0.756, blue: 0.85, alpha: 1);
        cloudSupportSwitch.layer.cornerRadius = 16;
        
        listOfBrandTypes = [seagateTypes, toshibaTypes, samsungTypes]
        textFields = [computerPartTextField, budgetTextField, TextField3]
        errorAlert.frame.origin.y = -1 * errorAlert.frame.size.height
        
        hiddenViews = [budgetQuestion, upgradeQuestion, placeholderQuestion]
        for view in hiddenViews {
            view.frame.origin.y = screenSize.height + view.frame.size.height
        }
        computerPartQuestion.frame.origin.y = screenSize.height / 2 - screenSize.height / 6
        
        currentQuestion = computerPartQuestion
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if(currentQuestion == budgetQuestion && computerPart == "Storage") {
            return 3
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(currentTextField == computerPartTextField) {
            return computerPartList[row]
        } else if(currentTextField == TextField3) {
            return picker2Type[row]
        } else if(currentTextField == selectedPartTextField) {
            if(computerPart == "CPU Processor") {
                return self.processorTypes[row]
            } else {
                //for now this is just storage
                if(component == 0) {
                    return storageBrands[row]
                } else if(component == 1) {
                    if(currentStorageBrand == "Seagate") {return seagateTypes[row]}
                    else if(currentStorageBrand == "Toshiba") {return toshibaTypes[row]}
                    else {return samsungTypes[row]}
                } else {
                    return storageSize[row]
                }
            }
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(currentTextField == computerPartTextField) {
            return computerPartList.count
        } else if(currentTextField == TextField3) {
            return picker2Type.count
        } else if(currentTextField == selectedPartTextField) {
            if(computerPart == "CPU Processor") {
                return 4
            } else {
                //currently just for storage
                if(component == 0) {
                    return 3
                } else if(component == 1) {
                    if(currentStorageBrand == "Seagate") {return seagateTypes.count}
                    else if(currentStorageBrand == "Toshiba") {return toshibaTypes.count}
                    else {return samsungTypes.count}
                } else {
                    return storageSize.count
                }
            }
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(currentTextField == computerPartTextField) {
            computerPartTextField.text = computerPartList[row]
            if(computerPartTextField.text == "Storage") {
                CloudSupport.isHidden = false
            } else {
                CloudSupport.isHidden = true
            }
            computerPart = computerPartTextField.text!
        } else if(currentTextField == TextField3) {
            TextField3.text = picker2Type[row]
        } else if(currentTextField == selectedPartTextField) {
            if(computerPart == "CPU Processor") {
                selectedPartTextField.text = self.processorTypes[row]
            } else {
                //for now, this is if storage
                if(component == 0) {
                    currentStorageBrand = storageBrands[row]
                    pickerView.reloadComponent(1)
                    selectedPartTextField.text = self.currentStorageBrand + " " + self.listOfBrandTypes[pickerView.selectedRow(inComponent: 0)][pickerView.selectedRow(inComponent: 1)] + " " + storageSize[pickerView.selectedRow(inComponent: 2)]
                } else if(component == 1) {
                    selectedPartTextField.text = self.currentStorageBrand + " " + self.listOfBrandTypes[pickerView.selectedRow(inComponent: 0)][row] + " " + storageSize[pickerView.selectedRow(inComponent: 2)]
                }
                else {
                    selectedPartTextField.text = self.currentStorageBrand + " " + self.listOfBrandTypes[pickerView.selectedRow(inComponent: 0)][pickerView.selectedRow(inComponent: 1)] + " " + storageSize[pickerView.selectedRow(inComponent: 2)]
                }
            }
        }
        if(currentTextField.tag < textFields.count - 1) {
            //textFields[currentTextField.tag + 1].becomeFirstResponder()
        } else {
            //self.view.endEditing(true)
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
        if(currentTextField.text != "") {
            self.view.endEditing(true)
            var nextQuestion : UIView
            if(currentQuestion.accessibilityIdentifier == "computerpartquestion") {
                nextQuestion = upgradeQuestion
            } else if(currentQuestion.accessibilityIdentifier == "upgradequestion") {
                print("upgrading")
                if(upgradeSwitch.isOn) {
                    selectedPartText.text! = "What is your current " + computerPart.lowercased() + "?"
                    nextQuestion = budgetQuestion
                    print("budget")
                } else {
                    print("bad")
                    //currently not implemented, delete next
                    nextQuestion = computerPartQuestion
                }
            } else {
                self.performSegue(withIdentifier: "inputToOutput", sender: self)
                return
                //nextQuestion = computerPartQuestion
            }
            UIView.animate(withDuration: 0.8, animations: {
                self.currentQuestion.frame.origin.y = 0 - self.currentQuestion.frame.size.height
                nextQuestion.frame.origin.y = self.screenSize.height / 2 - self.screenSize.height / 6
            })
            currentQuestion = nextQuestion
        } else {
            print(2)
            UIView.animate(withDuration: 0.4, animations: {
                self.errorAlert.frame.origin.y = 0
            })
            UIView.animate(withDuration: 0.4, delay: 5, animations: {
                self.errorAlert.frame.origin.y = -1 * self.errorAlert.frame.size.height
            })
            currentTextField.becomeFirstResponder()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is OutputView
        {
            let next = segue.destination as? OutputView
            next!.computerPart = self.computerPart
            if(computerPart == "Storage") {
//                let storageParts = selectedPartTextField.text?.split(separator: " ")
//                if let brand = storageParts?[0] {
//                    next!.storageType[0] = String(brand)
//                }
//                if let type = storageParts?[1] {
//                    next!.storageType[1] = String(type)
//                }
//                if let size = storageParts?[2] {
//                    next!.storageType[2] = String(size)
//                }
                next!.storageType[0] = currentStorageBrand
                next!.storageType[1] = self.listOfBrandTypes[pickerView.selectedRow(inComponent: 0)][pickerView.selectedRow(inComponent: 1)]
                next!.storageType[2] = storageSize[pickerView.selectedRow(inComponent: 2)]
            } else {
                next!.nonStorageType = selectedPartTextField.text!
            }
        }
    }
    //        for n in 0 ..< textFields.count {
    //            if(textFields[n].text == "") {
    //                UIView.animate(withDuration: 0.4, animations: {
    //                    self.errorAlert.frame.origin.y = 0
    //                })
    //                UIView.animate(withDuration: 0.4, delay: 5, animations: {
    //                    self.errorAlert.frame.origin.y = -1 * self.errorAlert.frame.size.height
    //                })
    //                textFields[n].becomeFirstResponder()
    //            } else {
    //
    //            }
    //        }
}

