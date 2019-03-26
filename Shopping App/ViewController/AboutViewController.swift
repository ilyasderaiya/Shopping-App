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
        self.navigationItem.rightBarButtonItem(UIBarButtonItem(title: "Contact US", style: UIBarButtonItem.Style.plain, target: self, action: #selector(AboutViewController.launchAlert)))
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
    func launchAlert(){
        let contactInfo="email:\nemilabrahamz@gmail.com\nsrinathsuddala@gmail.com\nilyasderaiya@gmail.com"
        let alert = UIAlertController(title: "Contact US", message:contactInfo, preferredStyle: .alert)
        let okbutton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okbutton)
        self.present(alert, animated: true)
    }

}
