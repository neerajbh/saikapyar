//
//  HomeViewController.swift
//  SaiKaPyar Schools
//
//  Created by Neeraj on 9/14/17.
//  Copyright © 2017 Neeraj. All rights reserved.
//

import UIKit

class HomeViewController: AbstractViewController{
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var myNav: UINavigationBar!
    @IBOutlet weak var leadCon: NSLayoutConstraint!
    @IBOutlet var tapAction: UITapGestureRecognizer!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var motivateButton: UIButton!
    @IBOutlet weak var trainerButton: UIButton!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var scrollcontent: UIView!
    @IBOutlet weak var websiteButton: UIButton!
    
    var textfields = [UITextField]()
    var onevar = false
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SlideMenu.sharedInstance.setBackgroundImage(myView, self.view)
        
        let image = UIImage(named: "TopView")
        myNav.setBackgroundImage(image, for: .default)
        
        tableview.tableFooterView = UIView()
        
        aboutButton.layer.cornerRadius = 15
        getButton.layer.cornerRadius = 15
        motivateButton.layer.cornerRadius = 15
        trainerButton.layer.cornerRadius = 15
        websiteButton.setAttributedTitle(NSAttributedString(string: "saikapyar.in", attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue, NSForegroundColorAttributeName: #colorLiteral(red: 0.9034938135, green: 0.1526519989, blue: 0.4528346647, alpha: 1)]), for: .normal)
    }
    
    @IBAction func tapActionPerform(_ sender: UITapGestureRecognizer) {
        print("hello")
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if myView.bounds.contains(touch.location(in: myView)) {
            return false
        }
        return true
    }
    
    @IBAction func openUrlSkp(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "http://saikapyar.in")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func swipeMe(_ sender: UIBarButtonItem) {
        SlideMenu.sharedInstance.buttonClick(constraints: leadCon, views: myView, mainView: self.view)
        onevar = !onevar
    }
    
    @IBAction func swipeLeftAction(_ sender: UIScreenEdgePanGestureRecognizer) {
        SlideMenu.sharedInstance.showSlideMenu(leadCon, myView, self.view)     
    }
    
    @IBAction func gotoViewsBtn(_ sender: UIButton) {
        switch sender.tag{
        case 1:
            goToNextView("AboutViewController")
        case 2:
            goToNextView("getInvolveViewController")
        case 3:
            goToNextView("MotivateViewController")
        case 4:
            goToNextView("TrainerViewController")
        default:
            print("default")
        }
    }
    
    func goToNextView(_ nextAdd: String){
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let next = story.instantiateViewController(withIdentifier: "\(nextAdd)")
        self.present(next, animated: false, completion: nil)
    }
    
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left{
            SlideMenu.sharedInstance.hideSlideMenu(leadCon, myView, self.view)
        }
        onevar = !onevar
    }

}
