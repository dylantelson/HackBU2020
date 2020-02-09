//
//  TableViewController.swift
//  HackBU
//
//  Created by Rosh Sugathan Thaivalappil on 2/9/20.
//  Copyright © 2020 Dylan Telson. All rights reserved.
//

import UIKit

class BrandTableViewController: UITableViewController {
    
    var computerPart : String = ""
    
    var componentNames = ["Intel i9", "AMD 240", "Intel i7", "Intel i5", "AMD 220", "Intel i3"]
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.register(UINib(nibName: "BrandTableViewCell", bundle: nil), forCellReuseIdentifier: "BrandTableViewCell")
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return componentNames.count
    }

//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 250
//    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "BrandTableViewCell", for: indexPath) as! BrandTableViewCell
        let description = componentNames[indexPath.row]
        cell.set(name: description)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  self.performSegue(withIdentifier: "showdetails", sender: self)
    }
}
