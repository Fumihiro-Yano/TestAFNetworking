//
//  ApiManager.swift
//  TestAFNetworking
//
//  Created by 矢野史洋 on 2016/05/08.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import Foundation

class ApiManager {
    let baseURL = "http://localhost:3000"
    let headerField = "api-key"
    let apiKey = "test_key"
    private var json:NSDictionary!
    
    init() {
        
   }

    class func getApi() {
        let api = ApiManager()
        let path = "/api/items/"
        let url = api.baseURL + path
        let manager = AFHTTPRequestOperationManager()
        manager.requestSerializer.setValue(api.apiKey, forHTTPHeaderField: api.headerField)
        manager.responseSerializer = AFHTTPResponseSerializer()
        manager.GET(url, parameters: nil,
            success: {(operation, responseObject) in
                do {
                    api.json = try NSJSONSerialization.JSONObjectWithData(responseObject as! NSData, options: .MutableContainers) as! NSDictionary
                    let items = api.json["items"] as! NSArray
                    let item = items.objectAtIndex(0)
                    let name = item["name"] as! NSString
                    print(name)
                } catch  {
                    // エラー処理
                }
                print("Success! \(api.json)")
            },
            failure: {(operation, error) in
                print("Error: \(error)")
            }
        )
    }
    
    class func postApi() {
      let api = ApiManager()
      let path = "/api/items/"
      let url = api.baseURL + path
      let params:Dictionary<String, String> = ["item[name]" : "ドラえもん", "item[price]" : "2000", "item[description]" : "不二子不二雄によって書かれた本である。"]
      let manager = AFHTTPRequestOperationManager()
      manager.requestSerializer.setValue(api.apiKey, forHTTPHeaderField: api.headerField)
      manager.responseSerializer = AFHTTPResponseSerializer()
      manager.POST(url, parameters: params,
            success: {(operation, responseObject) in
                do {
                    api.json = try NSJSONSerialization.JSONObjectWithData(responseObject as! NSData, options: .MutableContainers) as! NSDictionary
//                    let items = api.json["items"] as! NSArray
//                    let item = items.objectAtIndex(0)
                      let name = api.json["name"] as! NSString
                      print(name)
                } catch  {
                    // エラー処理
                }
                print("Success! \(api.json)")
            },
            failure: {(operation, error) in
                print("Error: \(error)")
            }
        )
    }
    
    class func putApi() {
        let api = ApiManager()
        let path = "/api/items/"
        let itemID = "1"
        let url = api.baseURL + path + itemID
        let params:Dictionary<String, String> = ["item[name]" : "僕は猫である。"]
        let manager = AFHTTPRequestOperationManager()
        manager.requestSerializer.setValue(api.apiKey, forHTTPHeaderField: api.headerField)
        manager.responseSerializer = AFHTTPResponseSerializer()
        manager.PUT(url, parameters: params,
            success: {(operation, responseObject) in
                do {
                    api.json = try NSJSONSerialization.JSONObjectWithData(responseObject as! NSData, options: .MutableContainers) as! NSDictionary
                    //                    let items = api.json["items"] as! NSArray
                    //                    let item = items.objectAtIndex(0)
                    let name = api.json["name"] as! NSString
                    print(name)
                } catch  {
                    // エラー処理
                }
                print("Success! \(api.json)")
            },
            failure: {(operation, error) in
                print("Error: \(error)")
            }
        )
    }
    
    class func deleteApi() {
        let api = ApiManager()
        let path = "/api/items/"
        let itemID = "22"
        let url = api.baseURL + path + itemID
        let manager = AFHTTPRequestOperationManager()
        manager.requestSerializer.setValue(api.apiKey, forHTTPHeaderField: api.headerField)
        manager.responseSerializer = AFHTTPResponseSerializer()
        manager.DELETE(url, parameters: nil,
            success: {(operation, responseObject) in
                do {
                    api.json = try NSJSONSerialization.JSONObjectWithData(responseObject as! NSData, options: .MutableContainers) as! NSDictionary
                    print(api.json)
                } catch  {
                    // エラー処理
                }
                print("Success! \(api.json)")
            },
            failure: {(operation, error) in
                print("Error: \(error)")
            }
        )
    }
    
}