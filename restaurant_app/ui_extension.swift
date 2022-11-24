//
//  ui_extension.swift
//  restaurant_app
//
//  Created by Matus Cuninka on 19/11/2022.
//

import Foundation
import Alamofire
///FoodsView
func calculate_items(_ item: [String]) -> Int {
    var calculate: Int = 0
    for i in decoding{
        //print(i.value)
        for j in i.value{
            //print(k.self)
            for k in item {
                if (String(k) == j.food_menu_id) {
                    calculate += Int(j.price)!
                }
            }
        }
    }
    return calculate
}
//POST
/*
func postMethod() {
    let params: Parameters = [
        "name": "Jack",
        "salary": "3540",
        "age": "23"
    ]
    
    AF.request("http://ordomi.4fan.cz/post.php", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
        switch response.result {
            case .success(let data):
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
                    }
                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                        print("Error: Cannot convert JSON object to Pretty JSON data")
                        return
                    }
                    guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                        print("Error: Could print JSON in String")
                        return
                    }
            
                    print(prettyPrintedJson)
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            case .failure(let error):
                print(error)
        }
    }
}
*/
func postMethod(url: String,_ orders_detail: String, price: Int){

    let params = [
    "restaurant_id": "1",
    "order_detail": "\(orders_detail)",
    "price": "\(price)"
    ]
    
    AF.request(url, method: .post, parameters: params, encoder: JSONParameterEncoder.default).response { response in
    debugPrint(response)
    }
    
}
