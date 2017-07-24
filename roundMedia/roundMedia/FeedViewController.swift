//
//  FeedViewController.swift
//  roundMedia
//
//  Created by Pavel Parkhomey on 7/20/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func signOutButton(_ sender: Any) {
        let KeychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("-----: Removed successful \(KeychainResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }

}
