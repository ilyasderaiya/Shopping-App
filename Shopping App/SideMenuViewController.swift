//
//  SideMenuViewController.swift
//  Shopping App
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit
import Firebase

class SideMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnHomeAction(_ sender: UIButton) {
        let sb=UIStoryboard(name: "Main", bundle: nil)
        let homeVC=sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.present(homeVC, animated: true)
    }
    @IBAction func btnProfileAction(_ sender: UIButton) {
        let sb=UIStoryboard(name: "Main", bundle: nil)
        let profileVC=sb.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
        self.present(profileVC, animated: true)
    }
    
    @IBAction func btnLogoutAction(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            
            let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = signInPage
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
