//
//  Firebase_ToDos_AppleSignInApp.swift
//  Firebase-ToDos-AppleSignIn
//
//  Created by Autthawigorn Yortpiboot on 10/5/2567 BE.
//
import Firebase
import SwiftUI

@main
struct Firebase_ToDos_AppleSignInApp: App {
    
    init() {
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
    }

    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}

