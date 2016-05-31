//
//  BaseViewController.swift
//  WeddingPlanner
//
//  Created by Felipe Assunção on 4/21/16.
//  Copyright © 2016 Felipe Assunção. All rights reserved.
//

import Foundation

class BaseViewController : UIViewController {
    
    var warningLabel : UILabel!
    var enableNavigation : Bool! = true
    var appDelegate:AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    func createWarn(warning : String!){
        warningLabel.hidden = false
        warningLabel.text = warning
    }
    
    func dismissWarn() {
        warningLabel.hidden = true
        warningLabel.text = ""
    }
}


enum Controller {
    case Login
    case Register
    case Main
    case Wedding
    case Tasks
}

extension BaseViewController {
    
    func RecirectToController(selectedController : Controller, keepMenu : Bool) {
    
        let storyboard = appDelegate.mainStoryboard
        var controller : BaseViewController!
        
        switch selectedController {
        
            case .Login:
                RedirectToControllerStatic("LoginController")
                return
            case .Register:
                RedirectToControllerStatic("RegisterController")
                return
            case .Main:
                controller = storyboard!.instantiateViewControllerWithIdentifier("MainController") as! MainViewController
            case .Wedding:
                controller = storyboard!.instantiateViewControllerWithIdentifier("MainController") as! MainViewController
            case .Tasks:
                controller = storyboard!.instantiateViewControllerWithIdentifier("MainController") as! MainViewController
        }
               
        if keepMenu {
            appDelegate.presetController(controller)
        } else {
            appDelegate.setController(controller)
        }
    }
    
    
    
    private func RedirectToControllerStatic (storyboardControllerName : String ){
        RedirectToControllerStatic(storyboardControllerName, transition: 1)
    }
    
    private func RedirectToControllerStatic (storyboardControllerName : String, transition : Double)
    {
        let secondViewController = (self.storyboard?.instantiateViewControllerWithIdentifier(storyboardControllerName))! as UIViewController
        
        let window = UIApplication.sharedApplication().windows[0] as UIWindow
        UIView.transitionFromView(
            window.rootViewController!.view,
            toView: secondViewController.view,
            duration: transition,
            options: .TransitionNone,
            completion: {
                finished in window.rootViewController = secondViewController
        })
    }

}
