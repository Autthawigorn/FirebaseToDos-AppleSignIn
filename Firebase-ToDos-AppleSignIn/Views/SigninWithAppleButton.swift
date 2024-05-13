//
//  SigninWithAppleButton.swift
//  Firebase-ToDos-AppleSignIn
//
//  Created by Autthawigorn Yortpiboot on 12/5/2567 BE.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SigninWithAppleButton: UIViewRepresentable {

    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        //
    }
    
}
