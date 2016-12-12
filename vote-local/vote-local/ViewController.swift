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
        let landingView = LandingView(frame: CGRect(x: 0, y: 0, width: 200, height: 600))
        self.view.addSubview(landingView)
    }
    
}
