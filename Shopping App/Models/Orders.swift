//
//  Orders.swift
//  Shopping App
//
//  Created by Emil Ilyas Srinath on 2019-03-23.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import Foundation
class Orders{
    var orderId:String
    var orderDetList=[OrderDetails]()
    init(){
        self.orderId=String()
    }
    init(orderId:String){
        self.orderId=orderId
    }
}
