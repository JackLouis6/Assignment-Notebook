//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Student on 1/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddItemView = false
    init () {
        UITableView.appearance().backgroundColor = .purple
    }
// Credits to Jack Lais for this code ^
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(assignmentList.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                    .listRowBackground(Color.gray)
    // Credits to Jack Lais for this code ^
                }
                .onMove(perform: { indices, newOffset in
                    assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentList.items.remove(atOffsets: indexSet)
                })
            }
            .sheet(isPresented: $showingAddItemView, content: {
                AddAssignmentView(assignmentList: assignmentList)
            })
            .navigationBarTitle("Assignments", displayMode: .inline)
            .navigationBarItems(leading: EditButton().foregroundColor(.purple),
                                trailing: Button(action: {
                                                    showingAddItemView = true}) {
                                    Image(systemName: "plus").foregroundColor(.purple)

                                    
                                })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable, Codable {
    
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
    
}
