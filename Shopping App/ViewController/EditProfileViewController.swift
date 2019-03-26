//
//  EditProfileViewController.swift
//  Shopping App
//
//  Created by Srinath Suddala on 2019-03-25.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var txtCustName: UITextField!
    @IBOutlet weak var txtCustDob: UITextField!
    @IBOutlet weak var txtCustGender: UITextField!
    @IBOutlet weak var txtCustNumber: UITextField!
    var m = Model.sharedModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Edit Profile"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnUpdateProfileClick(_ sender: Any) {
        if (txtCustName.text?.isEmpty)! || (txtCustDob.text?.isEmpty)! || (txtCustGender.text?.isEmpty)! || (txtCustNumber.text?.isEmpty)! {
            let alert = UIAlertController(title: "Empty", message: "All TextFied are required to be filled", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true)
            return
        }else{
            m.cust.custName = txtCustName.text!
            m.cust.custDob = txtCustDob.text!
            m.cust.custGender = txtCustGender.text!
            m.cust.custNumber = Int(txtCustNumber.text!)!
            let alert = UIAlertController(title: "Empty", message: "Profile Upodated", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
        
    }
    

}
