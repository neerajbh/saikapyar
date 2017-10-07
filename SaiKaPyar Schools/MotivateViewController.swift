//
//  MotivateViewController.swift
//  SaiKaPyar Schools
//
//  Created by Neeraj on 9/21/17.
//  Copyright © 2017 Neeraj. All rights reserved.
//

import UIKit

class MotivateViewController: AbstractViewController {
    @IBOutlet weak var slideView: UIView!
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var myNav: UINavigationBar!

    @IBOutlet weak var messageText: UITextField!
    @IBOutlet weak var quantityText: UITextField!
    @IBOutlet weak var itemText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var leadCon: NSLayoutConstraint!
    var textfields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfields = [nameText, itemText, quantityText, messageText, phoneText, emailText]
        for i in 0...textfields.count-1{
            TextFieldsSupporting.shared.setBottomBorder(textfields[i])
        }
        
        SlideMenu.sharedInstance.setBackgroundImage(slideView, self.view)
        
        let image = UIImage(named: "TopView")
        myNav.setBackgroundImage(image, for: .default)
        let fonts = UIFont(name: "Helvetica Neue", size: 16)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName : fonts!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName : fonts!], for: .selected)
    }
    
    @IBAction func slideAction(_ sender: UIBarButtonItem) {
        SlideMenu.sharedInstance.buttonClick(constraints: leadCon, views: slideView, mainView: self.view)
    }
    
    @IBAction func hideMenuAction(_ sender: UISwipeGestureRecognizer) {
        SlideMenu.sharedInstance.hideSlideMenu(leadCon, slideView, self.view)
    }
    
    @IBAction func showMenuAction(_ sender: UIScreenEdgePanGestureRecognizer) {
        SlideMenu.sharedInstance.showSlideMenu(leadCon, slideView, self.view)
    }
}
