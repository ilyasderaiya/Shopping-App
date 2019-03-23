//
//  Products.swift
//  Shopping App
//
//  Created by Ilyas Deraiya on 2019-03-22.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import Foundation
class Products{
    var productId:Int
    var productName:String
    var productQuantity:Int
    var productPrice:Double
    var productImageName:String
    init(){
        self.productId=0
        self.productName=String()
        self.productQuantity=0
        self.productPrice=0.0
        self.productImageName=String()
    }
    init(productId:Int,productName:String,productQuantity:Int,productPrice:Double, prdImg:String){
        self.productId=productId
        self.productName=productName
        self.productQuantity=productQuantity
        self.productPrice=productPrice
        self.productImageName=prdImg
    }
}
