//
//  SignUp.swift
//  vote-local
//
//  Created by White Walls on 12/11/16.
//  Copyright © 2016 medium-gray. All rights reserved.
//

import Foundation
import UIKit
//import PureLayout

class SignUpView: UIView {
    //    var shouldSetupConstraints = true
    
    var bannerView: UIImageView!
    var profileView: UIImageView!
    var segmentedControl: UISegmentedControl!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.green
        
        let label = UILabel(frame: CGRect(x: 200, y: 0, width: 200, height: 800))
        label.text = "sign up view"
        self.addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
