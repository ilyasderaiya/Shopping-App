//
//  AboutViewController.swift
//  Shopping App
//
//  Created by ilyas Deraiya on 2019-03-22.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: BaseViewController, WKNavigationDelegate {

    @IBOutlet weak var wkAbout: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "About-Us"
        addCartButton()
        addSlideMenuButton()
        
        
        wkAbout.navigationDelegate = self
        loadHtml()
    }
    

    func loadHtml(){
        let localFilePath = Bundle.main.url(forResource: "About", withExtension: "html")
        let myReq = URLRequest(url: localFilePath!)
        wkAbout.load(myReq)
    }

}
