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
    static let courses = ["English", "Math", "Social Studies", "Science", "Gym", "Language", "Elective", "No Class"]
    
    var body: some View {
        
        NavigationView {
            Form {
                Picker("Class", selection: $course) {
                    ForEach(Self.courses, id: \.self) { priority in
                        Text(priority)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline).foregroundColor(.purple)
            .navigationBarItems(trailing: Button("Save") {
                            if course.count > 0 && description.count > 0 {
                                let item = AssignmentItem(id: UUID(), course: course,
                                                    description: description, dueDate: dueDate)
                                assignmentList.items.append(item)
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
            .foregroundColor(.purple)
            )
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
