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
//        ApiManager.getApi()
//        ApiManager.postApi()
//        ApiManager.putApi()
          ApiManager.deleteApi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

