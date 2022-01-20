//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Student on 1/19/22.
//

import Foundation

class AssignmentList: ObservableObject {

    @Published var items = [AssignmentItem(description: "Take out trash", dueDate: Date()),
                            AssignmentItem(description: "Pick up clothes", dueDate: Date()),
                            AssignmentItem(description: "Eat a donut", dueDate: Date())]

 }
