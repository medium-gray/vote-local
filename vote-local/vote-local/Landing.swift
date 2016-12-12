//
//  Landing.swift
//  vote-local
//
//  Created by White Walls on 12/11/16.
//  Copyright © 2016 medium-gray. All rights reserved.
//

import Foundation
import UIKit
//import PureLayout

class LandingView: UIView {
//    var shouldSetupConstraints = true
    
    var bannerView: UIImageView!
    var profileView: UIImageView!
    var segmentedControl: UISegmentedControl!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
        
        let label = UILabel(frame: CGRect(x: 200, y: 0, width: 200, height: 800))
        label.text = "hello"
        self.addSubview(label)

        let button = UIButton(frame: CGRect(x: 100, y: 0, width: 40, height: 40))
        button.backgroundColor = UIColor.cyan
        button.addTarget(self, action: #selector(LandingView.getStartedButtonTapped(_:)), for: .touchUpInside)

        self.addSubview(button)
        print("test")
    }
    
    func getStartedButtonTapped(_ sender: UIButton) {
        print("Button Clicked")
    }
    
    override var intrinsicContentSize : CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
