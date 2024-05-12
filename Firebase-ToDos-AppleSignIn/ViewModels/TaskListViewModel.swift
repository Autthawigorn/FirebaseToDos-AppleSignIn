//
//  TaskListViewModel.swift
//  Firebase-ToDos-AppleSignIn
//
//  Created by Autthawigorn Yortpiboot on 10/5/2567 BE.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskReporitory = TaskRepository()
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancelable = Set<AnyCancellable>()
    
    init(){
        taskReporitory.$tasks
            .map { tasks in
                tasks.map { task in
                    TaskCellViewModel(task: task)
                }
        }
            .assign(to: \.taskCellViewModels, on: self)
            .store(in: &cancelable)
    }
    
    func addTask(task: Task) {
        taskReporitory.addTask(task)
//        let taskVM = TaskCellViewModel(task: task)
//        self.taskCellViewModels.append(taskVM)
    }
}
