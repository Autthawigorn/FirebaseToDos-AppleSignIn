//
//  Task.swift
//  Firebase-ToDos-AppleSignIn
//
//  Created by Autthawigorn Yortpiboot on 10/5/2567 BE.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


struct Task: Identifiable, Codable {
   @DocumentID var id: String?
    var title: String
    var completed: Bool
   @ServerTimestamp var createdTime: Timestamp?
    var userId: String?
}

#if DEBUG
let testDataTasks = [
    Task(title: "Imprement the UI", completed: true),
    Task(title: "Connect to Firebase", completed: false),
    Task(title: "????", completed: false),
    Task(title: "Profit!!", completed: true)
]
#endif
