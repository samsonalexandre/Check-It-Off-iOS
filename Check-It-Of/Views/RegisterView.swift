//
//  RegisterView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 07.02.24.
//

import SwiftUI
import PhotosUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "Registrieren", subtitle: "Organisieren Sie Aufgaben", angle: -15, background: .orange)
            
            
            
            Form {
                TextField("Vollständiger Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Adresse", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Passwort", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                ToDoButton(title: "Benutzerkonto erstellen", background: .green) {
                    // Registration
                    viewModel.register()
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
        .environmentObject(RegisterViewModel())
}
