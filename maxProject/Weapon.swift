//
//  Weapon.swift
//  maxProject
//
//  Created by Vladimir Timoshenko on 11.12.2017.
//  Copyright © 2017 Vladimir Timoshenko. All rights reserved.
//

import Foundation

enum Bonus {
   case rukiBazuki, armourPenitration, health
}


class Weapon {
    var name: String
    var damage: Double
    var bonus: Bonus
    var wearinnes: Double
    var price: Int
    
    
    init() {
        name = ""
        damage = 0.0
        bonus = Bonus.health
        wearinnes = 0.0
        price = 0
    }
    
    
    
    
    init(name: String, damage: Double, bonus: Bonus, wearinnes: Double, price: Int) {
        self.name = name
        self.damage = damage
        self.bonus = bonus
        self.wearinnes = wearinnes
        self.price = price
    }
    
    
    
    func getWeaponDamage() -> Double {
        
        var damageValue = self.damage
        
        switch bonus {
        case .armourPenitration:
            damageValue += 0
        case .health:
            damageValue += 0
        case .rukiBazuki:
            damageValue += 10.5
        default:
            damageValue += 0
            
            
        }
        return damageValue
    }
    
    
    
    
    
    
    
}
