//
//  OrderDetailsViewController.swift
//  Shopping App
//
//  Created by Akhil James Joseph on 2019-03-26.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit

class OrderDetailsViewController: BaseViewController, UITableViewDelegate,UITableViewDataSource {
    var total:Double=0.0
    var o=Orders()
    @IBOutlet weak var lblItemTotal: UILabel!
   
    @IBOutlet weak var tblVwOrderDetail: UITableView!
    
    //@IBOutlet weak var tblVwItem: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem?.isEnabled=false
        self.tblVwOrderDetail.delegate=self
        self.tblVwOrderDetail.dataSource=self

        // Do any additional setup after loading the view.
    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return (o.orderDetList.count)
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell=tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartItemTableViewCell
            
            
            let ordDet=(o.orderDetList[indexPath.row])
            cell.imgVwItem.image=UIImage(named: ordDet.imgPath)
            //print("name:\(scItem.productName)")
            cell.lblItemName.text=ordDet.productName
            cell.lblItemQty.text="Quantity:\(ordDet.quantity)"
            cell.lblItemPrice.text="$\(ordDet.total)"
            total += ordDet.total
            lblItemTotal.text="$\(total)"
            return cell
            
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
