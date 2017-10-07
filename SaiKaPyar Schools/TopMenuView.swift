//
//  TopMenuView.swift
//  SaiKaPyar Schools
//
//  Created by Neeraj on 9/25/17.
//  Copyright © 2017 Neeraj. All rights reserved.
//

import UIKit

class TopMenuView: UIView {

    @IBOutlet var topMenuView: UIView!
    @IBOutlet weak var topMenuLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView()
    }
    
    func loadView(){
        Bundle.main.loadNibNamed("TopMenuView", owner: self, options: nil)
        self.topMenuView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(topMenuView)
        topMenuLabel.text = "SaiKaPyar\nskp@socialsoft4u.com"
        
    }
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(1)
        context?.setStrokeColor(UIColor.white.cgColor)
        context?.move(to: CGPoint(x: 10, y: 149))
        context?.addLine(to: CGPoint(x: 230, y: 149))
        context?.strokePath()
    }
}
