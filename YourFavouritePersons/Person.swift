//
//  Person.swift
//  YourFavouritePersons
//
//  Created by Mark Booster on 24-07-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class Person {
    
    private var _imagePath: String
    private var _namePerson: String
    private var _personDateOfBirth: String
    private var _personDescription: String
    private var _personQuote: String
    
    var imagePath: String {
        return _imagePath
    }
    
    var namePerson: String {
        return _namePerson
    }
    
    var personDateOfBirth: String {
        return _personDateOfBirth
    }
    
    var personDescription: String {
        return _personDescription
    }
    
    var personQuote: String {
        return _personQuote
    }
    
    init(imagePath: String, namePerson: String, personDateOfBirth: String, personDescription: String, personQuote: String) {
        self._imagePath = imagePath
        self._namePerson = namePerson
        self._personDateOfBirth = personDateOfBirth
        self._personDescription = personDescription
        self._personQuote = personQuote
    }
    
}
