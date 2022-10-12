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
    @State public var close = false

    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Button{
                isShowingScanner = true
            } label:{
                Label("Scan", systemImage: "qrcode.viewfinder")
            }
            .sheet(isPresented: $isShowingScanner){
                CodeScannerView(codeTypes: [.qr], simulatedData: "QRcodeScan\n", completion: handelScan)
                
                NavigationView{
                    
                    NavigationLink(isActive: $ScannerSuccess) { // move to another view
                      // Destination
                        
                        
                    } label: {
                        main_menu()
                    }
                }
                    // add more code
            }.navigationBarBackButtonHidden(true)//hide navigationBarBackButton
            .sheet(isPresented: $close) {
                    qr_code_scanner()}
        }
        

    }
    func handelScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
            
            case .success(let result):
                var details = result.string.components(separatedBy: "\n")
                details[0] = "Your scan was succesfull"
                ScannerSuccess = true
                close = true
                presentationMode.wrappedValue.dismiss()
                
            case .failure(let error):
                print("Scanning failed : \(error.localizedDescription)")
        }
        
    }
}


struct qr_code_scanner_Previews: PreviewProvider {
    static var previews: some View {
        qr_code_scanner()
    }
}
