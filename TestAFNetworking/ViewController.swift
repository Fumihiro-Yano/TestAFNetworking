//
//  ViewController.swift
//  TestAFNetworking
//
//  Created by 矢野史洋 on 2016/05/08.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        let manager = AFHTTPRequestOperationManager()
//        manager.requestSerializer.setValue("api-key", forHTTPHeaderField: "test_key")
        manager.GET("http://localhost:3000/api/items", parameters: nil,
            success: {(operation, responseObject) in
                print("Success! \(responseObject)")
            },
            failure: {(operation, error) in
                print("Error: \(error)")
            }
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

