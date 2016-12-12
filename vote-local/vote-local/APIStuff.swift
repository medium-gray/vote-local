//
//  APIStuff.swift
//  vote-local
//
//  Created by White Walls on 8/19/16.
//  Copyright © 2016 medium-gray. All rights reserved.
//

import Foundation
import UIKit

let API_TOKEN = "AIzaSyCdQ7xLpl36LPzdhXnUaC-OxjJ0J7toCxg"
let ENDPOINT = "https://www.googleapis.com/civicinfo/v2/representatives?address=1296+pacific+street+brooklyn+ny+11216&key=AIzaSyCdQ7xLpl36LPzdhXnUaC-OxjJ0J7toCxg"

class APIStuff: NSObject {
    
    class func getDataForAddress() -> Dictionary<String, AnyObject> {
        
        let url = URL(string: ENDPOINT)
        
        var result = Dictionary<String, AnyObject>()
        
//        else {
//            print("Error: cannot create URL")
//        }
        let urlRequest = URLRequest(url: url!)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            // do stuff with response, data & error here
            
            //TODO: check if response status code = 200
            if let jsonResult = self.nsdataToJSON(data: data!) as? Dictionary<String, AnyObject> {
                // do whatever with jsonResult
                for item in jsonResult {
//                    if item.0 == "offices" {
//                        for office in (item.1 as! NSArray) {
//                            print("office: ", (office["name"]! as! AnyObject?)!)
//                        }
//                    }
                    print("item: ", item.0)
                }
                result = jsonResult
            } else {
                result = ["Error message": "Did not return any data" as AnyObject]
            }
        })
        
        task.resume()

        return result
    }
    
    
    class func nsdataToJSON(data: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
    
    
    class func createUser(username: String, email: String, password: String, address: String, party: String, name: String) -> Dictionary<String, AnyObject> {
        let url = URL(string: "http://localhost:8000/users/")
        
        var result = Dictionary<String, AnyObject>()
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"

        let params = ["username":username as AnyObject,
                      "email":email as AnyObject,
                      "password":password as AnyObject,
                      "voter":["address":address,
                               "party":party,
                               "name":name] as AnyObject] as Dictionary<String, AnyObject>
        do {
        urlRequest.httpBody = try JSONSerialization.data(
            withJSONObject: params,
            options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch {
            print("error with json serialization")
        }
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            // do stuff with response, data & error here
            
            //TODO: check if response status code = 200
            if let jsonResult = self.nsdataToJSON(data: data!) as? Dictionary<String, AnyObject> {
                // do whatever with jsonResult
                print(jsonResult)
                result = jsonResult
            } else {
                result = ["Error message": "Did not return any data" as AnyObject]
            }
        })
        
        task.resume()
        
        return result
    }

    
}
