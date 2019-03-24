//
//  Extenstions.swift
//  Shopping App
//
//  Created by Akhil James Joseph on 2019-03-23.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import Foundation
extension String{
    //https://stackoverflow.com/questions/26845307/generate-random-alphanumeric-string-in-swift
    func randomStringWithLength (len : Int) -> String {
        
        let letters : NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        var randomString : NSMutableString = NSMutableString(capacity: len)
        
        for i in 1...len {
            //(var i=0; i < len; i++){
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.character(at: Int(rand)))
        }
        
        return String(randomString)
        
    }
}
