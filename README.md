# AppleLogin
Sign in with Apple using SwiftUI 

## Code example 
```swift
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
```
