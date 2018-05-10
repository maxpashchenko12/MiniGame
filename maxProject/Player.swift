//
//  Player.swift
//  maxProject
//
//  Created by Vladimir Timoshenko on 11.12.2017.
//  Copyright © 2017 Vladimir Timoshenko. All rights reserved.
//

import Foundation

var parentVC = ViewController()

class Player {
    
    static let initPlayer = Player()
    
    var name: String
    var hp: Double
    var mana: Double
    var damage: Double
    var weapon: Weapon
    var armour: Double
    var points: Int
    var level: Int
    var currentExp: Int
    var expToNextLevel: Int
    
    
    
     init() {
        name = ""
        hp = 0.0
        mana = 0.0
        damage = 0.0
        weapon = Weapon()
        armour = 0.0
        points = 0
        level = 0
        currentExp = 0
        expToNextLevel = 0
    }
    
    
    
     init(name: String, hp: Double, mana: Double, damage: Double, weapon: Weapon, armour: Double, level: Int, points: Int, currentExp: Int, expToNextLevel: Int) {
        self.name = name
        self.hp = hp
        self.mana = mana
        self.damage = damage
        self.weapon = weapon
        self.armour = armour
        self.level = level
        self.points = points
        self.currentExp = currentExp
        self.expToNextLevel = expToNextLevel
    }
    
    
    func loadPlayer() -> Player {
        
        let player = Player(name: "Lobov", hp: 10.0, mana: 5.5, damage: 1.5, weapon: Weapon.init(name: "bashka", damage: 5.5, bonus: Bonus.armourPenitration, wearinnes: 0.9, price:20), armour: 0.25, level: 1, points: 50, currentExp: 100, expToNextLevel: 1500)
      
        
        return player
    }
    
    
    func playerDamage() -> Double {
        
    let dam = self.damage + weapon.damage * weapon.wearinnes
        return dam
    }
    
    
    
    func playerKick(enemy: Enemy) {

        if enemy.armour > 0 {
            enemy.hp -= playerDamage() * enemy.armour
        } else {
            enemy.hp -= playerDamage()
        }

    }
    
    
    
    func getPlayerLevel() -> Int  {
        let lev = self.level
        
        return lev
}
    
    
    
func increaseLevel() {
        self.level += 1
        self.hp += 0.05
        self.mana += 0.05
        self.armour += 0.05
        self.damage += 0.05
        self.expToNextLevel += 150
    }
    
    
    
    
    func checkExp() {
        
        if currentExp == expToNextLevel {
            increaseLevel()
            
        } else if currentExp > expToNextLevel {
            increaseLevel()
            currentExp = currentExp - expToNextLevel
        } else if currentExp < expToNextLevel {
            }
        }
    
    
    
    func playerRewards(enemy: Enemy) {
        if enemy.isDeath() == true {
            self.points += 20
            self.currentExp += 300
        } 
    }
    
    func playerDeath() -> Bool {
        
        var playerDie: Bool = false
        
        if self.hp <= 0 {
            playerDie = true
        } else {
            playerDie = false
        }
        return playerDie
    }
}
    
    
    
    

