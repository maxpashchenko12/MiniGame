//
//  TableViewCell.swift
//  maxProject
//
//  Created by Max on 22.12.17.
//  Copyright © 2017 Vladimir Timoshenko. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameWeaponLabel: UILabel!
    @IBOutlet weak var damageWeaponLabel: UILabel!
    @IBOutlet weak var wearinnesWeaponLabel: UILabel!
    @IBOutlet weak var bonusWeaponLabel: UILabel!
    @IBOutlet weak var priceWeaponLabel: UILabel!
    @IBOutlet weak var weaponImages: UIImageView!
    
    
    var shopTableVC: ShopViewController!
   // var parentVC: ViewController!
    var indexPath: IndexPath!
    
    
    
    
    
   
    
    
    
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (shopTableVC.weaponDict as AnyObject).count
        
    }
    

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        nameWeaponLabel.text        = ""
        damageWeaponLabel.text      = ""
        bonusWeaponLabel.text       = ""
        wearinnesWeaponLabel.text   = ""
        priceWeaponLabel.text       = ""
        
    }

    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
