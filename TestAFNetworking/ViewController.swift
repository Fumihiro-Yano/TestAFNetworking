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
        manager.GET("https://api.github.com/users/octocat/orgs", parameters: nil,
            success: {(operation, responseObject) in
                print("Success! \(operation)")
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

