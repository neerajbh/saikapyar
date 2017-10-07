//
//  getInvolveViewController.swift
//  SaiKaPyar Schools
//
//  Created by Neeraj on 10/3/17.
//  Copyright © 2017 Neeraj. All rights reserved.
//

import UIKit

class getInvolveViewController: AbstractViewController {

    @IBOutlet weak var myNav: UINavigationBar!
    @IBOutlet weak var leadCon: NSLayoutConstraint!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var messageText: UITextField!
    
    var textfields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfields = [nameText, messageText, phoneText, emailText, dateText]
        for i in 0...textfields.count-1{
            TextFieldsSupporting.shared.setBottomBorder(textfields[i])
        }
        
        SlideMenu.sharedInstance.setBackgroundImage(sideView, self.view)
        
        let image = UIImage(named: "TopView")
        myNav.setBackgroundImage(image, for: .default)
        
        let fonts = UIFont(name: "Helvetica Neue", size: 16)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName : fonts!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName : fonts!], for: .selected)
    }
    
    @IBAction func hideMenuAction(_ sender: UISwipeGestureRecognizer) {
        SlideMenu.sharedInstance.hideSlideMenu(leadCon, sideView, self.view)
    }
    
    @IBAction func showMenuAction(_ sender: UIScreenEdgePanGestureRecognizer) {
        SlideMenu.sharedInstance.showSlideMenu(leadCon, sideView, self.view)
    }
    
    @IBAction func slideAction(_ sender: UIBarButtonItem) {
        SlideMenu.sharedInstance.buttonClick(constraints: leadCon, views: sideView, mainView: self.view)
    }
    
}
