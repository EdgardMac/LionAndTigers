//
//  ViewController.swift
//  Lions&Tigers
//
//  Created by Edgard Maciel on 10/2/15.
//  Copyright © 2015 Edgard Maciel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var breedLabel: UILabel!
    
    @IBOutlet weak var randomFactLevel: UILabel!
    
    
    var myTigers:[Tiger] = []
    var lions: [Lion] = []
    var lionCubs: [LionCub] = []
    
    var currentIndex = 0
    
    var currentAnimal = ( species: "Tiger", index: 0)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage( named: "BengalTiger.jpg")
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myTiger.chuff()
        myTiger.chuffANumberOfTimes(3, isLoud: false)
        
        myTigers.append(myTiger)
        
        print("My tiger's name is: \(myTiger.name), it's age is: \(myTiger.age), it's breed is: \(myTiger.breed), and it's image is: \(myTiger.image)")
        
        myImageView.image=myTiger.image
        nameLabel.text=myTiger.name
        ageLabel.text="\(myTiger.age)"
        breedLabel.text=myTiger.breed
        randomFactLevel.text=myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigres"
        secondTiger.age = 2
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
        secondTiger.chuff()
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger ()

        thirdTiger.name = "Jacob"
        thirdTiger.age = 4
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        myTiger.chuffANumberOfTimes(3)
        secondTiger.chuffANumberOfTimes(2)
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name  = "Mufasa"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        lion.roar()
        lioness.roar()
        lion.changeToAlphaMale()
        print(lion.isAlphaMale)
        
        self.lions += [ lion, lioness]
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale = true
        
        lionCub.roar()
        lionCub.rubLionCubsBelly()
        
        var femaleLionCub = LionCub()

        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        
        self.lionCubs += [lionCub, femaleLionCub]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        updateAnimal()
        updateView()
        

        
    }
    
    
    func updateAnimal() {
        
        switch currentAnimal {
            
        case ("Tiger", _) :
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
            
        case("Lion",_):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
            
        default :
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    
    func updateView(){
        
        
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFactLevel.text = tiger.randomFact()
            }
            else if self.currentAnimal.species == "Lion" {
                let lion = self.lions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subspecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.randomFactLevel.text = lion.randomFact()   
            }
            
            else if self.currentAnimal.species == "LionCub" {
                let lionCub = self.lionCubs[self.currentAnimal.index]
                self.myImageView.image = lionCub.image
                self.breedLabel.text = lionCub.subspecies
                self.ageLabel.text = "\(lionCub.age)"
                self.nameLabel.text = lionCub.name
                self.randomFactLevel.text = lionCub.randomFact()
            }
            
            self.randomFactLevel.hidden = false
            
            
            
            }, completion: {
                (finished:Bool) -> () in
        })
        
        
    }
    


}

