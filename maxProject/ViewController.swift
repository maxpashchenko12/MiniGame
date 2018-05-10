//
//  ViewController.swift
//  maxProject
//
//  Created by Vladimir Timoshenko on 11.12.2017.
//  Copyright © 2017 Vladimir Timoshenko. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var enemyWeaponView: UIView!
    @IBOutlet weak var enemyWeaponLabel: UILabel!
    @IBOutlet weak var enemyHpView: UIView!
    @IBOutlet weak var enemyHpLabel: UILabel!
    @IBOutlet weak var enemyManaView: UIView!
    @IBOutlet weak var enemyManaLabel: UILabel!
    @IBOutlet weak var enemyImageView: UIImageView!
    
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerHpView: UIView!
    @IBOutlet weak var playerHpLabel: UILabel!
    @IBOutlet weak var playerManaView: UIView!
    @IBOutlet weak var playerManaLabel: UILabel!
    @IBOutlet weak var playerExpLabel: UILabel!
    
    
    @IBOutlet weak var shopButtonOutlet: UIButton!
    
    var enemyImageArray: [UIImage] = [
        UIImage(named: "joker.png")!,
        UIImage(named: "deathstroke.png")!,
        UIImage(named: "harley.png")!,
        UIImage(named: "Deadshot.png")!]
    
    
    var player: Player!
    var enemy: Enemy!
    var lastImageIndex = 0
    
    @IBOutlet weak var nickNameView: UIView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    
    
    @IBAction func saveLoginButtonAction(_ sender: Any) {
        
        playerNameLabel.text = loginTextField.text
        UserDefaults.standard.set(loginTextField.text, forKey: "name")
        UserDefaults.standard.set(player.loadPlayer(), forKey: "player")
        
        
        
    if playerNameLabel.text != nil {
        nickNameView.isHidden = true
        loginTextField.isHidden = true
        saveButtonOutlet.isHidden = true
    }
}

    
    func enemyStatsLabel() {
        
        enemyHpLabel.text = "\(enemy.hp)"
        enemyManaLabel.text = "\(enemy.mana)"
        //enemyWeaponLabel.text = "\(enemy.weapon.name): +\(enemy.weapon.damage) damage"
    }
    
    
    
    func loadPlayScene() {
        
        player = Player().loadPlayer()
        playerHpLabel.text = "\(player.hp)"
        playerManaLabel.text = "\(player.mana)"
        playerExpLabel.text = "\(player.currentExp)/\(player.expToNextLevel)"
            
        enemy = Enemy().firstEnemy()
        enemyStatsLabel()
        enemyImageView.image = enemyImageArray[lastImageIndex]
    }

    
    
    
    
    func popUp() {
        
       
   nickNameView.layer.cornerRadius = 6
   enemyWeaponView.layer.cornerRadius = 6
   //enemyWeaponLabel.layer.cornerRadius = 6
   enemyHpView.layer.cornerRadius = 6
   enemyManaView.layer.cornerRadius = 6

   playerNameLabel.layer.cornerRadius = 6
   playerHpView.layer.cornerRadius = 6
   playerManaView.layer.cornerRadius = 6
   playerExpLabel.layer.cornerRadius = 6
       
   shopButtonOutlet.layer.cornerRadius = 6
        
        if playerNameLabel.text != nil {
            nickNameView.isHidden = true
            loginTextField.isHidden = true
            saveButtonOutlet.isHidden = true
        } else {
            let alert = CustomMethods.Alerts.createAlert(titleText: "Error", messageText: "Free string")
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
func shake() {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: enemyImageView.center.x - 10, y: enemyImageView.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: enemyImageView.center.x + 10, y: enemyImageView.center.y))
        
        enemyImageView.layer.add(animation, forKey: "position")
    
    player.weapon.wearinnes -= 0.04
    if player.weapon.wearinnes <= 0 {
        let alert = CustomMethods.Alerts.createAlert(titleText: "Weapon is broken", messageText: "buy new")
        self.present(alert, animated: true, completion: nil)
        player.weapon.damage = 0
    }
    
    }
    
    
    
@objc func myUIImageViewTapped(sender: UITapGestureRecognizer ) {
        shake()
        
        
        
         player.playerKick(enemy: enemy)
        
        
        if enemy.counterAttack(player: player) {
          if player.playerDeath() {
            let alert = CustomMethods.Alerts.createAlert(titleText: "Game Over", messageText: "You death!")
            self.present(alert, animated: true, completion: nil)
            playerHpLabel.text = "\(0.0)"
        } else {
            playerHpLabel.text = "\(player.hp)"
            }
        }
        
        
        
       if enemy.isDeath() {
            let alert = CustomMethods.Alerts.createAlert(titleText: "You win", messageText: "Who's next ?")
            self.present(alert, animated: true, completion: nil)
            player.checkExp()
            player.playerRewards(enemy: enemy)
            playerExpLabel.text = "\(player.currentExp)/\(player.expToNextLevel)"
        
            enemy = Enemy().newEnemy()
            enemyStatsLabel()
            var index = 0
        repeat {
            
            index = Int(arc4random_uniform(3))
            
        } while index == lastImageIndex
        
        lastImageIndex = index
        
            enemyImageView.image = enemyImageArray[index]
        } else {
            enemyStatsLabel()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enemyWeaponLabel.isHidden = true
        enemyWeaponView.isHidden = true
        
        popUp()
        loadPlayScene()
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(self.myUIImageViewTapped(sender:)))
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        view.addGestureRecognizer(singleTap)
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        if let x = UserDefaults.standard.object(forKey: "name") {
            playerNameLabel.text = x as? String
            
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "shopSegue" {
            
            let shopController = segue.destination as? ShopViewController
            shopController?.player = self.player
            
            
        }
    }
    
    
    
    
    
    
    

}


