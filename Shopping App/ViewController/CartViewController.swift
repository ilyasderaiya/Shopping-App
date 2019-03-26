//
//  CartViewController.swift
//  Shopping App
//
//  Created by Ilyas Deraiya on 2019-03-22.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit

class CartViewController: BaseViewController, UITableViewDelegate,UITableViewDataSource {
    
    var total:Double=0.0
    var m = Model.sharedModel
    
    @IBOutlet weak var lblItemTotal: UILabel!
    @IBOutlet weak var tblVwItem: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblVwItem.delegate=self
        self.tblVwItem.dataSource=self
        //lblItemTotal.text=String(total)

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (m.SCArray.count)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartItemTableViewCell
        
        
        let scItem=(m.SCArray[indexPath.row])
        cell.imgVwItem.image=UIImage(named: scItem.imgName)
        print("name:\(scItem.productName)")
        cell.lblItemName.text=scItem.productName
        cell.lblItemQty.text="Quantity:\(scItem.quantity)"
        cell.lblItemPrice.text="$\(scItem.price)"
        total += scItem.price
        lblItemTotal.text="$\(total)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            m.SCArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    @IBAction func btnCheckoutClick(_ sender: UIButton) {
        if m.SCArray.count == 0 {
            //Alert For adding Something to Cart
            return
        }else{
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let checkoutVC = sb.instantiateViewController(withIdentifier: "CheckoutViewController") as! CheckoutViewController
            self.navigationController?.pushViewController(checkoutVC, animated: false)
            let id=String()
            let tempOrder=Orders(orderId: id.randomStringWithLength(len: 5))
            for i in m.SCArray{
                tempOrder.orderDetList.append(OrderDetails(productID: i.productId, productName: i.productName, quantity: i.quantity, total: i.price, imgPath: i.imgName))
            }
            m.orderList.append(tempOrder)
        }
        
    }
    
    @IBAction func EditButtonAction(_ sender: UIBarButtonItem) {
        print("Edit")
    }
    
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }*/
    

    

}
