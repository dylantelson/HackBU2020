//
//  TableViewController.swift
//  HackBU
//
//  Created by Rosh Sugathan Thaivalappil on 2/9/20.
//  Copyright © 2020 Dylan Telson. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var computerPart : String = ""

    let sortby = ["Popular","Durable","Cost-Effective","Best-Service"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let description = sortby[indexPath.row]
        cell.set(name: description)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toBrandTableView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is BrandTableViewController {
            let next = segue.destination as? BrandTableViewController
            next!.computerPart = self.computerPart
        }
    }
}
