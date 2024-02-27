//
//  NewItemView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 07.02.24.
//

import SwiftUI // Für SwiftUI-Bibliothek
import FirebaseAuth // Für Authentifizierung mit Firebase
import FirebaseFirestore // Für die Verbindung mit der Firestore-Datenbank

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("Neu Aufgabe")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form {
                TextField("Titel", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Fälligkeitsdatum", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                ToDoButton(title: "Speichern", background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }                
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Fehler"), message: Text("Bitte füllen Sie alle Felder aus, und wählen Sie eine Fälligkeitsdatum."))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in }))
}

/*
 NewItemView(newItemPresented: ...): Dies erstellt eine Instanz der NewItemView, die die erforderlichen Bindings oder andere Parameter erhält. In diesem Fall wird das Binding newItemPresented bereitgestellt, um den Zustand zu steuern, ob das neue Element präsentiert wird.
 Binding(get: { ... }, set: { ... }): Hier wird ein Binding definiert, das den Wert von newItemPresented steuert. In diesem spezifischen Beispiel wird der Getter verwendet, um immer true zurückzugeben und der Setter wird leer gelassen. Dies bedeutet, dass das Binding immer true ist und der Setter nicht spezifiziert ist, da die Vorschau den Zustand nicht ändern muss.
 */
