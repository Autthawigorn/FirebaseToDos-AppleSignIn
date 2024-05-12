//
//  TaskCellViewModel.swift
//  Firebase-ToDos-AppleSignIn
//
//  Created by Autthawigorn Yortpiboot on 10/5/2567 BE.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
    @Published var taskRepository = TaskRepository()
    @Published var task: Task
    
    var id = ""
    @Published var completionStateIconName = ""
    
    private var cancelables = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
        
        $task
            .map { task in
                task.completed ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancelables)
        
        $task
            .compactMap { task in
                task.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancelables)
        
        $task
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { task in
            self.taskRepository.updateTask(task)
            }
        .store(in: &cancelables)
        
    }
}
