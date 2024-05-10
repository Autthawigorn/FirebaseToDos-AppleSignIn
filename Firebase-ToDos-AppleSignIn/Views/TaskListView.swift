//
//  ContentView.swift
//  Firebase-ToDos-AppleSignIn
//
//  Created by Autthawigorn Yortpiboot on 10/5/2567 BE.
//

import SwiftUI

struct TaskListView: View {
    
    let tasks = testDataTasks
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List(tasks) { task in
                    TaskCell(task: task)
                }
                .listStyle(.plain)
                Button(action:{}) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 24))
                    Text("Add New Task")
                }
                .padding()
            }
            .navigationTitle("Task")
        }
    }
}

#Preview {
    TaskListView()
}

struct TaskCell: View {
    let task: Task
    
    var body: some View {
        HStack{
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 24))
            Text(task.title)
        }
    }
}
