//
//  SidebarTableViewController.swift
//  WeddingPlanner
//
//  Created by Felipe Assunção on 4/20/16.
//  Copyright © 2016 Felipe Assunção. All rights reserved.
//

import UIKit

class NavigationViewController: BaseViewController {

    @IBOutlet var userImageView: UIImageView!
 
    override func viewDidAppear(animated: Bool) {
        enableNavigation = false;
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        
        userImageView.layer.borderWidth = 0
        userImageView.layer.masksToBounds = false
        userImageView.layer.borderColor = UIColor.whiteColor().CGColor
        userImageView.layer.cornerRadius =  40
        userImageView.clipsToBounds = true
    }
    
    @IBAction func Logout(sender: AnyObject) {
        self.RecirectToController(Controller.Login, keepMenu: false)
    }
}
