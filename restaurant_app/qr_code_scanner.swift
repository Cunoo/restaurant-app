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
    
    var body: some View {
        Button{
            isShowingScanner = true
        } label:{
            Label("Scan", systemImage: "qrcode.viewfinder")
        }
        .sheet(isPresented: $isShowingScanner){
            CodeScannerView(codeTypes: [.qr], simulatedData: "TestQRScan", completion: handelScan)
                // add more code
            
        }
    }
    func handelScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
        case .success(let result):
            var details = result.string.components(separatedBy: "\n")
            details[0] = "Your scan was succesfull"
        
            
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
