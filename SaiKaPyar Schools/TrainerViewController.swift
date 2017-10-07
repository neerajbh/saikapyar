//
//  TrainerViewController.swift
//  SaiKaPyar Schools
//
//  Created by Neeraj on 9/21/17.
//  Copyright © 2017 Neeraj. All rights reserved.
//

import UIKit

class TrainerViewController: AbstractViewController{

    @IBOutlet weak var myNav: UINavigationBar!
    @IBOutlet weak var leadCon: NSLayoutConstraint!
    @IBOutlet weak var sideTable: UITableView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var exampleText: UITextField!
    @IBOutlet weak var messageText: UITextField!
    
    var onevar = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var textfields = [UITextField]()
        textfields = [nameText, messageText, phoneText, emailText, exampleText]
        for i in 0...textfields.count-1{
            TextFieldsSupporting.shared.setBottomBorder(textfields[i])
        }
        
        SlideMenu.sharedInstance.setBackgroundImage(sideView, self.view)
        
        let image = UIImage(named: "TopView")
        myNav.setBackgroundImage(image, for: .default)

        sideTable.tableFooterView = UIView()
        
        let fonts = UIFont(name: "Helvetica Neue", size: 16)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName : fonts!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName : fonts!], for: .selected)
    }
    
    @IBAction func slideAction(_ sender: UIBarButtonItem) {
        SlideMenu.sharedInstance.buttonClick(constraints: leadCon, views: sideView, mainView: self.view)
        onevar = !onevar
    }
    
    @IBAction func showAction(_ sender: UIScreenEdgePanGestureRecognizer) {
        SlideMenu.sharedInstance.showSlideMenu(leadCon, sideView, self.view)
        onevar = !onevar
    }
    
    @IBAction func hideAction(_ sender: UISwipeGestureRecognizer) {
        SlideMenu.sharedInstance.hideSlideMenu(leadCon, sideView, self.view)
        onevar = !onevar
    }
}
