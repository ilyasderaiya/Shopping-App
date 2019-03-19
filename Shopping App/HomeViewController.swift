//
//  HomeViewController.swift
//  Shopping App
//
//  Created by Akhil James Joseph on 2019-03-15.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBarLogOut(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            
            let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = signInPage
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
        /*do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initial
 */
    }
    
    
}
