//
//  ContentView.swift
//  testing
//
//  Created by Matus Cuninka on 06/10/2022.
//
import SwiftUI

let urlString = "http://ordomi.4fan.cz/test.php"

let myURL = URL(string: urlString)

let content = try! String(contentsOf: myURL!, encoding: .ascii)
let decoding_url = content.data(using: .utf8)!

struct Food: Codable, Identifiable, Hashable {
    
    enum CodingKeys: CodingKey {
            case name
            case description
            case alergens
        }
    
    let name, description, alergens: String
    var id = UUID()
}


struct Foods: View {
    var decoding = try! JSONDecoder().decode([String:[Food]].self, from: decoding_url)
    var body: some View {

        VStack(alignment: .leading){
            List{
                ForEach(Array(decoding.keys), id: \.self){ i in
                    Text(i)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.gray)
                    ForEach(decoding[i]!){ k in
                        Text(k.name)
                            .font(.title3)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.red)
                        Text(k.description)
                            .font(.title3)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.gray)
                        Text(k.alergens)
                            .font(.title3)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.gray)
                    }
                    
                }
        
            }
        }
        
    }
    
}
struct Foods_Previews: PreviewProvider {
    static var previews: some View {
        Foods()
    }
}
