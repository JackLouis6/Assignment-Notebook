//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Student on 1/19/22.
//

import Foundation

class AssignmentList: ObservableObject {

    @Published var items = [AssignmentItem(description: "Tap the + above to begin adding assignments", dueDate: Date())]

 }
