//
//  ContentView.swift
//  restaurant_app
//
//  Created by Matus Cuninka on 07/10/2022.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        VStack{
            
            qr_code_scanner()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
