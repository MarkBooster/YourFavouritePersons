//
//  AddFavouritePersonVC.swift
//  YourFavouritePersons
//
//  Created by Mark Booster on 24-07-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class AddFavouritePersonVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dateOfBirthDatePicker: UIDatePicker!
    @IBOutlet weak var personDescriptionTextField: UITextField!
    @IBOutlet weak var favouriteQuoteTextfield: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

    }
    
    @IBAction func addPictureButton(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func makePostButton(sender: AnyObject) {
        if let name = nameField.text, let age = dateOfBirthDatePicker.textInputMode, let desc = personDescriptionTextField.text, let quote = favouriteQuoteTextfield.text, let img = personImage.image {
            
        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        personImage.image = image
    }
}
