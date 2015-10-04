//
//  LionCub.swift
//  Lions&Tigers
//
//  Created by Edgard Maciel on 10/4/15.
//  Copyright © 2015 Edgard Maciel. All rights reserved.
//

import Foundation


class LionCub: Lion {
    
    func rubLionCubsBelly () {
        print("LionCub: Snuggle and be happy")
    }
    
    override func roar () {
        
        super.roar()
        print("LionCub: Growl Growl")
    }
    
    override func randomFact() -> String {
        var randomFactString:String
        if isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks."
        }
        else {
            randomFactString = "Cubs begin eating meat at about the age of six weeks"
        }
        return randomFactString
    }
    
}