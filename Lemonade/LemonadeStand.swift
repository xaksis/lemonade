//
//  File.swift
//  Lemonade
//
//  Created by Akshay Anand on 11/16/14.
//  Copyright (c) 2014 CrayonBytes. All rights reserved.
//

import Foundation
import UIKit

class LemonadeStand {
    //prices
    let lemon_price:CGFloat = 2.0
    let ice_price:CGFloat = 2.0
    
    //supply
    var lemons:Int = 1
    var ice:Int = 1
    var money:CGFloat = 10.0
    
    //how many bought
    var lemons_bought:Int = 0
    var ice_bought:Int = 0
    
    //Today's Mix
    var lemon_mix:Int = 0
    var ice_mix:Int = 0
    var lemonade_quality = ""
    
    //Today's customers
    var preferences:[String] = []
    
    func canBuyLemon() -> Bool {
        if self.money >= lemon_price {
            return true
        }
        return false
    }
    
    func canBuyIce() -> Bool {
        if self.money >= ice_price {
            return true
        }
        return false
    }
    
    func canSellLemon() -> Bool {
        if self.lemons > 0 {
            return true
        }
        return false
    }
    
    func canSellIce() -> Bool {
        if self.ice > 0 {
            return true
        }
        return false
    }
    
    func canAddLemon() -> Bool {
        if self.lemons > 0 {
            return true
        }
        return false
    }
    
    func canRemoveLemon() -> Bool {
        if self.lemon_mix > 0 {
            return true
        }
        return false
    }
    
    func canAddIce() -> Bool {
        if self.ice > 0 {
            return true
        }
        return false
    }
    
    func canRemoveIce() -> Bool {
        if self.ice_mix > 0 {
            return true
        }
        return false
    }
    
    func buyLemon() {
        if canBuyLemon() {
            //pay the price
            self.money -= lemon_price
            
            //add to supply
            self.lemons++
            self.lemons_bought++
        }
    }

    func sellLemon() {
        if canSellLemon() {
            //remove from supply
            self.lemons--
        
            //add to money
            self.money += self.lemon_price
        }
    }
    
    func buyIce() {
        if canBuyIce() {
            //pay the price
            self.money -= self.ice_price
            
            //add to supply
            self.ice++
            self.ice_bought++
        }
    }
    
    func sellIce() {
        if canSellIce() {
            //remove from supply
            self.ice--;
            
            //add to money
            self.money += self.ice_price
        }
    }
    
    
    
    func addLemon() {
        if canAddLemon() {
            //remove one from supply
            self.lemons--
            self.lemon_mix++
        }
    }
    
    func removeLemon() {
        if canRemoveLemon() {
            self.lemon_mix--
            self.lemons++
        }
    }
    
    func addIce() {
        if canAddIce() {
            self.ice--
            self.ice_mix++
        }
    }
    
    func removeIce() {
        if canRemoveIce() {
            self.ice_mix--
            self.ice++
        }
    }
    

    
    //utility methods
    private func getLemonadeQuality(ratio: CGFloat) -> String {
        if ratio > 1 {
            return "acidic"
        }
        if ratio == 1 {
            return "equal"
        }
        return "diluted"
    }
    
    private func getPrefernceQuality(ratio: CGFloat) -> String{
        var quality = ""
        switch ratio {
        case 0.0...0.4:
            quality = "acidic"
        case 0.4...0.6:
            quality = "equal"
        default:
            quality = "diluted"
        }
        return quality
    }
    
    private func getCustomers() {
        var random_num = Int(arc4random_uniform(UInt32(10))) + 1
        //lets create a preference array
        for var i = 1; i<=random_num; i++ {
            var preference = CGFloat(arc4random())/CGFloat(UInt32.max)
            var quality = getPrefernceQuality(preference)
            println("Customer #\(i): ratio - \(preference), quality - " + quality)
            if quality == self.lemonade_quality {
                self.money++;
                println("Paid!")
            }else{
                println("No Match :(")
            }
            
        }
    }
    
    private func createMix() {
        let ratio = CGFloat(CGFloat(lemon_mix)/CGFloat(ice_mix))
        self.lemonade_quality = getLemonadeQuality(ratio)
        println("lemonade ratio: \(ratio) and quality: " + self.lemonade_quality)
     }
    
    private func reset(){
        self.lemon_mix = 0
        self.ice_mix = 0
        self.lemons_bought = 0
        self.ice_bought = 0
    }
    
    //main function to start the day
    func startDay() {
        self.createMix()
        self.getCustomers()
        self.reset()
    }
    
}