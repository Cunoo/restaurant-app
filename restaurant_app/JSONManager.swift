//
//  JSONManager.swift
//  restaurant_app
//
//  Created by Matus Cuninka on 16/11/2022.
//

import Foundation


//JSON keys
struct Food: Codable, Identifiable, Hashable {
    
    enum CodingKeys: CodingKey {
            case name
            case description
            case alergens
            case price
            case image_path
            case food_menu_id
        }
    
    let name, description, alergens, price, image_path, food_menu_id: String
    var id = UUID()
}

struct FoodType: Codable, Hashable {
    let food_type: [Food]
}

let urlString = "http://ordomi.4fan.cz/test.php"

let myURL = URL(string: urlString)

let content = try! String(contentsOf: myURL!, encoding: .ascii)
let decoding_url = content.data(using: .utf8)!

//decoding from json
var decoding = try! JSONDecoder().decode([String:[Food]].self, from: decoding_url)
