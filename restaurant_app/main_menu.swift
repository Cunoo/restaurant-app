//
//  main_menu.swift
//  restaurant_app
//
//  Created by Matus Cuninka on 07/10/2022.
//

import SwiftUI

struct main_menu: View {
    @State private var isQuit = false
    @State private var test = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        
            VStack{
                //Buttons
                Button("PRIVOLAŤ BARMANA", action: {})
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255))
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    
                    
                Button("MENU", action: {})
                
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255))
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                
                
                Button("STAV OBJEDNÁVKY", action: {})
                
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255))
                    .clipShape(Capsule())
                    .foregroundColor(.white)

                Button("ODÍSŤ") {
                    isQuit = true
                    let window = UIApplication
                        .shared
                        .connectedScenes
                        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                                    .first { $0.isKeyWindow }
                    window?.rootViewController = UIHostingController(rootView: qr_code_scanner())
                            window?.makeKeyAndVisible()


                }.padding()
                    .frame(width: 200, height: 50)
                    .background(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255))
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                
                /*if isQuit{
                    qr_code_scanner()
                    
                }*/
                
        
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 233 / 255, green: 183 / 255, blue: 34 / 255)).ignoresSafeArea()
    }
}

struct main_menu_Previews: PreviewProvider {
    static var previews: some View {
        main_menu()
    }
}
                               
                            
