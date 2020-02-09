//
//  TableViewCell.swift
//  HackBU
//
//  Created by Rosh Sugathan Thaivalappil on 2/9/20.
//  Copyright © 2020 Dylan Telson. All rights reserved.
//

import UIKit
class BrandTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func set(name: String)
    {
        self.name.text = name
    }
}
