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
    

}
