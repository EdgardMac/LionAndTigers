//
//  tiger.swift
//  Lions&Tigers
//
//  Created by Edgard Maciel on 10/2/15.
//  Copyright © 2015 Edgard Maciel. All rights reserved.
//

import Foundation
import UIKit


struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named: "")
    
    func chuff(){
    print("Tiger: Chuff Chuff")
    
    }
    
    func chuffANumberOfTimes (numberOfTimes :Int){
        
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
        
        self.chuff()
            
        }
    
    }
    
    func chuffANumberOfTimes (numberOfTimes :Int, isLoud :Bool){
    
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; ++chuffTimes {
        
            if isLoud {
                
                chuff()
            }else {
                
                print("Tiger: purr purr")
            }
        
        }
    
    }
    
    func ageInTigerYearsFromAge (regularAge :Int) -> Int {
    
    let newage = regularAge*3
        
        return newage
    
    }

    
    
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        var randomFact: String
        if randomNumber == 0 {
            randomFact = "The Tiger is the biggest species in the cat family"
        }
        else if randomNumber == 1 {
            randomFact = "Tigers can reach a length of 3.3 meters"
        }
        else {
            randomFact = "A group of tigers is known as an 'ambush' or 'streak'"
        }
        return randomFact
    }
}
