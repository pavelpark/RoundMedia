//
//  Post.swift
//  roundMedia
//
//  Created by Pavel Parkhomey on 7/28/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import Foundation

class Post {
    private var _caption: String!
    private var _imageUrl: String!
    private var _likes: Int!
    private var _postKey: String!
    
    var caption: String {
        return _caption
    }
    var imageUrl: String {
        return _imageUrl
    }
    var likes: Int {
        return _likes
    }
    var postKey: String {
        return _postKey
    }
    
    
    
}
