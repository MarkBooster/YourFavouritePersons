//
//  DataService.swift
//  YourFavouritePersons
//
//  Created by Mark Booster on 24-07-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class DataService {
    static let instance = DataService()
    
    private var _loadedPersons = [Person]()
    
    var loadedPersons: [Person] {
        return _loadedPersons
    }
    
    func savePersons() {
        let personsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPersons)
        NSUserDefaults.standardUserDefaults().setObject(personsData, forKey: KEY_PERSONS)
    }
    
    func loadPersons() {
        if let personsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_PERSONS) as? NSData {
            
            if let personsArray = NSKeyedUnarchiver.unarchiveObjectWithData(personsData) as? [Person] {
                _loadedPersons = personsArray
            }
            
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "personsLoaded", object: nil)
)    }
    
    func saveImageAndCreatePath(image: UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPerson(post: Person) {
        _loadedPersons.append(post)
        savePersons()
        loadPersons()
    }
    
    func documentsPathForFileName(name: String) -> String {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = path[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }
    
}
