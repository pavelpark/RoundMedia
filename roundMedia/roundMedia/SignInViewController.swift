//
//  ViewController.swift
//  roundMedia
//
//  Created by Pavel Parkhomey on 7/11/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailFeild: CleanText!
    @IBOutlet weak var passwordFeild: CleanText!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _ = KeychainWrapper.defaultKeychainWrapper.string(forKey: KEY_UID){
        performSegue(withIdentifier: "goToFeed", sender: nil)
        }
        
    }

   

    @IBAction func facebookButtonTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("------: Unable to authenticate with Facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("------: User cancelled Facebook authentication")
            } else {
                print("------: Successfully authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("------: Unable to authenticate with Firebase")
            } else {
                print("------: Susseccfully authenticated with Firebase")
                if user != nil {
                    self.completeWithSignIn(id: (user?.uid)!)
                }
            }
        }
    }

    @IBAction func emailSignInTapped(_ sender: AnyObject) {
        
        if let email = emailFeild.text, let password = passwordFeild.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("-----: Email user authenticated with Firebase")
                    self.completeWithSignIn(id: (user?.uid)!)
                } else {
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("------: Unable to authenticate with Firebase using email")
                        } else {
                            print("------: Successfully authenticated with Firebase")
                            self.completeWithSignIn(id: (user?.uid)!)
                        }
                    })
                }
            })
        }
    }
    
    func completeWithSignIn(id: String) {
        let keychainResult = KeychainWrapper.standard.set("string" , forKey: "key uid")
        print("------: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
    
}

