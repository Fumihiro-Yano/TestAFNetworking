//
//  ViewController.swift
//  TestAFNetworking
//
//  Created by 矢野史洋 on 2016/05/08.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

private var json:NSDictionary!

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        let manager = AFHTTPRequestOperationManager()
        manager.requestSerializer.setValue("test_key", forHTTPHeaderField: "api-key")
        manager.responseSerializer = AFHTTPResponseSerializer()
        manager.GET("http://localhost:3000/api/items", parameters: nil,
            success: {(operation, responseObject) in
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(responseObject as! NSData, options: .MutableContainers) as! NSDictionary
                    let items = json["items"] as! NSArray
                    let item = items.objectAtIndex(0)
                    let name = item["name"] as! NSString
                    print(name)
                } catch  {
                    // エラー処理
                }
                print("Success! \(json)")
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

