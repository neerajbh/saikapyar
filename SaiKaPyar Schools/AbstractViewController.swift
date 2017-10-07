//
//  AbstractViewController.swift
//  SaiKaPyar Schools
//
//  Created by Neeraj on 9/25/17.
//  Copyright © 2017 Neeraj. All rights reserved.
//

import UIKit

class AbstractViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var imageName: String!
    var pageArray = [[String:String]]()
    var Address: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        pageArray = [["Name": "Home", "Add": "HomeViewController", "imagePath": "home"], ["Name": "About", "Add":"AboutViewController", "imagePath": "user"], ["Name":"Get Involved", "Add":"getInvolveViewController", "imagePath": "meeting"], ["Name":"Motivate", "Add":"MotivateViewController", "imagePath": "motivate"], ["Name":"Trainer","Add":"TrainerViewController", "imagePath": "training"]]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = pageArray[indexPath.row]["Name"]
        cell?.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        imageName = pageArray[indexPath.row]["imagePath"]
        cell?.imageView?.image = UIImage(named: imageName)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Address = pageArray[indexPath.row]["Add"]
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "\(Address!)")
        self.present(nextView, animated: false, completion: nil)
    }

    func phoneNumber(_ phones: String){
        if (phones.characters.count == 10) && (phones.characters.first == "6" || phones.characters.first == "7" || phones.characters.first == "8" || phones.characters.first == "9"){
            
        }
        else{
            alertsShow("Phone Number not Valid", "OK", "Make sure your phone number is 10 digit long and start with 6/7/8/9")
        }
    }
    
    func emailValidation(_ emails: String){
        if isValidEmail(emailString: emails){
            
        }
        else{
            alertsShow("Email is not valid", "OK", "You enter invalid email. Please make sure your email address contain text@domainName.domainType")
        }
    }
    
    func alertsShow(_ titleController: String, _ titleAction: String, _ messageController: String){
        let alertC = UIAlertController(title: titleController, message: messageController, preferredStyle: .alert)
        alertC.addAction(UIAlertAction(title: titleAction, style: .default, handler: nil))
        present(alertC, animated: true, completion: nil)
    }
    
    func isValidEmail(emailString: String) -> Bool{
        var returnValue = true
        let emailRegex = "[A-Z0-9a-z.-_]+@[A-Za-z0-9]+\\.[A-Za-z]{2,3}"
        do{
            let regex = try NSRegularExpression(pattern: emailRegex)
            let nsString = emailString as NSString
            let results = regex.matches(in: emailString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        return returnValue
    }
}
