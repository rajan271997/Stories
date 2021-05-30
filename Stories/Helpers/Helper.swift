//
//  Helper.swift
//  Stories
//
//  Created by Rajan Arora on 30/05/21.
//

import UIKit

class Helper {
    func roundViews(radius : CGFloat,view : UIView) {
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
    }
}
