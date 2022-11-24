//
//  qr_code_scanner.swift
//  restaurant_app
//
//  Created by Matus Cuninka on 07/10/2022.
//

import SwiftUI
import CodeScanner





struct qr_code_scanner: View {
    @State private var isShowingScanner = false
    @State public var ScannerSuccess = false
    
    var body: some View {
        VStack{
            Text("Vitaj v aplikácii ORDOMI")
            Button{
                isShowingScanner = true
            } label:{
                Label("SCAN", systemImage: "qrcode.viewfinder")
            }
            .sheet(isPresented: $isShowingScanner){ //opening scanner
                CodeScannerView(codeTypes: [.qr], simulatedData: "QRcodeScan\n", completion: handelScan)
                    
                    // add more code
            }//.navigationBarBackButtonHidden(true)//hide navigationBarBackButton
            
            //open another view
            /*if ScannerSuccess {
                viewModel
            }*/
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 233 / 255, green: 183 / 255, blue: 34 / 255)).ignoresSafeArea()
    }
    
    func handelScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
        case .success(let result):
            //var details = result.string.components(separatedBy: "\n")
            //details[0] = "Your scan was succesfull"
            ScannerSuccess = true
            
            
            //go to main_menu after success scan
            let window = UIApplication
                .shared
                .connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                            .first { $0.isKeyWindow }
            window?.rootViewController = UIHostingController(rootView: main_menu())
                    window?.makeKeyAndVisible()
            
            
        case .failure(let error):
            print("Scanning failed : \(error.localizedDescription)")
        }
        
    }
}


struct qr_code_scanner_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            qr_code_scanner()
        }
    }
}


//qr_code_view
func r_to_menu() -> Void {
    let window = UIApplication
        .shared
        .connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow }
    window?.rootViewController = UIHostingController(rootView: main_menu())
            window?.makeKeyAndVisible()
    
}
