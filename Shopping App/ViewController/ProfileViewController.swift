//
//  ProfileViewController.swift
//  Shopping App
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: BaseViewController {
    var menuIsShown=false
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var m = Model.sharedModel
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblCustName: UILabel!
    @IBOutlet weak var lblCustDob: UILabel!
    @IBOutlet weak var lblCustGender: UILabel!
    @IBOutlet weak var lblCustNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        loadData()
        addSlideMenuButton()
        addCartButton()
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        let eml = Auth.auth().currentUser?.email
        lblEmail.text = "Email: \(String(describing: eml!))"
        lblCustName.text = "Name: \(m.cust.custName)"
        lblCustDob.text = "Date of Birth: \(m.cust.custDob)"
        lblCustGender.text = "Gender: \(m.cust.custGender)"
        lblCustNumber.text = "Phone No. :\(m.cust.custNumber)"
    }

    @IBAction func btnEditClick(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let editVC = sb.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        self.navigationController?.pushViewController(editVC, animated: true)
    }
}
