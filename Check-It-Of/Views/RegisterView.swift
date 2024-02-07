//
//  RegisterView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 07.02.24.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Registrieren", subtitle: "Organisieren Sie Aufgaben", angle: -15, background: .orange)
            
            Form {
                TextField("Vollständiger Name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Adresse", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
               SecureField("Passwort", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                ToDoButton(title: "Benutzerkonto erstellen", background: .green) {
                    // Registration
                }
                .padding()
            }
            .offset(y: -50)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
