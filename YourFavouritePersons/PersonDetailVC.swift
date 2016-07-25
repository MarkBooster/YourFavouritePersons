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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        


    }
    

    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func editButton(sender: AnyObject) {
    }

}
