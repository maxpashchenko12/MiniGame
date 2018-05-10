//
//  ShopViewController.swift
//  maxProject
//
//  Created by Max on 26.12.17.
//  Copyright © 2017 Vladimir Timoshenko. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    var parentVC: ViewController!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func closeShopButton(_ sender: Any) {
       // performSegue(withIdentifier: "closeShop", sender: ShopViewController.self)
    dismiss(animated: true, completion: nil)
    }
    
    
   
    
    
    
    
    
    
var weaponDict = [ Weapon(name: "Excalibur", damage: 5.5, bonus: Bonus.rukiBazuki, wearinnes: 1, price: 30),
                    Weapon(name: "Thor hammer", damage: 10.0, bonus: Bonus.armourPenitration, wearinnes: 1, price: 50),
                    Weapon(name: "Frostmourne", damage: 15.0, bonus: Bonus.health, wearinnes: 1, price: 80),
                    Weapon(name: "Sauron armour", damage: 0.0, bonus: Bonus.armourPenitration, wearinnes: 1, price: 100)]
    
    
    var weaponImageArray: [UIImage] = [
        UIImage(named: "Excalibur.png")!,
        UIImage(named: "Thor hammer.png")!,
        UIImage(named: "Frostmourne.png")!,
        UIImage(named: "Sauron armour.png")!]
    
  
    
    var weapon: Weapon!
    var player: Player!
    var indexPath: IndexPath! = []
    
    
    @IBAction func buyButtonAction(_ sender: Any) {
        
        if let cell = (sender as AnyObject).superview??.superview as? TableViewCell {
            indexPath = tableView.indexPath(for: cell)
        }
        points()
        
    }
    
    
    
    
    
    func points() {
        
        
      
      //  let row = (indexPath?.row)!
        
        weapon = weaponDict[indexPath.row]
        
        
        
        print("\(player.points) < \(weapon.price)")
        
        if player.points < weapon.price {
            
            let alert = CustomMethods.Alerts.createAlert(titleText: "You cannot buy this weapon", messageText: "don't have points")
            self.present(alert, animated: true, completion: nil)
        } else if player.points >= weapon.price {
        
            player.weapon = weapon
            player.points -= weapon.price
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weaponDict.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        
//        cell.shopVC = self
//        cell.indexPath = indexPath
//        cell.model = weaponDict[indexPath.row]
        
        
        let weapon = weaponDict[indexPath.row]
        cell.nameWeaponLabel.text        = weapon.name
        cell.damageWeaponLabel.text      = "Damage: \(weapon.damage)"
        cell.bonusWeaponLabel.text       = "Bonus: \(weapon.bonus)"
        cell.wearinnesWeaponLabel.text   = "Wearinnes: \(weapon.wearinnes)"
        cell.priceWeaponLabel.text       = "Price: \(weapon.price)"
        
        let imageWeap = weaponImageArray[indexPath.row]
        cell.weaponImages.image = imageWeap
        
        return cell
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
