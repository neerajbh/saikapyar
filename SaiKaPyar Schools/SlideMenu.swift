//
//  SlideMenu.swift
//  SaiKaPyar Schools
//
//  Created by Neeraj on 9/14/17.
//  Copyright © 2017 Neeraj. All rights reserved.
//

import UIKit

class SlideMenu: NSObject {
    static let sharedInstance = SlideMenu()
    var checkForButton = false
    
    func showSlideMenu(_ forConstraint: NSLayoutConstraint, _ forView: UIView, _ forMainView: UIView){
        forConstraint.constant = 0
        forView.backgroundColor = #colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1)
        UIView.animate(withDuration: 0.5) { 
            forMainView.layoutIfNeeded()
        }
    }
    
    func hideSlideMenu(_ forConstraint: NSLayoutConstraint, _ forView: UIView, _ forMainView: UIView){
        forConstraint.constant = -240
        forView.backgroundColor = #colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1)
        UIView.animate(withDuration: 0.5) { 
            forMainView.layoutIfNeeded()
        }
    }
    
    func buttonClick(constraints: NSLayoutConstraint, views: UIView, mainView: UIView){
        if checkForButton{
            hideSlideMenu(constraints, views, mainView)
        }
        else{
            showSlideMenu(constraints, views, mainView)
        }
    }
    
    func setBackgroundImage(_ sideView: UIView, _ mainView: UIView){
        let backgroundImage = UIImageView(frame: sideView.layer.bounds)
        backgroundImage.image = UIImage(named: "SideBar")
        sideView.insertSubview(backgroundImage, at: 0)
        mainView.bringSubview(toFront: sideView)
        sideView.layer.shadowOpacity = 0.3
    }
    
}
