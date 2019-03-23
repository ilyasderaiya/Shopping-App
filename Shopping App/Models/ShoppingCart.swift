//
//  ShoppingCart.swift
//  Shopping App
//
//  Created by Ilyas Deraiya on 2019-03-22.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import Foundation

class ShoppingCart{
    //var cartId:Int
    var productId:Int
    var productName:String
    var quantity:Int
    var price: Double
    var imgName=String()
    //var dateAdded:String
    init(){
        self.productName=""
        self.productId=0
        self.quantity=0
        self.price = 0.0
        //self.dateAdded=String()
    }
    func addCartItem(productId:Int,quantity:Int, price:Double, Name:String, imgName:String){
        //self.cartId=cartId
        self.productId=productId
        self.quantity=quantity
        self.price=price*Double(quantity)
        self.productName=Name
        self.imgName=imgName
        //self.dateAdded=dateAdded
        print("Item added")
        viewCartDetails()
    }
    func updateQuantity()
    {
        print("Enter new quantity")
        self.quantity=Int(readLine()!)! //https://blog.faodailtechnology.com/reading-standard-input-stdin-in-swift-45f81b3caf2c //Int(readLine(strippingNewline: true)!)!
    }
    func viewCartDetails(){
        //print("cart id:\(self.cartId)")
        //print("Item No.\t\tItem Name\t\tQuantity\t  Date Added")
        //for i in p{
            //if(self.productId == i.getproductId){
                print("\t\(self.productId)\t    \t    \(self.quantity)\t")
            //}
        //}
        
    }
    
}
