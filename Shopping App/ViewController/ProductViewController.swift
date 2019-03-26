//
//  ProductViewController.swift
//  Shopping App
//
//  Created by Akhil James Joseph on 2019-03-21.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit


class ProductViewController: BaseViewController {
    
    var m = Model.sharedModel
    var pObj:Products?
    var btnShowCart: UIButton?
    var qty:Int=1
    
    
    @IBOutlet weak var btnCart: UIBarButtonItem!
    
    @IBOutlet weak var lblProdQty: UILabel!
    
    
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgVwProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblProductName.text=pObj!.productName
        imgVwProduct.image=UIImage(named: pObj!.productImageName)
        lblPrice.text="$\((pObj?.productPrice)!)"
        addSlideMenuButton()
        addCartButton()
        
        self.navigationItem.title = "Product"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func stepperQtyAction(_ sender: UIStepper) {
        lblProdQty.text = "\(sender.value)"
        qty = Int(sender.value)
        lblPrice.text="$\(Double(qty) * pObj!.productPrice)"
    }
    
   /* override func onCartClick(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let cartVC = sb.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        //cartVC.m=m
        self.navigationController?.pushViewController(cartVC, animated: false)
    }*/
    
    @IBAction func btnAddtoCartClicked(_ sender: UIButton) {
        let sc=ShoppingCart()
        sc.addCartItem(productId: (pObj?.productId)!, quantity: qty,
                       price:pObj!.productPrice,Name: pObj!.productName, imgName: pObj!.productImageName)
        m.SCArray.append(sc)
        let alert=UIAlertController(title: "Success", message: "Product added to cart", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: .none))
        print(qty)
        self.present(alert, animated: false)
    }
    
    @IBAction func barBtnCartAction(_ sender: UIBarButtonItem) {
        let sb=UIStoryboard(name: "Main", bundle: nil)
        let cartVC=sb.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        //cartVC.m=m
        self.present(cartVC, animated: false)
        //self.navigationController?.pushViewController(cartVC, animated: false)
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
