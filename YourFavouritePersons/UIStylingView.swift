//
//  UIStylingView.swift
//  YourFavouritePersons
//
//  Created by Mark Booster on 24-07-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
            
        }
    }
}