//
//  ConfirmationViewController.swift
//  Shopping App
//
//  Created by Ilyas Deraiya on 2019-03-22.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    var m=Model.sharedModel
    
    @IBOutlet weak var lblStreetName: UILabel!
    @IBOutlet weak var lblSuburb: UILabel!
    @IBOutlet weak var lblPostCodeState: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton=true
        let info=m.cardship
        lblStreetName.text="\(info.appartment), \(info.street)"
        lblSuburb.text=info.city
        lblPostCodeState.text="\(info.postalCode), \(info.province)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnKeepShoppingAction(_ sender: UIButton) {
        m.SCArray.removeAll()
        let sb=UIStoryboard(name: "Main", bundle: nil)
        let homeVC=sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(homeVC, animated: true)
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
