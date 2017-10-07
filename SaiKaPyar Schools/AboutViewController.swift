//
//  AboutViewController.swift
//  SaiKaPyar Schools
//
//  Created by Neeraj on 9/19/17.
//  Copyright © 2017 Neeraj. All rights reserved.
//

import UIKit
import Alamofire
import SystemConfiguration

class AboutViewController: AbstractViewController, UITabBarDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var nameBottom: NSLayoutConstraint!
    @IBOutlet weak var phoneBottom: NSLayoutConstraint!
    @IBOutlet weak var emailBottom: NSLayoutConstraint!
    @IBOutlet weak var messageBottom: NSLayoutConstraint!
    @IBOutlet weak var testimonialsTable: UITableView!
    @IBOutlet weak var contactViewC: UIView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var tabBarView: UITabBar!
    @IBOutlet weak var topNavigation: UINavigationBar!
    @IBOutlet weak var leadCons: NSLayoutConstraint!
    @IBOutlet weak var slideView: UIView!
    @IBOutlet weak var aboutTable: UITableView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var messageText: UITextField!
    
    var keyboardHeight: CGFloat!
    var selectedIndex = -1
    var checkbool = false
    var dataArrays = [AnyObject]()
    var aboutArray = [AnyObject]()
    var heading: String!
    var contents: String!
    var textfields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request("http://saikapyar.in/demoabout.php").responseJSON { response in
            
            if let dicts = response.result.value as? Dictionary<String, AnyObject>{
                if let innerDict = dicts["images"]{
                    self.dataArrays = innerDict as! [AnyObject]
                    self.aboutTable.reloadData()
                }
            }
            
        }
        
        Alamofire.request("http://saikapyar.in/demotestimonials.php").responseJSON { response in
            
            if let dicts = response.result.value as? Dictionary<String, AnyObject>{
                if let innerDict = dicts["result"]{
                    self.aboutArray = innerDict as! [AnyObject]
                    self.testimonialsTable.reloadData()
                }
            }
            
        }
        
        textfields = [nameText, messageText, phoneText, emailText]
        for i in 0...textfields.count-1{
            TextFieldsSupporting.shared.setBottomBorder(textfields[i])
            textfields[i].delegate = self
        }
        
        SlideMenu.sharedInstance.setBackgroundImage(slideView, self.view)
        
        aboutTable.isHidden = false
        testimonialsTable.isHidden = true
        contactViewC.isHidden = true
        let image = UIImage(named: "TopView")
        topNavigation.setBackgroundImage(image, for: .default)
        
        myTableView.tableFooterView = UIView()
        myTableView.separatorStyle = .none
        aboutTable.tableFooterView = UIView()
        
        let fonts = UIFont(name: "Helvetica Neue", size: 19)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName : fonts!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName : fonts!], for: .selected)
        tabBarView.delegate = self
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardHeight = keyboardSize.height
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(up: true, moveValue: 100)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 100)
    }
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if isConnectedToNetwork(){
            
        }else{
            alertsShow("Please Connect to Internet", "Ok", "We have detected that you are not connected to internet. Please enable your internet.")
        }
    }
    
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
    }

    func setBottomBorder(_ textfld: UITextField) {
        textfld.borderStyle = .none
        textfld.layer.backgroundColor = UIColor.white.cgColor
        
        textfld.layer.masksToBounds = false
        textfld.layer.shadowColor = UIColor.gray.cgColor
        textfld.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textfld.layer.shadowOpacity = 1.0
        textfld.layer.shadowRadius = 0.0
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag{
        case 1:
            aboutTable.isHidden = false
            testimonialsTable.isHidden = true
            contactViewC.isHidden = true
            break
        case 2:
            aboutTable.isHidden = true
            testimonialsTable.isHidden = false
            contactViewC.isHidden = true
            break
        case 3:
            aboutTable.isHidden = true
            testimonialsTable.isHidden = true
            contactViewC.isHidden = false
            break
        default:
            break
        }
    }
    
    @IBAction func swipeMeAction(_ sender: UIBarButtonItem) {
        SlideMenu.sharedInstance.buttonClick(constraints: leadCons, views: slideView, mainView: self.view)
    }
    
    @IBAction func showMeAction(_ sender: UIScreenEdgePanGestureRecognizer) {
        SlideMenu.sharedInstance.showSlideMenu(leadCons, slideView, self.view)
    }
    
    @IBAction func hideMeAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left{
        SlideMenu.sharedInstance.hideSlideMenu(leadCons, slideView, self.view)
        }
        checkbool = !checkbool
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == aboutTable{
            if indexPath.row == selectedIndex{
                return 130
            }
            return 30
        }
        if tableView == testimonialsTable{
            return 85
        }
        return 44
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int?
        if tableView == aboutTable {
            count = dataArrays.count
        }
        if tableView == myTableView {
            count = pageArray.count
        }
        if tableView == testimonialsTable{
            count = aboutArray.count
        }
        return count!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        if tableView == self.aboutTable{
            cell = tableView.dequeueReusableCell(withIdentifier: "cellss") as! customCell
            (cell as! customCell).heading.text = dataArrays[indexPath.row].value(forKey: "Heading") as? String
            (cell as! customCell).content.text = dataArrays[indexPath.row].value(forKey: "Content") as? String
            
        }
        if tableView == self.myTableView{
            cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = pageArray[indexPath.row]["Name"]
            cell?.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            imageName = pageArray[indexPath.row]["imagePath"]
            cell?.imageView?.image = UIImage(named: imageName)
        }
        if tableView == self.testimonialsTable {
            cell = tableView.dequeueReusableCell(withIdentifier: "cells") as! CustomTableCells
            (cell as! CustomTableCells).CommentLabel.text = aboutArray[indexPath.row].value(forKey: "Comment") as? String
            (cell as! CustomTableCells).ClientLabel.text = aboutArray[indexPath.row].value(forKey: "ClientName") as? String
            (cell as! CustomTableCells).designationLabel.text = aboutArray[indexPath.row].value(forKey: "Designation") as? String
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == myTableView {
            Address = pageArray[indexPath.row]["Add"]
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let nextView = storyboard.instantiateViewController(withIdentifier: "\(Address!)")
            self.present(nextView, animated: false, completion: nil)
        }
        if tableView == aboutTable {
            if selectedIndex == indexPath.row{
                selectedIndex = -1
            }
                else{
                selectedIndex = indexPath.row
            }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}
