//
//  ShopTableViewController.swift
//  maxProject
//
//  Created by Max on 26.12.17.
//  Copyright © 2017 Vladimir Timoshenko. All rights reserved.
//

import UIKit

class ShopTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var weaponDict = [ Weapon(name: "Excalibur", damage: 5.5, bonus: Bonus.rukiBazuki, wearinnes: 1, price: 30),
                       Weapon(name: "Thor hammer", damage: 10.0, bonus: Bonus.armourPenitration, wearinnes: 1, price: 50),
                       Weapon(name: "Frostmourne", damage: 15.0, bonus: Bonus.health, wearinnes: 1, price: 80),
                       Weapon(name: "Sauron armour", damage: 0.0, bonus: Bonus.armourPenitration, wearinnes: 1, price: 100)]
    
    
    var weaponArray: [UIImage] = [
        UIImage(named: "Excalibur.png")!,
        UIImage(named: "Thor hammer.png")!,
        UIImage(named: "Frostmourne.png")!,
        UIImage(named: "Sauron armour.png")!]
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.weaponDict.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        
        cell.shopVC = self
        cell.indexPath = indexPath
        cell.model = weaponDict[indexPath.row]
        
        let row = (indexPath?.row)!
        
        let weapon = shopVC.weaponDict[row]
        cell.nameWeaponLabel.text        = weapon.name
        cell.damageWeaponLabel.text      = "\(weapon.damage)"
        cell.bonusWeaponLabel.text       = "\(weapon.bonus)"
        cell.wearinnesWeaponLabel.text   = "\(weapon.wearinnes)"
        cell.priceWeaponLabel.text       = "\(weapon.price)"
        
        let imageWeap = shopVC.weaponArray[row]
        weaponImages.image = imageWeap
        return cell
    }
    


    // MARK: - Table view data source

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
