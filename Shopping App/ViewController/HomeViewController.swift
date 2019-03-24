//
//  HomeViewController.swift
//  Shopping App
//
//  Created by Akhil James Joseph on 2019-03-15.
//  Copyright © 2019 Ilyas. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var m = Model.sharedModel
    //var m : Model?
    @IBOutlet weak var ProductCollectionView: UICollectionView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var menuIsShown = false
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        addCartButton()
       // let userDefault=UserDefaults.standard
       // m=(userDefault.data(forKey: "model") as! NSObject) as! Model
        //print("Inside home\n")
        self.ProductCollectionView.delegate=self
        self.ProductCollectionView.dataSource=self

        // Do any additional setup after loading the view.
    }
    /*
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
    }*/
 
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return m.p.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
        print(m.p[indexPath.row].productName)
        cell.imgVwProduct.image=UIImage(named: m.p[indexPath.row].productImageName)
        cell.lblProductName.text=m.p[indexPath.row].productName//PrName[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb=UIStoryboard(name: "Main", bundle: nil)
        let productVC=sb.instantiateViewController(withIdentifier: "ProductVC") as! ProductViewController
        //productVC.img=UIImage(named: "S7")!
        //productVC.PrName=PrName[indexPath.row]
        productVC.pObj=m.p[indexPath.row]
        //productVC.m=m
        //self.present(productVC, animated: true)
        self.navigationController?.pushViewController(productVC, animated: false)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
    
    /*@IBAction func btnBarLogOut(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            
            let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = signInPage
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }*/
        
        
        /*do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initial
     }*/
    
}
