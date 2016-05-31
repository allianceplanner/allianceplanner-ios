//
//  MainViewController.swift
//  WeddingPlanner
//
//  Created by Felipe Assunção on 4/20/16.
//  Copyright © 2016 Felipe Assunção. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: BaseViewController {

    @IBOutlet var userImageView: UIImageView!
    
    @IBAction func menuButton_TouchDown(sender: AnyObject) {
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    
    override func viewDidLoad () {
//        if(UserDomain.user == nil) {
//            self.RedirectToController("LoginController")
//            return
//        }
        
        super.viewDidLoad()
//        let repository = WeddingRepository(address: EndingPointConfiguration.WeddingService)
//        let wedding = Wedding()
//        
//        wedding.brideId = "9876"
//        wedding.groomId = "5678"
//        
//        let inserted = repository.insert(wedding)
//        let a = inserted.groomId
//        let b = inserted.id
//        
//        let list = repository.list()
//        let x = list?.count
//        let z = list?.isEmpty
    }
    
    override func viewDidAppear (animated: Bool) {
        super.viewDidAppear(animated)
        userImageView.layer.borderWidth = 0
        userImageView.layer.masksToBounds = false
        userImageView.layer.borderColor = UIColor.whiteColor().CGColor
        userImageView.layer.cornerRadius = 44
        userImageView.clipsToBounds = true
    }
}
