//
//  main_menu.swift
//  restaurant_app
//
//  Created by Matus Cuninka on 07/10/2022.
//
import SwiftUI

struct main_menu: View {
    @State private var isShowingDetailView = false
    @State private var presentAlert = false
    var body: some View {
        NavigationView {
            VStack{
                //Buttons
                Button("PRIVOLAŤ BARMANA"){
                    //call barman
                    presentAlert = true
                    call_barman(url: "http://ordomi.4fan.cz/call_barman.php", "0", "1", "1")

                }
                    .alert(isPresented: $presentAlert) {
                        Alert(
                            title: Text("Objednavka"),
                            message: Text("Barman je na ceste!"),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color(red: 233 / 255, green: 183 / 255, blue: 34 / 255))
                    .clipShape(Capsule())
                    .foregroundColor(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255))
                    .alert("Barman je na ceste",isPresented: $presentAlert) { }
                    
                    NavigationLink(destination: FoodsView(), isActive: $isShowingDetailView) {
                            Text("JEDÁLNÍČEK")
                        }
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color(red: 233 / 255, green: 183 / 255, blue: 34 / 255))
                            .clipShape(Capsule())
                            .foregroundColor(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255))
                        
            
                
                Button("STAV OBJEDNÁVKY", action: {})
                
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color(red: 233 / 255, green: 183 / 255, blue: 34 / 255))
                    .clipShape(Capsule())
                    //text color
                    .foregroundColor(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255))

                Button("ODÍSŤ") {
                    //go to qrcode scanner
                    let window = UIApplication
                        .shared
                        .connectedScenes
                        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                                    .first { $0.isKeyWindow }
                    window?.rootViewController = UIHostingController(rootView: qr_code_scanner())
                            window?.makeKeyAndVisible()


                }.padding()
                    .frame(width: 200, height: 50)
                    .background(Color(red: 233 / 255, green: 183 / 255, blue: 34 / 255))
                    .clipShape(Capsule())
                    //.foregroundColor(.white)
                    .foregroundColor(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255))
                
        
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255)).ignoresSafeArea()
        }
    }
}

struct main_menu_Previews: PreviewProvider {
    static var previews: some View {
        main_menu()
    }
}
