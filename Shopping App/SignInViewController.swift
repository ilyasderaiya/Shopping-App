//
//  SignInViewController.swift
//  Shopping App
//
//  Created by Akhil James Joseph on 2019-03-15.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        configureGoogleSignInButton()
    }
    
    
    
    
    //creating the Google sign in button
    fileprivate func configureGoogleSignInButton() {
        let googleSignInButton = GIDSignInButton()
        googleSignInButton.center = view.center
        view.addSubview(googleSignInButton)
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.present(homeVC, animated: true)
        }
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
    
    /*
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("Google Sign In for User")
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: (authentication.idToken)!, accessToken: (authentication.accessToken)!)
        // When user is signed in
        Auth.auth().signInAndRetrieveData(with: credential, completion: { (user, error) in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                return
            }
        })
    }
    // Start Google OAuth2 Authentication
    func sign(_ signIn: GIDSignIn?, present viewController: UIViewController?) {
        
        // Showing OAuth2 authentication window
        if let aController = viewController {
            present(aController, animated: true) {() -> Void in }
        }
    }
    // After Google OAuth2 authentication
    func sign(_ signIn: GIDSignIn?, dismiss viewController: UIViewController?) {
        // Close OAuth2 authentication window
        dismiss(animated: true) {() -> Void in }
    }
    
    */
    
}
