//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Student on 1/19/22.
//

import SwiftUI

struct AddAssignmentView: View {
    
    @ObservedObject var assignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let priorities = ["High", "Medium", "Low"]
    
    var body: some View {
        
        NavigationView {
                    Form {
                        Picker("Course", selection: $course) {
                            ForEach(Self.priorities, id: \.self) { priority in
                                Text(priority)
                            }
                        }
                    }
                }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
