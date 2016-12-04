//
//  ViewController.swift
//  vote-local
//
//  Created by White Walls on 8/19/16.
//  Copyright © 2016 medium-gray. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blueColor()
        
        let label = UILabel(frame: CGRect(x: 200, y: 0, width: 200, height: 800))
        label.text = "hello"
        self.view.addSubview(label)
        print("help: ", APIStuff.getDataForAddress())
        print("user help: ", APIStuff.createUser())
    }
    
}
