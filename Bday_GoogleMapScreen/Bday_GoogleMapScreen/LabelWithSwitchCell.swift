//
//  LabelWithSwitchCell.swift
//  Bday
//
//  Created by Appinventiv on 25/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class LabelWithSwitchCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var onOffSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.onOffSwitch.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onOffSwitchTapped(_ sender: UISwitch) {
        
    }
}
