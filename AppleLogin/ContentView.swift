//
//  ContentView.swift
//  AppleLogin
//
//  Created by Islam Md. Zahirul on 6/5/21.
//

import SwiftUI
import UIKit
import AuthenticationServices


struct ContentView: View {
    var body: some View {
        VStack {
            LoginWithAppleView(buttonType: .continue, buttonStyle: .black) { result  in
                
                switch result {
                case .success(let credential): do {
                    if let appleIDCredential = credential as? ASAuthorizationAppleIDCredential {
                        //appleIDCredential.email
                        //appleIDCredential.fullName
                        //appleIDCredential.user
                    }
                }
                case .failure(let error): do {
                    // handle error
                }
                }
                
                
            }//:LoginWithAppleView
            .frame(minWidth: 230, maxWidth: 550)
            .frame(height: 45)
            .padding()
        }//: VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
