//
//  PersonCell.swift
//  YourFavouritePersons
//
//  Created by Mark Booster on 24-07-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var namePersonLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(person: Person) {
        namePersonLabel.text = person.namePerson
        personImage.image = DataService.instance.imageForPath(person.imagePath)
        
    }


}
