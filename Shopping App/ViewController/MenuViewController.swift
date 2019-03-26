//
//  MenuViewController.swift
//  Shopping App
//
//  Created by Ilyas Deraiya on 2019-03-22.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit
import Firebase

class MenuViewController: UIViewController {

    var btnMenu : UIButton!
    var delegate : SlideMenuDelegate?
    var m: Model?
    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func btnHomeClick(_ sender: Any) {
        let sb=UIStoryboard(name: "Main", bundle: nil)
        let homeVC=sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        //self.present(homeVC, animated: true)
        //homeVC.m=m
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    
    
    
    
    @IBAction func btnProfileClick(_ sender: Any) {
        let sb=UIStoryboard(name: "Main", bundle: nil)
        let profileVC=sb.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
        //self.present(profileVC, animated: true)
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @IBAction func btnAboutClick(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let aboutVC = sb.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        self.navigationController?.pushViewController(aboutVC, animated: true)
    }
    
    
    @IBAction func btnLogoutClick(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            /*
            let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = signInPage*/
          //  let sb = UIStoryboard(name: "Main", bundle: nil)
        //    let signinVC = sb.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
       //     self.navigationController?.popToViewController(signinVC, animated: true)
            
            self.navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func btnCloseMenuClick(_ sender: UIButton) {
        btnMenu.tag = 0
        btnMenu.isHidden = false
        if (self.delegate != nil){
            var index = Int32(sender.tag)
            if (sender == self.btnCloseMenuOverlay) {
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear },
                       completion: { (finished) -> Void in
                        self.view.removeFromSuperview()
                        self.removeFromParent()
        })
        
    }
    
    @IBAction func btnMyOrdersAction(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let orderVC = sb.instantiateViewController(withIdentifier: "OrderTableViewController") as! OrderTableViewController
        self.navigationController?.pushViewController(orderVC, animated: true)
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
