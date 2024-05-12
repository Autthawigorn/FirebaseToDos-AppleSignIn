//
//  ContentView.swift
//  Firebase-ToDos-AppleSignIn
//
//  Created by Autthawigorn Yortpiboot on 10/5/2567 BE.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    
    let tasks = testDataTasks
    
    @State var presentAddNewItem = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List {
                    ForEach(taskListVM.taskCellViewModels) { taskCellVM in
                        TaskCell(taskCellVM: taskCellVM)
                    }
                    if presentAddNewItem {
                        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false))) { task in
                            taskListVM.addTask(task: task)
                            presentAddNewItem.toggle()
                        }
                    }
                }
                .listStyle(.plain)
                Button(action:{self.presentAddNewItem.toggle()}) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 24))
                    Text("Add New Task")
                }
                .padding()
                .opacity(presentAddNewItem ? 0.0 : 1.0)
            }
            .navigationTitle("Task")
        }
    }
}

#Preview {
    TaskListView()
}

struct TaskCell: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    
    var onCommit: (Task) -> (Void) = {_ in}
    
    var body: some View {
        HStack{
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 24))
                .onTapGesture {
                    taskCellVM.task.completed.toggle()
                }
            TextField("Enter the task title", text: $taskCellVM.task.title) {
                onCommit(taskCellVM.task)
            }
        }
    }
}
