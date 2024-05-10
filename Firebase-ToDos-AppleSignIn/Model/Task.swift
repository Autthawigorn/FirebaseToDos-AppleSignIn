//
//  Task.swift
//  Firebase-ToDos-AppleSignIn
//
//  Created by Autthawigorn Yortpiboot on 10/5/2567 BE.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

#if DEBUG
let testDataTasks = [
    Task(title: "Imprement the UI", completed: true),
    Task(title: "Connect to Firebase", completed: false),
    Task(title: "????", completed: false),
    Task(title: "Profit!!", completed: true)
]
#endif
