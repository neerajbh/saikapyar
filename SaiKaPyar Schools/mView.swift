//
//  mView.swift
//  SaiKaPyar Schools
//
//  Created by Neeraj on 9/20/17.
//  Copyright © 2017 Neeraj. All rights reserved.
//

import UIKit

class mView: UIView {

    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        getNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        getNib()
    }
    func getNib(){
        Bundle.main.loadNibNamed("mView", owner: self, options: nil)
        self.view.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(view)
        mLabel.text = "+91 9316224422 \n +91 9646388359 \n skp@socialsoft4u.com"
    }
}
