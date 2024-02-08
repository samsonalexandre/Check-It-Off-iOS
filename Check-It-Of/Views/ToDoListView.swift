//
//  CheckItOfItemsView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 07.02.24.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewModel()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Aufgabenliste")
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
