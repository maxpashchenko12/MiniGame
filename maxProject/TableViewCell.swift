//
//  TableViewCell.swift
//  maxProject
//
//  Created by Max on 21.12.17.
//  Copyright © 2017 Vladimir Timoshenko. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    
    
    
    
    
    @IBOutlet weak var nameWeaponLabel: UILabel!
    @IBOutlet weak var damageWeaponLabel: UILabel!
    @IBOutlet weak var wearinnesWeaponLabel: UILabel!
    @IBOutlet weak var bonusWeaponLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
