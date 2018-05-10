//
//  Enemy.swift
//  maxProject
//
//  Created by Vladimir Timoshenko on 11.12.2017.
//  Copyright © 2017 Vladimir Timoshenko. All rights reserved.
//

import Foundation



class Enemy: Codable {
    
    var hp: Double
    var attackDamage: Double
    var mana: Double
    var counterAttackChance: Double
    var armour: Double
//    var weapon: Weapon
    var expGiven: Int
    
    
    init() {
        
        hp = 0.0
        attackDamage = 0.0
        mana = 0.0
        counterAttackChance = 0.0
        armour = 0.0
//        weapon = Weapon()
        expGiven = 0
    }
    

    
    
    init(hp: Double, attackDamage: Double, mana: Double, counterAttackChance: Double, armour: Double/*, weapon: Weapon*/, expGiven: Int) {
        
        self.hp = hp
        self.attackDamage = attackDamage
        self.mana = mana
        self.counterAttackChance = counterAttackChance
        self.armour = armour
//        self.weapon = weapon
        self.expGiven = expGiven
        
    }
    
    
    
    func enemyDamage() -> Double {
        let enemyDam = self.attackDamage /*+ weapon.damage*/
        
        return enemyDam
    }
    
    

    func counterAttack(player: Player) -> Bool {
        
        
        var counterDamageBool: Bool = false
        let chance = drand48()
        
        if chance <= counterAttackChance {
            counterDamageBool = true
            player.hp -= self.enemyDamage() * player.armour
        } else {
            counterDamageBool = false
            }
        return counterDamageBool
        }
    
    
    func encodeWithCoder(encoder: NSCoder) {
    }
    
    
    //var objectNsCoder: NSCoder!
    
     func firstEnemy() -> Enemy {
        
        let first = Enemy()
        first.hp = 10.0
        first.attackDamage = 1.5
        first.mana = 5.2
        first.counterAttackChance = 0.05
        first.armour = 0.3
        //        first.weapon = Weapon.init(name: "usi", damage: 5.3, bonus: Bonus.rukiBazuki, wearinnes: 0.02)
        first.expGiven = 3
     
       //aCoder.encode(first, forKey: "currentEnemy")
//        let data = NSKeyedArchiver.archivedData(withRootObject: first)
//            UserDefaults.standard.set(data, forKey: "currentEnemy")
//
        //let player = Enemy(from: first as! Decoder)
       
        
        //NSKeyedArchiver.archiveRootObject(first, toFile: "currentEnemy")
       // UserDefaults.standard.set(encodedData, forKey: "previouseEnemy")
        
        try? UserDefaults.standard.set(PropertyListEncoder().encode(first), forKey: "currentEnemy")
        
        return first
    }
    
    
    
    
    func newEnemy() -> Enemy {
        
        let encoded = try? PropertyListDecoder().decode(Enemy.self, from: UserDefaults.standard.object(forKey: "currentEnemy") as! Data)
        
        let enemy = encoded as! Enemy
        
        enemy.hp += 2.5
        enemy.armour += 0.015
        enemy.mana += 2.5
        enemy.attackDamage += 0.05
        enemy.counterAttackChance += 0.02
        
//        if let data = UserDefaults.standard.object(forKey: "currentEnemy") as? NSData {
//            NSKeyedUnarchiver.unarchiveObject(with: data as Data)
//        }
        
        
        try? UserDefaults.standard.set(PropertyListEncoder().encode(enemy), forKey: "currentEnemy")
        
        return enemy
    }
    
    
    func isDeath() -> Bool {
        
        var death: Bool = false
        
            if self.hp <= 0 {
                death = true
//                parentVC.createAlert(titleText: "Enemy death", messageText: "You win")
                //newEnemy()
        } else {
                death = false
            }
            return death
        }
        
    
    
    
    
    
    
    
    }
    
    
    
    
    
    

