//
//  ProductViewController.swift
//  Shopping App
//
//  Created by Akhil James Joseph on 2019-03-21.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    var PrName=String()
    var img=UIImage()
    
    @IBOutlet weak var imgVwProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblProductName.text=PrName
        imgVwProduct.image=img
        // Do any additional setup after loading the view.
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
