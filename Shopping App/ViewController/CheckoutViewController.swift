//
//  CheckoutViewController.swift
//  Shopping App
//
//  Created by Ilyas Deraiya on 2019-03-22.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var m=Model.sharedModel
    var total=0.0
    @IBOutlet weak var txtCardNumber: UITextField!
    
    @IBOutlet weak var txtExpiryMonth: UITextField!
    
    @IBOutlet weak var txtExpiryYear: UITextField!
    
    @IBOutlet weak var txtCvv: UITextField!
    @IBOutlet weak var txtStreet: UITextField!
    @IBOutlet weak var txtAppartment: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtProvince: UITextField!
    @IBOutlet weak var txtPostalCode: UITextField!
    
    @IBOutlet weak var tblVwOrderDetails: UITableView!
    @IBOutlet weak var lblTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblVwOrderDetails.delegate=self
        self.tblVwOrderDetails.dataSource=self
        

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
            setData()
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let confirmVC = sb.instantiateViewController(withIdentifier: "ConfirmationViewController") as! ConfirmationViewController
            self.navigationController?.pushViewController(confirmVC, animated: false)
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //var count=0
        //for i in m.orderList{
        //    count += i.orderDetList.count
        //}
        return m.orderList[m.orderList.endIndex-1].orderDetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let orderDetailCell=tableView.dequeueReusableCell(withIdentifier: "CheckoutTableViewCell") as! CheckoutTableViewCell
        let orderdet=m.orderList[m.orderList.endIndex-1].orderDetList[indexPath.row]
        print("Name:\(orderdet.productName) Price:\(orderdet.total)")
        orderDetailCell.lblProductTitle.text="\(orderdet.productName) x \(orderdet.quantity)"
        orderDetailCell.lblProductPrice.text="$\(orderdet.total)"
        total += orderdet.total
        lblTotal.text="$\(total)"
        return orderDetailCell
    }
    
    func setData(){
        m.cardship.cardNumber=txtCardNumber.text!
        m.cardship.expiry="\(txtExpiryMonth!)/\(txtExpiryYear!)"
        m.cardship.CVV=txtCvv.text!
        m.cardship.appartment=txtAppartment.text!
        m.cardship.street=txtStreet.text!
        m.cardship.city=txtCity.text!
        m.cardship.province=txtProvince.text!
        m.cardship.postalCode=txtPostalCode.text!
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
