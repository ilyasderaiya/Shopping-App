//
//  AdminViewController.swift
//  Shopping App
//
//  Created by Srinath Suddala on 2019-03-25.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    @IBOutlet weak var txtProdName: UITextField!
    @IBOutlet weak var txtProdPrice: UITextField!
    @IBOutlet weak var txtProdQty: UITextField!
    @IBOutlet weak var txtProdImg: UITextField!
    var m = Model.sharedModel
    override func viewDidLoad() {
        super.viewDidLoad()
        hideBack()
        self.navigationItem.title = "Admin"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddProdClick(_ sender: UIButton) {
        if (txtProdName.text?.isEmpty)! || (txtProdPrice.text?.isEmpty)! || (txtProdQty.text?.isEmpty)! || (txtProdImg.text?.isEmpty)! {
            let alert = UIAlertController(title: "Empty", message: "All field required to be filled", preferredStyle: .alert)
            let okbutton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okbutton)
            self.present(alert, animated: true)
        }else{
        m.p.append(Products(productId: m.p.count, productName: txtProdName.text!, productQuantity: Int(txtProdQty!.text!)!, productPrice: Double(txtProdPrice.text!)!, prdImg: txtProdImg.text!))
            let alert = UIAlertController(title: "Added!", message: "Product Added", preferredStyle: .alert)
            let okbutton = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okbutton)
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func btnLogoutClick(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let signinVC = sb.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.present(signinVC, animated: true)
    }
    
    @objc func logout(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func hideBack()
    {
        self.navigationItem.hidesBackButton = true
        let buttonLogout = UIBarButtonItem(title: NSLocalizedString("Logout", comment: ""), style: UIBarButtonItem.Style.plain, target: self, action: #selector(AdminViewController.logout))
        
        self.navigationItem.leftBarButtonItem = buttonLogout
    }

}
