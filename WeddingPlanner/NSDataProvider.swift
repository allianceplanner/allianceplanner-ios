//
//  NSDataProvider.swift
//  WeddingPlanner
//
//  Created by Felipe Assunção on 5/22/16.
//  Copyright © 2016 Felipe Assunção. All rights reserved.
//

import Foundation

public class NSDataProvider {

    static func LoadFromUri(address : String, method : String? = nil, json : String? = nil) -> NSString {
    
        let url: NSURL = NSURL(string: address)!
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        
        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
        request.addValue("application/json",forHTTPHeaderField: "Accept")
        request.HTTPMethod = method == nil ? "GET" : method!
        request.HTTPBody = json == nil ? nil : json!.dataUsingEncoding(NSUTF8StringEncoding)
        
        do {
            let dataVal = try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
            do {
                let rawContent = NSString(data: dataVal, encoding: NSUTF8StringEncoding)!
                print(rawContent)
                return rawContent
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return "";
    }
    
//    
//    func HTTPPostJSON(url: String,  data: NSData,
//                      callback: (String, String?) -> Void) {
//        
//        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
//        request.HTTPMethod = "POST"
//        request.addValue("application/json",forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json",forHTTPHeaderField: "Accept")
//        request.HTTPBody = data
//        HTTPsendRequest(request, callback: callback)
//    }
//    
//    func HTTPsendRequest(request: NSMutableURLRequest,
//                         callback: (String, String?) -> Void) {
//        let task = NSURLSession.sharedSession()
//            .dataTaskWithRequest(request) {
//                (data, response, error) -> Void in
//                if (error != nil) {
//                    callback("", error.localizedDescription)
//                } else {
//                    callback(NSString(data: data,
//                        encoding: NSUTF8StringEncoding)! as String, nil)
//                }
//        }
//        
//        task.resume()
//    }
//    //use
//    var data :Dictionary<String, AnyObject> = yourDictionaryData<--
//    var requestNSData:NSData = NSJSONSerialization.dataWithJSONObject(request, options:NSJSONWritingOptions(0), error: &err)!
//    HTTPPostJSON("http://yourPosturl..", data: requestNSData) { (response, error) -> Void in
//    if error != nil{
//    //error
//    return;
//    }
//    
//    println(response);
//    }
    
}