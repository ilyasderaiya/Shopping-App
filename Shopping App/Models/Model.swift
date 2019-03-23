//
//  Model.swift
//  Shopping App
//
//  Created by Ilyas Deraiya on 2019-03-22.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import Foundation
class Model{
    private init(){}
    static let sharedModel=Model()
    var SCArray=[ShoppingCart]()
    var p = [Products]()
    func addVal(){
        p.append(Products(productId: 1, productName: "Iphone XS Max 64GB", productQuantity: 10, productPrice: 1200.00, prdImg: "Xs-Max" ))
        p.append(Products(productId: 2, productName: "Samsung Note 9 64GB", productQuantity: 5, productPrice: 949.99, prdImg: "Note9"))
        p.append(Products(productId: 3, productName: "Huawei Mate 20 Pro", productQuantity: 5, productPrice: 1349.00, prdImg: "Mate20"))
        p.append(Products(productId: 4, productName: "Google Pixel 3 Xl 64GB", productQuantity: 5, productPrice: 1499.99, prdImg: "Pixel3"))
        p.append(Products(productId: 5, productName: "OnePlus 6t", productQuantity: 8, productPrice: 749.89, prdImg: "Oneplus"))
    }
}
