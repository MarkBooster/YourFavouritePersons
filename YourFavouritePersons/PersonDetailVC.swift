//
//  PersonDetailVC.swift
//  YourFavouritePersons
//
//  Created by Mark Booster on 25-07-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class PersonDetailVC: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var favouriteQuoteTextView: UITextView!
    
    var person: Person!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = person.namePerson
        imageView.image = DataService.instance.imageForPath(person.imagePath)
        birthdayLabel.text = person.personDateOfBirth
        descriptionTextView.text = person.personDescription
        favouriteQuoteTextView.text = person.personQuote    
        
    }
    
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveEditButton(sender: AnyObject) {
        if let name = nameLabel.text, let age = birthdayLabel.text, let desc = descriptionTextView.text, let quote = favouriteQuoteTextView.text, let img = imageView.image {
            
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
            
            let person = Person(imagePath: imgPath, namePerson: name, personDateOfBirth: age, personDescription: desc, personQuote: quote)
            DataService.instance.changePerson(person)
            dismissViewControllerAnimated(true, completion: nil)
            
        }
        
    }

}

//        if let desc = descriptionTextView.text, let quote = favouriteQuoteTextView.text {
//
////            let person = Person(imagePath: imgPath, namePerson: name, personDateOfBirth: age, personDescription: desc, personQuote: quote)
//            let person = Person(imagePath: "", namePerson: "", personDateOfBirth: "", personDescription: desc, personQuote: quote)
//
//            DataService.instance.changePerson(person)
//            dismissViewControllerAnimated(true, completion: nil)
//        }
//

