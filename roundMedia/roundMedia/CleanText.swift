//
//  CleanText.swift
//  roundMedia
//
//  Created by Pavel Parkhomey on 7/14/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

class CleanText: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.1).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 2.0
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)

    }
    
}
