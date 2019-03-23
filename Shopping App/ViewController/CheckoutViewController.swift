//
//  CheckoutViewController.swift
//  Shopping App
//
//  Created by Ilyas Deraiya on 2019-03-22.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var txtCardNumber: UITextField!
    
    @IBOutlet weak var txtExpiryMonth: UITextField!
    
    @IBOutlet weak var txtExpiryYear: UITextField!
    
    @IBOutlet weak var txtCvv: UITextField!
    @IBOutlet weak var txtStreet: UITextField!
    @IBOutlet weak var txtAppartment: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtProvince: UITextField!
    @IBOutlet weak var txtPostalCode: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPayNowClick(_ sender: UIButton) {
        if ((txtCardNumber.text?.isEmpty)! || (txtExpiryMonth.text?.isEmpty)! || (txtExpiryYear.text?.isEmpty)! || (txtCvv.text?.isEmpty)!){
            //Alert Card Details Missing
            print("Missing Card Details")
            return
        }else if( (txtStreet.text?.isEmpty)! || (txtAppartment.text?.isEmpty)! || (txtCity.text?.isEmpty)! || (txtProvince.text?.isEmpty)! || (txtPostalCode.text?.isEmpty)! ){
            //Alert to Show Shipping Details Missing
            print("Add Shipping Details")
            return
        }else{
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let confirmVC = sb.instantiateViewController(withIdentifier: "ConfirmationViewController") as! ConfirmationViewController
            self.navigationController?.pushViewController(confirmVC, animated: false)
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
