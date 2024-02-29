//
//  ToDoListViewModel.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 07.02.24.
//

import Foundation
import FirebaseFirestore

// ViewModel für die Ansicht der Liste von Elementen
// Primärregister
class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
