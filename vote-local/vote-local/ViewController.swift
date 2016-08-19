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

    let API_TOKEN = "AIzaSyCdQ7xLpl36LPzdhXnUaC-OxjJ0J7toCxg"
    let ENDPOINT = "https://www.googleapis.com/civicinfo/v2/representatives?address=1296+pacific+street+brooklyn+ny+11216&key=AIzaSyCdQ7xLpl36LPzdhXnUaC-OxjJ0J7toCxg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blueColor()
        
        guard let url = NSURL(string: ENDPOINT) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = NSURLRequest(URL: url)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let task = session.dataTaskWithRequest(urlRequest, completionHandler: { (data, response, error) in
            // do stuff with response, data & error here
            print("data: ", data)
            print("")
            print("response: ", response)
            print("")
            print("type: ", self.nsdataToJSON(data!).dynamicType)
            print("")
            print("json: ", self.nsdataToJSON(data!))
        })
        task.resume()
        
        let label = UILabel(frame: CGRect(x: 200, y: 0, width: 200, height: 800))
        label.text = "hello"
        self.view.addSubview(label)
    }
    
    func nsdataToJSON(data: NSData) -> AnyObject? {
        do {
            print("type from json converter fn: ", try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers).dynamicType)
            return try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
    
}