//
//  NetWorkTools.swift
//  swiftNetWork
//
//  Created by PF on 17/2/3.
//  Copyright © 2017年 PF. All rights reserved.
//

import UIKit
import AFNetworking

enum NetWorkType {
    case GET
    case POST
}

class NetWorkTools: AFHTTPSessionManager {

    static let shared: NetWorkTools = {
        let instance = NetWorkTools()
        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        return instance
    }()
    
    func request(requestType: NetWorkType = .GET, urlString: String, parameters: [String :AnyObject]?, completion: @escaping (_ json: Any?, _ isSuccess: Bool) ->()) {
        
        let success = { (task: URLSessionDataTask, json: Any?) in
            completion(json, true)
        }
        
        let failure = { (task: URLSessionDataTask?, error: Error) in
            completion(error, false)
        }
        
        if requestType == .GET {

            get(urlString, parameters: parameters, progress: nil, success: success, failure: failure)
        }else{
            
            post(urlString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
    }
    
    func uploadWithData(urlString: String, parameters: [String: AnyObject]?, fileData: Data, name: String, fileName: String, progress: @escaping (_ progress: Progress)->(), completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()){
        
        post(urlString, parameters: parameters, constructingBodyWith: { (formData) in
            
            formData.appendPart(withFileData: fileData ,name: name, fileName: fileName, mimeType: "application/octet-stream")
        }, progress: { (pro) in
            
            progress(pro)
        }, success: { (task: URLSessionDataTask, json: Any?) in
            
            completion(json, true)

        }) { (task: URLSessionDataTask?, error: Error) in
            
            completion(error, false)
        }
    }
}
