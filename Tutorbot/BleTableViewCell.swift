//
//  BleTableViewCell.swift
//  Tutorbot
//
//  Created by student on 03/06/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class BleTableViewCell: UITableViewCell {

    @IBOutlet weak var nameBleDevice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
