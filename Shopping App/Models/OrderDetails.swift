//
//  OrderDetails.swift
//  Shopping App
//
//  Created by Akhil James Joseph on 2019-03-23.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import Foundation
class OrderDetails{
    var productID:Int
    var productName:String
    var quantity:Int
    var total:Double
    init(){
        self.productID=0
        self.productName=String()
        self.quantity=0
        self.total=0.0
    }
    init(productID:Int, productName:String, quantity:Int, total:Double){
        self.productID=productID
        self.productName=productName
        self.quantity=quantity
        self.total=total
    }
}
