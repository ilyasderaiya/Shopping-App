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
        cell.lblItemPrice.text=String(scItem.price)
        total += scItem.price
        lblItemTotal.text=String(total)
        return cell
        
    }
    
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
