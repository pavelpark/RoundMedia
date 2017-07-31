//
//  RoundView.swift
//  roundMedia
//
//  Created by Pavel Parkhomey on 7/25/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit

class RoundView: UIImageView {

    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }

}
