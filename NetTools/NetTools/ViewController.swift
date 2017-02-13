//
//  ViewController.swift
//  NetTools
//
//  Created by PF on 17/2/13.
//  Copyright © 2017年 PF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetWorkTools.shared.request(requestType: .GET, urlString: "http://www.baidu.com", parameters: nil) { (json: Any, success: Bool) in
            print(json)
        }
        
        NetWorkTools.shared.uploadWithData(urlString: "", parameters: nil, fileData: Data(), name: "", fileName: "", progress: { (progress) in
            
        }) { (json: Any, isSuccess: Bool) in
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

