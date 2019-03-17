//
//  SignInViewController.swift
//  Shopping App
//
//  Created by Akhil James Joseph on 2019-03-15.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSigninClick(_ sender: Any) {
        if (txtEmail.text?.isEmpty)! || (txtPassword.text?.isEmpty)! {
            displayMessage(userMessage: "All field are required to be filled!")
            return
        }
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (user, error) in
            if error == nil{
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let homeVC = sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                self.present(homeVC, animated: true)
            }
            else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
   
    
    @IBAction func btnSignUpClick(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let signupVC = sb.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(signupVC, animated: true)
    }
    
    func displayMessage(userMessage: String) -> Void {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default){ (action:UIAlertAction!) in
                // Code to do something when OK button Tapped
                print("OK Button Tapped")
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            alert.addAction(OKAction)
            self.present(alert, animated: true)
        }
    }
    
}
