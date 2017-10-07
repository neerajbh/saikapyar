//
//  TextFieldsSupporting.swift
//  SaiKaPyar Schools
//
//  Created by Neeraj on 10/4/17.
//  Copyright © 2017 Neeraj. All rights reserved.
//

import UIKit

class TextFieldsSupporting: NSObject {
    static let shared = TextFieldsSupporting()
    func setBottomBorder(_ textfld: UITextField) {
        textfld.borderStyle = .none
        textfld.layer.backgroundColor = UIColor.white.cgColor
        
        textfld.layer.masksToBounds = false
        textfld.layer.shadowColor = UIColor.gray.cgColor
        textfld.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textfld.layer.shadowOpacity = 1.0
        textfld.layer.shadowRadius = 0.0
    }
}
