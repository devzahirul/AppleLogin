//
//  LoginWithAppleView.swift
//  AppleLogin
//
//  Created by Islam Md. Zahirul on 7/5/21.
//

import SwiftUI
import UIKit
import AuthenticationServices

struct LoginWithAppleView: UIViewRepresentable {
    // MARK:- init
    let buttonType: ASAuthorizationAppleIDButton.ButtonType
    let buttonStyle: ASAuthorizationAppleIDButton.Style
    
    // MARK:- completion callback
    let completion: (Result<ASAuthorizationCredential, Error>) -> Void
    
    // MARK:- Protocal confirmation
    typealias UIViewType = ASAuthorizationAppleIDButton
    
    func makeCoordinator() -> Coordinator {
        return LoginWithAppleView.Coordinator(self.completion)
    }
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        let autorizationButton = ASAuthorizationAppleIDButton(authorizationButtonType: buttonType,
                                                              authorizationButtonStyle: buttonStyle)
        autorizationButton.addTarget(context.coordinator,
                                     action: #selector(context.coordinator.appleSigninButtonAction(_:)),
                                     for: .touchUpInside)
        
        return autorizationButton
    }
    
   
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
     //TODO: write code if needed .
    }
    
    //MARK:- Coordinator for perform ASAuthorizationServiceDelegates
    class Coordinator: NSObject, ASAuthorizationControllerDelegate {
        let completion: (Result<ASAuthorizationCredential, Error>) -> Void
        
        init(_ completion: @escaping(Result<ASAuthorizationCredential, Error>) -> Void) {
            self.completion = completion
        }
        
        @objc func appleSigninButtonAction(_ sender: Any) {
            //For sign in
            let signinAppleIdProvider = ASAuthorizationAppleIDProvider()
            let request = signinAppleIdProvider.createRequest()
            request.requestedScopes = [.email,.fullName]
            
            //For password
            let passwordProvider = ASAuthorizationPasswordProvider()
            let passwordRequest = passwordProvider.createRequest()
            
            //Create controller with requests
            let controller = ASAuthorizationController(authorizationRequests: [request, passwordRequest])
            controller.delegate = self
            
            //Call for perform requests
            controller.performRequests()
        }
        
        func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
            completion(.success(authorization.credential))
        }
        
        func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
            completion(.failure(error))
        }
        
    }//: Coordinator
    
}


struct LoginWithAppleView_Previews: PreviewProvider {
    static var previews: some View {
        LoginWithAppleView(buttonType: .continue, buttonStyle: .black) { result in
            switch result {
            case .success(let credential): do {
                //
            }
            case .failure(let error): do {
                //
            }
            }
        }
    }
}
