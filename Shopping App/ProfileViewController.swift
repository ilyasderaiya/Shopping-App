//
//  ProfileViewController.swift
//  Shopping App
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuBtnClicked(_ sender: UIBarButtonItem) {
        if(menuIsShown){
            leadingConstraint.constant = -200
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            })
        }
        else{
            leadingConstraint.constant=0
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            })
        }
        menuIsShown = !menuIsShown
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
